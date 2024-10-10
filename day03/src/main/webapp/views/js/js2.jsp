<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let v1 = 10;
    let v2 = "'text'";
    let v3 = "text";
    let v4 = true;

    // function
    let v5 = function (){};
    function v6(){};

    // undefined
    let v7;

    // object
    let v8 = [1,2,3,'aa'];
    let v9 = {
        'id' : 'id01',
        'name':'james',
        go:function(){},
        stop:function (){}
    };

    // JSON
    let v10 = [{},{},{}];

    alert(typeof(v10));
</script>
<div class="col-sm-10">

    <h2>js2 Page</h2>

</div>