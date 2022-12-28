<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Classic Model Online</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .cart-info {
            margin-left: -1em;
            border-radius: 12px;
            background-color: bisque;
            position: absolute;
            z-index: 100;
            border: none;
            padding-left: 5px;
            padding-right: 5px;
            display: none;
        }

    </style>
    <script>
        function logout() {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-right'></i> Login"
            }
            xhttp.open("GET", "logout");
            xhttp.send();
        }

        function login(userName, password) {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                if (!userName || !password) {
                    document.getElementById("login-message").textContent = "Invalid user name or password !!!";
                } else if (xhttp.status === 200) {
                    $('#modalLoginForm').modal('hide');
                    document.getElementById("login-menu").innerHTML = "<i class='bi bi-box-arrow-left'></i> Logout"
                    document.getElementById("login-message").textContent = "";
                } else if (xhttp.status >= 500) {
                    document.getElementById("login-message").textContent = xhttp.statusText;
                } else {
                    document.getElementById("login-message").textContent = "Wrong user name or password !!!";
                }
            }
            let urlEncodedData = "", urlEncodedDataPairs = [];
            urlEncodedDataPairs.push(encodeURIComponent("userName") + '=' + encodeURIComponent(userName));
            urlEncodedDataPairs.push(encodeURIComponent("password") + '=' + encodeURIComponent(password));
            urlEncodedData = urlEncodedDataPairs.join('&').replace(/%20/g, '+');
            xhttp.open("POST", "login");
            xhttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttp.send(urlEncodedData);
        }


        function showLoginForm() {
            let menu = document.getElementById("login-menu").innerHTML;
            if (menu.includes('Logout')) {
                logout();
            } else {
                $('#modalLoginForm').modal('show');
                $('.modal-content').addClass("bg-dark text-white");
            }
        }

        function addToCart(productCode) {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                cartInfo = document.getElementById("noOfItemInCart");
                noOfItem = xhttp.responseText;
                if (xhttp.response.length > 4) {
                    alert(noOfItem)
                    return;
                }
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'none'
                }
                cartInfo.innerHTML = noOfItem;
            }
            xhttp.open("GET", "add-to-cart?productCode=" + productCode);
            xhttp.send();
        }

        function setLoading(on_off) {
            let loading = document.getElementById("loading");
            if (on_off == 'on') {
                loading.classList.remove("d-none");
                loading.classList.add("d-inline");
            } else {
                loading.classList.remove("d-inline");
                loading.classList.add("d-none");
            }
        }

        function loadOffice(officeCode) {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off')
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "office-list?officeCode=" + officeCode);
            xhttp.send();
            updateNumberOfItem()
        }

        function loadProduct(page, pageSize = document.getElementById("itemsPage").value) {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off')
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "product-list?page=" + page + "&pageSize=" + pageSize);
            xhttp.send();

            updateNumberOfItem()
        }

        function loadOrderHistory() {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off')
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "order-history");
            xhttp.send();

            updateNumberOfItem()
        }

        function viewCart() {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off')
                document.getElementById("view-cart").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "view-cart.jsp");
            xhttp.send();

            $('#viewCartModal').modal('show');
            $('.modal-content').addClass("bg-dark text-white");
            updateNumberOfItem()

        }

        function removeItem(productCode) {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
            };
            xhttp.open("GET", "removeItem?productCode=" + productCode);
            xhttp.send();
            updateNumberOfItem()
            viewCart();
        }

        function updateNumberOfItem() {
            setLoading('on')
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off');
                cartInfo = document.getElementById("noOfItemInCart");
                noOfItem = xhttp.responseText;
                if (xhttp.response.length > 4) {
                    return;
                }
                if (noOfItem > 0) {
                    cartInfo.style.display = 'inline'
                } else {
                    cartInfo.style.display = 'none'
                }
                cartInfo.innerHTML = noOfItem;
            }
            xhttp.open("GET", "update-number-of-item");
            xhttp.send();
        }

        function loadHomepage() {
            setLoading('on');
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                setLoading('off')
                document.getElementById("body-content").innerHTML = xhttp.responseText;
            }
            xhttp.open("GET", "./assets/home-info.html");
            xhttp.send();
        }
    </script>
</head>
<body class="bg-dark">
<nav class="navbar navbar-expand-sm navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand text-warning" href="javascript:loadHomepage()">Classic Model</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mynavbar">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOffice('')">Office</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadProduct(1,15)">Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:loadOrderHistory()">Order History</a>
                </li>
                <li class="nav-item ml-4">
                    <a id="login-menu" class="nav-link text-dark" href="javascript:showLoginForm()"><i
                            class="bi bi-box-arrow-in-right"></i> Login</a>
                </li>
            </ul>
            <div style="margin-right: 20px">
                <img src="assets/images/cart.png" width="42" onclick="viewCart()"/>
                <button id="noOfItemInCart" class="cart-info" onclick="viewCart()"></button>
            </div>
            <form class="d-flex">
                <input id="searchBox" class="form-control me-2" type="text" placeholder="Search">
<%--                <button class="btn btn-primary" type="button" onclick="search(thisContent)">Search</button>--%>
                <i class="bi bi-search" style="font-size: 1.5rem;"></i>
            </form>
        </div>
    </div>
</nav>
<div class="container text-light" id="body-content">
    <jsp:include page="assets/home-info.html"/>
</div>
<div class="d-flex justify-content-center modal d-none" id="loading">
    <div class="spinner-border text-primary"
         style="margin-top: 10%; width: 6rem; height: 6rem;">
    </div>
</div>
<div class="modal fade" id="modalLoginForm" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Sign in</h4>
                <button type="button" class="close"
                        onclick="$('#modalLoginForm').modal('hide')">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-2">
                    <i class="bi bi-person-lines-fill h3"></i>
                    <input type="email" id="defaultForm-user" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-user">User name</label>
                </div>
                <div class="md-form mb-2">
                    <i class="bi bi-key h3"></i>
                    <input type="password" id="defaultForm-pass" class="form-control validate">
                    <label data-error="wrong" data-success="right" for="defaultForm-pass">Your password</label>
                </div>
                <div class="md-form mt-2">
                    <label class="text-danger" id="login-message"></label>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center border-0">
                <button class="btn btn-primary"
                        onclick="login($('#defaultForm-user').val(), $('#defaultForm-pass').val())">Login
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal" tabindex="-1" id="viewCartModal">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Your Cart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"
                        onclick="$('#viewCartModal').modal('hide')">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" id="view-cart"></div>
        </div>
    </div>
</div>
</body>
</html>