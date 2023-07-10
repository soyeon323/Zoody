<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/common/header.css">
</head>
<body>

    <nav>
        <a id="logoImg" href="${root}">
            <img src="${root}/resources/img/logo/logo.svg" alt="로고이미지">
        </a>

        <div id="nav-info">

            <div id="nav-alert">

                <div class="mail-alert">
                    <img src="${root}/resources/svg/icon/mail_default.svg" alt="메일 아이콘">
                </div>

                <div class="alret-alert">
                    <img src="${root}/resources/svg/icon/alert_default.svg" alt="메일 아이콘">
                </div>
            </div>

            <div id="nav-profile">
                
                <div class="img-profile">
                    <img src="" alt=" ">
                </div>

                <div class="box-profile">
                    {name}
                </div>

            </div>
        </div>
    </nav>

    
</body>
