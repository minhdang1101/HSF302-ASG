<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Trang Chủ - BookStore</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
                <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                    rel="stylesheet">

                <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
                <style>
                    /* GHI ĐÈ: Trang chủ dùng nền màu sáng nhẹ thay vì Gradient cầu vồng để đỡ rối mắt */
                    body {
                        background: #f4f6f9 !important;
                        animation: none !important;
                        display: block !important;
                        /* Reset display flex của login */
                        height: auto !important;
                    }

                    /* Banner Style */
                    .hero-banner {
                        border-radius: 20px;
                        overflow: hidden;
                        box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
                    }

                    .carousel-item img {
                        height: 500px;
                        object-fit: cover;
                    }

                    /* Feature Box */
                    .feature-card {
                        background: white;
                        padding: 20px;
                        border-radius: 15px;
                        text-align: center;
                        transition: transform 0.3s ease;
                        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
                        height: 100%;
                    }

                    .feature-card:hover {
                        transform: translateY(-5px);
                    }

                    .feature-icon {
                        width: 60px;
                        height: 60px;
                        line-height: 60px;
                        border-radius: 50%;
                        background: rgba(35, 166, 213, 0.1);
                        /* Màu xanh nhạt */
                        color: #23a6d5;
                        font-size: 1.5rem;
                        margin: 0 auto 15px;
                    }

                    /* Sidebar Filter */
                    .filter-sidebar {
                        background: white;
                        border-radius: 16px;
                        padding: 25px;
                        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
                        border: none;
                    }

                    /* Tiêu đề section */
                    .section-header {
                        display: flex;
                        justify-content: space-between;
                        align-items: flex-end;
                        margin-bottom: 30px;
                        border-bottom: 2px solid #eaeaea;
                        padding-bottom: 15px;
                    }

                    .section-title {
                        font-size: 1.8rem;
                        font-weight: 700;
                        color: #2c3e50;
                        position: relative;
                        margin: 0;
                    }

                    .section-title::after {
                        content: '';
                        position: absolute;
                        bottom: -17px;
                        left: 0;
                        width: 60px;
                        height: 4px;
                        border-radius: 2px;
                    }
                </style>
            </head>

            <body>

                <jsp:include page="/WEB-INF/views/layout/header.jsp" />

                <div class="container mt-4 mb-5">
                    <div id="bannerCarousel" class="carousel slide carousel-fade hero-banner" data-bs-ride="carousel">
                        <div class="carousel-indicators">
                            <c:forEach items="${banners}" varStatus="status">
                                <button type="button" data-bs-target="#bannerCarousel"
                                    data-bs-slide-to="${status.index}" class="${status.first ? 'active' : ''}"></button>
                            </c:forEach>
                        </div>

                        <div class="carousel-inner">
                            <c:forEach var="banner" items="${banners}" varStatus="status">
                                <div class="carousel-item ${status.first ? 'active' : ''}" data-bs-interval="4000">
                                    <img src="${banner.imageUrl}" class="d-block w-100" alt="${banner.title}">
                                    <div class="carousel-caption d-none d-md-block text-start"
                                        style="background: linear-gradient(to right, rgba(0,0,0,0.7), transparent); left:0; right:0; bottom:0; top:0; padding: 5rem;">
                                        <div class="animate-fade-in-up" style="max-width: 600px; padding-top: 100px;">
                                            <span class="badge bg-primary mb-3 px-3 py-2 rounded-pill">BEST
                                                SELLER</span>
                                            <h1 class="display-4 fw-bold mb-3">${banner.title}</h1>
                                            <p class="lead mb-4 text-white-50">Khám phá thế giới tri thức vô tận.</p>
                                            <a href="#shop" class="btn btn-light rounded-pill px-5 py-3 fw-bold shadow">
                                                Mua Ngay <i class="fas fa-arrow-right ms-2"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty banners}">
                                <div class="carousel-item active">
                                    <div class="d-flex align-items-center justify-content-center text-white"
                                        style="height: 500px; background: linear-gradient(135deg, #667eea, #764ba2);">
                                        <div class="text-center">
                                            <h1>Chào mừng đến với BookStore</h1>
                                            <p>Nơi tri thức hội tụ</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </div>

                        <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel"
                            data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel"
                            data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        </button>
                    </div>
                </div>

