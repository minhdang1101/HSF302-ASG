<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <c:forEach var="book" items="${books}">
                <div class="col-6 col-md-4 col-lg-3 mb-4 animate-fade-in-up">
                    <div class="card h-100 book-card">

                        <div class="book-img-wrapper">
                            <a href="${pageContext.request.contextPath}/book/detail/${book.bookId}">
                                <img src="${book.coverPics}" alt="${book.bookName}" loading="lazy">
                            </a>

                            <div class="rating-badge">
                                <i class="fas fa-star text-warning me-1"></i>4.5
                            </div>
                        </div>

                        <div class="card-body d-flex flex-column p-3">
                            <a href="${pageContext.request.contextPath}/book/detail/${book.bookId}"
                                class="text-decoration-none">
                                <h5 class="book-title" title="${book.bookName}">${book.bookName}</h5>
                            </a>

                            <p class="book-author" title="${book.author}">
                                <i class="fas fa-pen-nib me-2 small"></i>${book.author}
                            </p>

                            <div class="mt-auto pt-3 border-top d-flex align-items-center justify-content-between">
                                <span class="price-text text-primary">
                                    <fmt:formatNumber value="${book.price}" type="number" maxFractionDigits="0" /> đ
                                </span>

                                <button
                                    class="btn btn-primary-gradient rounded-pill btn-sm px-3 py-2 shadow-sm d-flex align-items-center"
                                    onclick="addToCart(event, '${book.bookName}', ${book.bookId})">
                                    <i class="fas fa-cart-plus"></i>
                                    <span class="d-none d-xl-inline ms-2 fw-bold">Thêm</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>