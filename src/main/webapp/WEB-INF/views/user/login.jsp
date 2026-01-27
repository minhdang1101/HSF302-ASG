<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Login - BookStore</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

            <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">

            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>

            <div class="auth-wrapper">
                <div class="auth-card">
                    <div class="auth-header text-center mb-4">
                        <div class="mb-3">
                            <i class="fas fa-book-open fa-3x text-white opacity-75"></i>
                        </div>
                        <h3>BookStore</h3>
                        <p class="text-white-50">Welcome back, please login.</p>
                    </div>

                    <div class="auth-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show shadow-sm" role="alert">
                                <i class="fas fa-exclamation-circle me-2 text-danger"></i> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>
                        <c:if test="${not empty success}">
                            <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                                <i class="fas fa-check-circle me-2 text-success"></i> ${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>

                        <form action="<c:url value='/login'/>" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" name="username"
                                    placeholder="Username" required autocomplete="off">
                                <label for="username"><i class="fas fa-user me-2"></i>Username</label>
                            </div>

                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="password" name="password"
                                    placeholder="Password" required>
                                <label for="password"><i class="fas fa-lock me-2"></i>Password</label>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe">
                                    <label class="form-check-label text-white-50" for="rememberMe">Remember me</label>
                                </div>
                                <a href="<c:url value='/forgot-password'/>"
                                    class="text-decoration-none small fw-bold forgot-pass">Forgot Password?</a>
                            </div>

                            <button type="submit" class="btn btn-login w-100 text-white mb-4">
                                Sign In <i class="fas fa-arrow-right ms-2"></i>
                            </button>

                            <div class="text-center text-white-50 small signup-link">
                                Don't have an account? <a href="<c:url value='/register'/>">Create Account</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            <c:if test="${not empty error}">
                <script>
                    const card = document.querySelector('.auth-card');
                    card.style.animation = 'shake 0.5s';

                    const style = document.createElement('style');
                    style.innerHTML = `
                @keyframes shake {
                    0% { transform: translateX(0); }
                    25% { transform: translateX(-10px); }
                    50% { transform: translateX(10px); }
                    75% { transform: translateX(-10px); }
                    100% { transform: translateX(0); }
                }
            `;
                    document.head.appendChild(style);
                </script>
            </c:if>
        </body>

        </html>