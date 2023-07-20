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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
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
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
                <div class="card">
                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                      <h5 class="card-title">101호 회의실</h5>
                      <a href="#" class="btn btn-primary">예약하기</a>
                      <div class="card-text">
                        <span>Capacity</span>
                        <span>Conference</span>
                        <span>EnrollDate</span>
                        <p>10 people</p>
                        <p>Available</p>
                        <p>2021</p>
                      </div>
                    </div>
                </div>
            </div>
            <div class="cardPlus">
                <a href="${root}/meetingroom/add">
                    <button>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M14.1667 9.16667H10.8333V5.83333C10.8333 5.61232 10.7455 5.40036 10.5893 5.24408C10.433 5.0878 10.221 5 10 5C9.77899 5 9.56702 5.0878 9.41074 5.24408C9.25446 5.40036 9.16667 5.61232 9.16667 5.83333V9.16667H5.83333C5.61232 9.16667 5.40036 9.25446 5.24408 9.41074C5.0878 9.56702 5 9.77899 5 10C5 10.221 5.0878 10.433 5.24408 10.5893C5.40036 10.7455 5.61232 10.8333 5.83333 10.8333H9.16667V14.1667C9.16667 14.3877 9.25446 14.5996 9.41074 14.7559C9.56702 14.9122 9.77899 15 10 15C10.221 15 10.433 14.9122 10.5893 14.7559C10.7455 14.5996 10.8333 14.3877 10.8333 14.1667V10.8333H14.1667C14.3877 10.8333 14.5996 10.7455 14.7559 10.5893C14.9122 10.433 15 10.221 15 10C15 9.77899 14.9122 9.56702 14.7559 9.41074C14.5996 9.25446 14.3877 9.16667 14.1667 9.16667Z" fill="white"/>
                        </svg>
                        회의실 추가
                    </button>
                </a>
            </div>
        </div>
    </div>
    
</body>
</html>