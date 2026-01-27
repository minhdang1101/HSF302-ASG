package com.example.config;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(@org.springframework.lang.NonNull HttpServletRequest request, @org.springframework.lang.NonNull HttpServletResponse response, @org.springframework.lang.NonNull Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;
        }
        return true;
    }
}
