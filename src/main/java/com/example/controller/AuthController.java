package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AuthController {

    private final UserService userService;

    public AuthController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/login")
    public String loginPage() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        User user = userService.login(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/"; // Go to homepage
        } else {
            redirectAttributes.addFlashAttribute("error", "Invalid username or password");
            return "redirect:/login";
        }
    }

    @GetMapping("/register")
    public String registerPage() {
        return "user/register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user,
                           RedirectAttributes redirectAttributes) {
        User existingUser = userService.register(user);
        if (existingUser != null) {
            redirectAttributes.addFlashAttribute("success", "Registration successful! Please login.");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("error", "Username or Email already exists");
            return "redirect:/register";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/forgot-password")
    public String forgotPasswordPage() {
        return "user/forgot-password";
    }

    @PostMapping("/forgot-password")
    public String processForgotPassword(@RequestParam String email,
                                        RedirectAttributes redirectAttributes) {
        String token = userService.forgotPassword(email);
        if (token != null) {
            // In a real app, send email. Here just show token for demo.
            redirectAttributes.addFlashAttribute("message", "Reset token generated: " + token);
        } else {
            redirectAttributes.addFlashAttribute("error", "Email not found");
        }
        return "redirect:/forgot-password";
    }
}
