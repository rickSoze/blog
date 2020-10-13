<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/2
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>展示博客</title>
    <style type="text/css">

        a:link {
            color: blue;
            text-decoration: none;
        }
        a:visited {
            color: blue;
            text-decoration: none;
        }
        a:hover {
            color: #999999;
            text-decoration: underline;
        }
        .ch{
            font-size: 20px;
            font-weight: bold;
            color: darkslategray;
        }

    </style>

    <script type="text/javascript" src="jquery-3.5.1.js"></script>

</head>
<body>
<div align="center">
    <h1 align="center" style="color:deeppink;">欢迎！${user.userName}</h1>
    <br>
    <br>
    <div>
        <a href="toLogin">登录</a>
    </div>
    <table border="solid 1px">
        <tr>
            <td class="ch">查看文章</td>
        </tr>
        <c:forEach items="${blogs}" var="title">
            <tr>
                <td><a href="showBlog?title=${title}">${title}</a></td>
            </tr>
        </c:forEach>

    </table>
</div>
</body>
</html>
