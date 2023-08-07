<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/project/side.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
<style>
    button{
        border: none;
        background: none;
    }
</style>
<body>

    <aside class="side-bar">
     
        <ul>
        <li>
            <a href="#"><i class="fa-solid fa-cat"></i> 근태 관리</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">일정 관리</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">인사 관리</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">동물 관리</a>
            <ul>
            <li><a href="/zoody/animal/enroll">동물 등록</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">전자 결제</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">프로젝트 관리</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        <li>
            <a href="#">커뮤니티</a>
            <ul>
            <li><a href="#">text1</a></li>
            <li><a href="#">text2</a></li>
            <li><a href="#">text3</a></li>
            <li><a href="#">text4</a></li>
            </ul>
        </li>
        </ul>
        <div id="storage"> &nbsp;&nbsp;&nbsp; 현재용량 500MB</div>
    </aside>

    <aside class="mini-side">
        <div><a>참여중인 프로젝트</a></div>
        <div>
            <button onclick="prjList();">목록으로</button>
        </div>
        <div><a>${prjVoList[0].title}</a></div>
        <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                <g clip-path="url(#clip0_429_9191)">
                <path d="M18 12V18H12C10.9478 17.9989 9.91443 17.7212 9.00349 17.1946C8.09255 16.6681 7.33609 15.9112 6.81 15C7.3754 14.996 7.93888 14.9336 8.4915 14.814C8.91236 15.3402 9.44625 15.765 10.0536 16.0569C10.6609 16.3487 11.3262 16.5002 12 16.5H16.5V12C16.4998 11.3259 16.3479 10.6605 16.0555 10.0532C15.7631 9.44582 15.3378 8.91206 14.811 8.4915C14.9316 7.93899 14.995 7.37551 15 6.81C15.9112 7.33609 16.6681 8.09255 17.1946 9.00349C17.7212 9.91443 17.9989 10.9478 18 12ZM13.5 6.75C13.5 4.95979 12.7888 3.2429 11.523 1.97703C10.2571 0.711159 8.54021 0 6.75 0C4.95979 0 3.2429 0.711159 1.97703 1.97703C0.711159 3.2429 0 4.95979 0 6.75L0 13.5H6.75C8.5396 13.498 10.2553 12.7862 11.5208 11.5208C12.7862 10.2553 13.498 8.5396 13.5 6.75ZM1.5 6.75C1.5 5.71165 1.80791 4.69661 2.38478 3.83326C2.96166 2.9699 3.7816 2.29699 4.74091 1.89963C5.70022 1.50227 6.75582 1.3983 7.77422 1.60088C8.79262 1.80345 9.72808 2.30346 10.4623 3.03769C11.1965 3.77191 11.6966 4.70738 11.8991 5.72578C12.1017 6.74418 11.9977 7.79978 11.6004 8.75909C11.203 9.7184 10.5301 10.5383 9.66674 11.1152C8.80339 11.6921 7.78835 12 6.75 12H1.5V6.75Z" fill="#374957"/>
                </g>
                <defs>
                <clipPath id="clip0_429_9191">
                <rect width="18" height="18" fill="white"/>
                </clipPath>
                </defs>
            </svg>
            <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
                채팅하기
            </button>
        </div>
        <!-- <div><a>국가주도 동물사랑 프로젝트</a></div>
        <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                <g clip-path="url(#clip0_429_9191)">
                <path d="M18 12V18H12C10.9478 17.9989 9.91443 17.7212 9.00349 17.1946C8.09255 16.6681 7.33609 15.9112 6.81 15C7.3754 14.996 7.93888 14.9336 8.4915 14.814C8.91236 15.3402 9.44625 15.765 10.0536 16.0569C10.6609 16.3487 11.3262 16.5002 12 16.5H16.5V12C16.4998 11.3259 16.3479 10.6605 16.0555 10.0532C15.7631 9.44582 15.3378 8.91206 14.811 8.4915C14.9316 7.93899 14.995 7.37551 15 6.81C15.9112 7.33609 16.6681 8.09255 17.1946 9.00349C17.7212 9.91443 17.9989 10.9478 18 12ZM13.5 6.75C13.5 4.95979 12.7888 3.2429 11.523 1.97703C10.2571 0.711159 8.54021 0 6.75 0C4.95979 0 3.2429 0.711159 1.97703 1.97703C0.711159 3.2429 0 4.95979 0 6.75L0 13.5H6.75C8.5396 13.498 10.2553 12.7862 11.5208 11.5208C12.7862 10.2553 13.498 8.5396 13.5 6.75ZM1.5 6.75C1.5 5.71165 1.80791 4.69661 2.38478 3.83326C2.96166 2.9699 3.7816 2.29699 4.74091 1.89963C5.70022 1.50227 6.75582 1.3983 7.77422 1.60088C8.79262 1.80345 9.72808 2.30346 10.4623 3.03769C11.1965 3.77191 11.6966 4.70738 11.8991 5.72578C12.1017 6.74418 11.9977 7.79978 11.6004 8.75909C11.203 9.7184 10.5301 10.5383 9.66674 11.1152C8.80339 11.6921 7.78835 12 6.75 12H1.5V6.75Z" fill="#374957"/>
                </g>
                <defs>
                <clipPath id="clip0_429_9191">
                <rect width="18" height="18" fill="white"/>
                </clipPath>
                </defs>
            </svg>
            <a href="">채팅하기</a>
        </div>
        <div><a>새로운 사자가족을 위한 우리 확장 프로젝트</a></div>
        <div>
            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                <g clip-path="url(#clip0_429_9191)">
                <path d="M18 12V18H12C10.9478 17.9989 9.91443 17.7212 9.00349 17.1946C8.09255 16.6681 7.33609 15.9112 6.81 15C7.3754 14.996 7.93888 14.9336 8.4915 14.814C8.91236 15.3402 9.44625 15.765 10.0536 16.0569C10.6609 16.3487 11.3262 16.5002 12 16.5H16.5V12C16.4998 11.3259 16.3479 10.6605 16.0555 10.0532C15.7631 9.44582 15.3378 8.91206 14.811 8.4915C14.9316 7.93899 14.995 7.37551 15 6.81C15.9112 7.33609 16.6681 8.09255 17.1946 9.00349C17.7212 9.91443 17.9989 10.9478 18 12ZM13.5 6.75C13.5 4.95979 12.7888 3.2429 11.523 1.97703C10.2571 0.711159 8.54021 0 6.75 0C4.95979 0 3.2429 0.711159 1.97703 1.97703C0.711159 3.2429 0 4.95979 0 6.75L0 13.5H6.75C8.5396 13.498 10.2553 12.7862 11.5208 11.5208C12.7862 10.2553 13.498 8.5396 13.5 6.75ZM1.5 6.75C1.5 5.71165 1.80791 4.69661 2.38478 3.83326C2.96166 2.9699 3.7816 2.29699 4.74091 1.89963C5.70022 1.50227 6.75582 1.3983 7.77422 1.60088C8.79262 1.80345 9.72808 2.30346 10.4623 3.03769C11.1965 3.77191 11.6966 4.70738 11.8991 5.72578C12.1017 6.74418 11.9977 7.79978 11.6004 8.75909C11.203 9.7184 10.5301 10.5383 9.66674 11.1152C8.80339 11.6921 7.78835 12 6.75 12H1.5V6.75Z" fill="#374957"/>
                </g>
                <defs>
                <clipPath id="clip0_429_9191">
                <rect width="18" height="18" fill="white"/>
                </clipPath>
                </defs>
            </svg>
            <a href="">채팅하기</a>
        </div> -->
    </aside>
</head>
<body>

    <script>
        // side-bar토글형식
        document.addEventListener('DOMContentLoaded', function() {
        var menuItems = document.querySelectorAll('.side-bar > ul > li > a');

        menuItems.forEach(function(item) {
            item.addEventListener('click', function(e) {
            e.preventDefault();
            var listItem = this.parentNode;
            listItem.classList.toggle('active');
            });
        });
        });

        //목록으로
        function prjList(){
            location.href = '${root}/project/progress';
        }
    </script>