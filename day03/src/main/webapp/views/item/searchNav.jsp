<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- pagination start -->
<div class="col text-center ">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${itemPage.getPrePage() != 0}">
                <li class="page-item">
                    <a class = "page-link" href="<c:url value="/${target}/search?pageNo=${itemPage.getPrePage()}&keyword=${keyword}"/> ">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a  class="page-link"  href="#">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${itemPage.getNavigateFirstPage() }" end="${itemPage.getNavigateLastPage() }" var="page">
            <c:choose>
                <c:when test="${itemPage.getPageNum() == page}">
                    <li class="page-item active">
                        <a class = "page-link" href="<c:url value="/${target}/search?pageNo=${page}&keyword=${keyword}"/> ">${page }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link"  href="<c:url value="/${target}/search?pageNo=${page}&keyword=${keyword}"/> ">${page }</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${itemPage.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link" href="<c:url value="/${target}/search?pageNo=${itemPage.getNextPage()}&keyword=${keyword}"/> ">Next</a>
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