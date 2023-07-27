<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/weather/weather.css">
</head>
<div id="weather_info">

    <div class="temperatures">기온 00</div>
    <div class="weather-icon">
        <img src="${root}/resources/img/icon/png/weather-cloud.png" alt="">
    </div>
    <div class="weather-conditions">날씨 00</div>

</div>