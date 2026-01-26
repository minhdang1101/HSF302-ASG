<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <c:forEach var="book" items="${books}">
                <div class="col-md-6 col-lg-3 mb-4 animate-fade-in-up">
                    <div class="card card-hover-effect h-100 border-0">
                        <div class="card-img-wrapper">
                            <img src="${book.coverPics}" class="card-img-top" alt="${book.bookName}">

                            <div class="position-absolute top-0 end-0 p-3">
                                <span class="badge bg-white text-primary shadow-sm rounded-pill fw-bold">
                                    <i class="fas fa-star text-warning me-1"></i>4.5
                                </span>
                            </div>
                        </div>

                        <div class="card-body d-flex flex-column pt-4 px-4">
                            <h5 class="card-title fw-bold mb-1 ml-1" title="${book.bookName}">${book.bookName}</h5>
                            <p class="text-secondary small mb-3 ml-1"><i
                                    class="fas fa-pen-nib me-2 text-primary opacity-50"></i>${book.author}</p>
                            <div
                                class="mt-auto d-flex align-items-center justify-content-between pt-3 border-top border-light">
                                <span class="price-tag-modern">
                                    <fmt:formatNumber value="${book.price}" type="currency" currencySymbol="₫"
                                        maxFractionDigits="0" />
                                </span>
                                <button class="btn btn-primary-gradient btn-sm rounded-pill shadow-sm px-2"
                                    onclick="addToCart(event, '${book.bookName}', ${book.bookId})">
                                    <i class="fas fa-cart-plus me-2"></i>Add
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>