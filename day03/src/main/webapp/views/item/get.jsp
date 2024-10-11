<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<style>
    #item_img{
        width:80px;
    }
</style>

<div class="col-sm-10">

    <h2>Item Get Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Image</th>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>RegDate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${items}">
            <tr>
                <td><img id="item_img" src="<c:url value="/img"/>/${c.imgName}"></td>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td><fmt:formatNumber type="number" pattern="###,###원" value="${c.price}" />
                <td><fmt:formatDate  value="${c.regDate}" pattern="yyyy년MM월dd일" />
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>