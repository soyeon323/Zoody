<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/meetingroom/reserve.css">
<title>Document</title>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="mt_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="mt_main">
            <!-- 맨 윗 줄 -->
            <div class="mt_link">
                <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="#">일정등록</a></li>
                      <li class="breadcrumb-item active" aria-current="page">회의실 상세 예약</li>
                    </ol>
                </div>
            </div>
            <div class="mt_search">
                <span>날짜</span>
                <input type="date" name="" id="">
            </div>
            <div class="mt_box">
            	<c:forEach items="${list}" var="vo">
	                <div class="card">
	                    <img src="${root}/resources/img/meetingroom/test.jpg" class="card-img-top" alt="...">
                        <button style="border: none; background-color: transparent;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                                <g clip-path="url(#clip0_473_8454)">
                                    <path d="M7.99935 2.66667C8.73572 2.66667 9.33268 2.06971 9.33268 1.33333C9.33268 0.596954 8.73572 0 7.99935 0C7.26297 0 6.66602 0.596954 6.66602 1.33333C6.66602 2.06971 7.26297 2.66667 7.99935 2.66667Z" fill="white"/>
                                    <path d="M7.99935 9.33365C8.73572 9.33365 9.33268 8.7367 9.33268 8.00032C9.33268 7.26394 8.73572 6.66699 7.99935 6.66699C7.26297 6.66699 6.66602 7.26394 6.66602 8.00032C6.66602 8.7367 7.26297 9.33365 7.99935 9.33365Z" fill="white"/>
                                    <path d="M7.99935 15.9997C8.73572 15.9997 9.33268 15.4027 9.33268 14.6663C9.33268 13.93 8.73572 13.333 7.99935 13.333C7.26297 13.333 6.66602 13.93 6.66602 14.6663C6.66602 15.4027 7.26297 15.9997 7.99935 15.9997Z" fill="white"/>
                                </g>
                                <defs>
                                    <clipPath id="clip0_473_8454">
                                    <rect width="16" height="16" fill="white"/>
                                    </clipPath>
                                </defs>
                            </svg>
                        </button>
                        <div class="list-group" style="display: none;">
                            <a href="${root}/meetingroom/reserve/update?no=${vo.no}" class="list-group-item list-group-item-action mtUpdate" aria-current="true" data-vo-no="${vo.no}" onclick="mtUpdate(event);">
                              수정하기
                            </a>
                            <a href="${root}/meetingroom/reserve/delete?no=${vo.no}" class="list-group-item list-group-item-action mtDelete" data-vo-no="${vo.no}" onclick="mtDelete(event);">삭제하기</a>
                        </div>
	                    <div class="card-body">
	                      <h5 class="card-title">${vo.name} 회의실</h5>
	                      <a href="#" class="btn btn-primary">예약하기</a>
	                      <div class="card-text">
	                        <span>Capacity</span>
	                        <span>Conference</span>
	                        <span>EnrollDate</span>
	                        <p>${vo.capacity} people</p>
	                        <c:choose> 
	                           <c:when test="${vo.status eq 'O'}">
	                             <p style="color: #00CBA4;">Available</p>
	                           </c:when>
	                           <c:otherwise>
	                             <p>Available</p>
	                           </c:otherwise> 
                         	</c:choose> 
                          	<p>${vo.enrolldate}</p>
                       	</div>
                      </div>
                </div>
                                  
              </c:forEach>
            </div>
            <div class="cardPlus">
                <a href="${root}/meetingroom/add">
                    <button>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M14.1667 9.16667H10.8333V5.83333C10.8333 5.61232 10.7455 5.40036 10.5893 5.24408C10.433 5.0878 10.221 5 10 5C9.77899 5 9.56702 5.0878 9.41074 5.24408C9.25446 5.40036 9.16667 5.61232 9.16667 5.83333V9.16667H5.83333C5.61232 9.16667 5.40036 9.25446 5.24408 9.41074C5.0878 9.56702 5 9.77899 5 10C5 10.221 5.0878 10.433 5.24408 10.5893C5.40036 10.7455 5.61232 10.8333 5.83333 10.8333H9.16667V14.1667C9.16667 14.3877 9.25446 14.5996 9.41074 14.7559C9.56702 14.9122 9.77899 15 10 15C10.221 15 10.433 14.9122 10.5893 14.7559C10.7455 14.5996 10.8333 14.3877 10.8333 14.1667V10.8333H14.1667C14.3877 10.8333 14.5996 10.7455 14.7559 10.5893C14.9122 10.433 15 10.221 15 10C15 9.77899 14.9122 9.56702 14.7559 9.41074C14.5996 9.25446 14.3877 9.16667 14.1667 9.16667Z" fill="white"/>
                        </svg>
                        회의실 추가
                    </button>
                </a>
            </div>
        </div>
    </div>

    <script>
        // 모든 .card 요소 선택
        const cards = document.querySelectorAll('.card');
    
        // 각각의 .card 요소에 대해서 이벤트를 추가
        cards.forEach(card => {
            // .card 요소 내부의 버튼을 선택
            const button = card.querySelector('button');
    
            // 버튼을 클릭했을 때 이벤트를 처리
            button.addEventListener('click', function() {
                // 현재 .card 요소 내부의 .list-group 요소를 선택
                const listGroup = card.querySelector('.list-group');
    
                // 'list-group' 클래스의 디스플레이 속성을 변경하여 나타났다 사라졌다 토글
                if (listGroup.style.display === 'none' || listGroup.style.display === '') {
                    listGroup.style.display = 'block';
                } else {
                    listGroup.style.display = 'none';
                }
            });
        });
    </script>

    <script>
        // function mtUpdate(event) {
        //     // event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지합니다.
        //     const voNo = event.target.dataset.voNo; // 클릭한 링크의 data-vo-no 값 가져오기
        //     sendAjaxForUpdate(voNo); // Ajax 요청 함수 호출
        // }

        function mtDelete(event) {
            event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지합니다.
            const voNo = event.target.dataset.voNo; // 클릭한 링크의 data-vo-no 값 가져오기
            sendAjaxForDelete(voNo); // Ajax 요청 함수 호출
        }

        // function sendAjaxForUpdate(voNo) {
        //     $.ajax({
        //         url: '${root}/meetingroom/reserve/update',
        //         method: 'POST',
        //         data: { no: voNo },
        //         success: function(response) {
        //             alert("조회 성공.")
        //         },
        //         error: function(error) {
        //             alert("수정 오류");
        //         }
        //     });
        // }

        function sendAjaxForDelete(voNo) {
            $.ajax({
                url: '${root}/meetingroom/reserve/delete',
                method: 'POST',
                data: { no: voNo },
                success: function(response) {
                    alert("성공적으로 삭제 처리 되었습니다.");
                    window.location.href = '${root}/meetingroom/reserve';
                },
                error: function(error) {
                    alert("삭제 오류");
                }
            });
        }
    </script>
    
</body>
</html>