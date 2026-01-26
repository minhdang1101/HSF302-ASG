<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
  <title>User List</title>
  <style>
    table, th, td { border: 1px solid black; border-collapse: collapse; padding: 8px; }
  </style>
</head>
<body>
<h2>User Management</h2>
<a href="user/add">Add New User</a>
<br/><br/>
<table>
  <thead>
  <tr>
    <th>Name</th>
    <th>Username</th>
    <th>Email</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="u" items="${users}">
    <tr>
      <td>${u.fullName}</td>
      <td>${u.username}</td>
      <td>${u.email}</td>
      <td>
        <a href="user/edit/${u.id}">Edit</a> |
        <a href="user/delete/${u.id}">Delete</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>