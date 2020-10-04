<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/2
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <title>用户注册</title>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script>
        $(function () {
            $("#username").focusout(function () {
                var user = $(this).val();
                if(user==""){
                    $("#msg1").replaceWith("<b id='msg1' style='color:red;'>用户名不能为空！请修改</b>");
                }
                else $("#msg1").replaceWith("<b id='msg1' ></b>")
            })

            $("#userpwd").focusout(function () {
                var user = $(this).val();
                if(user==""){
                    $("#msg2").replaceWith("<b id='msg2' style='color:red;'>密码不能为空！请修改</b>");
                }
                else $("#msg2").replaceWith("<b id='msg2' ></b>")
            })
        })
    </script>
        </head>
<body>

<form style="width: 30em; margin: 150px auto auto;" action="registry" method="post">
    <h2 style="color:blue;">注册</h2>
    <div>
        <b>用户名：</b><input  id="username" name="userName" type="text"/><b id="msg1"></b>
        <br/>
        <b>密码：</b><input  id="userpwd" type="password" name="userPwd"/><b id="msg2"></b>
        <br/>
        <br>
       <input type="submit" value="注册">
        <br>
        <a href="toLogin">返回登录页面</a>
    </div>
    <div style="color:red;">
        ${regFailed}
    </div>
</form>


</body>
</html>
