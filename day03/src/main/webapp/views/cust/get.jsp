<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-sm-10">

    <h2>Get Page</h2>
    <button id="btn_get">Get Data</button>
    <h5>Title description, Sep 2, 2017</h5>
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
                <td>${c.id}</td>
                <td>${c.pwd}</td>
                <td>${c.name}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>