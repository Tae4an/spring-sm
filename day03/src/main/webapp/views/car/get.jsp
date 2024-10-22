<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<style>
    #car_img {
        width: 200px;
    }
</style>

<div class="col-sm-10">

    <h2>Car Get Page</h2>
    <br>
    <h5>차량 검색</h5>
    <form action="<c:url value="/car/search"/>" method="GET" class="mb-3">
        <div class="input-group">
            <%--            <input type="text" class="form-control" placeholder="차량 이름 검색" name="name">--%>
            <input type="text" class="form-control" placeholder="검색어를 입력하세요..(차량 이름, 차량 가격, 차량 색상, 차량 타입..)"  name="keyword"
            <c:if test="${keyword != null}"> value="${keyword}" </c:if>
            >
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </div>
    </form>
    <h5>차량 목록</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Color</th>
            <th>Type</th>
            <th>Price</th>
            <th>Production Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carPage.getList()}">
            <tr>
                <td><img id="car_img" src="<c:url value="/img/car"/>/${c.carImg}"></td>
                <td><a href="/car/detail?id=${c.carId}"/>${c.carName}</td>
                <td>${c.carColor}</td>
                <td>${c.carType}</td>
                <td><fmt:formatNumber type="number" pattern="###,###원" value="${c.carPrice}"/>
                <td>
                    <c:set var="dateFormat" value="yyyy년 MM월 dd일"/>
                        ${c.productionDate.format(DateTimeFormatter.ofPattern(dateFormat))}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="searchNav.jsp"/>
</div>
