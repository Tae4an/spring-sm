<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    $(document).ready(function(){
        js5.init();
    });
</script>
<div class="col-sm-10">

    <h2>JS5 Page</h2>
    <form id="login_form">
        <div class="form-group">
            <label for="id">Id:</label>
            <input type="text" class="form-control" placeholder="Enter id" id="id" name="id">
        </div>
        <div class="form-group">
            <label for="pwd">Password:</label>
            <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="pwd">
        </div>

        <button type="button" class="btn btn-primary">Submit</button>
    </form>

</div>