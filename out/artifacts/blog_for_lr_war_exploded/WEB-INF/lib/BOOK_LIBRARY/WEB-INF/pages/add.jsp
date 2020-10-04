<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/7/17
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加图书</title>
</head>
<style>
    button{
        position: relative;
        top: -39px;
        left: 57px;
    }
</style>
<body>
<div align="center">
    <form action="addBook">
        图书名称：<input name="bookName"><br>
        图书价格：<input name="bookPrice"><br>
        图书作者：<input name="bookAuthor"><br>
        <input type="submit" value="确认添加">
    </form>
    <button onclick="window.location.href='showlist'">返回</button>
</div>
</body>
</html>
