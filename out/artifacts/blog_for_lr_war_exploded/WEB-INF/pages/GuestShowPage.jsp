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
        $(function() {
            $("#sub").click(function () {
                var commentTable = $("#comments");
                var bid = $(":input[name='forBlog']").val();
                var content = $(":input[name='content']").val();
                $.post(
                    "addCom",
                    {
                        forBlog: bid,
                        content: content
                    },
                    function () {
                        commentTable.append(
                            "<tr>\n" +
                            " <td>评论：" + content + "</td>\n" +
                            "</tr>")
                    }
                )
                return false;
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
<body class="layui-layout-body" style="font-size: 18px">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo"><a class="pp" href="toMain" style="font-size: 30px">wh的博客</a></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;"><div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">

                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-header" style="font-size: 25px" aria-disabled="true">${blog.blogTitle}</div>
                            <div class="layui-card-body">
                                <textarea style="width:1000px; height:400px;font-size: 20px" disabled>
                                ${blog.content}
                                </textarea>>
                            </div>

                            <div class="layui-card-header"><a href="toMain" style="font-size: 15px">返回</a></div>
                            <div class="layui-card-header" style="font-size: 15px">评论</div>
                            <div class="layui-card-body">
                                <div align="center">
                                    <table id="comments">
                                        <c:forEach var="c" items="${comments}">
                                            <tr>
                                                <td>评论：${c.content}</td>
                                            </tr>
                                        </c:forEach>

                                        <form action="addCom" method="post">
                                            输入评论：<input name="content">
                                            <input id="sub" type="submit" value="提交评论" >
                                            <input type="hidden" name="forBlog" value="${blog.bid}">

                                        </form>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

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