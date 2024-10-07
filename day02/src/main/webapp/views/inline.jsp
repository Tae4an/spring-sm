<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inline 요소 예제</title>
    <link href="/css/inline.css" rel="stylesheet">

</head>
<body>
<h1>포괄적인 Inline 요소 예제</h1>

<div class="section">
    <h2>1. 기본 Inline 요소</h2>
    <p>
        이 문단은 다양한 inline 요소를 포함합니다:
        <span class="highlight">highlighted span</span>,
        <a href="#" class="custom-link">사용자 정의 링크</a>,
        <strong>강조된 텍스트</strong>,
        <em>기울임꼴 텍스트</em>,
        <code>인라인 코드</code>,
        <mark>마크된 텍스트</mark>,
        <small>작은 텍스트</small>,
        텍스트<sub>아래 첨자</sub>,
        텍스트<sup>위 첨자</sup>.
    </p>
</div>

<div class="section">
    <h2>2. Inline vs Block vs Inline-block</h2>
    <p>Inline 요소들 (기본값):
        <span>Span 1</span>
        <span>Span 2</span>
        <span>Span 3</span>
    </p>
    <p>Block 요소들:
    <div class="block">Block 1</div>
    <div class="block">Block 2</div>
    <div class="block">Block 3</div>
    </p>
    <p>Inline-block 요소들:
        <span class="inline-block">IB 1</span>
        <span class="inline-block">IB 2</span>
        <span class="inline-block">IB 3</span>
    </p>
</div>

<div class="section">
    <h2>3. Inline 요소의 마진과 패딩</h2>
    <p class="inline-container">
        일반 텍스트
        <span style="padding: 10px;">패딩 10px</span>
        <span style="margin: 0 10px;">좌우 마진 10px</span>
        <span style="margin: 10px 0;">상하 마진 10px (효과 없음)</span>
        일반 텍스트
    </p>
</div>

<div class="section">
    <h2>4. Inline 요소의 수직 정렬</h2>
    <p class="vertical-align-demo">
        기준선
        <span class="baseline">baseline</span>
        <span class="top">top</span>
        <span class="middle">middle</span>
        <span class="bottom">bottom</span>
        <span class="text-top">text-top</span>
        <span class="text-bottom">text-bottom</span>
    </p>
</div>

<div class="section">
    <h2>5. Inline 이미지와 텍스트 흐름</h2>
    <p>
        텍스트 시작
        <img src="/api/placeholder/50/50" alt="작은 이미지" style="vertical-align: middle;" />
        이미지 주변의 텍스트
        <img src="/api/placeholder/100/100" alt="큰 이미지" style="vertical-align: middle;" />
        텍스트 끝
    </p>
</div>
</body>
</html>