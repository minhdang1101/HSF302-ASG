package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        User currentUser = userService.getUserById(user.getId());
        model.addAttribute("user", currentUser);
        return "user/profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam String email,
                                @RequestParam String fullName, // Assuming User has fullName, let's check User model again.
                                // It has fullName.
                                HttpSession session,
                                RedirectAttributes redirectAttributes) {
        User sessionUser = (User) session.getAttribute("user");
        if (sessionUser == null) {
            return "redirect:/login";
        }
        
        User user = userService.getUserById(sessionUser.getId());
        user.setEmail(email);
        user.setFullName(fullName);
        
        userService.saveUser(user);
        session.setAttribute("user", user);
        
        redirectAttributes.addFlashAttribute("success", "Profile updated successfully!");
        return "redirect:/profile";
    }

    @PostMapping("/profile/change-password")
    public String changePassword(@RequestParam String oldPassword,
                                 @RequestParam String newPassword,
                                 HttpSession session,
                                 RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        boolean success = userService.changePassword(user.getId(), oldPassword, newPassword);
        if (success) {
            redirectAttributes.addFlashAttribute("success", "Password changed successfully!");
        } else {
            redirectAttributes.addFlashAttribute("error", "Incorrect old password!");
        }
        return "redirect:/profile";
    }
}