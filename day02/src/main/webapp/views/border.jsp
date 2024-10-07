<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>다양한 Border 스타일 예제</title>
    <link href="/css/border.css" rel="stylesheet">

</head>
<body>
<div class="container">
    <h1>다양한 Border 스타일 예제</h1>

    <div class="example">
        <h2>기본 Border 스타일</h2>
        <div class="box border-solid">Solid</div>
        <div class="box border-dotted">Dotted</div>
        <div class="box border-dashed">Dashed</div>
        <div class="box border-double">Double</div>
        <div class="box border-groove">Groove</div>
        <div class="box border-ridge">Ridge</div>
        <div class="box border-inset">Inset</div>
        <div class="box border-outset">Outset</div>
    </div>

    <div class="example">
        <h2>Border 두께</h2>
        <div class="box border-thick">Thick</div>
        <div class="box border-medium">Medium</div>
        <div class="box border-thin">Thin</div>
    </div>

    <div class="example">
        <h2>Border 색상</h2>
        <div class="box border-colored red">Red</div>
        <div class="box border-colored green">Green</div>
        <div class="box border-colored blue">Blue</div>
    </div>

    <div class="example">
        <h2>개별 방향 Border</h2>
        <div class="box border-top">Top</div>
        <div class="box border-right">Right</div>
        <div class="box border-bottom">Bottom</div>
        <div class="box border-left">Left</div>
    </div>

    <div class="example">
        <h2>둥근 모서리 Border</h2>
        <div class="box border-rounded">Rounded</div>
        <div class="box border-circle">Circle</div>
    </div>

    <div class="example">
        <h2>특수 Border 효과</h2>
        <div class="box border-gradient">Gradient</div>
        <div class="box border-image">Image</div>
    </div>
</div>
</body>
</html>