<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>wh的博客</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function () {
            $("a#delete").click(function () {
                var TR = $(this).parent().parent();
                var title = $(this).parent().parent().children().first().text();
                var flag=confirm("确认要删除"+title+"吗？")
                if(flag){
                    var settings={
                        url:"deleteBlog",
                        data:"title="+title,
                        type:"POST",
                        success:function () {
                            TR.remove();
                        },
                        error:function () {
                            alert("删除失败了！")
                        }
                    }
                    $.ajax(settings);
                }
                return false;
            })
        })

    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 30px">wh的博客</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
                <ul class="layui-nav layui-layout-left">
                    <li class="layui-nav-item"><a href="toWrite" style="font-size: 18px">写文章</a></li>

                </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    wh
                </a>
            </li>
            <li class="layui-nav-item"><a href="logout">注销</a></li>
        </ul>
    </div>

   <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;"><div class="layui-col-md12">
        <div class="layui-card">
            <div class="layui-card-header" style="font-size: 30px;color: black; font-weight: bold">所有博客</div>
            <div class="layui-card-body">
                <table class="layui-table" lay-even="" lay-skin="row">
                    <colgroup>
                        <col width="80%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="font-size: 20px; color: #1E9FFF">文章题目</th>
                        <th>修改</th>
                        <th>删除</th>
                    </tr>
                    </thead>
                    <tbody>
<!--                    <tr>-->
<!--                        <td>贤心</td>-->
<!--                        <td>   <button type="button" class="layui-btn"><i class="layui-icon"></i></button></td>-->
<!--                        <td>   <button type="button" class="layui-btn"><i class="layui-icon"></i></button></td>-->
<!--                    </tr>-->
                    <c:forEach items="${blogTitles}" var="title">
                        <tr >
                            <td><a href="showBlog?title=${title}" style="font-size: 20px">${title}</a></td>
                            <td><a id="update" href="toUpdate?title=${title}">修改</a></td>
                            <td><a id="delete" href="deleteBlog?title=${title}">删除</a></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>

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