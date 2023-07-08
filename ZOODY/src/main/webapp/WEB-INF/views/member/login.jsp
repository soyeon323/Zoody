<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
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

    html{
        background-color: #f4f7fd;
    }

    #wrap{
        margin: auto;
        margin-top: 130px;
        width: 400px;
        height: 500px;
        background-color: white;
        border: 1px solid black;
        border-radius: 20px;
       
    }

    img{
        width: 200px;
        height: 120px;
        margin-left: 90px;
        margin-top: 20px;
    }

    #login-form{
        display: grid;
        grid-template-rows: 3fr 1fr 1fr 1fr;
        grid-gap: 50px;
    }
    
</style>
</head>
<body>
		<div id="wrap">
            <form id="login-form" action="" method="POST">
            <img src="/zoody/resources/img/logo/logo.png" alt="로고 이미지">
                <input type="text" name="" placeholder="ID">
                <input type="text" name="" placeholder="PWD">
                <input type="submit" value="로그인"> 
            </form>
		</div>
</body>
</html>