<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    h1 { color: #333; }
    form { max-width: 400px; margin: 0 auto; }
    label { display: block; margin-bottom: 5px; }
    input[type="text"], input[type="number"], textarea, select {
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
    input[type="submit"]:hover { background-color: #45a049; }
    .search-form { margin-bottom: 20px; }
    .search-result { max-width: 400px; margin: 0 auto 20px; }
    .current-image { max-width: 100px; margin-bottom: 10px; }
</style>

<h1>상품 정보 수정</h1>

<form class="search-form" action="searchForEditProduct" method="get">
    <input type="text" name="keyword" placeholder="상품명으로 검색" required>
    <input type="submit" value="검색">
</form>

<div class="search-result">
    <h2>검색 결과</h2>
    <p>검색된 상품: 아이폰 15</p>
</div>

<form action="updateProduct" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${product.id}">

    <label for="category">카테고리:</label>
    <select id="category" name="category_id" required>
        <option value="2" selected>스마트폰</option>
        <option value="3">노트북</option>
        <!-- 다른 카테고리 옵션들 -->
    </select>

    <label for="name">상품명:</label>
    <input type="text" id="name" name="name" value="아이폰 15" required>

    <label for="price">가격:</label>
    <input type="number" id="price" name="price" value="1200000" required>

    <label for="description">상품 설명:</label>
    <textarea id="description" name="description" rows="4" required>애플 스마트폰</textarea>

    <label for="count">재고 수량:</label>
    <input type="number" id="count" name="count" value="100" required>

    <label for="is_public">공개 여부:</label>
    <select id="is_public" name="is_public" required>
        <option value="true" selected>공개</option>
        <option value="false">비공개</option>
    </select>

    <label>현재 이미지:</label>
    <img src="iphone15.jpg" alt="현재 이미지" class="current-image">

    <label for="img1">새 이미지 업로드 (선택사항):</label>
    <input type="file" id="img1" name="img1" accept="image/*">

    <input type="submit" value="수정">
</form>