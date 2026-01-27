<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Register - BookStore</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        </head>

        <body>

            <div class="auth-wrapper">
                <div class="auth-card animate-fade-in-up">
                    <div class="auth-header">
                        <h3>Create Account</h3>
                        <p class="mb-0 text-white-50">Join our community today</p>
                    </div>
                    <div class="auth-body">
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle me-2"></i> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        </c:if>

                        <form action="<c:url value='/register'/>" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="fullName" name="fullName"
                                    placeholder="Full Name" required>
                                <label for="fullName">Full Name</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="username" name="username"
                                    placeholder="Username" required>
                                <label for="username">Username</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="email" class="form-control" id="email" name="email"
                                    placeholder="Email Address" required>
                                <label for="email">Email Address</label>
                            </div>
                            <div class="form-floating mb-4">
                                <input type="password" class="form-control" id="password" name="password"
                                    placeholder="Password" required>
                                <label for="password">Password</label>
                            </div>

                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" id="terms" required>
                                <label class="form-check-label text-muted small" for="terms">
                                    I agree to the <a href="#" class="text-decoration-none">Terms of Service</a> and <a
                                        href="#" class="text-decoration-none">Privacy Policy</a>
                                </label>
                            </div>

                            <button type="submit" class="btn btn-primary-gradient w-100 mb-3 shadow">Create
                                Account</button>

                            <div class="text-center text-muted small">
                                Already have an account? <a href="<c:url value='/login'/>"
                                    class="text-decoration-none fw-bold text-primary">Sign in</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>