<%--                <div class="container mb-5">--%>
<%--                    <div class="row g-4">--%>
<%--                        <div class="col-md-3 col-6">--%>
<%--                            <div class="feature-card">--%>
<%--                                <div class="feature-icon"><i class="fas fa-truck-fast"></i></div>--%>
<%--                                <h6 class="fw-bold">Freeship</h6>--%>
<%--                                <small class="text-muted">Đơn từ 500k</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3 col-6">--%>
<%--                            <div class="feature-card">--%>
<%--                                <div class="feature-icon"><i class="fas fa-shield-halved"></i></div>--%>
<%--                                <h6 class="fw-bold">Bảo Mật</h6>--%>
<%--                                <small class="text-muted">Thanh toán an toàn</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3 col-6">--%>
<%--                            <div class="feature-card">--%>
<%--                                <div class="feature-icon"><i class="fas fa-rotate-left"></i></div>--%>
<%--                                <h6 class="fw-bold">Đổi Trả</h6>--%>
<%--                                <small class="text-muted">Trong 30 ngày</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="col-md-3 col-6">--%>
<%--                            <div class="feature-card">--%>
<%--                                <div class="feature-icon"><i class="fas fa-headset"></i></div>--%>
<%--                                <h6 class="fw-bold">Hỗ Trợ</h6>--%>
<%--                                <small class="text-muted">24/7 Nhanh chóng</small>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="container mb-5" id="shop">
                    <div class="row">

                        <div class="col-lg-3 mb-4">
                            <div class="filter-sidebar sticky-top" style="top: 100px; z-index: 10;">
                                <h5 class="fw-bold mb-4"><i class="fas fa-filter me-2 text-primary"></i>Bộ Lọc</h5>

                                <form id="filterForm">
                                    <div class="mb-4">
                                        <label class="form-label small fw-bold text-muted text-uppercase">Từ
                                            khóa</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-0"><i
                                                    class="fas fa-search text-muted"></i></span>
                                            <input type="text" id="keywordInput" name="keyword"
                                                class="form-control bg-light border-0" placeholder="Tên sách...">
                                        </div>
                                    </div>

                                    <div class="mb-4">
                                        <label class="form-label small fw-bold text-muted text-uppercase">Khoảng
                                            giá</label>
                                        <div class="d-flex align-items-center gap-2">
                                            <input type="number" name="minPrice"
                                                class="form-control bg-light border-0 text-center" placeholder="Min">
                                            <span class="text-muted">-</span>
                                            <input type="number" name="maxPrice"
                                                class="form-control bg-light border-0 text-center" placeholder="Max">
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label small fw-bold text-muted text-uppercase">Danh
                                            mục</label>
                                        <div class="d-flex flex-column gap-2">
                                            <label class="d-flex align-items-center" style="cursor: pointer;">
                                                <input type="radio" name="cateId" value="" class="form-check-input me-2"
                                                    checked>
                                                <span>Tất cả</span>
                                            </label>
                                            <c:forEach var="cate" items="${categories}">
                                                <label class="d-flex align-items-center" style="cursor: pointer;">
                                                    <input type="radio" name="cateId" value="${cate.categoryId}"
                                                        class="form-check-input me-2">
                                                    <span>${cate.categoryName}</span>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <button type="button" id="btnApplyFilter"
                                        class="btn btn-primary w-100 rounded-pill fw-bold mt-2">
                                        Áp Dụng
                                    </button>
                                </form>
                            </div>
                        </div>

                        <div class="col-lg-9">
                            <div class="section-header">
                                <div>
                                    <h2 class="section-title">Sách Mới & Nổi Bật</h2>
                                    <p class="text-muted mb-0 mt-2">Tuyển tập những cuốn sách bán chạy nhất tháng này
                                    </p>
                                </div>

                                <div class="spinner-border text-primary d-none" id="loadingSpinner" role="status">
                                    <span class="visually-hidden">Loading...</span>
                                </div>
                            </div>

                            <div id="bookListContainer">
                                <div class="row g-4">
                                    <c:forEach var="book" items="${books}">
                                        <div class="col-6 col-md-4 col-lg-3 animate-fade-in-up">
                                            <div class="card h-100 book-card">
                                                <div class="book-img-wrapper">
                                                    <a
                                                        href="${pageContext.request.contextPath}/book/detail/${book.bookId}">
                                                        <img src="${book.coverPics}" alt="${book.bookName}"
                                                            loading="lazy">
                                                    </a>
                                                    <div class="rating-badge">
                                                        <i class="fas fa-star text-warning me-1"></i>4.5
                                                    </div>
                                                </div>

                                                <div class="card-body d-flex flex-column p-3">
                                                    <a href="${pageContext.request.contextPath}/book/detail/${book.bookId}"
                                                        class="text-decoration-none">
                                                        <h5 class="book-title" title="${book.bookName}">${book.bookName}
                                                        </h5>
                                                    </a>

                                                    <p class="book-author" title="${book.author}">
                                                        <i class="fas fa-pen-nib me-2 small"></i>${book.author}
                                                    </p>

                                                    <div
                                                        class="mt-auto pt-3 border-top d-flex align-items-center justify-content-between">
                                                        <span class="price-text text-primary">
                                                            <fmt:formatNumber value="${book.price}" type="number"
                                                                maxFractionDigits="0" /> đ
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
                                </div>
                            </div>

                            <c:if test="${empty books}">
                                <div class="text-center py-5">
                                    <img src="https://cdn-icons-png.flaticon.com/512/7486/7486744.png" width="120"
                                        alt="Empty" class="mb-3 opacity-50">
                                    <h5 class="text-muted">Không tìm thấy cuốn sách nào!</h5>
                                </div>
                            </c:if>

                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/views/layout/footer.jsp" />

                <div class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 1100">
                    <div id="cartToast" class="toast align-items-center text-white border-0 shadow-lg"
                        style="background: linear-gradient(45deg, #11998e, #38ef7d); border-radius: 12px;" role="alert"
                        aria-live="assertive" aria-atomic="true">
                        <div class="d-flex px-2 py-2">
                            <div class="toast-body d-flex align-items-center fs-6" id="cartToastBody">
                            </div>
                            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
                                aria-label="Close"></button>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {
                        // 1. Logic cho Carousel (Banner)
                        const myCarouselElement = document.querySelector('#bannerCarousel');
                        if (myCarouselElement) {
                            new bootstrap.Carousel(myCarouselElement, { interval: 4000, wrap: true });
                        }

                        // 2. Logic cho AJAX Search & Filter
                        const filterForm = document.getElementById('filterForm');
                        const bookListContainer = document.getElementById('bookListContainer');
                        const loadingSpinner = document.getElementById('loadingSpinner');
                        const btnApplyFilter = document.getElementById('btnApplyFilter');
                        const keywordInput = document.getElementById('keywordInput');

                        function fetchBooks() {
                            loadingSpinner.classList.remove('d-none');
                            bookListContainer.style.opacity = '0.5';

                            const formData = new FormData(filterForm);
                            const params = new URLSearchParams(formData);

                            fetch('${pageContext.request.contextPath}/api/search?' + params.toString())
                                .then(response => response.text())
                                .then(html => {
                                    setTimeout(() => {
                                        bookListContainer.innerHTML = html;
                                        loadingSpinner.classList.add('d-none');
                                        bookListContainer.style.opacity = '1';
                                    }, 300);
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                    loadingSpinner.classList.add('d-none');
                                    bookListContainer.style.opacity = '1';
                                });
                        }

                        if (btnApplyFilter) btnApplyFilter.addEventListener('click', fetchBooks);

                        let timeout = null;
                        if (keywordInput) {
                            keywordInput.addEventListener('keyup', function (e) {
                                clearTimeout(timeout);
                                timeout = setTimeout(function () {
                                    fetchBooks();
                                }, 500);
                            });
                        }

                        const radios = document.querySelectorAll('input[name="cateId"]');
                        radios.forEach(radio => {
                            radio.addEventListener('change', fetchBooks);
                        });

                        window.addToCart = function (event, bookName, bookId) {
                            event.preventDefault();
                            event.stopPropagation();

                            const toastEl = document.getElementById('cartToast');
                            const toastBody = document.getElementById('cartToastBody');

                            toastBody.innerHTML = `<i class="fas fa-check-circle me-2"></i> Đã thêm <strong>${bookName}</strong>`;
                            const toast = new bootstrap.Toast(toastEl);
                            toast.show();

                            fetch('${pageContext.request.contextPath}/cart/add/' + bookId)
                                .then(res => { if (res.ok) console.log('Added to cart DB'); })
                                .catch(err => console.error(err));
                        };
                    });
                </script>
            </body>

            </html>