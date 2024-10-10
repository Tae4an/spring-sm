<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

    function display(datas){
        let result = '';
        $(datas).each(function (index, data){
            result += '<tr>';
            result += '<td>' + data.id + '</td>'
            result += '<td>' + data.name + '</td>'
            result += '<td>' + data.age + '</td>'
            result += '</tr>';
        });
        $('#c_data > tbody').html(result);
    };

    function getData() {
        let datas = [
            {'id': 'id01', 'name': 'taesan1', 'age': '10'},
            {'id': 'id02', 'name': 'taesan2', 'age': '20'},
            {'id': 'id03', 'name': 'taesan3', 'age': '30'},
            {'id': 'id04', 'name': 'taesan4', 'age': '40'},
            {'id': 'id05', 'name': 'taesan5', 'age': '50'}
        ];
        display(datas);
    };

    $(document).ready(function () {
        $('#btn_get').click(function () {
            getData();
        });
    });
</script>

<div class="col-sm-10">

    <h2>js3 Page</h2>
    <button id="btn_get">Get Data</button>
    <h5>test</h5>
    <table class="table" id="c_data">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Age</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>