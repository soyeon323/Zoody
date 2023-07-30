<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/home.css">
<script src="${root}/resources/js/home.js"></script>
<script src="${root}/resources/js/common/weather.js"></script>
</head>
<body>

    
    <%@ include file="/WEB-INF/views/header.jsp" %>


    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <div id="grid-wrap">

            <div class="grid area-gird-1">
                <div class="area profile">
                    <div class="profile-img">
                        이미지
                    </div>
                    <div class="profile-info">
                            <div class="profile-content">

                                <c:if test="${empty loginMember}">
                                    <div><img class="home-icon" height="20" width="20" onclick="profileEditModal()" src="${root}/resources/img/icon/svg/edit.svg" alt=""></div>
                                    <div>메세지</div>
                                    <div>부서</div>
                                    <div>이메일</div>
                                    <div>이름</div>
                                </c:if>

                                <c:if test="${not empty loginMember}">

                                    <div><img class="home-icon" onclick="profileEditModal()"s src="${root}/resources/img/icon/svg/edit.svg" alt=""></div>
                                    <div class="profile-content-intro">${loginMember.lineIntro}</div>
                                    <div class="profile-content-department">
                                        <div>
                                            <div>${loginMember.departmentName}</div>
                                            <div>${loginMember.rankName}</div>
                                        </div>
                                        
                                    </div>
                                    <div class="profile-content-email">${loginMember.mail}</div>
                                    <div class="profile-content-name">${loginMember.name}</div>

                                </c:if>

                            </div>
                            <div class="profile-btns">
                                <a href="${root}/mail/write">메일쓰기</a>
                                <a href="${root}/member/logout">로그아웃</a>
                            </div>
                    </div>
                </div>
                <div class="area calender">
                    <%@ include file="/WEB-INF/views/common/fullcalendar.jsp" %>
                </div>
                <div class="area weather">
                    <%@ include file="/WEB-INF/views/common/weather.jsp" %>
                </div>
                <div class="area news">
                    
                        <div class="news-header">뉴스 / 최신글</div>
                        <div class="news-news"></div>
                        <div class="news-newpost"></div>

                </div>
            </div>
    
            <div class="grid area-gird-2">
                <div class="area schedule">
                    <div class="div-header">
                        <span>일정</span>
                        <img class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>
                </div>
                <div class="area chart">
                    <div class="div-header">
                        <span>진행도</span>
                        <img class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>

                    <%@ include file="/WEB-INF/views/home/chart.jsp" %>
                    
                </div>

                <div class="area attendance">
                    <div class="div-header">
                        <span>근태현황</span>
                        <img class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>
                </div>

                <div class="area community">
                    <div onclick="goToCommunity()" class="community-header div-header">
                        <span>커뮤니티</span>
                        <img class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>  
                   
                    <div class="community-list-area">

                        <c:if test="${ empty boardList }">

                        <div>데이터가 없습니다</div>

                        </c:if>
                        
                        <c:if test="${not empty boardList }">

                            <c:forEach items="${ boardList }" var="list">

                                <div class="community-list">
                                    <div>${ list.no }</div>
                                    <div>${ list.title }</div>
                                    <div>${ list.userNo }</div>
                                    <div>${ list.hit }</div>
                                    <div>${ list.enrollDate }</div>
                                </div>

                            </c:forEach>

                        </c:if>

                    </div>

                    

                    

                </div>
                <div onclick="goToNotice()" class="area notice" id="notice">
                    <img src="${root}/resources/img/icon/svg/notice.svg" alt="">
                    <div>전직원 알림) 스미싱 스팸메일 열람주의</div>
                </div>
            </div>

        </div>
        
    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>