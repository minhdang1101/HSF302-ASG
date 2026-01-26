<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Online Book Store</title>
            <!-- Bootstrap 5 CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap"
                rel="stylesheet">
            <!-- Font Awesome -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <!-- Custom CSS -->
            <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
        </head>

        <body>

            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg fixed-top">
                <div class="container">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
                        <i class="fas fa-book-reader me-2"></i>BookStore
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <!-- Search bar was here, but removed by user request in home.jsp. 
                 If we want global search, we can put it back here. 
                 For now, keeping it consistent with current home.jsp state (no search in navbar). -->
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                                    <i class="fas fa-shopping-cart me-1"></i> Cart
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/user/profile">
                                    <i class="fas fa-user-circle me-1"></i> Profile
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/library">
                                    <i class="fas fa-bookmark me-1"></i> My Library
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Push content down due to fixed navbar -->
            <div style="margin-top: 80px;"></div>