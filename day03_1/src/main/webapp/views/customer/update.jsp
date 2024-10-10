<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    h1 {
        color: #333;
    }
    form {
        max-width: 400px;
        margin: 0 auto;
    }
    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"], input[type="email"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }

    .search-form {
        margin-bottom: 20px;
    }

    .search-result { max-width: 400px; margin: 0 auto 20px; }

</style>

<h1>회원 정보 수정 페이지</h1>

<form class="search-form" action="searchForEdit" method="get">
    <input type="text" name="keyword" placeholder="이름 또는 이메일로 검색" required>
    <input type="submit" value="검색">
</form>

<div class="search-result">
    <h2>검색 결과</h2>
    <p>검색된 회원: 홍길동 (hong@example.com)</p>
</div>

<form action="update" method="post">
    <input type="hidden" name="id" value="${member.id}">

    <label for="name">이름:</label>
    <input type="text" id="name" name="name" value="홍길동" required>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" value="hong@example.com" required>

    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone" value="010-1234-5678">

    <input type="submit" value="수정">
</form>
