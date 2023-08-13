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
<style>
    .active {
        background-color: #4876EF; /* 활성화된 메뉴 배경색 설정 */
        color: white; /* 클릭된 메뉴 글씨 색 변경 */
    }

    .side-bar > ul > li.active ul li:hover > a {
        border-left: 6px solid #4876EF; /* 호버 시 왼쪽 테두리 변경 */
    }
</style>
</head>
<body>

    <aside class="side-bar">
     
        <ul>
        <li>
            <a href="#"><i class="fa-solid fa-cat"></i> 근태 관리</a>
            <ul>
            <li><a href="${root}/attendance/main">근무현황</a></li>
            <li><a href="${root}/attendance/list">근무현황 목록 조회</a></li>
            <!-- 'ADMIN'을 포함하는 경우에 실행할 내용 -->
            <c:if test="${fn:contains(loginMember.id, 'ADMIN')}">
                <li><a href="${root}/attendance/admin/allList">유저 전체 근무 조회</a></li>
                <li><a href="${root}/attendance/admin/objection">objection</a></li>
            </c:if>
            </ul>
        </li>
        <li>
            <a href="#">일정 관리</a>
            <ul>
            <li><a href="${root}/calendar/main">일정관리</a></li>
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
        <c:if test="${not empty loginMember }">
	         <li>
	            <a href="#">부패도 조사</a>
	            <ul>
	            <li><a href="${root}/corrupt/survey/score/">부패도 점수 보기</a></li>
	            </ul>
	        </li>
        </c:if>
        <c:if test="${loginMember.id == 'admin'}">
            <li>
                <a href="#">인사 관리</a>
                <ul>
                <li><a href="${root}/employee/enroll">인사등록</a></li>
                <li><a href="${root}/employee/list">인사목록</a></li>
                </ul>
            </li>
        </c:if>
        <li>
            <a href="${root}/animal/list?page=1">동물 관리</a>
            <ul>
            <li><a href="${root}/animal/enroll">동물 등록</a></li>
            <li><a href="${root}/animal/list?page=1">동물 목록</a></li>
            <li><a href="${root}/animal/training/list?page=1">동물 훈련 일지목록</a></li>
            <li><a href="${root}/animal/health/list?page=1">동물 건강 일지목록</a></li>
            </ul>
        </li>
        <li>
            <a href="#">주소록</a>
            <ul>
            <li><a href="${root}/addressbook">주소록(조직도)</a></li>
            </ul>
        </li>
        <li>
            <a href="#">메일</a>
            <ul>
            <li><a href="${root}/mail/list?folder=receive">메일 목록</a></li>
            <li><a href="${root}/mail/write">메일 작성</a></li>
            </ul>
        </li>
        <li>
            <a href="#">전자 결재</a>
            <ul>
            <li><a href="${root}/approval/list">전자메일 목록 </a></li>
            <li><a href="${root}/approval/write/1">전자결재 작성 </a></li>
            </ul>
        </li>
        <li>
            <a href="#">프로젝트 관리</a>
            <ul>
            <li><a href="${root}/project/progress">진행중인 프로젝트</a></li>
            </ul>
        </li>
        <li>
            <a href="#">커뮤니티</a>
            <ul>
            <li><a href="${root}/community/board/freeBoard/">게시판</a></li>
            <li><a href="${root}/community/vote/">투표</a></li>
            <li><a href="${root}/community/survey/">설문 조사</a></li>
            <li><a onclick="goSuggestion('${loginMember.id}');">건의사항</a></li>
            <li><a onclick="goNotice('${loginMember.id}');">공지사항</a></li>
            </ul>
        </li>
        <li>
            <a href="#">지도</a>
            <ul>
            <li><a href="${root}/guidance/guidance">지도 보기</a></li>
            </ul>
        </li>
        </ul>
        <a href="${root}/document/list"> <div id="storage"> &nbsp;&nbsp;&nbsp; ${loginMember.capacity}중 N 사용</div> </a>
       
    </aside>

</body>
</html>
    <script>
        // side-bar 토글 형식
        document.addEventListener('DOMContentLoaded', function() {
            var menuItems = document.querySelectorAll('.side-bar > ul > li > a');
            
            menuItems.forEach(function(item) {
                item.addEventListener('click', function(e) {
                    e.preventDefault();
                    
                    // 현재 클릭된 메뉴의 부모 요소 (li)
                    var listItem = this.parentNode;
                    
                    // 현재 클릭된 메뉴가 활성화되어 있는지 여부
                    var isActive = listItem.classList.contains('active');
                    
                    // 모든 메뉴 비활성화
                    menuItems.forEach(function(otherItem) {
                        var otherListItem = otherItem.parentNode;
                        if (otherListItem !== listItem) {
                            otherListItem.classList.remove('active');
                        }
                    });

                    if (!isActive) {
                    listItem.classList.add('active');
                 }
                    // 클릭된 요소의 글씨 색을 하얀색으로 변경
                    menuItems.forEach(function(otherItem) {
                    if (otherItem !== item) {
                        otherItem.style.color = ''; // 기본 색상으로 되돌리기
                    }
                });
                item.style.color = 'white'; // 클릭된 요소의 글씨 색 변경
                });
            });
        });


        //건의사항 주소
        function goSuggestion(id){
           if(id == 'admin'){
                location.href = '${root}/admin/suggestion/list';
           }else if(id != 'admin'){
                location.href = '${root}/suggestion/list';
           }
        }

        //공지사항 주소
        function goNotice(id){
            if(id == 'admin'){
                location.href = '${root}/admin/notice/list';
            }else if(id != 'admin'){
                location.href = '${root}/notice/list';
            }
        }

        // 현재 클릭된 메뉴의 상태 변경
        if (!isActive) {
                    listItem.classList.add('active');
                }
    </script>
