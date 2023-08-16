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

    
    <div class="modal">
        <div class="modal-content">
            <div class="modal-top">
                <div class="modal-close" onclick="modalClose()"></div>
                <div class="modal-top-content">
                    <div class="modal-top-info">
                        <span>| ${loginMember.departmentName} ${loginMember.rankName}</span>
                        <span>입사일 ${loginMember.registrationDate}</span>
                    </div>
                    <div class="modal-top-profile-area">
                        <div class="modal-profile"><img src="${root}/resources/img/employee/${loginMember.profile}" alt="이미지"></div>
                        <span>${loginMember.name}</span>
                    </div>
                   
                    
                </div>
            </div>
            <div class="modal-body">
                <form action="">
                    <div class="modal-body-intro">
                        상태메세지
                        <input class="modal-body-intro-input" type="text" name="lineIntro" id="" value="${loginMember.lineIntro}"  data-original-value="${loginMember.lineIntro}"  readonly>
                        <img class="modal-edit-btn" src="${root}/resources/img/icon/svg/rename.svg" alt="">
                    </div>
                    <div class="modal-body-edit">
                        <label for="">
                            이메일
                            <input type="text" name="email" value="${loginMember.mail}" data-original-value="${loginMember.mail}">
                        </label>
                        <label for="">
                            전화번호
                            <input type="text" name="phone" value="${loginMember.phone}" data-original-value="${loginMember.phone}">
                            <img class="modal-edit-btn" src="${root}/resources/img/icon/svg/rename.svg" alt="">
                        </label>
                        <label for="">
                            생년월일
                            <input type="text" name="birthDate" value="${loginMember.birthDate}" data-original-value="${loginMember.birthDate}">
                            <img class="modal-edit-btn" src="${root}/resources/img/icon/svg/rename.svg" alt="">
                        </label>
                    </div>

                    <div class="modal-btn-area">
                        <input type="submit" value="등록">
                        <input type="button" onclick="modalClose()" value="취소">
                    </div>

                </form>
            </div>
        </div>

    </div>

    

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
                            <img src="${root}/resources/img/employee/${loginMember.profile}" alt="">
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
                        <div class="news-news">
                            <div class="news-newpost">
                                <div class="community-list">
                                    <div>제목</div>
                                    <div>작성자</div>
                                    <div>조회수</div>
                                    <div></div>
                                </div>
                                <c:forEach items="${ getEventNotice }" var="list">
                                    
    
                                    <div class="community-list" onclick="goToNoticeDetail('${ list.no }')">
                                        <div>${ list.title }</div>
                                        <div>운영자</div>
                                        <div>${ list.hit }</div>
                                        <div>${ list.no }</div>
                                    </div>
    
    
                                </c:forEach>
                            </div>
                        </div>
                        <div class="news-newpost">
                            <div class="community-list">
                                <div>제목</div>
                                <div>작성자</div>
                                <div>조회수</div>
                                <div></div>
                            </div>
                            <c:forEach items="${ newBoardList }" var="list">
                                

                                <div class="community-list newpost">
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

                    <div class="schedule-area">
                        <c:forEach items="${ getCalendar }" var="list">
                        
                            <div class="schedule-body">
                                <input class="schedule-no" type="text" value="${ list.no }">
                                <input class="schedule-days-left" type="text" value="${ list.daysLeft }">
                                <div>D-${ list.daysLeft }</div>
                                <div class="schedule-title">${ list.title }</div>
                                <input class="schedule-days-left" type="text" value="${ list.typeNo }">
                                
                            </div>

                        </c:forEach>
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
                            <div> 오늘 근무한 시간 </div>
                            <div class="officehours">00:00:00</div>

                            <div>
                                <div class="checkInTime-area">
                                    <div>출근</div>
                                    <div class="checkInTime">${ getAttendance.checkInTime }</div>
                                    <div>[${ getAttendance.type }]</div>
                                </div>
                                
                                <div class="checkInTime-area check-out">
                                    <div class="checkOutTime-icon">퇴근</div>
                                    <div class="checkOutTime not-null">${ getAttendance.checkOutTime }</div>
                                </div>
                            </div>

                            

                            
                            

                        </div>


                    </c:if>

                    <style>
                        
                        .attendance-area {
                            padding: 15;
                            width: 90%;
                            justify-self: center;
                            display: flex;
                            flex-direction: column;
                            align-items: center;
                        }

                        .attendance-area > div:first-child {
                            font-size: 14;
                            color: #77828a;
                            margin-bottom: 5px;
                            border-bottom: 1px solid #f1f1f1;
                            font-weight: 600;
                        }

                        .attendance-area > div:nth-child(2) {
                            font-size: 10;
                            color: #6a767f;
                            margin-bottom: 5;
                        }

                        .attendance-area > div.officehours {
                            font-size: 23;
                            margin-bottom: 10;
                            color: #374957;
                            letter-spacing: 2px;
                        }
                        
                        .checkInTime-area {
                            display: grid;
                            font-size: 16px;
                            align-items: center;
                            padding: 2px;
                            justify-content: flex-start;
                            grid-template-columns: 1fr 1fr 1fr;
                            justify-items: center;
                        }

                        .checkInTime-area > div {
                            justify-self: center;
                            text-align: center;
                        }

                        .checkInTime-area > div:first-child {
                            background-color: #4876EF;
                            padding: 7px;
                            border-radius: 15px;
                            color: #fff;
                            font-size: 14px;
                        }

                        .checkInTime-area > div:nth-child(3){
                            font-size: 14px;
                            color: #77828a;;
                        }

                        .checkInTime-area > div:nth-child(2) {
                            width: 80;
                        }

                        .checkInTime-area.check-out > div:first-child{
                            background-color: #00cba4;
                        }

                    </style>


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


                                <div class="community-list  newpost">
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

