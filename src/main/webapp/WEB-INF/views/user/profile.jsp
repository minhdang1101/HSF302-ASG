<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>My Profile - BookStore</title>
            <!-- Include Bootstrap & Custom CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
            <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
        </head>

        <body>

            <jsp:include page="/WEB-INF/views/layout/header.jsp" />

            <div class="container" style="margin-top: 100px; margin-bottom: 50px;">
                <div class="row justify-content-center">
                    <div class="col-md-8">
                        <div class="card filter-card animate-fade-in-up">
                            <div class="card-body p-5">
                                <div class="text-center mb-4">
                                    <i class="fas fa-user-circle text-primary display-1 mb-3"></i>
                                    <h2 class="fw-bold">My Profile</h2>
                                    <p class="text-muted">Manage your account information</p>
                                </div>

                                <div class="alert alert-info shadow-sm border-0 rounded-3">
                                    <i class="fas fa-info-circle me-2"></i>
                                    User profile functionality is currently under development.
                                </div>

                                <hr class="my-4">

                                <div class="d-flex justify-content-center gap-3">
                                    <a href="${pageContext.request.contextPath}/" class="btn btn-primary-gradient px-4">
                                        <i class="fas fa-arrow-left me-2"></i> Back to Home
                                    </a>
                                    <button class="btn btn-outline-secondary rounded-pill px-4">
                                        <i class="fas fa-edit me-2"></i> Edit Profile
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>