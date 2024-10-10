<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <style>
        h1 { color: #333; }
        .search-form { max-width: 400px; margin: 0 auto 20px; }
        .search-form input[type="text"] { width: 70%; padding: 8px; margin-right: 10px; border: 1px solid #ddd; border-radius: 4px; }
        .search-form input[type="submit"] { background-color: #4CAF50; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .search-result { max-width: 400px; margin: 0 auto 20px; }
        .confirm-box { max-width: 400px; margin: 0 auto; text-align: center; }
        .btn { display: inline-block; padding: 10px 15px; margin: 10px; text-decoration: none; color: white; border-radius: 4px; }
        .btn-delete { background-color: #f44336; }
        .btn-cancel { background-color: #808080; }
    </style>

<h1>회원 삭제</h1>

<!-- 검색 폼 -->
<form class="search-form" action="searchForDelete" method="get">
    <input type="text" name="keyword" placeholder="이름 또는 이메일로 검색" required>
    <input type="submit" value="검색">
</form>

<!-- 검색 결과 (샘플) -->
<div class="search-result">
    <h2>검색 결과</h2>
    <p>검색된 회원: 홍길동 (hong@example.com)</p>
</div>

<!-- 삭제 확인 -->
<div class="confirm-box">
    <p>정말로 홍길동 회원을 삭제하시겠습니까?</p>
    <a href="confirmDelete?id=1" class="btn btn-delete">삭제</a>
    <a href="list" class="btn btn-cancel">취소</a>
</div>
</body>
</html>