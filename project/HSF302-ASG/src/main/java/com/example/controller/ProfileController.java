package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import com.example.util.FileUploadUtil;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/profile")
public class ProfileController {

    private final UserService userService;

    // Constructor injection
    public ProfileController(UserService userService) {
        this.userService = userService;
    }


    // Xem profile

    @GetMapping
    public String profile(HttpSession session, Model model) {

        User user = (User) session.getAttribute("USER_LOGIN");
        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", user);
        return "profile";
    }


    // Cập nhật profile
    @PostMapping("/update")
    public String updateProfile(
            @RequestParam String email,
            @RequestParam(required = false) MultipartFile avatar,
            HttpSession session) {

        User user = (User) session.getAttribute("USER_LOGIN");
        if (user == null) {
            return "redirect:/login";
        }

        String avatarName = null;
        if (avatar != null && !avatar.isEmpty()) {
            avatarName = FileUploadUtil.saveFile(avatar);
        }

        userService.updateProfile(user.getId(), email, avatarName);

        // cập nhật lại session
        User updatedUser = userService.getUserById(user.getId());
        session.setAttribute("USER_LOGIN", updatedUser);

        return "redirect:/profile";
    }

    // Đổi mật khẩu

    @PostMapping("/change-password")
    public String changePassword(
            @RequestParam String oldPassword,
            @RequestParam String newPassword,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("USER_LOGIN");
        if (user == null) {
            return "redirect:/login";
        }

        boolean success = userService.changePassword(
                user.getId(), oldPassword, newPassword
        );

        if (!success) {
            model.addAttribute("error", "Mật khẩu cũ không đúng");
            model.addAttribute("user", user);
            return "profile";
        }

        return "redirect:/profile";
    }


    // Logout

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
}
