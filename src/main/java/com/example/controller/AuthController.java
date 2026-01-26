package com.example.controller;

import com.example.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    // Form quên mật khẩu
    @GetMapping("/forgot")
    public String forgotForm() {
        return "forgot-password";
    }

    @PostMapping("/forgot")
    public String forgotSubmit(@RequestParam String email, Model model) {
        String token = userService.forgotPassword(email);
        if (token == null) {
            model.addAttribute("error", "Email không tồn tại");
            return "forgot-password";
        }
        model.addAttribute("token", token);
        return "check-email";
    }

    // Form reset mật khẩu
    @GetMapping("/reset")
    public String resetForm(@RequestParam String token, Model model) {
        model.addAttribute("token", token);
        return "reset-password";
    }

    @PostMapping("/reset")
    public String resetSubmit(
            @RequestParam String token,
            @RequestParam String password,
            Model model) {

        boolean success = userService.resetPassword(token, password);
        if (!success) {
            model.addAttribute("error", "Token không hợp lệ");
            return "reset-password";
        }

        return "login";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

}
