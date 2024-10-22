<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

    <h2>CustPage Page</h2>
    <table class="table" id="cdata">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Password</th>
            <th>Name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${custPage.getList()}">
            <tr>
                <td><a href="/cust/page?id=${c.custId}">${c.custId}</a></td>
                <td>${c.custPwd}</td>
                <td>${c.custName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../nav.jsp"/>
</div>
