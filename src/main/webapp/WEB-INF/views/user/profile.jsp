<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="jakarta.tags.core" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>My Profile - BookStore</title>
            <!-- Include Header which already has Bootstrap/Styles -->
            <jsp:include page="/WEB-INF/views/layout/header.jsp" />
            <!-- Custom CSS Overrides if needed (header already includes style.css) -->
        </head>

        <body class="bg-light">

            <div class="container py-5">

                <div class="profile-header-card animate-fade-in-up">
                    <div class="profile-cover"></div>
                    <div class="profile-avatar-container">
                        <img src="https://ui-avatars.com/api/?name=${user.fullName}&background=random&size=150"
                            alt="Avatar" class="profile-avatar shadow-sm">
                        <h2 class="mt-3 fw-bold text-dark">${user.fullName}</h2>
                        <p class="text-muted mb-4">@${user.username}</p>
                    </div>
                </div>

                <div class="row g-4 animate-fade-in-up delay-100">
                    <!-- Sidebar Navigation -->
                    <div class="col-lg-4">
                        <div class="card border-0 shadow-sm rounded-4 mb-4">
                            <div class="card-body p-0">
                                <div class="list-group list-group-flush rounded-4 overflow-hidden">
                                    <a href="#profile" class="list-group-item list-group-item-action p-3 active"
                                        data-bs-toggle="list">
                                        <i class="fas fa-user-circle me-3"></i> Profile Settings
                                    </a>
                                    <a href="#password" class="list-group-item list-group-item-action p-3"
                                        data-bs-toggle="list">
                                        <i class="fas fa-lock me-3"></i> Change Password
                                    </a>
                                    <a href="${pageContext.request.contextPath}/library"
                                        class="list-group-item list-group-item-action p-3">
                                        <i class="fas fa-book me-3"></i> My Library
                                    </a>
                                    <a href="${pageContext.request.contextPath}/logout"
                                        class="list-group-item list-group-item-action p-3 text-danger">
                                        <i class="fas fa-sign-out-alt me-3"></i> Logout
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="card border-0 shadow-sm rounded-4 bg-primary-gradient text-white">
                            <div class="card-body p-4 text-center">
                                <h5 class="fw-bold"><i class="fas fa-medal me-2"></i>Premium Member</h5>
                                <p class="mb-0 small opacity-75">Member since 2024</p>
                            </div>
                        </div>
                    </div>

                    <!-- Content Area -->
                    <div class="col-lg-8">
                        <div class="tab-content">

                            <!-- Profile Settings Tab -->
                            <div class="tab-pane fade show active" id="profile">
                                <div class="card border-0 shadow-sm rounded-4">
                                    <div class="card-body p-4">
                                        <h4 class="section-title">Edit Profile</h4>

                                        <c:if test="${not empty success}">
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                <i class="fas fa-check-circle me-2"></i> ${success}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                            </div>
                                        </c:if>

                                        <form action="<c:url value='/profile/update'/>" method="post" class="mt-4">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="fullName"
                                                            name="fullName" value="${user.fullName}" required>
                                                        <label for="fullName">Full Name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input type="text" class="form-control" id="username"
                                                            value="${user.username}" disabled readonly
                                                            style="background-color: #f8f9fa;">
                                                        <label for="username">Username (Read-only)</label>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="form-floating">
                                                        <input type="email" class="form-control" id="email" name="email"
                                                            value="${user.email}" required>
                                                        <label for="email">Email Address</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-end mt-4">
                                                <button type="submit"
                                                    class="btn btn-primary-gradient px-5 shadow-sm">Save
                                                    Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <!-- Password Tab -->
                            <div class="tab-pane fade" id="password">
                                <div class="card border-0 shadow-sm rounded-4">
                                    <div class="card-body p-4">
                                        <h4 class="section-title">Change Password</h4>

                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger alert-dismissible fade show mt-3"
                                                role="alert">
                                                <i class="fas fa-exclamation-circle me-2"></i> ${error}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                            </div>
                                        </c:if>

                                        <form action="<c:url value='/profile/change-password'/>" method="post"
                                            class="mt-4">
                                            <div class="mb-3">
                                                <label for="oldPassword"
                                                    class="form-label text-muted small fw-bold text-uppercase">Current
                                                    Password</label>
                                                <input type="password" class="form-control" id="oldPassword"
                                                    name="oldPassword" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="newPassword"
                                                    class="form-label text-muted small fw-bold text-uppercase">New
                                                    Password</label>
                                                <input type="password" class="form-control" id="newPassword"
                                                    name="newPassword" required>
                                            </div>
                                            <div class="mb-4">
                                                <label for="confirmPassword"
                                                    class="form-label text-muted small fw-bold text-uppercase">Confirm
                                                    New Password</label>
                                                <input type="password" class="form-control" id="confirmPassword"
                                                    required>
                                            </div>

                                            <div class="alert alert-info small">
                                                <i class="fas fa-info-circle me-2"></i> Make sure it's at least 15
                                                characters OR at least 8 characters including a number and a lowercase
                                                letter.
                                            </div>

                                            <div class="text-end mt-4">
                                                <button type="submit"
                                                    class="btn btn-primary-gradient px-5 shadow-sm">Update
                                                    Password</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/layout/footer.jsp" />

        </body>

        </html>