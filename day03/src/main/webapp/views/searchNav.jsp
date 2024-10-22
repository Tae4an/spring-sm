<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="col text-center ">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${custPage.getPrePage() != 0}">
                <li class="page-item">
                    <a class = "page-link" href="<c:url value="/${target}/find_impl?pageNo=${custPage.getPrePage()}&keyword=${search.keyword}&search=${search.search}"/> ">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a  class="page-link"  href="#">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${custPage.getNavigateFirstPage() }" end="${custPage.getNavigateLastPage() }" var="page">
            <c:choose>
                <c:when test="${custPage.getPageNum() == page}">
                    <li class="page-item active">
                        <a class = "page-link" href="<c:url value="/${target}/find_impl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}"/> ">${page }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link"  href="<c:url value="/${target}/find_impl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}"/> ">${page }</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${custPage.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value="/${target}/find_impl?pageNo=${custPage.getNextPage()}&keyword=${search.keyword}&search=${search.search}"/> ">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link"  href="#">Next</a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->