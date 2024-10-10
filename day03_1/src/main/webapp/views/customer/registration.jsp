<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    h1 {
        color: #333;
    }
    form {
        max-width: 400px;
        margin: 0 auto;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"], input[type="email"] {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        padding: 10px 15px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
<h1>회원 등록</h1>
<form action="register" method="post">
    <label for="name">이름:</label>
    <input type="text" id="name" name="name" required>

    <label for="email">이메일:</label>
    <input type="email" id="email" name="email" required>

    <label for="phone">전화번호:</label>
    <input type="text" id="phone" name="phone">

    <input type="submit" value="등록">
</form>
