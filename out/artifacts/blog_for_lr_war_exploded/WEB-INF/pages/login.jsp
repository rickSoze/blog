<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>wh的博客</title>
    <link rel="stylesheet" href="layui/css/layui.css">

    <script type="text/javascript" src="jquery-3.5.1.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 30px">wh的博客</div>
    </div>



    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header" align="center"><b style="color: green; font-size: 40px">用户登录</b></div>
                <div class="layui-card-body">
                    <form style="width: 30em; margin: 50px auto auto;" method="post" action="login">
                        <table>
                            <tr>
                                <td><b>用户名：</b></td>
<!--                                <td><input name="userName" type="text"/></td>-->
                                <td>  <input type="text" name="userName" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input"></td>

                            </tr>
                            <tr>
                                <td><b>密码：</b></td>
<!--                                <td><input name="userPwd" type="password"/></td>-->
                                <td><input type="password" name="userPwd" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
                                </td>
                            </tr>

                        </table>
                        <div style="align-content: center">
                            <input type="submit" class="layui-btn" value="登录" />
                            <br>
                        </div>

                        <div>
                            <b style="color: red">${loginFailed}</b>
                            <b style="color: green">${regSuccess}</b>
                        </div>
                    </form>
                </div>
            </div>
        </div></div>
    </div>



    <div class="layui-footer">
        <!-- 底部固定区域 -->

    </div>
</div>
</body>
</html>