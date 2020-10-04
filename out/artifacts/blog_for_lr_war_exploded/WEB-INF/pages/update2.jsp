<%--
  Created by IntelliJ IDEA.
  User: 文杭
  Date: 2020/10/3
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改文章</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/showdown/1.9.0/showdown.min.js"></script>
    <script type="text/javascript" src="jquery-3.5.1.js"></script>
</head>

<body>
<div style="font-size: 20px;height: 30px; text-align: center;color: #009689; font-weight: bold;">
    <input id="title" type="text" rows="1" style="font-size: 20px;height: 30px;
    text-align: center;color: #009689; font-weight: bold;"
           value="${blog.blogTitle}"
    >
</div>
<link rel="stylesheet" type="text/css" href="../css/markdown.css">
<style>
    .markdown-here-wrapper {
        font-size: 16px;
        line-height: 1.8em;
        letter-spacing: 0.1em;
    }

    pre,
    code {
        font-size: 14px;
        font-family: Roboto, 'Courier New', Consolas, Inconsolata, Courier, monospace;
        margin: auto 5px;
    }

    code {
        white-space: pre-wrap;
        border-radius: 2px;
        display: inline;
    }

    pre {
        font-size: 15px;
        line-height: 1.4em;
        display: block;
    !important;
    }

    pre code {
        white-space: pre;
        overflow: auto;
        border-radius: 3px;
        padding: 1px 1px;
        display: block !important;
    }

    strong,
    b {
        color: #BF360C;
    }

    em,
    i {
        color: #009688;
    }

    hr {
        border: 1px solid #BF360C;
        margin: 1.5em auto;
    }

    p {
        margin: 1.5em 5px !important;
    }

    table,
    pre,
    dl,
    blockquote,
    q,
    ul,
    ol {
        margin: 10px 5px;
    }

    ul,
    ol {
        padding-left: 15px;
    }

    li {
        margin: 10px;
    }

    li p {
        margin: 10px 0 !important;
    }

    ul ul,
    ul ol,
    ol ul,
    ol ol {
        margin: 0;
        padding-left: 10px;
    }

    ul {
        list-style-type: circle;
    }

    dl {
        padding: 0;
    }

    dl dt {
        font-size: 1em;
        font-weight: bold;
        font-style: italic;
    }

    dl dd {
        margin: 0 0 10px;
        padding: 0 10px;
    }

    blockquote,
    q {
        border-left: 2px solid #009688;
        padding: 0 10px;
        color: #777;
        quotes: none;
        margin-left: 1em;
    }

    blockquote::before,
    blockquote::after,
    q::before,
    q::after {
        content: none;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    h6 {
        margin: 20px 0 10px;
        padding: 0;
        font-style: bold !important;
        color: #009688 !important;
        text-align: center !important;
        margin: 1.5em 5px !important;
        padding: 0.5em 1em !important;
    }

    h1 {
        font-size: 24px !important;
        border-bottom: 1px solid #ddd !important;
    }

    h2 {
        font-size: 20px !important;
        border-bottom: 1px solid #eee !important;
    }

    h3 {
        font-size: 18px;
    }

    h4 {
        font-size: 16px;
    }


    table {
        padding: 0;
        border-collapse: collapse;
        border-spacing: 0;
        font-size: 1em;
        font: inherit;
        border: 0;
        margin: 0 auto;
    }

    tbody {
        margin: 0;
        padding: 0;
        border: 0;
    }

    table tr {
        border: 0;
        border-top: 1px solid #CCC;
        background-color: white;
        margin: 0;
        padding: 0;
    }

    table tr:nth-child(2n) {
        background-color: #F8F8F8;
    }

    table tr th,
    table tr td {
        font-size: 16px;
        border: 1px solid #CCC;
        margin: 0;
        padding: 5px 10px;
    }

    table tr th {
        font-weight: bold;
        color: #eee;
        border: 1px solid #009688;
        background-color: #009688;
    }
</style>
<style>
    #area>table {
        width: 100%;
        table-layout: fixed;
    }

    #area table tr td {
        margin: 0;
        padding: 6px;
        border: 0;

    }


    #md-area {

        width: 100%;
        height: 600px;
        font-size: 18px;
        overflow: hidden;
        font-weight: bold;
        outline: none;
    }

    #show-area {
        height: 600px;
        background-color: #FCF6E5;
    }

    .clearfix:before {
        content: "";
        display: table;
    }
</style>
<script>
    function mdSwitch() {
        var mdValue = document.getElementById("md-area").value;
        var converter = new showdown.Converter();
        var html = converter.makeHtml(mdValue);
        document.getElementById("show-area").innerHTML = html;
    }
    //
    // $(function () {
    //     $("#sub").click(function () {
    //         var title = $("#title").val();
    //         var content = $("#md-area").text();
    //         var bid = $("#bid").val();
    //
    //         alert(content)
    //         $.post(
    //             "update",
    //             {
    //                 blogTitle:title,
    //                 bid:bid,
    //                 content:content
    //             },
    //             function () {
    //                 $("#sub").append("<b>修改成功！</b>")
    //             }
    //         )
    //
    //
    //
    //     })
    // })
</script>
<form action="update" method="post">
    <input name="blogTitle" hidden value="${blog.blogTitle}">
<div id="area">
    <table>
        <tr>
            <td >
                <textarea  name="content" id="md-area" onkeyup=mdSwitch()>
                ${blog.content}
                </textarea>
            </td>
            <td>
                <div id="show-area" class="clearfix"></div>
            </td>
        </tr>
    </table>
</div>
<div>
<input type="submit" value="提交修改"/>
    <br/>
    <a href="showMyBlogs">返回</a>
<input id="bid" value="${blog.bid}" type="hidden">

</div>
</form>
</body>
</html>
