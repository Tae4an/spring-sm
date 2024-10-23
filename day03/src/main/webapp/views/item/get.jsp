<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #dataTable {
        width: 100%;
    }
    #img{
        width: 100px;
    }
</style>
<div class="col-sm-10">
    <h1>Item Get Page</h1>
    <h5>아이템 검색</h5>
    <form action="<c:url value="/item/search"/>" method="GET" class="mb-3">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="검색어를 입력하세요..(아이템 이름, 아이템 가격, 날짜..)"  name="keyword"
            <c:if test="${keyword != null}"> value="${keyword}" </c:if>
            >
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </div>
    </form>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable">
                <thead class="thead-dark">
                <tr>
                    <th>Image</th>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Reg Date</th>
                    <th>Update Date</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="item" items="${itemPage.getList()}">
                    <tr>
                        <td>
                            <a href="<c:url value="/item/detail"/>?id=${item.itemId}">
                                <img id="img" src="<c:url value="/imgs"/>/${item.imgName}">
                            </a>
                        </td>
                        <td>${item.itemId}</td>
                        <td><a href="<c:url value="/item/detail"/>?id=${item.itemId}">
                                ${item.itemName}
                        </td>
                        <td>
                            <fmt:formatNumber type="number" pattern="###,###원" value="${item.itemPrice}"/></td>
                        <td>
                            <fmt:parseDate value="${ item.regDate }"
                                           pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }"/></td>
                        <td>
                            <fmt:parseDate value="${ item.updateDate }"
                                           pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                            <fmt:formatDate pattern="dd.MM.yyyy HH:mm" value="${ parsedDateTime }"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="searchNav.jsp"/>
</div>

