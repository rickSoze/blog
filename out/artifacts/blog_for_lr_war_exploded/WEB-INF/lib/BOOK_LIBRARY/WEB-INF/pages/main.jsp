<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/7/16
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统</title>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
    <script type="text/javascript">
        $(function(){
            $("a#delete").click(function(){
                var idTd= $(this).parent().parent().children().first();
                var name = idTd.next().text();

                var flag = confirm("确认删除"+name+"吗？");
                if (flag){
                    var settings={
                        url:"deletebook",
                        data:"bookname="+name,
                        type:"GET",
                        success:function () {
                            idTd.parent().remove();
                        }
                    }
                    $.ajax(settings);
                }
                return false;
            })

           $("a[href='lend']").click(function () {
               var id = $(this).parent().parent().children().first().text();
                var stock =  $(this).text()=='未借阅'?1:0;
                alert(stock)
                var p = {
                    url:"lend",
                    data:"bookId="+id+"&bookStock="+stock,
                    success:function (data) {
                        alert(this)
                        if (data==1) $("#lend:contains('未借阅')").text("已借阅")
                        else
                            $("#lend:contains('已借阅')").text("未借阅")
                    }
                }
                $.ajax(p);

               return false;
           })
        })

    </script>
</head>
<style>
    table{
        table-layout: fixed;
        position: relative;
        top: 100px;
    }
    #add{
        position: relative;
        left: 1050px;
        top: 95px;
    }
</style>
<body>
<h1 align="center">图书列表</h1><br>
<hr>
<button id="add" onclick="window.location.href='toAdd'" >添加图书</button>
<%--<button onclick="window.location.href='insertMany'">批量插入</button>--%>
<%--<a href="insertMany">批量插入</a>--%>
<table cellspacing="0" cellpadding="10" border="1" align="center">
    <tr>
        <th width="40">序号</th>
        <th width="150">书名</th>
        <th width="60">价格</th>
        <th width="80">作者</th>
        <th width="80">借阅状态</th>
        <th width="40">删除</th>
        <th width="40">修改</th>
    </tr>
    <c:forEach items="${bookInfo.list}" var="book">
        <tr>
            <td align="center">${book.bookId}</td>
            <td align="center">${book.bookName}</td>
            <td align="center">${book.bookPrice}</td>
            <td align="center">${book.bookAuthor}</td>
            <td align="center"><c:if test="${book.bookStock==1}"><a href="lend" id="lend">未借阅</a></c:if>
                <c:if test="${book.bookStock!=1}"><a href="lend" id="lend">已借阅</a></c:if></td>
            <td><a id="delete" href="deletebook">删除</a> </td>
            <td><a href="toUpdate?bookid=${book.bookId}">修改</a> </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="7" align="center">
            <c:if test="${bookInfo.pageNum!=1}">
                <a href="showlist?pn=1">首页</a>
                <a href="showlist?pn=${bookInfo.prePage}">上一页</a>
            </c:if>
            <c:forEach items="${bookInfo.navigatepageNums}" var="num">
                <c:if test="${num==bookInfo.pageNum}">
                    【${num}】</c:if>
                <c:if test="${num!=bookInfo.pageNum}">
                    <a href="showlist?pn=${num}">${num}</a></c:if>
            </c:forEach>
            <c:if test="${bookInfo.pageNum!=bookInfo.pages}">
                <a href="showlist?pn=${bookInfo.nextPage}">下一页</a>
                <a href="showlist?pn=${bookInfo.pages}">末页</a>
            </c:if>
        </td>
    </tr>

</table>
</body>
</html>
