<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>2024년 몰입형 SW 정규과정 실습</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="<c:url value="/js/index.js"/> "></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d2ca8e15764aac3b60faca46633851f&libraries=services"></script>

    <style>
        #back_img{
            width: auto;
            height: 400px;
        }
    </style>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0; background-color: #3e5570; color: #FFFFFF">
    <h1>2024년 몰입형 SW 정규과정 실습</h1>
</div>
<ul class="nav justify-content-end">
    <c:choose>
        <c:when test="${sessionScope.loginid == null}">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/login"/> ">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/register"/>">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/about"/>">About us</a>
            </li>
        </c:when>
        <c:otherwise>
            <li class="nav-item">
                <a class="nav-link" href="#">${sessionScope.loginid}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logout_impl"/>">Logout</a>
            </li>
        </c:otherwise>
    </c:choose>

</ul>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="<c:url value="/" /> ">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/js" /> ">JS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/ajax"/> ">AJAX</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/map"/> ">Map</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/chart"/> ">Chart</a>
            </li>
            <c:if test="${sessionScope.loginid != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/cust"/> ">Cust</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/item"/> ">Item</a>
                </li>
            </c:if>

        </ul>
    </div>
</nav>

<div class="container" style="margin-top:30px">
    <div class="row">
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Footer</p>
</div>

</body>
</html>