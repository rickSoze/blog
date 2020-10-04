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
    <title>我的博客</title>
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
<body>
<div align="center">
    <a href="toWrite" style="font-size: 30px">写文章</a>
    <br>
    <table border="solid 2px">
    <tr>
        <td>文章题目</td>
        <td>修改文章</td>
        <td>删除文章</td>
    </tr>
        <c:forEach items="${blogTitles}" var="title">
            <tr>
                <td><a href="showBlog?title=${title}">${title}</a></td>
                <td><a id="update" href="toUpdate?title=${title}">修改</a></td>
                <td><a id="delete" href="deleteBlog?title=${title}">删除</a></td>
            </tr>
        </c:forEach>

</table>
</div>
</body>
</html>
