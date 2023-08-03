<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/tempside.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
</head>
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
            <li><a href="${root}/employee/enroll">인사등록</a></li>
            <li><a href="${root}/employee/list">인사목록</a></li>
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
        <div><a>커뮤니티</a></div>
        <div>
            <button onclick="goWrite();">글쓰기</button>
        </div>
        <div><a>관리자게시판</a></div>
        <div><a href="${root}/admin/notice/list">공지사항</a></div>
        <div><a>직원게시판</a></div>
        <div><a href="${root}/admin/suggestion/list">건의사항</a></div>
        <div><a href="">설문/투표</a></div>
        <div><a>부서게시판</a></div>
        <div><a href="">사내뉴스</a></div>
        <div><a href="">동아리/동호회</a></div>
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

    //글쓰기 주소 걸기
    function goWrite(){
        location.href = "${root}/admin/notice/write";
    }
</script>
