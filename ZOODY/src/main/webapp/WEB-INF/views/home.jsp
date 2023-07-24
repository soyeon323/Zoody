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
                                <div><img src="${root}/resources/svg/icons/edit.svg" alt=""></div>
                                <div>2</div>
                                <div>3</div>
                                <div>4</div>
                                <div>5</div>
                            </div>
                            <div class="profile-btns">
                                d
                            </div>
                    </div>
                </div>
                <div class="area calender">
                    <%@ include file="/WEB-INF/views/common/fullcalendar.jsp" %>
                </div>
                <div class="area weather">
                    <button onclick="getWeatherInfo()">날씨</button>
                    <button onclick="getPosition()"> 현재위치 </button>

                </div>
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
                <div class="area notice" id="notice">
                    <img src="${root}/resources/svg/icons/notice.svg" alt="">
                    <div>전직원 알림) 스미싱 스팸메일 열람주의</div>
                </div>
            </div>

        </div>
        
    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>
<script>

   


    function getPosition() {

        window.navigator.geolocation.getCurrentPosition(success, error);

    }

    function success(position) {
    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;

    // 원래 좌표계는 WGS84 (World Geodetic System 1984)로 가정
    var originalProjection = 'EPSG:4326';

    // UTM 좌표계는 지역에 따라 다를 수 있으며, 여기서는 대한민국 기준으로 UTM-K 좌표계를 사용
    var targetProjection = 'EPSG:5179';

    // proj4 라이브러리를 사용하여 좌표를 변환
    var transformedCoordinates = proj4(originalProjection, targetProjection, [longitude, latitude]);

    var utmX = transformedCoordinates[0]; // UTM X 좌표
    var utmY = transformedCoordinates[1]; // UTM Y 좌표

    alert("내 위치 UTM X = " + utmX + " 내 위치 UTM Y = " + utmY);
}

function error(err) {
    $('div').text("조회 실패 ==>" + err.code);
}


</script>