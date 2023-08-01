<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js" integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.js" integrity="sha512-8tHhvNIEwJiw6wQDCVob7hCrwfECKknmtZAdP8JdqZcQ6OEAf1aaErJAzTAL5tQYrcrJOhqS2P3laAuwk4+e5g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="${root}/resources/css/home/chart.css">
<style>

    .chart-body {
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-content: space-around;
        flex-direction: row;
        margin-left: 90px;
        margin-top: 30px;
    }

    .second {
        justify-self: center;
        align-self: center;
        position:relative;  
        /* width:400px;      */
        display: flex;
        justify-content: center;
    }
    .second > canvas {}
    .second > strong {
        position: absolute;
        margin-top: 60px;
        margin-left: 8px;
        width: 97.05;
        height: 40;
        /* margin: -50px 0 0 -55px; */
        font-size: 2rem;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #8c8c8c;
    }

    .second > strong:hover {
        color: #374957;
    }

    .project-info-area {
        display: grid;
        height: 100%;
        flex-direction: column;
        grid-template-rows: 2fr 5fr;
        width: 80%;
        justify-self: center;
        align-items: stretch;
    }

    .project-info-area > span:first-child {
        align-self: end;
    }

    .project-info-area > span:nth-child(2) {
        margin-top: 10;
        margin-left: 3;
        font-size: 14;
        color: #8c8c8c;
    }
    
</style>
</head>

<div class="chart-body">
    
    <div class='second circle'>
        <strong></strong>
    </div>

</div>

<script>
    $(function(){
        // perNum 변수에 70을 저장
        var perNum = 33;

        // 'second.circle' 클래스를 가진 요소에 circleProgress 플러그인 적용
        $('.second.circle').circleProgress({
            // value 옵션에 perNum의 값을 100으로 나눈 결과를 지정하여 진행 막대의 값으로 설정
            value: perNum/100,

            // 진행 막대의 시작 각도를 300도로 설정
            startAngle: 300,

            // 진행 막대의 크기를 150픽셀로 설정
            size: 150,

            // 진행 막대의 채우기 설정을 그라데이션으로 지정
            fill: {
                gradient: ["#4876ef","#00cba4"], // 그라데이션 색상 배열
                gradientAngle: Math.PI / 2 // 그라데이션의 각도를 90도로 설정 (수직 방향)
            },

            // 애니메이션 설정
            animation: {
                duration: 2200, // 애니메이션 지속 시간을 2200밀리초(2.2초)로 설정
                easing: "swing" // 애니메이션 이징 함수를 swing으로 설정
            },

            // 진행 막대의 선 끝 모양을 'round'로 설정
            lineCap: "round",

            // 애니메이션의 진행 방향을 반대로 설정
            reverse: true
        }).on('circle-animation-progress', function(event, progress) {
            // 애니메이션 진행 중에 호출되는 이벤트 핸들러
            // 현재 진행 중인 애니메이션의 진행률을 이용하여 진행 막대에 표시할 텍스트를 갱신
            $(this).find('strong').html(Math.round(perNum * progress) + '<i>%</i>');
        });
    });
</script>
