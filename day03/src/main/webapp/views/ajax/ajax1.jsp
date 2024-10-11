<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let ajax1 = {
        init:function (){
            setInterval(()=>{
                this.getData();
            }, 1000);
        },
        getData:function (){
            $.ajax({
               'url':'<c:url value="/getctime"/>',
               'success':(result)=>{
                   this.display(result);
               }
            });
        },
        display:function (result){
            $('#ctime').html(result.ctime);
        }
    };

    $(function (){
        ajax1.init();
    });
</script>
<div class="col-sm-10">

    <h2>ajax1 Page</h2>
    <h1 id ="ctime"></h1>
</div>