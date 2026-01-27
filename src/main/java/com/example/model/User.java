package com.example.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name", nullable = true, unique = true, length = 30)
    private String fullName;

    @Column(name = "username", nullable = false, unique = true, length = 30)
    private String username;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(nullable = false)
    private String role;

    @Column(nullable = false)
    private String status;

    private String password;

    @Column(name = "reset_token")
    private String resetToken;

    @Column(name = "avatar")
    private String avatar;

    @Column(name="created_on", nullable = false)
    private LocalDateTime createdOn;

    public User() {
        this.createdOn = LocalDateTime.now();
        this.status = "ACTIVE";
        this.role = "USER";
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public LocalDateTime getCreatedOn() { return createdOn; }
    public void setCreatedOn(LocalDateTime createdOn) { this.createdOn = createdOn; }

    public String getResetToken() {
        return resetToken;
    }

    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


    public void setPassword(String password) {
        this.password = password;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPassword() {
        return password;
    }



}