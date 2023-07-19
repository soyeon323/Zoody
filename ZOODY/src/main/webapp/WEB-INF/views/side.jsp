<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/common/side.css">
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
            <a href="#">업무 할당</a>
            <ul>
            <li><a href="${root}/work/work">업무 할당</a></li>
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
            <a href="${root}/animal/list">동물 관리</a>
            <ul>
            <li><a href="${root}/animal/enroll">동물 등록</a></li>
            <li><a href="${root}/animal/list">동물 목록</a></li>
            </ul>
        </li>
        <li>
            <a href="#">전자 결제</a>
            <ul>
            <li><a href="${root}/addressbook/main-page">주소록(조직도)</a></li>
            <li><a href="${root}/mail/folder/receive">메일 목록</a></li>
            <li><a href="${root}/mail/write">메일 작성</a></li>
            <li><a href="${root}/mail/detail">메일 상세 </a></li>
            <li><a href="${root}/approval/main-page">전자메일 목록 </a></li>
            <li><a href="${root}/approval/write/letter-of-approval">전자결재 작성 </a></li>
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
            <li><a href="${root}/community/board/freeBoard/">게시판</a></li>
            <li><a href="${root}/community/vote/">투표</a></li>
            <li><a href="${root}/community/survey/">설문 조사</a></li>
            <li><a href=""></a></li>
            </ul>
        </li>
        </ul>
        <a href="${root}/document/"> <div id="storage"> &nbsp;&nbsp;&nbsp; 현재용량 500MB</div> </a>
       
    </aside>

</body>
</html>
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

    </script>