package com.example.repository;

import com.example.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.NoResultException;
import jakarta.persistence.Persistence;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class UserRepository {
    private static EntityManagerFactory emf;

    public UserRepository() {
        // Tên persistence-unit phải khớp với file persistence.xml
        emf = Persistence.createEntityManagerFactory("JPAS");
    }

    public void save(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<User> findAll() {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery("SELECT u FROM User u", User.class).getResultList();
        }
    }

    public User findById(Long id) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.find(User.class, id);
        }
    }

    public void delete(Long userId) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            User user = em.find(User.class, userId);
            if (user != null) {
                em.remove(user);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void update(User user) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    //  Login: tìm theo username
    public User findByUsername(String username) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT u FROM User u WHERE u.username = :username",
                            User.class)
                    .setParameter("username", username)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    //  Login: tìm theo email
    public User findByEmail(String email) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT u FROM User u WHERE u.email = :email",
                            User.class)
                    .setParameter("email", email)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    //  Quên mật khẩu: lưu reset token
    public void updateResetToken(Long userId, String resetToken) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            User user = em.find(User.class, userId);
            if (user != null) {
                user.setResetToken(resetToken);
                em.merge(user);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    //  Quên mật khẩu: tìm user theo token
    public User findByResetToken(String token) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT u FROM User u WHERE u.resetToken = :token",
                            User.class)
                    .setParameter("token", token)
                    .getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    //  Quên mật khẩu: cập nhật mật khẩu mới
    public void updatePassword(Long userId, String newPassword) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            User user = em.find(User.class, userId);
            if (user != null) {
                user.setPassword(newPassword);
                user.setResetToken(null); // clear token sau khi đổi pass
                em.merge(user);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    //  Phân quyền: tìm user theo role
    public List<User> findByRole(String role) {
        try (EntityManager em = emf.createEntityManager()) {
            return em.createQuery(
                            "SELECT u FROM User u WHERE u.role = :role",
                            User.class)
                    .setParameter("role", role)
                    .getResultList();
        }
    }

    // Cập nhật profile (email + avatar)
    public void updateProfile(Long userId, String email, String avatar) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            User user = em.find(User.class, userId);
            if (user != null) {
                user.setEmail(email);
                if (avatar != null) {
                    user.setAvatar(avatar);
                }
                em.merge(user);
            }

            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Đổi mật khẩu khi đã đăng nhập
    public boolean changePassword(Long userId, String oldPass, String newPass) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();

            User user = em.find(User.class, userId);
            if (user == null || !user.getPassword().equals(oldPass)) {
                return false;
            }

            user.setPassword(newPass);
            em.merge(user);
            em.getTransaction().commit();
            return true;

        } finally {
            em.close();
        }
    }
}