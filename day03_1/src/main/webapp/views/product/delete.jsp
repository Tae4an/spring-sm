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
    .product-image { width: 100px; height: 100px; object-fit: cover; margin-bottom: 10px; }
</style>

<h1>상품 삭제</h1>

<form class="search-form" action="searchForDeleteProduct" method="get">
    <input type="text" name="keyword" placeholder="상품명으로 검색" required>
    <input type="submit" value="검색">
</form>

<div class="search-result">
    <h2>검색 결과</h2>
    <img src="iphone15.jpg" alt="아이폰 15" class="product-image">
    <p>상품명: 아이폰 15</p>
    <p>카테고리: 스마트폰</p>
    <p>가격: 1,200,000원</p>
    <p>재고: 100개</p>
    <p>등록일: 2024-08-01</p>
    <p>공개 여부: 공개</p>
</div>

<div class="confirm-box">
    <p>정말로 '아이폰 15' 상품을 삭제하시겠습니까?</p>
    <a href="confirmDeleteProduct?id=1" class="btn btn-delete">삭제</a>
    <a href="productList" class="btn btn-cancel">취소</a>
</div>