<%--
  Created by IntelliJ IDEA.
  User: INT202&204
  Date: 11/9/2022
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Office Listings</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<div class="row bg-secondary">
    <h2>Classic Model Offices ::</h2>
</div>
<div class="row">
    <c:forEach items="${offices}" var="office">
        <div onclick="loadOffice('${office.officeCode}')"
                class="div-link col-2 border border-secondary p-2 m-2 text-dark ${office.officeCode == selectedOffice.officeCode ? 'bg-warning' : 'bg-light'}">
            <div>
                ${office.city}, ${office.country}
            </div>
            <div> ${office.phone}</div>
        </div>
    </c:forEach>
</div>
<br>
<div class="row bg-light text-dark">
    <b>Employees ::</b>
</div>
<div class="row">
    <c:forEach items="${selectedOffice.employeeList}" var="employee">
        <div class="col-2 pl-2 m-2 border border-secondary rounded-pill bg-light">
            <div class="text-dark"> ${employee.firstName}
                    ${employee.lastName} - ${employee.jobTitle}
            </div>
        </div>
    </c:forEach>
</div>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
