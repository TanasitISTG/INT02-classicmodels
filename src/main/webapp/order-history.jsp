<%--
  Created by IntelliJ IDEA.
  User: God_5
  Date: 12/19/2022
  Time: 10:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <div class="row">
        <div class="col-12">
            <h3 class="text-center">Order History of ${user.customerName}</h3>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-dark table-bordered">
                    <caption style="caption-side: top">Order's information
                        of ${user.customerName}</caption>
                    <c:forEach items="${orders}" var="order" varStatus="vs">
                        <thead class="thead-dark">
                            <tr style="white-space:nowrap;">
                                <th scope="col">Order Number</th>
                                <th scope="col">Order Date</th>
                                <th scope="col">Shipped Date</th>
                                <th scope="col">Status</th>
                                <th scope="col">Comments</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td style="white-space:nowrap;">${order.orderNumber}</td>
                                <td style="white-space:nowrap;">${order.orderDate}</td>
                                <td style="white-space:nowrap;">${order.shippedDate}</td>
                                <td style="white-space:nowrap;">${order.status}</td>
                                <td>
                                    <c:if test="${order.comments == null}">No comments</c:if>
                                        ${order.comments}
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <c:forEach items="${orders}" var="order">
                    <table class="table table-dark table-bordered">
                        <caption style="caption-side: top">Information of order ${order.orderNumber}</caption>
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="white-space:nowrap;">Order Line Number</th>
                            <th scope="col" style="white-space:nowrap;">Product Code</th>
                            <th scope="col" style="white-space:nowrap;">Product Name</th>
                            <th scope="col" style="white-space:nowrap;">Product Description</th>
                            <th scope="col" style="white-space:nowrap;">Quantity Ordered</th>
                            <th scope="col" style="white-space:nowrap;">Price Each</th>
                            <th scope="col" style="white-space:nowrap;">Total</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${order.orderDetailList}" var="orderDetail">
                            <tr>
                                <td>${orderDetail.orderLineNumber}</td>
                                <td>${orderDetail.productCode}</td>
                                <td>${orderDetail.product.productName}</td>
                                <td>${orderDetail.product.productDescription}</td>
                                <td>${orderDetail.quantityOrdered}</td>
                                <td>${orderDetail.priceEach}</td>
                                <td>${orderDetail.quantityOrdered * orderDetail.priceEach}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
