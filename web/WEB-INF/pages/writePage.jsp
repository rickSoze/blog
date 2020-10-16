<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>wh的博客</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script>
        $(function () {
            $("#title").focusout(function () {
                var title = $(this).val();
                if(title==""){
                    $("#msg").replaceWith("<b id='msg' style='color:red;'>文章标题不能为空！请修改</b>");
                    return;
                }
                if (title.length>=15) {
                    $("#msg").replaceWith("<b id='msg' style='color:red;'>文章标题过长！请修改</b>");
                    return;
                }
                $.get(
                    "queryBlog",
                    {
                        title:title
                    },
                    function (data) {
                        if (data=="true"){
                            $("#msg").replaceWith("<b id='msg' style='color:red;'>文章标题已存在！请修改</b>");
                        }
                        else{
                            $("#msg").replaceWith("<b id='msg' style='color:green;'>文章标题可用</b>")
                        }
                    }
                )
            })
        })

    </script>
    <style>
        .pp:link{
            color: #009688;
        }
        .pp:hover{
            color: #009688;
        }
        .pp:visited{
            color: #009688;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a class="pp" href="showMyBlogs" style="font-size: 30px">wh的博客</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><b>写文章</b></li>
        </ul>
    </div>


    <div class="layui-body">
        <form  class="layui-form" action="addBlog" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label" style="font-size: 18px">文章标题</label>

                <div class="layui-input-block">
                    <input type="text" style="font-size: 18px" name="blogTitle" lay-verify="title"  id="title" autocomplete="off" placeholder="输入文章标题" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label" style="font-size: 18px">文章内容</label>
                <div class="layui-input-block">
                    <textarea name="content" class="layui-textarea" placeholder="输入文章内容" style="font-size: 18px"></textarea>
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <input type="submit" class="layui-btn" />
                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                </div>
            </div>
        </form>
        <div>
            <b id="msg"> </b><br>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->

    </div>
</div>
</body>
</html>