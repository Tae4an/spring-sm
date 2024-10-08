<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
    <h2>Login Page</h2>
    <div class="row">
        <div class="col-sm-5">
            <form action="/action_page.php">
                <div class="mb-3 mt-3">
                    <label for="id" class="form-label">ID:</label>
                    <input type="text" class="form-control" id="id" placeholder="Enter id">
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>