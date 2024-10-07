<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이미지 요소 예제</title>
    <link href="/css/img.css" rel="stylesheet">

</head>
<body>
<h1>이미지 요소 예제</h1>

<div class="section">
    <h2>1. 기본 이미지</h2>
    <img src="/img/img.png" alt="기본 이미지">
</div>

<div class="section">
    <h2>2. 반응형 이미지</h2>
    <img src="/img/img.png" alt="반응형 이미지" class="img-responsive">
</div>

<div class="section">
    <h2>3. 이미지 형태</h2>
    <img src="/img/img.png" alt="원형 이미지" class="img-circle" width="200" height="200">
    <img src="/img/img.png" alt="썸네일 이미지" class="img-thumbnail" width="200" height="200">
</div>

<div class="section clearfix">
    <h2>4. 이미지 정렬</h2>
    <img src="/img/img.png" alt="왼쪽 정렬 이미지" class="img-float-left" width="150" height="150">
    <p>이 텍스트는 왼쪽에 떠 있는 이미지 옆에 위치합니다.</p>
</div>

<div class="section clearfix">
    <img src="/img/img.png" alt="오른쪽 정렬 이미지" class="img-float-right" width="150" height="150">
    <p>이 텍스트는 오른쪽에 떠 있는 이미지 옆에 위치합니다. </p>
</div>

<div class="section">
    <h2>5. 중앙 정렬 이미지</h2>
    <img src="/img/img.png" alt="중앙 정렬 이미지" class="img-center" width="300" height="200">
</div>

<div class="section">
    <h2>6. 이미지 호버 효과</h2>
    <img src="/img/img.png" alt="호버 효과 이미지" class="img-hover-effect" width="200" height="200">
</div>

<div class="section">
    <h2>7. 이미지 캡션</h2>
    <figure class="img-caption">
        <img src="/img/img.png" alt="캡션 이미지" width="300" height="200">
        <figcaption>아주 예쁩니다</figcaption>
    </figure>
</div>

<div class="section">
    <h2>8. 이미지 맵</h2>
    <img src="/img/img.png" alt="이미지 맵" usemap="#workmap" width="400" height="300">
    <map name="workmap">
        <area shape="rect" coords="34,44,270,350" alt="Computer" href="#computer">
        <area shape="rect" coords="290,172,333,250" alt="Phone" href="#phone">
        <area shape="circle" coords="337,300,44" alt="Cup of coffee" href="#coffee">
    </map>
</div>
</body>
</html>