<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function display(products) {
        let result = '';
        $(products).each(function (index, product) {
            result += '<tr>';
            result += '<td><img src="' + product.img + '" alt="' + product.name + '" class="product-image"></td>';
            result += '<td>' + product.category + '</td>';
            result += '<td>' + product.name + '</td>';
            result += '<td>' + product.price.toLocaleString() + '원</td>';
            result += '<td>' + product.regDate + '</td>';
            result += '<td>' + product.description + '</td>';
            result += '<td>' + product.count + '</td>';
            result += '<td>' + (product.isPublic ? '공개' : '비공개') + '</td>';
            result += '<td class="action-links">';
            result += '<a href="editProduct?id=' + product.id + '">수정</a> ';
            result += '<a href="deleteProduct?id=' + product.id + '" onclick="return confirm(\'정말로 삭제하시겠습니까?\');">삭제</a>';
            result += '</td>';
            result += '</tr>';
        });
        $('#product_data > tbody').html(result);
    };

    function getProductData() {
        let products = [
            {id: 1, category: '스마트폰', name: '아이폰 15', price: 1200000, regDate: '2024-08-01', description: '애플 스마트폰', img: 'iphone15.jpg', count: 100, isPublic: true},
            {id: 2, category: '스마트폰', name: '갤럭시 S24', price: 1300000, regDate: '2024-08-02', description: '삼성 스마트폰', img: 'galaxys24.jpg', count: 90, isPublic: true},
            {id: 3, category: '노트북', name: '맥북 프로', price: 2500000, regDate: '2024-08-03', description: '애플의 고성능 노트북', img: 'macbookpro.jpg', count: 50, isPublic: true},
            {id: 4, category: '노트북', name: '갤럭시북', price: 1800000, regDate: '2024-08-04', description: '삼성 프리미엄 노트북', img: 'galaxybook.jpg', count: 60, isPublic: true},
            {id: 5, category: '태블릿', name: '아이패드 프로', price: 1000000, regDate: '2024-08-05', description: '애플의 프로급 태블릿', img: 'ipadpro.jpg', count: 70, isPublic: true},
            {id: 6, category: '스마트워치', name: '애플워치', price: 500000, regDate: '2024-08-06', description: '애플의 스마트워치', img: 'applewatch.jpg', count: 80, isPublic: true},
            {id: 7, category: '스마트워치', name: '갤럭시워치', price: 400000, regDate: '2024-08-07', description: '삼성의 스마트워치', img: 'galaxywatch.jpg', count: 85, isPublic: true},
            {id: 8, category: 'TV', name: 'OLED TV', price: 2000000, regDate: '2024-08-08', description: '최신 OLED TV', img: 'oledtv.jpg', count: 30, isPublic: true},
            {id: 9, category: '냉장고', name: '양문형 냉장고', price: 1500000, regDate: '2024-08-09', description: '대용량 양문형 냉장고', img: 'refrigerator.jpg', count: 40, isPublic: true},
            {id: 10, category: '세탁기', name: '드럼 세탁기', price: 800000, regDate: '2024-08-10', description: '저소음 드럼 세탁기', img: 'washer.jpg', count: 45, isPublic: true},
            {id: 11, category: '의류', name: '여름용 티셔츠', price: 30000, regDate: '2024-08-11', description: '시원한 소재의 티셔츠', img: 'tshirt.jpg', count: 200, isPublic: true},
            {id: 12, category: '신발', name: '런닝화', price: 120000, regDate: '2024-08-12', description: '편안한 러닝화', img: 'runningshoes.jpg', count: 150, isPublic: true},
            {id: 13, category: '액세서리', name: '선글라스', price: 80000, regDate: '2024-08-13', description: 'UV 차단 선글라스', img: 'sunglasses.jpg', count: 100, isPublic: true},
            {id: 14, category: '소설', name: '해리포터 시리즈', price: 150000, regDate: '2024-08-14', description: '해리포터 시리즈 전집', img: 'harrypotter.jpg', count: 50, isPublic: true},
            {id: 15, category: '자기계발', name: '아톰의 습관', price: 18000, regDate: '2024-08-15', description: '습관 개선 자기계발서', img: 'atomichabits.jpg', count: 100, isPublic: true},
            {id: 16, category: '과학', name: '코스모스', price: 25000, regDate: '2024-08-16', description: '칼 세이건의 우주과학 명저', img: 'cosmos.jpg', count: 80, isPublic: true}
        ];
        display(products);
    };

    $(document).ready(function () {
        $('#btn_get').click(function () {
            getProductData();
        });
    });
</script>

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

<div class="col-sm-10">
    <h1>상품 목록</h1>
    <button id="btn_get">상품 데이터 가져오기</button>
    <table class="table" id="product_data">
        <thead class="thead-dark">
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
        <tbody></tbody>
    </table>
</div>