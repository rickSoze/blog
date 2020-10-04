<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/3
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>查看博客</title>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script>
        // $(function () {
        //    $("#delcom").click(function () {
        //        alert("?")
        //         var TR = $(this).parent().parent();
        //         var ThisCid = $("this").prev().prev().text();
        //         alert(ThisCid)
        //         $.post(
        //             "deleteComment",
        //             {
        //                 cid:ThisCid
        //             },
        //             function () {
        //                TR.remove()
        //             }
        //         )
        //        return false;
        //    });
        // });

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

<div align="center">
    <b style="font-size: 50px;color: #009688">${blog.blogTitle}</b>
</div>
<br>
<div align="center">
    <textarea cols="80" rows="30" disabled>
        ${blog.content}
    </textarea>
    <br>
    <a href="showMyBlogs">返回</a>
</div>
<div align="center">
    <table id="comments">
   <c:forEach var="c" items="${comments}">
       <tr>
           <td>评论：${c.content}</td>
           <td><a id="delcom" href="deleteComment?cid=${c.cid}&title=${blog.blogTitle}">删除评论</a></td>
       </tr>
   </c:forEach>
        <form action="addCom" method="post">
            输入评论：<input name="content"><br>
            <input type="hidden" name="forBlog" value="${blog.bid}">
            <input id="sub" type="submit" value="提交评论">
        </form>
    </table>
</div>


</body>
</html>
