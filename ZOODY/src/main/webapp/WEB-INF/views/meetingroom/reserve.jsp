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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/meetingroom/reserve.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Document</title>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

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
                      <li class="breadcrumb-item"><a href="${root}/calendar/main">일정등록</a></li>
                      <li class="breadcrumb-item active" aria-current="page">회의실 상세 예약</li>
                    </ol>
                </div>
            </div>
            <div style="display: flex; justify-content: space-between; align-items: baseline;">
                <div class="mt_search">
                    <span>날짜</span>
                    <input type="date" name="date" id="date" required>
                </div>
                <!-- <a class="btn btn-primary" href="${root}/meetingroom/my-reserve" role="button" style="font-size: 13px; background-color: #00BEEA; border: none;">내 예약 현황 확인 >></a> -->
                <button class="btn btn-primary" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasBottom" aria-controls="offcanvasBottom" style="font-size: 13px; background-color: #00BEEA; border: none;">내 예약 현황 확인 >></button>

                <div class="offcanvas offcanvas-bottom" tabindex="-1" id="offcanvasBottom" aria-labelledby="offcanvasBottomLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasBottomLabel">회의실 예약 목록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body small">
                    <div class="overflow-auto">

                        <table class="table table-striped myReserveList">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">예약일</th>
                                    <th scope="col">회의실</th>
                                    <th scope="col">시작시간</th>
                                    <th scope="col">종료시간</th>
                                    <th scope="col">상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${reserveList}" var="res">
                                    <tr>
                                        <th scope="row">${res.no}</th>
                                        <td>${res.date}</td>
                                        <td>${res.name}</td>
                                        <td>${res.startTime}</td>
                                        <td>${res.endTime}</td>
                                        <td><button data-res-date="${res.date}" data-res-startTime="${res.startTime}" data-res-no="${res.no}" type="button" class="btn btn-outline-success" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" onclick="unReserve()">예약 취소</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                </div>
            </div>
        

            <div class="mt_box">
            	<c:forEach items="${list}" var="vo">
	                <div class="card" style="box-shadow: 0px 2px 8px 0px rgba(0, 0, 0, 0.10);">
                        <img src="${root}/resources/img/meetingroom/${vo.changeName}" class="card-img-top" alt="회의실사진"> <!-- 여기에 썸네일 이미지 보이기 -->
	                    <!-- <img src="${vo.changeName}" class="card-img-top" alt="111"> -->
                        <!-- 'ADMIN'을 포함하는 경우에 실행할 내용 -->
                        <c:if test="${fn:contains(loginMember.id, 'admin')}">
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
                            <c:choose> 
	                           <c:when test="${vo.status eq 'O'}">
                                    <a href="${root}/meetingroom/reserve/stop?no=${vo.no}" class="list-group-item list-group-item-action mtStop" data-vo-no="${vo.no}" onclick="mtStop(event);">정지하기</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="${root}/meetingroom/reserve/normal?no=${vo.no}" class="list-group-item list-group-item-action mtNormal" data-vo-no="${vo.no}" onclick="mtNormal(event);">정지취소</a>
	                           </c:otherwise> 
                         	</c:choose> 
                        </div>
                        </c:if>
	                    <div class="card-body">
	                      <h5 class="card-title">${vo.name} 회의실</h5>
	                      <!-- <a href="#" class="btn btn-primary">예약하기</a> -->


                          <c:choose> 
                            <c:when test="${vo.status eq 'O'}">
                              <button type="button" class="btn btn-primary reserveBtn" data-bs-toggle="modal" data-vo-no="${vo.no}" data-bs-target="#staticBackdrop" onclick="reserve(this);">
                                  예약하기
                              </button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="btn btn-primary reserveBtn" style="background-color: gray; border: none;">
                                    예약 정지
                                </button>
                            </c:otherwise> 
                          </c:choose> 
                            
                            <!-- Modal -->
                            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="staticBackdropLabel" style="margin-right: 10px;">예약 가능 시간</h1>
                                    <div class="resInfo">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="11" height="11" viewBox="0 0 11 11" fill="none">
                                            <g clip-path="url(#clip0_1585_8779)">
                                              <path d="M5.5 0C4.41221 0 3.34884 0.322569 2.44437 0.926917C1.5399 1.53127 0.834947 2.39025 0.418665 3.39524C0.00238307 4.40024 -0.106535 5.5061 0.105683 6.573C0.317902 7.63989 0.841726 8.6199 1.61092 9.38909C2.3801 10.1583 3.36011 10.6821 4.42701 10.8943C5.4939 11.1065 6.59977 10.9976 7.60476 10.5813C8.60976 10.1651 9.46874 9.46011 10.0731 8.55564C10.6774 7.65117 11 6.5878 11 5.5C10.9984 4.04179 10.4185 2.64376 9.38735 1.61265C8.35624 0.581546 6.95821 0.00157716 5.5 0V0ZM5.5 10.0833C4.59351 10.0833 3.70736 9.81453 2.95364 9.3109C2.19991 8.80728 1.61246 8.09146 1.26555 7.25397C0.918653 6.41647 0.827888 5.49492 1.00474 4.60584C1.18159 3.71676 1.61811 2.90008 2.2591 2.25909C2.90009 1.6181 3.71676 1.18158 4.60584 1.00473C5.49492 0.827885 6.41647 0.918651 7.25397 1.26555C8.09146 1.61245 8.80728 2.19991 9.3109 2.95364C9.81453 3.70736 10.0833 4.5935 10.0833 5.5C10.082 6.71517 9.59869 7.88018 8.73943 8.73943C7.88018 9.59869 6.71517 10.082 5.5 10.0833V10.0833Z" fill="#C5C5C5"/>
                                              <path d="M5.49935 2.2915C5.37779 2.2915 5.26121 2.33979 5.17526 2.42575C5.0893 2.5117 5.04102 2.62828 5.04102 2.74984V6.4165C5.04102 6.53806 5.0893 6.65464 5.17526 6.74059C5.26121 6.82655 5.37779 6.87484 5.49935 6.87484C5.62091 6.87484 5.73749 6.82655 5.82344 6.74059C5.9094 6.65464 5.95769 6.53806 5.95769 6.4165V2.74984C5.95769 2.62828 5.9094 2.5117 5.82344 2.42575C5.73749 2.33979 5.62091 2.2915 5.49935 2.2915Z" fill="#C5C5C5"/>
                                              <path d="M5.95769 8.24984C5.95769 7.99671 5.75248 7.7915 5.49935 7.7915C5.24622 7.7915 5.04102 7.99671 5.04102 8.24984C5.04102 8.50297 5.24622 8.70818 5.49935 8.70818C5.75248 8.70818 5.95769 8.50297 5.95769 8.24984Z" fill="#C5C5C5"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_1585_8779">
                                                <rect width="11" height="11" fill="white"/>
                                              </clipPath>
                                            </defs>
                                        </svg>
                                        <span>1회 예약 시 최대 1시간 예약 가능합니다.</span>
                                        </div>
                                    <input type="hidden" id="mNo" name="meetingroomNo" value="">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                                <button type="button" class="timeBtn" value="9">오전 09:00</button>
                                                <button type="button" class="timeBtn" value="10">오전 10:00</button>
                                                <button type="button" class="timeBtn" value="11">오전 11:00</button>
                                                <button type="button" class="timeBtn" value="12">오후 12:00</button>
                                                <button type="button" class="timeBtn" value="1">오후 01:00</button>
                                                <button type="button" class="timeBtn" value="2">오후 02:00</button>
                                                <button type="button" class="timeBtn" value="3">오후 03:00</button>
                                                <button type="button" class="timeBtn" value="4">오후 04:00</button>
                                                <button type="button" class="timeBtn" value="5">오후 05:00</button>
                                                <span id="result_checkId" style="grid-column: 1/4;display: flex;align-items: center;font-size: 14px;"></span>
                                    </div>
                                    <div class="modal-footer">
                                    <input type="hidden" name="timeValue" id="timeValue" value="">
                                    <button type="button" class="btn btn-secondary subBtn" data-bs-dismiss="modal">취소</button>
                                    <button type="submit" class="btn btn-primary subBtn" onclick="reserveMt(event)">예약</button>
                                    </div>
                                </div>
                                </div>

                                
                            </div>


	                      <div class="card-text">
	                        <span>Capacity</span>
	                        <span>Conference</span>
	                        <span>EnrollDate</span>
	                        <p>${vo.capacity} people</p>
	                        <c:choose> 
	                           <c:when test="${vo.status eq 'O'}">
	                             <p style="color: #00CBA4";>Available</p>
	                           </c:when>
	                           <c:otherwise>
	                             <p style="color: gray;">Available</p>
	                           </c:otherwise> 
                         	</c:choose> 
                          	<p>${vo.enrolldate}</p>
                       	</div>
                      </div>
                </div>
                                  
              </c:forEach>
            </div>
            <!-- 'ADMIN'을 포함하는 경우에 실행할 내용 -->
            <div class="cardPlus">
                <c:if test="${fn:contains(loginMember.id, 'admin')}">
                    <a href="${root}/meetingroom/add">
                        <button>
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                <path d="M14.1667 9.16667H10.8333V5.83333C10.8333 5.61232 10.7455 5.40036 10.5893 5.24408C10.433 5.0878 10.221 5 10 5C9.77899 5 9.56702 5.0878 9.41074 5.24408C9.25446 5.40036 9.16667 5.61232 9.16667 5.83333V9.16667H5.83333C5.61232 9.16667 5.40036 9.25446 5.24408 9.41074C5.0878 9.56702 5 9.77899 5 10C5 10.221 5.0878 10.433 5.24408 10.5893C5.40036 10.7455 5.61232 10.8333 5.83333 10.8333H9.16667V14.1667C9.16667 14.3877 9.25446 14.5996 9.41074 14.7559C9.56702 14.9122 9.77899 15 10 15C10.221 15 10.433 14.9122 10.5893 14.7559C10.7455 14.5996 10.8333 14.3877 10.8333 14.1667V10.8333H14.1667C14.3877 10.8333 14.5996 10.7455 14.7559 10.5893C14.9122 10.433 15 10.221 15 10C15 9.77899 14.9122 9.56702 14.7559 9.41074C14.5996 9.25446 14.3877 9.16667 14.1667 9.16667Z" fill="white"/>
                            </svg>
                            회의실 추가
                        </button>
                    </a>
                </c:if>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            $(".btn-outline-success").click(function() {
                var resNo = $(this).data("res-no");
                var resDate = $(this).data("res-date");
                var resTime = $(this).data("res-starttime");


                console.log("예약 번호 : " + resNo);
                console.log("예약 시간 : " + resDate + "/" + resTime);

                var resDateTime = resDate + ' ' + resTime.replace(" ~ ", "");
                console.log("결과 : " + resDateTime);

                $.ajax({
                    type: "POST",
                    url: "${root}/meetingroom/unReserve",
                    data: { 
                        resNo: resNo,
                        resDateTime : resDateTime
                    },
                    success: function(data) {

                        if(data == "Y"){
                            alert("예약 취소 완료")
                        } else {
                            alert("예약 취소 실패")
                        }
                        location.reload();

                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                    }
                });
            });
        });
    </script>


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

        function mtDelete(event) {
            event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지
            const voNo = event.target.dataset.voNo; // 클릭한 링크의 data-vo-no 값 가져오기
            sendAjaxForDelete(voNo); // Ajax 요청 함수 호출
        }

        function sendAjaxForDelete(voNo) {
            $.ajax({
                url: '${root}/meetingroom/reserve/delete',
                method: 'POST',
                data: { 
                    no: voNo,

                },
                success: function(response) {
                    alert("성공적으로 삭제 처리 되었습니다.");
                    window.location.href = '${root}/meetingroom/reserve';
                },
                error: function(error) {
                    alert("삭제 오류");
                }
            });
        }

        function mtStop(event) {
            event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지
            const voNo = event.target.dataset.voNo; // 클릭한 링크의 data-vo-no 값 가져오기
            sendAjaxForStop(voNo); // Ajax 요청 함수 호출
        }

        function sendAjaxForStop(voNo) {
            $.ajax({
                url: '${root}/meetingroom/reserve/stop',
                method: 'POST',
                data: { 
                    no: voNo,

                },
                success: function(response) {
                    alert("성공적으로 정지 처리 되었습니다.");
                    window.location.href = '${root}/meetingroom/reserve';
                },
                error: function(error) {
                    alert("정지 오류");
                }
            });
        }

        function mtNormal(event) {
            event.preventDefault(); // 링크의 기본 동작(페이지 이동)을 방지
            const voNo = event.target.dataset.voNo; // 클릭한 링크의 data-vo-no 값 가져오기
            sendAjaxForNormal(voNo); // Ajax 요청 함수 호출
        }

        function sendAjaxForNormal(voNo) {
            $.ajax({
                url: '${root}/meetingroom/reserve/normal',
                method: 'POST',
                data: { 
                    no: voNo,

                },
                success: function(response) {
                    alert("성공적으로 정지취소 처리 되었습니다.");
                    window.location.href = '${root}/meetingroom/reserve';
                },
                error: function(error) {
                    alert("정지취소 오류");
                }
            });
        }

    </script>

    <!-- hidden에 회의실 번호 넣기 -->
    <script>

        function reserve(button) {
            const meetingroomNo = button.getAttribute('data-vo-no');
            document.getElementById('mNo').value = meetingroomNo;

            console.log(meetingroomNo);

            var date = $('#date').val();

            // $.ajax({
            //     url: '${root}/meetingroom/time',
            //     data: {
            //         meetingroomNo: meetingroomNo,
            //         date : date
            //     },
            //     dataType : "json",
            //     method: 'GET',
            //     success: function(result) {
            //         console.log(result);
            //     },
            //     error: function(xhr, status, error) {
            //         console.error(error);
            //     }
            // });
        }

    </script>

    <!-- 오늘 이전 날짜 선택 불가능 -->
    <script>
        const date = document.querySelector('#date');

        const today = new Date();
        today.setMinutes(today.getMinutes() - today.getTimezoneOffset());
        const nowISOString = today.toISOString().split('T')[0];

        date.min = nowISOString;

    </script>

    <!-- 예약하기 -->
    <script>

        $('.timeBtn').on('click', (e) => {
            var btnValue = e.target.value;
            document.getElementById('timeValue').value = btnValue;

            var meetingroomNo = $('#mNo').val();
            var date = $('#date').val();

            console.log("Meeting Room No:", meetingroomNo);
            console.log("startTime:", btnValue);
            console.log("date:", date);

            $.ajax({
                url : "${root}/meetingroom/check",
                data : {
                    meetingroomNo : meetingroomNo,
                    startTime : btnValue,
                    date : date
                },
                type : "POST",
                success : function(data){
                    
                    var resultText = '';

                    if(data == "Y"){
                        resultText = "예약 불가능한 시간입니다.";
                        $('#result_checkId').html(resultText).css("color","red");
                    } else {
                        resultText = "예약 가능한 시간입니다.";
                        $('#result_checkId').html(resultText).css("color","green");
                    }

                    console.log(data);
                },
                error : function(error){
                    console.error(error);
                }
            })
            
            })

        function reserveMt(event) {
            var meetingroomNo = $('#mNo').val();
            var startTime = $('#timeValue').val(); // 포커스된 버튼의 값 가져오기
            var endTime = startTime + 1;
            var date = $('#date').val();

            console.log("Meeting Room No:", meetingroomNo);
            console.log("startTime:", startTime);
            console.log("endTime:", endTime);
            console.log("date:", date);

            $.ajax({
                url : '${root}/meetingroom/reserve',
                data : {
                    meetingroomNo : meetingroomNo,
                    startTime : startTime,
                    date : date
                },
                method : "POST",
                success : function(data){

                    if(data == "Y"){
                        alert("예약이 성공적으로 처리되었습니다.")
                        location.reload();
                    }else{
                        swal("예약 실패!", "이미 예약되어있는 시간입니다. 날짜 선택을 다시 해주세요.", "error");
                    }

                },
                error: function(xhr, status, error){
                    swal("예약 실패!", "예약에 실패하셨습니다. 날짜 선택 후 다시 시도해 주세요.", "error");
                    console.error(error);
                }
            })
        
        }
    </script>

    <!-- 예약 이미 된 시간 가져오기 -->
    <!-- <script>
        function reserve() {

        const reserveBtn = document.querySelector('.reserveBtn');
        const mNo = reserveBtn.getAttribute('data-vo-no');

        $.ajax({
            url:"${root}/meetingroom/time",
            data : mNo,
            dataType: "JSON",
            method: "GET",
            success:function(result){
                console.log(result);
            },
            error: function (error) {
                console.log(error);
            }

        })

        console.log("data-vo-no 값:", voNo);
        }
    </script> -->



    <script>

        // var reserveBtns = document.querySelectorAll('.reserveBtn');
        //     reserveBtns.forEach(function(reserveBtn) {
        //         reserveBtn.addEventListener('click', function() {
        //             var meetingroomNo = this.dataset.meetingroomNo;
        //             var meetingroomNoInput = document.querySelector('input[name="meetingroomNo"]');
        //             meetingroomNoInput.value = meetingroomNo;
        //         });
        //     });
            
        // console.log(meetingroomNo);

        // function reserve() {

        //     $.ajax({
        //         url: '${root}/meetingroom/reserve',
        //         method: "GET",
        //         data: { voNo: voNo },
        //         success: function (response) {
                    
        //             console.log("서버 응답:", response);
        //         },
        //         error: function (xhr, status, error) {
        //             console.error("에러 발생:", error);
        //         }
        //     });
        // }
    </script>

    <!-- 예약된 시간 확인하기 -->
    <!-- <script>
        $(document).ready(function() {
            $('.reserveBtn').on('click', function() {
                var meetingroomNo = $(this).data('vo-no');
                var date = $('#date').val(); // 선택한 날짜

                $.ajax({
                    url: '${root}/meetingroom/time',
                    data: { meetingroomNo: meetingroomNo, date: date },
                    method: 'GET',
                    // dataType: "json",
                    success: function(reservedTimes) {
                        // reservedTimes에는 예약된 시간 정보가 배열로 담겨 있습니다.
                        // 예약 가능한 시간과 예약 불가능한 시간을 표시하는 로직을 구현합니다.
                        console.log(reservedTimes);
                        // $('.timeBtn').each(function() {
                        //     var value = $(this).val();
                        //     if (reservedTimes.includes(value)) {

                        //         $(this).prop('disabled', true);
                        //         $(this).css('backgroundColor', 'gray');
                        //     } else {
                        //         $(this).prop('disabled', false);
                        //         $(this).css('background-color', '');
                        //     }
                        // });
                    },
                    error: function(error) {
                        console.error(error);
                    }
                });
            });
        });
    </script> -->

    

</body>
</html>