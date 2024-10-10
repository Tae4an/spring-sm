<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(document).ready(function(){
        js4.init();
    });
</script>

<div class="col-sm-10">

    <h2>JS4 Page</h2>
    <button id="btn_get">Get Data</button>
    <h5>Title description, Sep 2, 2017</h5>
    <table class="table" id="cdata">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Age</th>
        </tr>
        </thead>
        <tbody>

        </tbody>
    </table>
</div>