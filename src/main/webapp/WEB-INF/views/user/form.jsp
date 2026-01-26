<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
  <title>${user.id == null ? 'Add New User' : 'Edit User'}</title>
  <style>
    .form-group { margin-bottom: 15px; }
    label { display: inline-block; width: 100px; font-weight: bold; }
    input { padding: 5px; width: 300px; }
    button { padding: 5px 15px; background-color: #4CAF50; color: white; border: none; cursor: pointer; }
    button:hover { background-color: #45a049; }
    .error { color: red; margin-left: 10px; }
  </style>
</head>
<body>
<h2>${user.id == null ? 'Add New User' : 'Edit User'}</h2>

<p><a href="${pageContext.request.contextPath}/user">Back to List</a></p>

<form:form action="${pageContext.request.contextPath}/user/save" method="post" modelAttribute="user">

  <form:hidden path="id"/>

  <div class="form-group">
    <label>Full Name:</label>
    <form:input path="fullName" required="true"/>
  </div>

  <div class="form-group">
    <label>Username:</label>
    <form:input path="username" required="true"/>
  </div>

  <div class="form-group">
    <label>Email:</label>
    <form:input path="email" type="email" required="true"/>
  </div>

  <div class="form-group">
    <label></label>
    <button type="submit">Save User</button>
  </div>

</form:form>
</body>
</html>