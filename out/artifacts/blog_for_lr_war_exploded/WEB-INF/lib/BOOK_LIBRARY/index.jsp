<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/7/16
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>登录</title>
  </head>
<script type="text/javascript" src="jquery-3.5.1.js"></script>
<style>
  div{
    border: solid;
    width: 200px;
    height: 150px;
    margin: auto;
  }
</style>


  <body>
  <h1 align="center"  style="color: blue" >登录图书管理系统</h1>
  <hr>

  <button id="btn">测试按钮</button>
  <div>
  <form action="login">
    账号：<input name="username"></br>
    密码：<input  type="password" name="pwd"><br>
    <input type="submit" value="登录">
  </form>
    <button onclick="javascript:window.location.href='toregister'">注册</button>
    <b style="color: red">${loginfail}</b>
  </div>
  </body>
</html>
