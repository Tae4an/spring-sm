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
</style>

<h1>상품 등록</h1>

<form action="registerProduct" method="post" enctype="multipart/form-data">
    <label for="category">카테고리:</label>
    <select id="category" name="category_id" required>
        <option value="2">스마트폰</option>
        <option value="3">노트북</option>
        <option value="4">태블릿</option>
        <option value="5">스마트워치</option>
        <option value="7">TV</option>
        <option value="8">냉장고</option>
        <option value="9">세탁기</option>
        <option value="11">의류</option>
        <option value="12">신발</option>
        <option value="13">액세서리</option>
        <option value="15">소설</option>
        <option value="16">자기계발</option>
        <option value="17">과학</option>
    </select>

    <label for="name">상품명:</label>
    <input type="text" id="name" name="name" required>

    <label for="price">가격:</label>
    <input type="number" id="price" name="price" required>

    <label for="description">상품 설명:</label>
    <textarea id="description" name="description" rows="4" required></textarea>

    <label for="img1">상품 이미지:</label>
    <input type="file" id="img1" name="img1" accept="image/*" required>

    <label for="count">재고 수량:</label>
    <input type="number" id="count" name="count" required>

    <label for="is_public">공개 여부:</label>
    <select id="is_public" name="is_public" required>
        <option value="true">공개</option>
        <option value="false">비공개</option>
    </select>

    <input type="submit" value="등록">
</form>