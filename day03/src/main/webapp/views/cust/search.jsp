<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="if" uri="http://www.springframework.org/tags" %>

<div class="col-sm-10">

    <h2>CustSearch Page</h2>
    <form action="<c:url value="/cust/find_impl"/>" method="GET">
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <text>Select list:</text>
                </div>
                <div class="col-sm-1.5">
                    <select class="form-control" name=keyword>
                        <option value="id"
                                <c:if test="${search.keyword == 'id'}"> selected </c:if>
                        >ID
                        </option>
                        <option value="name"
                                <c:if test="${search.keyword == 'name'}"> selected </c:if>
                        >NAME
                        </option>
                    </select>
                </div>
                <div class="col-sm-7">
                    <input type="text" class="form-control" name="search"
                    <c:if test="${search.search != null}"> value="${search.search}" </c:if>
                    >
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </div>
    </form>
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
                <td><a href="/cust/detail?id=${c.custId}">${c.custId}</a></td>
                <td>${c.custPwd}</td>
                <td>${c.custName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${custPage.getSize() != null}">
        <jsp:include page="../searchNav.jsp"/>
    </c:if>
</div>
