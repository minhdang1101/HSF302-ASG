<h2>${book.bookName}</h2>
<p><i>Đọc thử</i></p>

<div style="white-space: pre-line">
    ${preview}
</div>

<p>👉 Mua sách để đọc đầy đủ nội dung</p>
<a href="${pageContext.request.contextPath}/cart/add/${book.bookId}">
    Mua ngay
</a>
