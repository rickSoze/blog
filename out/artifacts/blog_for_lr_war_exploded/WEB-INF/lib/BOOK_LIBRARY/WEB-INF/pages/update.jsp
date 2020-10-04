<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/7/17
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改图书</title>
</head>
<body>
<div align="center">
    <form action="updatebook">
        图书名称：<input name="bookName" type="text" value="${book.bookName}"><br>
        图书价格：<input name="bookPrice" type="text" value="${book.bookPrice}"><br>
        图书作者：<input name="bookAuthor" type="text" value="${book.bookAuthor}"><br>
        <input type="hidden" name="bookId" value="${book.bookId} ">
        是否借阅：<select name="bookStock">
                    <option>1</option>
                    <option>0</option>
                </select><br>
        <input type="submit" value="提交修改">
    </form>
</div>
</body>
</html>
