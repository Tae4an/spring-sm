<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>

    $(function(){
        login.init();
    });
</script>

<div class="col-sm-10">
    <h2>Login Page</h2>
    <div class="row">
        <div class="col-sm-5">
            <form id="login_form">
                <c:if test="${not empty error}">
                    <div class="alert alert-danger" id="error-message">${error}</div>
                </c:if>
                <div class="mb-3 mt-3">
                    <label for="id" class="form-label">ID:</label>
                    <input type="text" class="form-control" id="id" placeholder="Enter id" name = "id">
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
                </div>

                <button type="button" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>