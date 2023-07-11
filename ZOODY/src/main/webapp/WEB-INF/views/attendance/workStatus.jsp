<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${root}/resources/css/attendance/attendance.css">
    <title>Document</title>
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="att_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="att_main">
            <!-- 첫번째 줄 -->
            <div class="att_check">
                <p>반갑습니다!</p>
                <p>이동욱님</p>
            </div>
            <div class="att_count1"></div>
            <div class="att_count2"></div>
            <div class="att_total"></div>

            <!-- 두번째 줄 -->
            <div class="att_calendar"></div>
            <div class="att_grap"></div>

            <!-- 세번째 줄 -->
            <div class="att_leave"></div>
            <div class="att_work"></div>
            <div class="att_department"></div>

            <!-- 네번째 줄 -->
            <div class="att_my"></div>
        </div>
    </div>
    
</body>
</html>