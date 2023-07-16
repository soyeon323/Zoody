<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/home.css">
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
                            <div>a</div>
                            <div>b</div>
                            <div class="profile-btns">
                                d
                            </div>
                    </div>
                </div>
                <div class="area calender">캘린더</div>
                <div class="area weather">날씨</div>
                <div class="area news">
                    
                        <div class="news-header">뉴스 / 최신글</div>
                        <div class="news-news"></div>
                        <div class="news-newpost"></div>

                </div>
            </div>
    
            <div class="grid area-gird-2">
                <div class="area schedule">일정</div>
                <div class="area chart">진행도</div>
                <div class="area attendance">근태현황</div>
                <div class="area community">커뮤니티</div>
                <div class="area notice">공지</div>
            </div>

        </div>
        
    </div>

</body>