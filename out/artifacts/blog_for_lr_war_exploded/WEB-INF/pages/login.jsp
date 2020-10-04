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
    <title>登录</title>
</head>

<body>
<form style="width: 30em; margin: 150px auto auto;" method="post" action="login">
    <h3 style="color:green;">用户登录</h3>
    <div>
        <b>用户名：</b><input name="userName" type="text"/>
        <br/>
        <b>密码：</b><input type="password" name="userPwd"/>
        <br/>
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
