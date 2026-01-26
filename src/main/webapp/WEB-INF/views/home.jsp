<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <jsp:include page="/WEB-INF/views/layout/header.jsp" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

        <div class="container-fluid p-0 mb-5">
            <div id="bannerCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach var="banner" items="${banners}" varStatus="status">
                        <div class="carousel-item ${status.first ? 'active' : ''}" data-bs-interval="5000">
                            <img src="${banner.imageUrl}" class="d-block w-100" alt="${banner.title}"
                                style="height: 600px; object-fit: cover;">
                            <div class="carousel-caption d-none d-md-block animate-fade-in-up">
                                <span
                                    class="badge bg-warning text-dark mb-2 px-3 py-2 rounded-pill fw-bold text-uppercase">Best
                                    Seller</span>
                                <h1 class="display-3 fw-bold mb-3 text-white">${banner.title}</h1>
                                <p class="lead mb-4 text-white-50">Khám phá thế giới tri thức vô tận ngay hôm nay.</p>
                                <a href="#shop"
                                    class="btn btn-primary btn-lg rounded-pill px-5 py-3 shadow-lg fw-bold">Mua Ngay <i
                                        class="fas fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${empty banners}">
                        <div class="carousel-item active">
                            <div class="d-block w-100 d-flex align-items-center justify-content-center text-white"
                                style="height: 600px; background: linear-gradient(135deg, #4f46e5, #ec4899);">
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="py-3 container features-bar mb-5">
            <div class="row text-center">
                <div class="col-md-3 feature-box border-end">
                    <div class="feature-icon"><i class="fas fa-truck"></i></div>
                    <h6 class="fw-bold">Miễn Phí Vận Chuyển</h6>
                    <small class="text-muted">Cho đơn hàng từ 500k</small>
                </div>
                <div class="col-md-3 feature-box border-end">
                    <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                    <h6 class="fw-bold">Thanh Toán An Toàn</h6>
                    <small class="text-muted">Bảo mật 100%</small>
                </div>
                <div class="col-md-3 feature-box border-end">
                    <div class="feature-icon"><i class="fas fa-undo"></i></div>
                    <h6 class="fw-bold">30 Ngày Đổi Trả</h6>
                    <small class="text-muted">Hoàn tiền dễ dàng</small>
                </div>
                <div class="col-md-3 feature-box">
                    <div class="feature-icon"><i class="fas fa-headset"></i></div>
                    <h6 class="fw-bold">Hỗ Trợ 24/7</h6>
                    <small class="text-muted">Luôn sẵn sàng</small>
                </div>
            </div>
        </div>

        <div class="container" id="shop">
            <div class="row">
                <div class="col-lg-3 mb-5">
                    <div class="card filter-card sticky-top" style="top: 90px; z-index: 1;">
                        <div class="card-body p-4">
                            <h5 class="fw-bold mb-4"><i class="fas fa-filter me-2 text-primary"></i>Bộ Lọc</h5>

                            <form id="filterForm">
                                <div class="mb-4">
                                    <label class="form-label small fw-bold text-muted text-uppercase">Tìm kiếm</label>
                                    <div class="modern-search-bar">
                                        <input type="text" id="keywordInput" name="keyword"
                                            placeholder="Tên sách, tác giả...">
                                        <button type="button" id="btnApplyFilter"><i class="fas fa-search"></i></button>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label small fw-bold text-muted text-uppercase">Khoảng giá</label>
                                    <div class="d-flex gap-2 align-items-center">
                                        <input type="number" class="form-control rounded-pill bg-light border-0"
                                            name="minPrice" placeholder="0">
                                        <span class="text-muted">-</span>
                                        <input type="number" class="form-control rounded-pill bg-light border-0"
                                            name="maxPrice" placeholder="Max">
                                    </div>
                                </div>

                                <div class="mb-2">
                                    <label class="form-label small fw-bold text-muted text-uppercase">Danh mục</label>
                                    <div class="d-flex flex-column gap-2">
                                        <label class="filter-option d-flex align-items-center p-2 rounded">
                                            <input class="form-check-input me-3 filter-input" type="radio" name="cateId"
                                                value="" checked>
                                            <span class="flex-grow-1">Tất cả</span>
                                            <span class="badge bg-light text-dark rounded-pill">All</span>
                                        </label>
                                        <c:forEach var="cate" items="${categories}">
                                            <label class="filter-option d-flex align-items-center p-2 rounded">
                                                <input class="form-check-input me-3 filter-input" type="radio"
                                                    name="cateId" value="${cate.categoryId}">
                                                <span class="flex-grow-1">${cate.categoryName}</span>
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="d-flex justify-content-between align-items-end mb-4 border-bottom pb-3">
                        <div>
                            <h3 class="section-title mb-1">Sách Mới Nổi Bật</h3>
                            <p class="text-muted small mb-0">Hiển thị các cuốn sách tốt nhất dành cho bạn</p>
                        </div>

                        <div class="spinner-border text-primary d-none" id="loadingSpinner" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>

                    <div class="row g-4" id="bookListContainer">
                        <jsp:include page="/WEB-INF/views/fragments/book-list.jsp" />
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener("DOMContentLoaded", function () {

                const myCarouselElement = document.querySelector('#bannerCarousel');
                if (myCarouselElement) {
                    const carousel = new bootstrap.Carousel(myCarouselElement, {
                        interval: 3000,
                        ride: 'carousel',
                        pause: 'hover',
                        wrap: true
                    });
                    carousel.cycle();
                }
                const filterForm = document.getElementById('filterForm');
                const bookListContainer = document.getElementById('bookListContainer');
                const loadingSpinner = document.getElementById('loadingSpinner');
                const btnApplyFilter = document.getElementById('btnApplyFilter');
                const filterInputs = document.querySelectorAll('.filter-input, input[name="minPrice"], input[name="maxPrice"]');
                const keywordInput = document.getElementById('keywordInput');

                // Hàm Debounce: Giúp trì hoãn việc gọi server liên tục khi gõ phím
                function debounce(func, wait) {
                    let timeout;
                    return function (...args) {
                        clearTimeout(timeout);
                        timeout = setTimeout(() => func.apply(this, args), wait);
                    };
                }

                function fetchBooks() {
                    loadingSpinner.classList.remove('d-none');
                    bookListContainer.style.opacity = '0.5'; // Hiệu ứng mờ khi đang load
                    bookListContainer.style.pointerEvents = 'none'; // Chặn click lung tung

                    const formData = new FormData(filterForm);
                    const params = new URLSearchParams(formData);

                    fetch('${pageContext.request.contextPath}/api/search?' + params.toString())
                        .then(response => response.text())
                        .then(html => {
                            // Giả lập delay một chút cho mượt (tuỳ chọn)
                            setTimeout(() => {
                                bookListContainer.innerHTML = html;
                                loadingSpinner.classList.add('d-none');
                                bookListContainer.style.opacity = '1';
                                bookListContainer.style.pointerEvents = 'auto';
                            }, 300);
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            loadingSpinner.classList.add('d-none');
                            bookListContainer.style.opacity = '1';
                        });
                }

                // Sự kiện: Click nút Search
                if (btnApplyFilter) {
                    btnApplyFilter.addEventListener('click', fetchBooks);
                }

                // Sự kiện: Gõ phím Enter (Có Debounce 500ms)
                const debouncedFetch = debounce(fetchBooks, 500);

                if (keywordInput) {
                    keywordInput.addEventListener('input', debouncedFetch); // Tìm ngay khi gõ xong
                    keywordInput.addEventListener('keypress', function (e) {
                        if (e.key === 'Enter') {
                            e.preventDefault();
                            fetchBooks();
                        }
                    });
                }

                // Sự kiện: Thay đổi danh mục hoặc giá
                filterInputs.forEach(input => {
                    input.addEventListener('change', fetchBooks);
                });

                // TOAST CART FUNCTION
                window.addToCart = function (event, bookName, bookId) {
                    event.preventDefault();
                    event.stopPropagation();

                    // Hiển thị Toast đẹp hơn
                    const toastEl = document.getElementById('cartToast');
                    const toastBody = document.getElementById('cartToastBody');

                    // Update nội dung
                    toastBody.innerHTML = `<i class="fas fa-check-circle me-2"></i> Đã thêm <strong>${bookName}</strong> vào giỏ!`;

                    const toast = new bootstrap.Toast(toastEl);
                    toast.show();

                    // Gọi API thêm giỏ hàng thật
                    fetch('${pageContext.request.contextPath}/cart/add/' + bookId)
                        .then(res => {
                            if (res.ok) {
                                // Có thể update số lượng trên icon giỏ hàng ở header tại đây
                                console.log('Cart updated');
                            }
                        })
                        .catch(err => console.error('Lỗi thêm giỏ hàng', err));
                };
            });
        </script>

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

        <jsp:include page="/WEB-INF/views/layout/footer.jsp" />