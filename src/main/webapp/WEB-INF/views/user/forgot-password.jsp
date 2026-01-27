<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Reset Password - BookStore</title>
            <!-- Bootstrap 5 -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <!-- Fonts -->
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <!-- Icons -->
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <!-- Custom CSS -->
            <link href="<c:url value='/css/style.css'/>" rel="stylesheet">
        </head>

        <body>

            <div class="auth-wrapper">
                <div class="auth-card animate-fade-in-up">
                    <div class="auth-header">
                        <h3>Reset Password</h3>
                        <p class="mb-0 text-white-50">We'll help you get back in</p>
                    </div>
                    <div class="auth-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle me-2"></i> ${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>

                        <form action="<c:url value='/forgot-password'/>" method="post">
                            <p class="text-muted small mb-4">Enter the email address associated with your account and
                                we'll send you a link to reset your password.</p>

                            <div class="form-floating mb-4">
                                <input type="email" class="form-control" id="email" name="email"
                                    placeholder="Email Address" required>
                                <label for="email">Email Address</label>
                            </div>

                            <button type="submit" class="btn btn-primary-gradient w-100 mb-3 shadow">Send Reset
                                Token</button>

                            <div class="text-center text-muted small">
                                <a href="<c:url value='/login'/>" class="text-decoration-none fw-bold text-secondary"><i
                                        class="fas fa-arrow-left me-1"></i> Back to Login</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>