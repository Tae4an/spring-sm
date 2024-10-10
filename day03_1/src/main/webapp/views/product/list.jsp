<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    h1 { color: #333; }
    .search-form { max-width: 400px; margin: 0 auto 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ddd; padding: 8px; text-align: left; }
    th { background-color: #f2f2f2; }
    tr:nth-child(even) { background-color: #f9f9f9; }
    .action-links a { margin-right: 10px; text-decoration: none; color: #1a73e8; }
    .product-image { width: 50px; height: 50px; object-fit: cover; }
</style>

<h1>상품 목록</h1>

<form class="search-form" action="searchProduct" method="get">
    <input type="text" name="keyword" placeholder="상품명으로 검색" required>
    <input type="submit" value="검색">
</form>

<table>
    <thead>
    <tr>
        <th>이미지</th>
        <th>카테고리</th>
        <th>상품명</th>
        <th>가격</th>
        <th>등록일</th>
        <th>설명</th>
        <th>재고</th>
        <th>공개 여부</th>
        <th>작업</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><img src="iphone15.jpg" alt="아이폰 15" class="product-image"></td>
        <td>스마트폰</td>
        <td>아이폰 15</td>
        <td>1,200,000원</td>
        <td>2024-08-01</td>
        <td>애플 스마트폰</td>
        <td>100</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=1">수정</a>
            <a href="deleteProduct?id=1" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="galaxys24.jpg" alt="갤럭시 S24" class="product-image"></td>
        <td>스마트폰</td>
        <td>갤럭시 S24</td>
        <td>1,300,000원</td>
        <td>2024-08-02</td>
        <td>삼성 스마트폰</td>
        <td>90</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=2">수정</a>
            <a href="deleteProduct?id=2" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="macbookpro.jpg" alt="맥북 프로" class="product-image"></td>
        <td>노트북</td>
        <td>맥북 프로</td>
        <td>2,500,000원</td>
        <td>2024-08-03</td>
        <td>애플의 고성능 노트북</td>
        <td>50</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=3">수정</a>
            <a href="deleteProduct?id=3" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="galaxybook.jpg" alt="갤럭시북" class="product-image"></td>
        <td>노트북</td>
        <td>갤럭시북</td>
        <td>1,800,000원</td>
        <td>2024-08-04</td>
        <td>삼성 프리미엄 노트북</td>
        <td>60</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=4">수정</a>
            <a href="deleteProduct?id=4" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="ipadpro.jpg" alt="아이패드 프로" class="product-image"></td>
        <td>태블릿</td>
        <td>아이패드 프로</td>
        <td>1,000,000원</td>
        <td>2024-08-05</td>
        <td>애플의 프로급 태블릿</td>
        <td>70</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=5">수정</a>
            <a href="deleteProduct?id=5" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="applewatch.jpg" alt="애플워치" class="product-image"></td>
        <td>스마트워치</td>
        <td>애플워치</td>
        <td>500,000원</td>
        <td>2024-08-06</td>
        <td>애플의 스마트워치</td>
        <td>80</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=6">수정</a>
            <a href="deleteProduct?id=6" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="galaxywatch.jpg" alt="갤럭시워치" class="product-image"></td>
        <td>스마트워치</td>
        <td>갤럭시워치</td>
        <td>400,000원</td>
        <td>2024-08-07</td>
        <td>삼성의 스마트워치</td>
        <td>85</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=7">수정</a>
            <a href="deleteProduct?id=7" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="oledtv.jpg" alt="OLED TV" class="product-image"></td>
        <td>TV</td>
        <td>OLED TV</td>
        <td>2,000,000원</td>
        <td>2024-08-08</td>
        <td>최신 OLED TV</td>
        <td>30</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=8">수정</a>
            <a href="deleteProduct?id=8" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="refrigerator.jpg" alt="양문형 냉장고" class="product-image"></td>
        <td>냉장고</td>
        <td>양문형 냉장고</td>
        <td>1,500,000원</td>
        <td>2024-08-09</td>
        <td>대용량 양문형 냉장고</td>
        <td>40</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=9">수정</a>
            <a href="deleteProduct?id=9" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="washer.jpg" alt="드럼 세탁기" class="product-image"></td>
        <td>세탁기</td>
        <td>드럼 세탁기</td>
        <td>800,000원</td>
        <td>2024-08-10</td>
        <td>저소음 드럼 세탁기</td>
        <td>45</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=10">수정</a>
            <a href="deleteProduct?id=10" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="tshirt.jpg" alt="여름용 티셔츠" class="product-image"></td>
        <td>의류</td>
        <td>여름용 티셔츠</td>
        <td>30,000원</td>
        <td>2024-08-11</td>
        <td>시원한 소재의 티셔츠</td>
        <td>200</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=11">수정</a>
            <a href="deleteProduct?id=11" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="runningshoes.jpg" alt="런닝화" class="product-image"></td>
        <td>신발</td>
        <td>런닝화</td>
        <td>120,000원</td>
        <td>2024-08-12</td>
        <td>편안한 러닝화</td>
        <td>150</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=12">수정</a>
            <a href="deleteProduct?id=12" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="sunglasses.jpg" alt="선글라스" class="product-image"></td>
        <td>액세서리</td>
        <td>선글라스</td>
        <td>80,000원</td>
        <td>2024-08-13</td>
        <td>UV 차단 선글라스</td>
        <td>100</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=13">수정</a>
            <a href="deleteProduct?id=13" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="harrypotter.jpg" alt="해리포터 시리즈" class="product-image"></td>
        <td>소설</td>
        <td>해리포터 시리즈</td>
        <td>150,000원</td>
        <td>2024-08-14</td>
        <td>해리포터 시리즈 전집</td>
        <td>50</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=14">수정</a>
            <a href="deleteProduct?id=14" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="atomichabits.jpg" alt="아톰의 습관" class="product-image"></td>
        <td>자기계발</td>
        <td>아톰의 습관</td>
        <td>18,000원</td>
        <td>2024-08-15</td>
        <td>습관 개선 자기계발서</td>
        <td>100</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=15">수정</a>
            <a href="deleteProduct?id=15" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td><img src="cosmos.jpg" alt="코스모스" class="product-image"></td>
        <td>과학</td>
        <td>코스모스</td>
        <td>25,000원</td>
        <td>2024-08-16</td>
        <td>칼 세이건의 우주과학 명저</td>
        <td>80</td>
        <td>공개</td>
        <td class="action-links">
            <a href="editProduct?id=16">수정</a>
            <a href="deleteProduct?id=16" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    </tbody>
</table>