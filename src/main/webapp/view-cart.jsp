<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<c:choose>
    <c:when test="${cart==null || empty cart.allItem}">
        <div class="alert alert-warning align-items-center" role="alert">
            <h4 class="alert-heading">Your cart is empty!</h4>
            <p>Go to <a class="modal-close" href="javascript:loadProduct(1,15)" onclick="$('#viewCartModal').modal('hide')">product</a> page to add items to your cart.</p>
        </div>

    </c:when>
    <c:otherwise>
        <table class="table table-dark table-bordered">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Product</th>
                <th scope="col">Quantity</th>
                <th scope="col">Price</th>
                <th scope="col">Total</th>
                <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${cart.allItem}" var="item">
                <tr>
                    <td>${item.product.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.product.msrp}</td>
                    <td>${item.getTotal()}</td>
                    <td>
                        <a href="javascript:removeItem('${item.product.productCode}')" class="btn btn-danger">Remove</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="alert alert-success" role="alert">
            <h4 class="alert-heading">Total: ${cart.totalPrice}</h4>
        </div>
    </c:otherwise>
</c:choose>