<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/calendar/month.css">

<!-- //fullcalendar css -->
<script src='fullcalendar/dist/index.global.js'></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- //fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Document</title>
<style>
  
   #contextMenu {
    display: none;
    position: absolute;
    z-index: 1000;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 5px;
  }

  .contextOpened {
    display: block !important;
  }
  
    /* 드래그 박스의 스타일 */
  #external-events {
    height: 50%;
    padding: 0 10px;
    border: 1px solid #f1f1f1;
    border-radius: 5px;
    background: #fff;
    text-align: left;
  }
  #external-events h4 {
    font-size: 15px;
    margin-top: 0;
    padding-top: 1em;
    margin-bottom: 15px;
    /* font-weight: 500; */
  }
  #external-events .fc-event {
    margin: 9px 0;
    cursor: move;
    height: 30px;
  }
 
  #external-events p {
    margin: 1.5em 0;
    font-size: 11px;
    color: #666;
  }
 
  #external-events p input {
    margin: 0;
    vertical-align: middle;
  }

</style>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="cal_wrap">

        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>

        <div id="cal_main">

          <!-- 일자 클릭시 카테고리 선택 메뉴 -->
          <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">개인</a></li>
                <li><a tabindex="-1" href="#">부서</a></li>
                <li><a tabindex="-1" href="#">회사</a></li>
                <li><a tabindex="-1" href="#">회의</a></li>
                <li class="divider"></li>
                <!-- <button type="button" class="btn-close" aria-label="Close"></button> -->
                <li><a tabindex="-1" href="#" data-role="close">close</a></li>
            </ul>
          </div>

          <!-- 캘린더 -->
          <div id='calendar-wrap'>
            <div id='calendar'></div>
          </div>

          <!-- 일정추가 모달 -->
          <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-title">일정명</label>
                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
                                    required="required" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작시간</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">종료시간</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-type">구분</label>
                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
                                    <option value="0">개인</option>
                                    <option value="1">부서</option>
                                    <option value="2">회사</option>
                                    <option value="3">회의</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-color">색상</label>
                                <select class="inputModal" name="color" id="edit-color">
                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
                                    <option value="#495057" style="color:#495057;">검정색</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-desc">설명</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

          <div class="panel-heading">
              <h3 class="panel-title">필터</h3>
          </div>

          <div class="panel-body">

              <div class="col-lg-6">
                  <label for="calendar_view">구분별</label>
                  <div class="input-group">
                      <select class="filter" id="type_filter" multiple="multiple">
                        <option value="0">개인</option>
                        <option value="1">부서</option>
                        <option value="2">회사</option>
                        <option value="3">회의</option>
                      </select>
                  </div>
              </div>
          </div>
        </div>


        </div>

    </div>

    <script>
      var draggedEventIsAllDay;
      var activeInactiveWeekends = true;
    
      document.addEventListener('DOMContentLoaded', function () {
        $(function () {
          var request = $.ajax({
            url: "${root}/calendar/list",
            method: "GET",
            dataType: "json"
          });
    
          request.done(function (data) {
            console.log(data);
    
            // calendar element 취득
            var calendarEl = document.getElementById('calendar');
            // full-calendar 생성하기
            var calendar = new FullCalendar.Calendar(calendarEl, {
              // 해더에 표시할 툴바
              headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
              locale: 'ko', // 한국어 설정
              editable: true, // 수정 가능
              selectable: true,
              droppable: true, // 드래그 가능
              drop: function (arg) { // 드래그 엔 드롭 성공시
                if (document.getElementById('drop-remove').checked) {
                  // 드래그 박스에서 아이템을 삭제
                  arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                }
              },
              events: data, // AJAX로 받아온 데이터를 이벤트로 설정
              eventClick: function (info) {
    
              },
              eventDragStart: function (event, jsEvent, ui, view) {
                draggedEventIsAllDay = event.allDay;
              },
              select: function (startDate, endDate, jsEvent, view) {
                var $contextMenu = $("#contextMenu");
                $contextMenu.addClass("contextOpened");
                $contextMenu.css({
                  display: "block",
                  left: jsEvent.pageX,
                  top: jsEvent.pageY
                });

                $contextMenu.on("click","a",function(e){
                  e.preventDefault();
                  $contextMenu.removeClass("contextOpened");
                  $contextMenu.hide();

                  if ($(this).data().role !== 'close') {
                    newEvent(startDate, endDate, $(this).html())
                  }
                });

                $contextMenu.on("click", "[data-role='close']", function () {
                $contextMenu.removeClass("contextOpened");
                $contextMenu.hide();
              });
              }
              // select: function(arg){
              //   var title = prompt('일정 입력');
              // }
            });
    
            // 캘린더 랜더링
            calendar.render();
          });
        });
      });
    
    </script>
    

 
	



</body>
</html>