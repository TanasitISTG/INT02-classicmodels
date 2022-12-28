<%--
  Created by IntelliJ IDEA.
  User: God_5
  Date: 12/26/2022
  Time: 10:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Dash board</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-5">
    <h1>Employee Information</h1>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <h5 class="card-title">Employee Number:</h5>
                    <p class="card-text">${secret_user.employeeNumber}</p>
                </div>
                <div class="col-md-6">
                    <h5 class="card-title">Name:</h5>
                    <p class="card-text">${secret_user.firstName} ${secret_user.lastName}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h5 class="card-title">Email:</h5>
                    <p class="card-text">${secret_user.email}</p>
                </div>
                <div class="col-md-6">
                    <h5 class="card-title">Office:</h5>
                    <p class="card-text">${secret_user.office.city}, ${secret_user.office.country}</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <h5 class="card-title">Reports To:</h5>
                    <p class="card-text">${secret_user.reportsTo}, ${reports_to.firstName} ${reports_to.lastName}</p>
                </div>
                <div class="col-md-6">
                    <h5 class="card-title">Job Title:</h5>
                    <p class="card-text">${secret_user.jobTitle}</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
