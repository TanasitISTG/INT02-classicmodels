<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: God_5
  Date: 12/16/2022
  Time: 7:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customers List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1>Customers List</h1>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Country</th>
                    <th>Phone</th>
                    <th>Role</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${customers}" var="customer">
                    <tr>
                        <td>034-${customer.customerNumber}</td>
                        <td>${customer.customerName}</td>
                        <td>${customer.addressLine1}, ${customer.city}</td>
                        <td>${customer.country}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.role}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
