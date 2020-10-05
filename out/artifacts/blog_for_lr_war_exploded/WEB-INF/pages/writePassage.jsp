<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/2
  Time: 19:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>写博客</title>
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
</head>
<style>
    .titlecss{
        font-size: 20px;
        color: dodgerblue;
        white-space: pre-wrap;
    }

    .text{
        font-size: 20px;
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
    <form action="addBlog" method="post">

        <p>文章标题</p>
        <b id="msg"> </b><br>
        <input name="blogTitle" id="title" type="text" class="titlecss">
        <br>
        <p>文章内容：</p>
        <br>
        <textarea name="content" rows="10" cols="10" class="text">

        </textarea>
        <br>
        <input  type="submit" value="保存文章">
    </form>
</div>
</body>
</html>