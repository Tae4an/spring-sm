<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

    <h2>Get Page</h2>
    <h5>회원 정보</h5>
    <table class="table" id="cdata">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Password</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${custs}">
            <tr>
                <td><a href="/cust/detail?id=${c.custId}">${c.custId}</a></td>
                <td>${c.custPwd}</td>
                <td>${c.custName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
