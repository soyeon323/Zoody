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
            <!-- 맨 윗 줄 -->
            <div class="att_check" style="color: aqua;"></div>
            <div class="" style="color: aqua;"></div>
            <div class="" style="color: aqua;"></div>
            <div class="" style="color: aqua;"></div>
        </div>
    </div>
    
</body>
</html>