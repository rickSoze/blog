<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/4
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
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

    </style>
</head>

<body>
<h2 align="center" style="color:green;">用户登录</h2>


<form style="width: 30em; margin: 50px auto auto;" method="post" action="login">
    <table>
        <tr>
            <td><b>用户名：</b></td>
            <td><input name="userName" type="text"/></td>
        </tr>
        <tr>
            <td><b>密码：</b></td>
            <td><input name="userPwd" type="password"/></td>
        </tr>

    </table>
    <div style="align-content: center">
        <input type="submit" value="登录">
        <br>
        <a href="toRegistry">没有账号？注册一个</a>
    </div>

    <div>
        <b style="color: red">${loginFailed}</b>
        <b style="color: green">${regSuccess}</b>
    </div>
</form>

</body>

</html>
