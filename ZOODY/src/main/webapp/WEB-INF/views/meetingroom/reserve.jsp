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
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/meetingroom/reserve.css">
<title>Document</title>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="mt_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="mt_main">
            <!-- 맨 윗 줄 -->
            <div class="mt_link">
                <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="#">일정등록</a></li>
                      <li class="breadcrumb-item active" aria-current="page">회의실 상세 예약</li>
                    </ol>
                </div>
            </div>
            <div class="mt_search">
                <span>날짜</span>
                <input type="date" name="" id="">
            </div>
            <div class="mt_box">
                <div class="card">
                    <img src="${root}/resources/img/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                    </div>
                </div>
            </div>
            <div class=""></div>
        </div>
    </div>
    
</body>
</html>