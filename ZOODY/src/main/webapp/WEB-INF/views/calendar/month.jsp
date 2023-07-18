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
<link rel="stylesheet" href="${root}/resources/css/calendar/month.css">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<!-- //fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- //fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<title>Document</title>
<style>

  
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
            <div id='external-events'>
                <h4>일정 추가</h4>
                <div id='external-events-list'></div>
            </div>
            <!-- calendar 태그 -->
            <div id='calendar-wrap'>
              <div id='calendar1'></div>
            </div>
            <!-- modal 추가 -->
            <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                  <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                          </button>
                      </div>
                      <div class="modal-body">
                          <div class="form-group">
                              <label for="taskId" class="col-form-label">일정 내용</label>
                              <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                              <label for="taskId" class="col-form-label">시작 날짜</label>
                              <input type="date" class="form-control" id="calendar_start_date" name="calendar_start_date">
                              <label for="taskId" class="col-form-label">종료 날짜</label>
                              <input type="date" class="form-control" id="calendar_end_date" name="calendar_end_date">
                          </div>
                      </div>
                      <div class="modal-footer">
                          <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal"
                              id="sprintSettingModalClose">취소</button>
                      </div>
                  </div>
            </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
      document.addEventListener('DOMContentLoaded', function () {
          var calendarEl = document.getElementById('calendar1');
          var calendar = new FullCalendar.Calendar(calendarEl, {
              timeZone: 'UTC',
              initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
              events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                  {
                      title:'일정',
                      start:'2023-07-18 00:00:00',
                      end:'2023-07-18 24:00:00' 
                      // color 값을 추가해 색상도 변경 가능 자세한 내용은 하단의 사이트 참조
                  }
              ], headerToolbar: {
                  center: 'addEventButton' // headerToolbar에 버튼을 추가
              }, customButtons: {
                  addEventButton: { // 추가한 버튼 설정
                      text : "일정 추가",  // 버튼 내용
                      click : function(){ // 버튼 클릭 시 이벤트 추가
                          $("#calendarModal").modal("show"); // modal 나타내기

                          $("#addCalendar").on("click",function(){  // modal의 추가 버튼 클릭 시
                              var content = $("#calendar_content").val();
                              var start_date = $("#calendar_start_date").val();
                              var end_date = $("#calendar_end_date").val();
                              
                              //내용 입력 여부 확인
                              if(content == null || content == ""){
                                  alert("내용을 입력하세요.");
                              }else if(start_date == "" || end_date ==""){
                                  alert("날짜를 입력하세요.");
                              }else if(new Date(end_date)- new Date(start_date) < 0){ // date 타입으로 변경 후 확인
                                  alert("종료일이 시작일보다 먼저입니다.");
                              }else{ // 정상적인 입력 시
                                  var obj = {
                                      "title" : content,
                                      "start" : start_date,
                                      "end" : end_date
                                  }//전송할 객체 생성

                                  console.log(obj); //서버로 해당 객체를 전달해서 DB 연동 가능
                              }
                          });
                      }
                  }
              },
              editable: true, // false로 변경 시 draggable 작동 x 
              displayEventTime: false // 시간 표시 x
          });
          calendar.render();
      });
</script>
<script>
    (function(){
    $(function(){
      // 드래그 박스 취득
      var containerEl = $('#external-events-list')[0];
      // 설정하기
      new FullCalendar.Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function(eventEl) {
          return {
            title: eventEl.innerText.trim()
          }
        }
      });
      // 드래그 아이템 추가하기
      for(var i=1; i<=5;i++) {
        var $div = $("<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'></div>");
        $event = $("<div class='fc-event-main'></div>").text("Event "+i);
        $('#external-events-list').append($div.append($event));
      }
      // calendar element 취득
      var calendarEl = $('#calendar1')[0];
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
        droppable: true,  // 드래그 가능
        drop: function(arg) { // 드래그 엔 드롭 성공시
          // 드래그 박스에서 아이템을 삭제한다.
          arg.draggedEl.parentNode.removeChild(arg.draggedEl);
        }
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
</script>

</body>
</html>