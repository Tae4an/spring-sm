<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ajax2 = {
        init: function () {
            this.getData();
            setInterval(() => {
                this.getData();
            }, 5000);
        },
        getData: function () {
            $.ajax({
                'url': '<c:url value="/getprank"/>',
                'success': (response) => {
                    this.display(response);
                }
            });
        },
        display: function (item) {
            let result = '';
            result += '<tr>';
            result += '<td>'+ item.id +'</td>';
            result += '<td>'+ item.name +'</td>';
            result += '<td>'+ item.price +'</td>';
            result += '</tr>';
            $('#cdata > tbody').html(result);
        }
    };

    $(function () {
        $('#btn_get').on('click', () => {
            ajax2.init();
        });
    });
</script>
<div class="col-sm-10">
    <h2>Ajax2 Page</h2>
    <h5>인기 상품</h5>
    <button id="btn_get">Get Data</button>
    <table class="table" id="cdata">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
