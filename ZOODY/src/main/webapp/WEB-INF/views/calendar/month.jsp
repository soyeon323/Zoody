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
              <h3 class="panel-title">카테고리 검색 설정</h3>
            </div>
            <div class="panel-body">
              <div class="col-lg-4">
                <div class="filter">
                  <div class="event_filter_wrapper">
                    <input id="개인" class="event_filter" name="event_filter_sel" type="checkbox" value="개인" data-type="state"/>
                    <label for="개인">
                      개인
                      <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17" fill="none">
                        <g clip-path="url(#clip0_1656_8789)">
                          <path d="M16.8448 8.62247C16.7016 9.03266 16.4677 9.40527 16.1606 9.71259L9.71475 16.1584C9.40711 16.4625 9.03433 16.6926 8.62463 16.8313C8.51123 16.1642 8.49121 15.4845 8.56513 14.8119C8.74995 13.2176 9.46812 11.7325 10.6031 10.5976C11.7381 9.46278 13.2232 8.74478 14.8176 8.56014C15.4929 8.48602 16.1753 8.507 16.8448 8.62247V8.62247ZM7.15342 14.6624C7.37449 12.7474 8.23661 10.9635 9.59971 9.60038C10.9628 8.23729 12.7468 7.37517 14.6618 7.1541C15.4231 7.07243 16.1918 7.091 16.9483 7.20935C16.7057 5.65465 16.0376 4.19742 15.0178 2.99906C13.9981 1.80071 12.6666 0.907993 11.1707 0.419796C9.67487 -0.0683998 8.07308 -0.133025 6.54276 0.233079C5.01243 0.599183 3.61331 1.38173 2.50035 2.49404C1.38739 3.60635 0.604037 5.00502 0.237042 6.53512C-0.129952 8.06523 -0.0662593 9.66706 0.421066 11.1632C0.908392 12.6593 1.80033 13.9914 2.99809 15.0118C4.19586 16.0323 5.65269 16.7012 7.20725 16.9447C7.08933 16.1896 7.07124 15.4222 7.15342 14.6624V14.6624Z" fill="#FFA500"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_1656_8789">
                            <rect width="17" height="17" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                    </label>
                  </div>
                  <div class="event_filter_wrapper">
                    <input id="부서" class="event_filter" name="event_filter_sel" type="checkbox" value="부서" data-type="state"/>
                    <label for="부서">
                      부서
                      <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17" fill="none">
                        <g clip-path="url(#clip0_1656_8789)">
                          <path d="M16.8448 8.62247C16.7016 9.03266 16.4677 9.40527 16.1606 9.71259L9.71475 16.1584C9.40711 16.4625 9.03433 16.6926 8.62463 16.8313C8.51123 16.1642 8.49121 15.4845 8.56513 14.8119C8.74995 13.2176 9.46812 11.7325 10.6031 10.5976C11.7381 9.46278 13.2232 8.74478 14.8176 8.56014C15.4929 8.48602 16.1753 8.507 16.8448 8.62247V8.62247ZM7.15342 14.6624C7.37449 12.7474 8.23661 10.9635 9.59971 9.60038C10.9628 8.23729 12.7468 7.37517 14.6618 7.1541C15.4231 7.07243 16.1918 7.091 16.9483 7.20935C16.7057 5.65465 16.0376 4.19742 15.0178 2.99906C13.9981 1.80071 12.6666 0.907993 11.1707 0.419796C9.67487 -0.0683998 8.07308 -0.133025 6.54276 0.233079C5.01243 0.599183 3.61331 1.38173 2.50035 2.49404C1.38739 3.60635 0.604037 5.00502 0.237042 6.53512C-0.129952 8.06523 -0.0662593 9.66706 0.421066 11.1632C0.908392 12.6593 1.80033 13.9914 2.99809 15.0118C4.19586 16.0323 5.65269 16.7012 7.20725 16.9447C7.08933 16.1896 7.07124 15.4222 7.15342 14.6624V14.6624Z" fill="#800080"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_1656_8789">
                            <rect width="17" height="17" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                    </label>
                  </div>
                  <div class="event_filter_wrapper">
                    <input id="회사" class="event_filter" name="event_filter_sel"  type="checkbox" value="회사" data-type="kind"/>
                    <label for="회사">
                      회사
                      <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17" fill="none">
                        <g clip-path="url(#clip0_1656_8789)">
                          <path d="M16.8448 8.62247C16.7016 9.03266 16.4677 9.40527 16.1606 9.71259L9.71475 16.1584C9.40711 16.4625 9.03433 16.6926 8.62463 16.8313C8.51123 16.1642 8.49121 15.4845 8.56513 14.8119C8.74995 13.2176 9.46812 11.7325 10.6031 10.5976C11.7381 9.46278 13.2232 8.74478 14.8176 8.56014C15.4929 8.48602 16.1753 8.507 16.8448 8.62247V8.62247ZM7.15342 14.6624C7.37449 12.7474 8.23661 10.9635 9.59971 9.60038C10.9628 8.23729 12.7468 7.37517 14.6618 7.1541C15.4231 7.07243 16.1918 7.091 16.9483 7.20935C16.7057 5.65465 16.0376 4.19742 15.0178 2.99906C13.9981 1.80071 12.6666 0.907993 11.1707 0.419796C9.67487 -0.0683998 8.07308 -0.133025 6.54276 0.233079C5.01243 0.599183 3.61331 1.38173 2.50035 2.49404C1.38739 3.60635 0.604037 5.00502 0.237042 6.53512C-0.129952 8.06523 -0.0662593 9.66706 0.421066 11.1632C0.908392 12.6593 1.80033 13.9914 2.99809 15.0118C4.19586 16.0323 5.65269 16.7012 7.20725 16.9447C7.08933 16.1896 7.07124 15.4222 7.15342 14.6624V14.6624Z" fill="#0000FF"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_1656_8789">
                            <rect width="17" height="17" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                    </label>
                  </div>
                  <div class="event_filter_wrapper">
                    <input id="회의" class="event_filter" name="event_filter_sel" type="checkbox" value="회의" data-type="kind"/>
                    <label for="회의">
                      회의
                      <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17" fill="none">
                        <g clip-path="url(#clip0_1656_8789)">
                          <path d="M16.8448 8.62247C16.7016 9.03266 16.4677 9.40527 16.1606 9.71259L9.71475 16.1584C9.40711 16.4625 9.03433 16.6926 8.62463 16.8313C8.51123 16.1642 8.49121 15.4845 8.56513 14.8119C8.74995 13.2176 9.46812 11.7325 10.6031 10.5976C11.7381 9.46278 13.2232 8.74478 14.8176 8.56014C15.4929 8.48602 16.1753 8.507 16.8448 8.62247V8.62247ZM7.15342 14.6624C7.37449 12.7474 8.23661 10.9635 9.59971 9.60038C10.9628 8.23729 12.7468 7.37517 14.6618 7.1541C15.4231 7.07243 16.1918 7.091 16.9483 7.20935C16.7057 5.65465 16.0376 4.19742 15.0178 2.99906C13.9981 1.80071 12.6666 0.907993 11.1707 0.419796C9.67487 -0.0683998 8.07308 -0.133025 6.54276 0.233079C5.01243 0.599183 3.61331 1.38173 2.50035 2.49404C1.38739 3.60635 0.604037 5.00502 0.237042 6.53512C-0.129952 8.06523 -0.0662593 9.66706 0.421066 11.1632C0.908392 12.6593 1.80033 13.9914 2.99809 15.0118C4.19586 16.0323 5.65269 16.7012 7.20725 16.9447C7.08933 16.1896 7.07124 15.4222 7.15342 14.6624V14.6624Z" fill="#008000"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_1656_8789">
                            <rect width="17" height="17" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                    </label>
                  </div>
                </div>
              </div>
              
            </div>
          </div>
          
          <!-- 캘린더 -->
          <div id="wrapper" style="
          background-color: white;
          border-radius: 5px;
          padding-bottom: 30px;
          margin-bottom: 23px;
          margin-top: 10px;
          padding-left: 81px;
      ">
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

      var loginMember = '${loginMember.name}';

      let typeFilter = document.querySelector('#type_filter');
      
    
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

                // eventDidMount: function(info) {
                //     let selectedType = typeFilter.value;
                //     let eventType = info.event.extendedProps.type;

                //     if (selectedType !== "all" && selectedType !== eventType) {
                //         info.el.style.display = "none";
                //     }
                // },

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



                  //일정 작성자가 내가 아닐 때
                  if (username === loginMember) {
                    $('#eventModal').modal('show');
                  }else{

                    var message = "\n구분 : " + type + "\n장소 : " + formatPlace + "\n시작시간 : " + formatStart + "\n종료시간 : " + formatEnd + "\n내용 : \n" + description;

                    swal(title,message,'info');

                  }

                  /* allDayCheck
                  if (info.view.type === "dayGridMonth") {
                      allDayCheck.show();
                  } else {
                      allDayCheck.hide();
                  } */

                  
                  
                  // $('#eventModal').modal('show');
                },
                eventClassNames : function(info) {

                  var result = true;
                  var types = [];

                  $("input[name='event_filter_sel']:checked").each(function(){
                    types.push($(this).val());
                  });

                  if(types.length){
                    result = result && types.indexOf(info.event.extendedProps.type) >= 0;
                  }

                  if(!result){
                    result = "hidden";
                  }

                  return result;

                }
                });

                // 캘린더 랜더링
                calendar.render();

                $('input[class=event_filter]').change(function(){
                  calendar.render();
                });

                // typeFilter.addEventListener("change", function() {
                //     let selectedType = typeFilter.value;

                //     // 모든 이벤트를 표시한 후 선택된 타입 이외의 이벤트를 숨김
                //     calendar.getEvents().forEach(function(event) {
                //         let eventType = event.extendedProps.type;
                //         if (selectedType === "all" || selectedType === eventType) {
                //             event.el.style.display = "";
                //         } else {
                //             event.el.style.display = "none";
                //         }
                //     });
                // });

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
      
      var eventData = {
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

  <!-- 일정 타입 별 검색 -->
  <script>


  </script>


    
  
 
	



</body>
</html>
