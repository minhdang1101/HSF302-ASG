package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/user")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    // Hiển thị danh sách user (giống hình trong tài liệu)
    @GetMapping
    public String listUsers(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "user/index";
    }

    // Form thêm mới
    @GetMapping("/add")
    public String showForm(Model model) {
        model.addAttribute("user", new User());
        return "user/form";
    }

    // Xử lý lưu user
    @PostMapping("/save")
    public String saveUser(@ModelAttribute("user") User user) {
        if (user.getId() == null) {
            user.setCreatedOn(LocalDateTime.now());
        }
        userService.saveUser(user);
        return "redirect:/user";
    }

    // Xóa user
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/user";
    }
}