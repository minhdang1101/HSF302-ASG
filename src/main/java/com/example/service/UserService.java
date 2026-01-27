package com.example.service;

import java.util.List;
import com.example.model.User;
import com.example.repository.UserRepository;
import org.springframework.stereotype.Service;
import com.example.util.TokenUtil;

@Service
@org.springframework.transaction.annotation.Transactional
public class UserService {

    private final UserRepository userRepository;

    // Constructor Injection
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public void saveUser(User user) {
        if (user.getId() != null) {
            userRepository.update(user);
        } else {
            userRepository.save(user);
        }
    }

    public User getUserById(Long id) {
        return userRepository.findById(id);
    }

    public void deleteUser(Long id) {
        userRepository.delete(id);
    }

    public String forgotPassword(String email) {
        User user = userRepository.findByEmail(email);
        if (user == null) return null;

        String token = TokenUtil.generateToken();
        userRepository.updateResetToken(user.getId(), token);

        return token;
    }

    // Reset mật khẩu
    public boolean resetPassword(String token, String newPassword) {
        User user = userRepository.findByResetToken(token);
        if (user == null) return false;

        userRepository.updatePassword(user.getId(), newPassword);
        return true;
    }

    // Cập nhật profile
    public void updateProfile(Long userId, String email, String avatar) {
        userRepository.updateProfile(userId, email, avatar);
    }

    // Đổi mật khẩu
    public boolean changePassword(Long userId, String oldPass, String newPass) {
        return userRepository.changePassword(userId, oldPass, newPass);
    }


    // Đăng ký
    public User register(User user) {
        if (userRepository.findByUsername(user.getUsername()) != null) {
            return null;
        }
        if (userRepository.findByEmail(user.getEmail()) != null) {
            return null;
        }
        user.setId(null);
        userRepository.save(user);
        return user;
    }

    // Đăng nhập
    public User login(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

}