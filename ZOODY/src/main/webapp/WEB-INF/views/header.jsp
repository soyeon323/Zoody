<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    html, body, div, span, applet, object, iframe,
    h1, h2, h3, h4, h5, h6, p, blockquote, pre,
    a, abbr, acronym, address, big, cite, code,
    del, dfn, em, img, ins, kbd, q, s, samp,
    small, strike, strong, sub, sup, tt, var,
    b, u, i, center,
    dl, dt, dd, ol, ul, li,
    fieldset, form, label, legend,
    table, caption, tbody, tfoot, thead, tr, th, td,
    article, aside, canvas, details, embed, 
    figure, figcaption, footer, header, hgroup, 
    menu, nav, output, ruby, section, summary,
    time, mark, audio, video {
        margin: 0;
        padding: 0;
        border: 0;
        font-size: 100%;
        font: inherit;
        vertical-align: baseline;
    }
    body{
        background-color: #F4F7FD;
        width: 100%;
        height: 100%;
    }
    nav{
        width: 100%;
        height: 65px;
        background-color: white;
        border-bottom: 1px solid rgb(213, 213, 213);
    }
    #sidebar{
        width: 255px;
        height: 93vh;
        background-color: white;
        border-right: 1px solid rgb(213, 213, 213);
    }
    #logoImg>img{
        width: 125px;
        height: 40px;
    }
    #logoImg{
        width: 125px;
        height: 65px;
        display: flex;
        align-items: center;
        margin-left: 30px;
    }
    #storage{
        width: 255px;
        height: 45px;
        background-color: #4876EF;
        position: absolute;
        bottom: 0px;
    }
</style>
</head>
<body>

    <nav>
        <div id="logoImg"><img src="/zoody/resources/img/logo/logo.png" alt="로고이미지"></div>
    </nav>

    <div id="sidebar">

        <div id="storage"></div>
    </div>

</body>