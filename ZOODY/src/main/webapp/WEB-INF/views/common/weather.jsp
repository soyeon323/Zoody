<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#weather_info {
    display: grid;
    align-items: center;
    justify-items: center;
    background: linear-gradient(360deg, #2594B7 0%, rgba(43, 152, 186, 0.71) 78.24%, rgba(81, 180, 212, 0.69) 103.57%);

    grid-template-areas: 
    "t i"
    "w i"
    ;
}

.temperatures {
    grid-area: t;
}

.weather-icon {
    grid-area: w;
}


 .weather-icon {
    width: 100;
    height: 100;
    overflow: hidden;
    grid-area: i;
 }

 .weather-icon > img {
    max-width: 100%;
 }

</style>
</head>
<div id="weather_info">

    <div class="temperatures">기온 00</div>
    <div class="weather-icon">
        <img src="${root}/resources/img/icon/png/weather-cloud.png" alt="">
    </div>
    <div class="weather-conditions">날씨 00</div>

</div>