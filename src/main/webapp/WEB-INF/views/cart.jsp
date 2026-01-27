<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>Your Shopping Cart</h2>

<c:choose>
    <c:when test="${empty cart}">
        <p>Your cart is empty.</p>
        <a href="/">Back to store</a>
    </c:when>
    <c:otherwise>
        <form action="${pageContext.request.contextPath}/cart/update" method="post">
            <table border="1" cellpadding="10">
                <tr>
                    <th>Book</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                    <th>Action</th>
                </tr>

                <c:forEach var="item" items="${cart}">
                    <tr>
                        <td>${item.bookName}</td>
                        <td>${item.price}</td>
                        <td>
                            <input type="hidden" name="bookId" value="${item.bookId}" />
                            <input type="number" name="quantity" value="${item.quantity}" min="1"/>
                        </td>
                        <td>${item.subtotal}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/cart/remove/${item.bookId}">Remove</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <br>
            <button type="submit">Update Cart</button>
            <a href="${pageContext.request.contextPath}/checkout">Proceed to Checkout</a>
        </form>
    </c:otherwise>
</c:choose>
