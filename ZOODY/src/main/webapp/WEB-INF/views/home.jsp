<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/home.css">

<script src="${root}/resources/js/common/weather.js"></script>
</head>
<body style="overflow-x: hidden">

    
    <%@ include file="/WEB-INF/views/header.jsp" %>


    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <div id="grid-wrap">

            <div class="grid area-gird-1">
                <div class="area profile">
                    <div class="profile-img">
                        <c:if test="${empty loginMember.profile}">
                            <img src="${root}/resources/img/profile/default_profile.svg" alt="">
                        </c:if>
                        <c:if test="${not empty loginMember.profile}">
                            <img src="${root}/resources/img/profile/${loginMember.id}.png" alt="">
                        </c:if>
                    </div>
                    <div class="profile-info">
                            <div class="profile-content">

                                <c:if test="${empty loginMember}">
                                    <div><img class="home-icon" height="20" width="20" onclick="profileEditModal()" src="${root}/resources/img/icon/svg/edit.svg" alt=""></div>
                                    <div class="profile-content-intro">메세지</div>
                                    <div class="profile-content-department">
                                        <div>
                                            <div>부서</div>
                                            <div>직책</div>
                                        </div>
                                    </div>
                                    <div class="profile-content-email">이메일</div>
                                    <div class="profile-content-name">이름</div>
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
                        <div class="news-newpost">
                            <div class="community-list">
                                <div>제목</div>
                                <div>작성자</div>
                                <div>조회수</div>
                                <div></div>
                            </div>
                            <c:forEach items="${ newBoardList }" var="list">
                                

                                <div class="community-list">
                                    <div>${ list.title }</div>
                                    <div>${ list.name }</div>
                                    <div>${ list.hit }</div>
                                    <div>${ list.boardNo }</div>
                                </div>


                            </c:forEach>
                        </div>

                </div>
            </div>
    
            <div class="grid area-gird-2">
                <div class="area schedule">
                    <div class="div-header">
                        <span>일정</span>
                        <img onclick="goToCalender()" class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>
                </div>
                <div class="area chart">
                    <div class="div-header">
                        <span>진행도</span>
                        <img onclick="goToProject()" class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>

                    <%@ include file="/WEB-INF/views/home/chart.jsp" %>
                    
                </div>

                <div class="area attendance">
                    <div class="div-header">
                        <span>근태현황</span>
                        <img onclick="goToAttendance()" class="home-icon" src="${root}/resources/img/icon/svg/link-Arrow.svg" alt="">
                    </div>

                    <c:if test="${not empty getAttendance }">
                                

                        <div class="attendance-area">
                            <div class="attendance-enrolldate">${ getAttendance.enrolldate }</div>
                            <div class="officehours">근무한 시간</div>
                            <div>[${ getAttendance.type }]</div>
                            <div class="checkInTime">${ getAttendance.checkInTime }</div>
                            <div class="checkOutTime">${ getAttendance.checkOutTime }</div>
                           
                        </div>


                    </c:if>

                    <style>
                        .attendance-area {
                            padding: 15;
                        }

                        .attendance-area > div:first-child {
                            font-size: 19;
                        }
                        
                    </style>



                    <script>
                        const checkOutTime = $(".checkOutTime").text();
                        if (checkOutTime === null || checkOutTime === '') {
                                
                            setInterval(()=> { officehoursCheck()},1000)
                        }
                        else {
                            const checkInTime = $(".checkInTime").text().trim();

                            const enrolldate = $(".attendance-enrolldate").text()+"T";
                            const checkInDate = new Date(enrolldate + checkInTime);
                            const checkOutDate = new Date(enrolldate + checkOutTime);

                            const timeDifferenceMs = checkOutDate - checkInDate;

                            const hours = Math.floor(timeDifferenceMs / (1000 * 60 * 60));
                            const minutes = Math.floor((timeDifferenceMs % (1000 * 60 * 60)) / (1000 * 60));
                            const seconds = Math.floor((timeDifferenceMs % (1000 * 60)) / 1000);

                            // 결과 출력
                            $(".officehours").text("근무한 시간: " + hours + "시간 " + minutes + "분 " + seconds + "초");
                        }

                        

                        function officehoursCheck() {
                            const checkInTime = $(".checkInTime").text().trim();

                            const enrolldate = $(".attendance-enrolldate").text()+"T";
                            const checkInDate = new Date(enrolldate + checkInTime);

                            // 현재 시간 가져오기
                            const currentDate = new Date();

                            // 밀리초로 시간 차이 계산
                            const timeDifferenceMs = currentDate - checkInDate;

                            const hours = Math.floor(timeDifferenceMs / (1000 * 60 * 60));
                            const minutes = Math.floor((timeDifferenceMs % (1000 * 60 * 60)) / (1000 * 60));
                            const seconds = Math.floor((timeDifferenceMs % (1000 * 60)) / 1000);

                            // 결과 출력
                            return $(".officehours").text("근무한 시간: " + hours + "시간 " + minutes + "분 " + seconds + "초")
                        }

                    </script>



                    <c:if test="${empty getAttendance}">
                        <div>
                            데이터 없음
                        </div>

                    </c:if>

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
                            <div class="community-list">
                                <div>번호</div>
                                <div>제목</div>
                                <div>작성자</div>
                                <div>조회수</div>
                                <div>작성일</div>
                                <div></div>
                            </div>
                            
                            <c:forEach items="${ boardList }" var="list">


                                <div class="community-list">
                                    <div>${ list.rownum }</div>
                                    <div>${ list.title }</div>
                                    <div>${ list.name }</div>
                                    <div>${ list.hit }</div>
                                    <div>${ list.enrollDate }</div>
                                    <div>${ list.boardNo }</div>
                                </div>

                            </c:forEach>

                        </c:if>

                    </div>

                    

                    

                </div>
                <div onclick="goToNotice()" class="area notice" id="notice">
                    <img src="${root}/resources/img/icon/svg/notice.svg" alt="">
                    <div>${getNotice[0].title}</div>
                </div>
            </div>

        </div>
        
    </div>

</body>
<script src="${root}/resources/js/home.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>

<script>

