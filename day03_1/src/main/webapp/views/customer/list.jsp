<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    h1 {
        color: #333;
    }

    .search-form {
        margin-bottom: 20px;
    }

    .search-form input[type="text"] {
        width: 300px;
        padding: 8px;
        margin-right: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    .search-form input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .action-links a {
        margin-right: 10px;
        text-decoration: none;
        color: #1a73e8;
    }
</style>

<h1>회원 목록</h1>

<form class="search-form" action="search" method="get">
    <input type="text" name="keyword" placeholder="이름 또는 이메일로 검색">
    <input type="submit" value="검색">
</form>

<table>
    <thead>
    <tr>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>작업</th>
    </tr>
    </thead>
    <tbody>
    <!-- 샘플 데이터 시작 -->
    <tr>
        <td>최태산</td>
        <td>xotks7524@gmail.com</td>
        <td>010-1234-5678</td>
        <td class="action-links">
            <a href="edit?id=1">수정</a>
            <a href="delete?id=1" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>홍길동</td>
        <td>hong@example.com</td>
        <td>010-2345-6789</td>
        <td class="action-links">
            <a href="edit?id=2">수정</a>
            <a href="delete?id=2" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>김철수</td>
        <td>kim@example.com</td>
        <td>010-3456-7890</td>
        <td class="action-links">
            <a href="edit?id=3">수정</a>
            <a href="delete?id=3" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>박민수</td>
        <td>park@example.com</td>
        <td>010-4567-8901</td>
        <td class="action-links">
            <a href="edit?id=4">수정</a>
            <a href="delete?id=4" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>최유리</td>
        <td>choi@example.com</td>
        <td>010-5678-9012</td>
        <td class="action-links">
            <a href="edit?id=5">수정</a>
            <a href="delete?id=5" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>정민재</td>
        <td>jung@example.com</td>
        <td>010-6789-0123</td>
        <td class="action-links">
            <a href="edit?id=6">수정</a>
            <a href="delete?id=6" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>강지은</td>
        <td>kang@example.com</td>
        <td>010-7890-1234</td>
        <td class="action-links">
            <a href="edit?id=7">수정</a>
            <a href="delete?id=7" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>윤서연</td>
        <td>yoon@example.com</td>
        <td>010-8901-2345</td>
        <td class="action-links">
            <a href="edit?id=8">수정</a>
            <a href="delete?id=8" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>임현우</td>
        <td>lim@example.com</td>
        <td>010-9012-3456</td>
        <td class="action-links">
            <a href="edit?id=9">수정</a>
            <a href="delete?id=9" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <tr>
        <td>송미라</td>
        <td>song@example.com</td>
        <td>010-0123-4567</td>
        <td class="action-links">
            <a href="edit?id=10">수정</a>
            <a href="delete?id=10" onclick="return confirm('정말로 삭제하시겠습니까?');">삭제</a>
        </td>
    </tr>
    <!-- 샘플 데이터 끝 -->
    </tbody>
</table>
