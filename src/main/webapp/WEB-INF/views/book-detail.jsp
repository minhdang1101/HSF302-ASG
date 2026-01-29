<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${book.bookName}</title>
</head>
<body>

<h1>${book.bookName}</h1>

<img src="${book.coverPics}" width="200"/>

<p><b>Tác giả:</b> ${book.author}</p>
<p><b>Thể loại:</b> ${book.category.categoryName}</p>
<p><b>Giá:</b> ${book.price} VND</p>

<hr/>

<h3>Mô tả</h3>
<p>${book.description}</p>

<h3>Nội dung</h3>
<p>${book.bookContent}</p>
<hr/>

<h3>Đánh giá từ người đọc</h3>

<c:choose>
    <c:when test="${empty reviews}">
        <p>Chưa có đánh giá nào cho sách này.</p>
    </c:when>

    <c:otherwise>
        <c:forEach var="r" items="${reviews}">
            <div style="border:1px solid #ddd; padding:10px; margin-bottom:10px">
                <b>${r.user.fullName}</b>
                <span> - ⭐ ${r.rating}/5</span>
                <br/>
                <small>${r.createdDate}</small>
                <p>${r.comment}</p>
            </div>
        </c:forEach>
    </c:otherwise>
</c:choose>


</body>
</html>
