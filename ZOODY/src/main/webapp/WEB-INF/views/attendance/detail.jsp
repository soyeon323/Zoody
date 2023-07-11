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
    <link rel="stylesheet" href="${root}/resources/css/attendance/detail.css">
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
            <div class="att_check"></div>
            <div class="att_type1"></div>
            <div class="att_type2"></div>
            <div class="att_type3"></div>
            <div class="att_type4"></div>
            <div class="att_workList"></div>

            <!-- 두번째 줄 : 검색바 부분 -->
            <div class="search_area"></div>

            <!-- 세번째 줄 -->
            <div class="att_myList"></div>
            <div class="att_leaveList"></div>
        </div>
    </div>
    
</body>
</html>