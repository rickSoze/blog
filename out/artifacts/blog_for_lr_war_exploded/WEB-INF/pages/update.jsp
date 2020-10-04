<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/3
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改文章</title>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
</head>
<style>
    .title{
        white-space: pre-wrap;
        font-size: 20px;
    }

    .text{
        white-space: pre-wrap;
        height: 500px;
        width: 500px;
    }

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
<body>
<div align="center">
    <form action="update" method="post">
        <input name="bid" value="${blog.bid}" type="hidden">
        <p>文章标题：</p>
        <input name="blogTitle" type="text" class="title" value="${blog.blogTitle}"> <br>
        <p>文章内容：</p>
        <textarea name="content" rows="80" cols="15" class="text" style="font-size: 20px">
            ${blog.content}
        </textarea>
        <br><br><br>
        <input id="sub" type="submit" value="提交修改">

    </form>
</div>
</body>
</html>
