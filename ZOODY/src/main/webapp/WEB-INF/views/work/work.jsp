<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 드래그 앤 드롭 API-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<link rel="stylesheet" href="${root}/resources/css/work/work.css">
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">
        <div id="enroll">업무 할당</div>
        <button class="btn btn-primary" id="popup_open_btn">업무 추가</button>

        <div class="container">
           
            <div class="column1">
                <h1>To-Do</h1>
              
            </div>

            <div class="column2">
               <h1>Doing</h1>
            </div>

            <div class="column3">
               <h1>Done</h1>
            </div>
         </div>

         <!-- 모달창1 -->
         <div id="my_modal">
           <h1>업무 할당</h1>
           <br>
           <div id="modal-area">
               <input type="text" name="" placeholder="업무 명">
               <input type="text" name="" placeholder="직원 명">
               <div id="btn-area">
                   <button class="btn btn-primary" style="width: 30px;" id="plusBtn">+</button>
                   <button class="btn btn-primary" style="width: 30px;" id="minusBtn">-</button>
               </div>
               
               <fieldset>
                <legend>업무 내용</legend>

               <!-- 여기에 들어가야함 -->
               
                </fieldset>
            <div id="date">
                마감날짜
                <div id='calendar-container'>
                    <div id='calendar'></div>
                  </div>
            </div>
            <div id="btn-area"> 
                <input class="btn btn-primary" id="addBtn" style="font-size: 1.3em;" type="button" value="추가">
            </div>
            </div>
           
            <a class="modal_close_btn">닫기</a>
        </div>


        <!-- 모달 창 2 -->
        <div id="my_modal2">
            <h1>업무 할당</h1>
            <br>
            <div id="modal-area">
                <input type="text" placeholder="업무 명">
                <input type="text" placeholder="직원 명">
                <fieldset id="fieldset">
                 <legend>업무 내용</legend>
                 <input type="text"> <input type="checkbox">
                 <input type="text"> <input type="checkbox">
                 <input type="text"> <input type="checkbox">
                 <input type="text"> <input type="checkbox">
                 <input type="text"> <input type="checkbox">
             </fieldset>
             
            </div>
            <div>마감 일시</div>
            
             <a class="modal_close_btn2">닫기</a>
         </div>

    </div>
</body>
</html>

<script>
  
    // 모달1
    function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    document.getElementById('popup_open_btn').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });


    //modal 2
    function handleListItemClick() {
        // Show the modal
        modal('my_modal2');
    }

    var listItems = document.querySelectorAll('.list-group-item');
    listItems.forEach(function(item) {
        item.addEventListener('click', handleListItemClick);
    });

    // 추가 버튼 누르면 colum 에 추가됨 근데   /* 백엔드 작업할때 AJAX로 처리*/
    const addBtn = document.querySelector('#addBtn');
    let divTagCnt = 1; // Initialize the divTagCnt variable
    
    addBtn.addEventListener('click', function() {
        let column = document.querySelector('.column1');
        let newDivTag = document.createElement('div');
        alert('추가 완료');
            newDivTag.setAttribute('class', 'list-group-item');
            newDivTag.innerHTML = "추가된 업무들<br>마감일시" + divTagCnt;
            column.appendChild(newDivTag);
            divTagCnt++;

        // 확인 버튼 누르고 모달창 닫히게하기
        var modal = document.getElementById('my_modal');
            modal.style.display = 'none';
        });

        var closeButton2 = document.querySelector('.modal_close_btn2');
        closeButton2.addEventListener('click', function() {
            // Hide the modal
            var modal2 = document.getElementById('my_modal2');
            modal2.style.display = 'none';
        });




    function handleDivClick() {
        var modal2 = document.getElementById('my_modal2');
        modal2.style.display = 'block';
    }

    var column = document.querySelector('.column1');
    column.addEventListener('click', function(event) {
        var clickedElement = event.target;
        if (clickedElement.classList.contains('list-group-item')) {
            handleDivClick();
        }
    });

    var column2 = document.querySelector('.column2');
    column2.addEventListener('click', function(event) {
        var clickedElement = event.target;
        if (clickedElement.classList.contains('list-group-item')) {
            handleDivClick();
        }
    });


    // callender
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth'
        });
        calendar.render();
      });

    //캘린더
    (function(){
    $(function(){
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '400px', // calendar 높이 설정
       
        // 해더에 표시할 툴바
        headerToolbar: {
        
        },
        initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        }
       
      });
      // 캘린더 랜더링
      calendar.render();
    });
  })();
  


 // 드래그 앤 드롭
 const columns = document.querySelectorAll(".column1,.column2,.column3");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });


//    input +
   document.getElementById('plusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = document.createElement('input');
        inputText.setAttribute('type', 'text');
        inputText.setAttribute('name', '');

        var inputCheckbox = document.createElement('input');
        inputCheckbox.setAttribute('type', 'checkbox');
        // inputCheckbox.setAttribute('style', '25px');
        inputCheckbox.style.width = "25px";

        fieldset.appendChild(inputText);
        fieldset.appendChild(inputCheckbox);
    });


    // input -
    document.getElementById('minusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = fieldset.querySelector('input[type="text"]');
        var inputCheckbox = fieldset.querySelector('input[type="checkbox"]');

        if (inputText) {
            fieldset.removeChild(inputText);
            fieldset.removeChild(inputCheckbox);
        }
    });


</script>