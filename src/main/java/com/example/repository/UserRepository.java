package com.example.repository;

import com.example.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class UserRepository {

    @PersistenceContext
    private EntityManager em;

    @Transactional
    public void save(User user) {
        em.persist(user);
    }

    public List<User> findAll() {
        return em.createQuery("SELECT u FROM User u", User.class).getResultList();
    }

    public User findById(Long id) {
        return em.find(User.class, id);
    }

    @Transactional
    public void delete(Long userId) {
        User user = em.find(User.class, userId);
        if (user != null) {
            em.remove(user);
        }
    }

    @Transactional
    public void update(User user) {
        em.merge(user);
    }

    //  Login: tìm theo username
    public User findByUsername(String username) {
        try {
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
        try {
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
    @Transactional
    public void updateResetToken(Long userId, String resetToken) {
        User user = em.find(User.class, userId);
        if (user != null) {
            user.setResetToken(resetToken);
            em.merge(user);
        }
    }

    //  Quên mật khẩu: tìm user theo token
    public User findByResetToken(String token) {
        try {
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
    @Transactional
    public void updatePassword(Long userId, String newPassword) {
        User user = em.find(User.class, userId);
        if (user != null) {
            user.setPassword(newPassword);
            user.setResetToken(null); // clear token sau khi đổi pass
            em.merge(user);
        }
    }

    //  Phân quyền: tìm user theo role
    public List<User> findByRole(String role) {
        return em.createQuery(
                        "SELECT u FROM User u WHERE u.role = :role",
                        User.class)
                .setParameter("role", role)
                .getResultList();
    }

    // Cập nhật profile (email + avatar)
    @Transactional
    public void updateProfile(Long userId, String email, String avatar) {
        User user = em.find(User.class, userId);
        if (user != null) {
            user.setEmail(email);
            if (avatar != null) {
                user.setAvatar(avatar);
            }
            em.merge(user);
        }
    }

    // Đổi mật khẩu khi đã đăng nhập
    @Transactional
    public boolean changePassword(Long userId, String oldPass, String newPass) {
        User user = em.find(User.class, userId);
        if (user == null || !user.getPassword().equals(oldPass)) {
            return false;
        }

        user.setPassword(newPass);
        em.merge(user);
        return true;
    }
}