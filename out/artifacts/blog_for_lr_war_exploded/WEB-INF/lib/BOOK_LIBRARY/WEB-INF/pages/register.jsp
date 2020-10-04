<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/7/16
  Time: 23:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册账号</title>
</head>

<script type="text/javascript" src="jquery-3.5.1.js"></script>

<style>
    div{
        width: 200px;
        height: 150px;
        margin: auto;
    }
</style>
<body>
<h1 align="center"  style="color: green">注册账号</h1><hr>

<div>
<form action="register" style="text-align: center" >
    账号<input id="name" name="username"></br>
    密码<input name="pwd"><br>
    <input type="submit" value="注册">
    <br><p style="color: red">${registerFailedInfo}</p>
</form>
</div>
</body>
</html>
