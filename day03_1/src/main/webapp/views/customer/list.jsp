<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    function display(customers) {
        let result = '';
        $(customers).each(function (index, customer) {
            result += '<tr>';
            result += '<td>' + customer.username + '</td>';
            result += '<td>' + customer.name + '</td>';
            result += '<td>' + customer.pNumber + '</td>';
            result += '<td>' + customer.signUpDate + '</td>';
            result += '<td class="action-links">';
            result += '<a href="editCustomer?id=' + customer.id + '">수정</a> ';
            result += '<a href="deleteCustomer?id=' + customer.id + '" onclick="return confirm(\'정말로 삭제하시겠습니까?\');">삭제</a>';
            result += '</td>';
            result += '</tr>';
        });
        $('#customer_data > tbody').html(result);
    };

    function getCustomerData() {
        let customers = [
            {id: 1, username: 'user1', name: '최태산', pNumber: '010-1234-5678', signUpDate: '2024-01-01'},
            {id: 2, username: 'user2', name: '이은범', pNumber: '010-2345-6789', signUpDate: '2024-01-02'},
            {id: 3, username: 'user3', name: '박민수', pNumber: '010-3456-7890', signUpDate: '2024-01-03'},
            {id: 4, username: 'user4', name: '최지은', pNumber: '010-4567-8901', signUpDate: '2024-01-04'},
            {id: 5, username: 'user5', name: '정대현', pNumber: '010-5678-9012', signUpDate: '2024-01-05'}
        ];
        display(customers);
    };

    $(document).ready(function () {
        $('#btn_get').click(function () {
            getCustomerData();
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
</style>

<div class="col-sm-10">
    <h1>회원 목록</h1>
    <button id="btn_get">회원 데이터 가져오기</button>
    <table class="table" id="customer_data">
        <thead class="thead-dark">
        <tr>
            <th>사용자명</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>가입일</th>
            <th>작업</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>