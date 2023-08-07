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
<link th:href="@{/Dashio/fullcalendar/main.css}" rel="stylesheet">
<link th:href="@{/Dashio/fullcalendar/main.min.css}" rel="stylesheet">
<script th:src="@{/Dashio/fullcalendar/main.min.js}"></script>
<link th:href="@{/Dashio/fullcalendar/demo-to-codepen.css}" rel="stylesheet">
<script th:src="@{/Dashio/fullcalendar/demo-to-codepen.js}"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script type="text/javascript" src="./fullcalendar-2.9.1/gcal.js"></script> -->
<!-- //fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- moment.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<!-- 추가 링크 -->
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<title>Document</title>
<style>
  
   /* #contextMenu {
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
  } */
  
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

  .panel-default {
    border-color: #ddd;
  } 

  .panel {
    margin-top: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
  }

  .panel-default>.panel-heading {
    color: #333;
    background-color: #f5f5f5;
    border-color: #ddd;
  }

  .panel-heading {
    padding: 10px 15px;
    border: 1px solid transparent;
    border-radius: 5px;
  }

  .panel-body {
    padding: 15px;
    display: flex;
    gap: 8px;
  }

  * {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }

  .form-group > label, .col-lg-4 > label{
    font-size: 13px;
    padding-bottom: 3px;
    color: #444444;
  }

  .fc-event:hover {
    cursor: pointer;
  }

  /* 팝오버 스타일 */
  /* .popoverTitleCalendar {
    color: #fff;
    background-color: #007bff;
    padding: 8px;
    font-weight: bold;
  }

  .popoverInfoCalendar {
    padding: 8px;
  }

  .popoverDescCalendar {
    padding-top: 8px;
  } */

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

          
          <!-- 날씨 정보 -->
  
          <div id="openviewWeather">
            <a class="weatherwidget-io" href="https://forecast7.com/en/37d57126d98/seoul/" data-label_1="Seoul" data-label_2="Weather" data-font="Roboto" data-icons="Climacons Animated" data-theme="pure" data-accent="rgba(1, 1, 1, 0.0)"></a>
          </div>
          
          <script>
          !function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
          </script>

          <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">카테고리1</a></li>
                <li><a tabindex="-1" href="#">카테고리2</a></li>
                <li><a tabindex="-1" href="#">카테고리3</a></li>
                <li><a tabindex="-1" href="#">카테고리4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

          <div class="panel panel-default hidden-print">
            <div class="panel-heading">
              <h3 class="panel-title">검색 설정</h3>
            </div>
            <div class="panel-body">
              <div class="col-lg-4">
                <!-- <label for="calendar_view">카테고리</label> -->
                  <!-- <div class="input-group">
                    <select class="filter" id="type_filter" multiple="multiple">
                      <option value="all">전체</option>
                      <option value="개인">개인</option>
                      <option value="부서">부서</option>
                      <option value="회사">회사</option>
                      <option value="회의">회의</option>
                    </select>
                  </div> -->
                  <label for="calendar_view">카테고리</label>
                  <div class="input-group">
                    <select class="form-select" id="inputGroupSelect04" aria-label="Example select with button addon">
                      <option selected>선택...</option>
                      <option value="0">개인</option>
                      <option value="1">부서</option>
                      <option value="2">회사</option>
                      <option value="3">회의</option>
                    </select>
                    <button class="btn btn-outline-secondary" type="button">검색</button>
                  </div>
              </div>
              <div class="col-lg-2">
                <div class="form-group">
                  <label for="calendar_view">달력 유형</label>
                  <select class="form-control" id="calendar_view">
                    <option value="month">Month</option>
                    <option value="agendaWeek">Week</option>
                    <option value="agendaDay">Day</option>
                    <option value="listWeek">Event List</option>
                  </select>
                </div>
              </div>
              <div class="col-lg-2">
                <div class="form-group">
                  <label for="calendar_start_time">시작 시간</label>
                  <select class="form-control" id="calendar_start_time">
                    <option value="01:00:00">01:00 AM</option>
                    <option value="02:00:00">02:00 AM</option>
                    <option value="03:00:00">03:00 AM</option>
                    <option value="04:00:00">04:00 AM</option>
                    <option value="05:00:00">05:00 AM</option>
                    <option value="06:00:00">06:00 AM</option>
                    <option value="07:00:00">07:00 AM</option>
                    <option value="08:00:00">08:00 AM</option>
                    <option value="09:00:00">09:00 AM</option>
                    <option value="10:00:00">10:00 AM</option>
                    <option value="11:00:00">11:00 AM</option>
                    <option value="12:00:00">12:00 PM</option>
                    <option value="13:00:00">13:00 PM</option>
                    <option value="14:00:00">14:00 PM</option>
                    <option value="15:00:00">15:00 PM</option>
                    <option value="16:00:00">16:00 PM</option>
                    <option value="17:00:00">17:00 PM</option>
                    <option value="18:00:00">18:00 PM</option>
                    <option value="19:00:00">19:00 PM</option>
                    <option value="20:00:00">20:00 PM</option>
                    <option value="21:00:00">21:00 PM</option>
                    <option value="22:00:00">22:00 PM</option>
                    <option value="23:00:00">23:00 PM</option>  
                  </select>
                </div>
              </div>
              <div class="col-lg-2">
                <div class="form-group">
                  <label for="calendar_end_time">종료 시간</label>
                  <select class="form-control" id="calendar_end_time">
                    <option value="01:00:00">01:00 AM</option>
                    <option value="02:00:00">02:00 AM</option>
                    <option value="03:00:00">03:00 AM</option>
                    <option value="04:00:00">04:00 AM</option>
                    <option value="05:00:00">05:00 AM</option>
                    <option value="06:00:00">06:00 AM</option>
                    <option value="07:00:00">07:00 AM</option>
                    <option value="08:00:00">08:00 AM</option>
                    <option value="09:00:00">09:00 AM</option>
                    <option value="10:00:00">10:00 AM</option>
                    <option value="11:00:00">11:00 AM</option>
                    <option value="12:00:00">12:00 PM</option>
                    <option value="13:00:00">13:00 PM</option>
                    <option value="14:00:00">14:00 PM</option>
                    <option value="15:00:00">15:00 PM</option>
                    <option value="16:00:00">16:00 PM</option>
                    <option value="17:00:00">17:00 PM</option>
                    <option value="18:00:00">18:00 PM</option>
                    <option value="19:00:00">19:00 PM</option>
                    <option value="20:00:00">20:00 PM</option>
                    <option value="21:00:00">21:00 PM</option>
                    <option value="22:00:00">22:00 PM</option>
                    <option value="23:00:00">23:00 PM</option> 
                  </select>
                </div>
              </div>
              <div class="col-lg-2">
                <div class="form-group">
                  <label for="ShowWeekends">주말 표시</label>
                  <div class="input-group">
                    <input class="showHideWeekend" type="checkbox" checked>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- 캘린더 -->
          <div id="wrapper">
            <div id="loading"></div>
            <div class="print-visible" id="calendar"></div>
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

                        <!-- <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="text"></label>
                            </div>
                        </div> -->
                        <div class="row" id="allDayCheck">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox" value="1"></label>
                            </div>
                        </div>
                        <div class="row">
                          <div class="col-xs-12">
                              <input class="inputModal" type="hidden" name="edit-id" id="edit-id"
                                  required="required" />
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
                                <label class="col-xs-4" for="edit-title">장소</label>
                                <input class="inputModal" type="text" name="edit-place" id="edit-place"
                                    />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-start">시작시간</label>
                                <input class="inputModal" type="text" name="edit-start" id="edit-start" disabled/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <label class="col-xs-4" for="edit-end">종료시간</label>
                                <input class="inputModal" type="text" name="edit-end" id="edit-end" disabled/>
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
                            <div class="col-xs-12" style="display: flex;">
                                <label class="col-xs-4" for="edit-desc">내용</label>
                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
                                    id="edit-desc" style="height: 100px;"></textarea>
                            </div>
                        </div>
                    </div>
                    <!-- 일정 등록 버튼 -->
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                        <button type="submit" class="btn btn-primary" id="save-event" onclick="saveEventToServer()">저장</button>
                    </div>
                    <!-- 일정 추가 버튼 -->
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent" onclick="deleteEventToServer()">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent" onclick="updateEventToServer()">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        



    </div>

    <script>
      var draggedEventIsAllDay;
      var activeInactiveWeekends = true;

      var newEvent;
      var editEvent;

      var addBtnContainer = $('.modalBtnContainer-addEvent');
      var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
      var allDayCheck = $('#allDayCheck');

      

      
    
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
              googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",
              eventSources :[ 
                  {
                      googleCalendarId : 'akak3927%40gmail.com&ctz=Asia%2FSeoul' // an option!
                  },
                  { googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com'
                    , className : 'ko_event' }
              ],
              // 해더에 표시할 툴바
              headerToolbar: {
                left: 'prev,next today,printButton',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
              locale: 'ko', // 한국어 설정
              editable: true, // 수정 가능
              selectable: true,
              businessHours: true,
              droppable: true, // 드래그 가능
              drop: function (arg) { // 드래그 엔 드롭 성공시
                if (document.getElementById('drop-remove').checked) {
                  // 드래그 박스에서 아이템을 삭제
                  arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                }
              },
              events: data, 
              customButtons: {
                  // 인쇄 버튼을 추가
                  printButton: {
                      icon: 'print',
                      click: function() {
                          window.print();
                      }
                  }
              },
              eventMouseEnter: function (info) {
                  var event = info.event;
                  var start = event.start;
                  var end = event.end;
                  var title = event.title;
                  var username = event.extendedProps.username;
                  var description = event.extendedProps.description;
                  var type = event.extendedProps.type;

                  var formatStart = moment(start).format("YYYY-MM-DD HH시 mm분");
                  var formatEnd = end ? moment(end).format("YYYY-MM-DD HH시 mm분") : "-"; // null인 경우 '-' 표시

                  var currentPopover = $('.popover');
                    if (currentPopover.length) {
                      currentPopover.popover('hide');
                    }

                  $(info.el).popover({
                    title: '<div class="popoverTitleCalendar" >' + title + '</div>',
                    content: '<div class="popoverInfoCalendar">' +
                              '<p><strong>작성자 : </strong> ' + username + '</p>' +
                              '<p><strong>카테고리 : </strong> ' + type + '</p>' +
                              '<p><strong>시작시간 : </strong> ' + formatStart + '</p>' +
                              '<p><strong>종료시간 : </strong> ' + formatEnd + '</p>' +
                              '<div class="popoverDescCalendar">' + description + '</div>' +
                              '</div>',
                    trigger: 'manual',
                    placement: 'top',
                    html: true,
                    container: 'body'
                  });
                  $(info.el).popover('show');
                },

                // 이벤트 호버 벗어날 때 동작 - 팝오버 숨기기
                eventMouseLeave: function (info) {
                  $(info.el).popover('hide');
                },

                select: function (info,jsEvent, view) {
                  
                  // alert('selected ' + info.startStr + ' to ' + info.endStr + info.view.type);

                  var today = moment();
                  var startDate = moment(info.start).format("YYYY-MM-DD HH:mm");
                  var endDate = moment(info.end).format("YYYY-MM-DD HH:mm");

                  addBtnContainer.show();
                  modifyBtnContainer.hide();

                  // 모달 열릴 때마다 입력 필드 초기화
                  $('#eventModal input, #eventModal textarea').val('');

                  // 타입이 'dayGridMonth'인 경우 하루종일(allDay) 부분 체크
                  if (info.view.type === "dayGridMonth") {
                      $('#edit-allDay').prop('checked', true);
                  } else {
                      $('#edit-allDay').prop('checked', false);
                  }

                  
                  

                  // 시작 시간과 종료 시간 입력 필드에 값 설정
                  $('#edit-start').val(startDate);
                  $('#edit-end').val(endDate);

                  $('#eventModal').modal('show');

                  

                },
                eventClick: function(info,jsEvent,view){

                  var event = info.event;
                  var allDay = event.allDay;
                  var _id = event.id;
                  var place = event.place;
                  var start = event.start;
                  var end = event.end;
                  var title = event.title;
                  var username = event.extendedProps.username;
                  var description = event.extendedProps.description;
                  var type = event.extendedProps.type;

                  var formatStart = moment(start).format("YYYY/MM/DD HH:mm");
                  var formatEnd = end ? moment(end).format("YYYY/MM/DD HH:mm") : "-";
                  var formatPlace = place ? place : "-";

                  addBtnContainer.hide();
                  modifyBtnContainer.show();

                  // 일정 작성자가 내가 아닐 때
                  // if (username == 1) {
                  //   $('#eventModal').modal('show');
                  // }else{

                  //   var message = "\n구분 : " + type + "\n장소 : " + formatPlace + "\n시작시간 : " + formatStart + "\n종료시간 : " + formatEnd + "\n내용 : \n" + description;

                  //   swal(title,message,'info');

                  // }

                  allDayCheck
                  if (info.view.type === "dayGridMonth") {
                      allDayCheck.show();
                  } else {
                      allDayCheck.hide();
                  }

                  if (allDay === true) {
                    $('#edit-allDay').prop('checked', true);
                  } else {
                    $('#edit-allDay').prop('checked', false);
                  }

                  // $('#edit-allDay').val(allDay)
                  $('#edit-id').val(_id);
                  $('#edit-title').val(title);
                  $('#edit-place').val(place);
                  $('#edit-start').val(formatStart);
                  $('#edit-end').val(formatEnd);
                  $('#edit-desc').val(description);
                  $("#edit-type option").filter(function() {
                    return $(this).text() === type;
                  }).prop('selected', true);
                  
                  $('#eventModal').modal('show');
                },
                });

        
                // 캘린더 랜더링
                calendar.render();
              });

              

        });

        
      });

    </script>

    <!-- 일정 추가 -->
    <script>
      function saveEventToServer() {
      // 모달의 입력 값을 가져옵니다.
      var allDay = $('#edit-allDay').prop('checked') ? 1 : 0;
      var title = $('#edit-title').val();
      var place = $('#edit-place').val();
      var startTime = $('#edit-start').val();
      var endTime = $('#edit-end').val();
      var typeNo = $('#edit-type').val();
      var content = $('#edit-desc').val();

      

      // AJAX 호출을 위한 데이터 객체 생성
      var eventData = {
        allDay: allDay,
        title: title,
        place: place,
        startTime: startTime,
        endTime: endTime,
        typeNo: typeNo,
        content: content
      };

      // AJAX 호출 설정
      $.ajax({
          type: 'POST',
          url: '${root}/calendar/main',
          data: eventData,
          success: function (response) {
            console.log('일정이 성공적으로 서버에 저장');
            location.reload();
          },
          error: function (error) {
            console.error('일정 저장 중 에러가 발생', error);
          }
        });
      }
  </script>

  <!-- 일정 수정 -->
  <script>
    function updateEventToServer() {
      var allDay = $('#edit-allDay').prop('checked') ? 1 : 0;
      var id = $('#edit-id').val();
      var title = $('#edit-title').val();
      var place = $('#edit-place').val();
      var startTime = $('#edit-start').val();
      var endTime = $('#edit-end').val();
      var typeNo = $('#edit-type').val();
      var content = $('#edit-desc').val();

      // var startTime = moment(start).format("YYYY/MM/DD HH:mm");
      // var endTime = moment(end).format("YYYY/MM/DD HH:mm");

      var eventData = {
        no : id,
        allDay: allDay,
        title: title,
        place: place,
        startTime: startTime,
        endTime: endTime,
        typeNo: typeNo,
        content: content
      };

      $.ajax({
        type: 'POST',
        url: '${root}/calendar/update',
        data: eventData,
        success: function(response) {
          console.log('일정이 성공적으로 서버에 업데이트');
          location.reload();
        },
        error: function(error) {
          console.error('일정 업데이트 중 에러가 발생', error);
        }
      });
    }
  </script>

  <!-- 일정 삭제 -->
  <script>
    function deleteEventToServer() {
      var id = $('#edit-id').val();

      $.ajax({
        type: 'POST',
        url: '${root}/calendar/delete',
        data: {no : id},
        success: function(response) {
          console.log('일정이 성공적으로 서버에 삭제');
          location.reload();
        },
        error: function(error) {
          console.error('일정 삭제 중 에러가 발생', error);
        }
      });
    }
  </script>


    
  
 
	



</body>
</html>
