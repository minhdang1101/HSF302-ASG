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

</body>
</html>
