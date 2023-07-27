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
            <form action="${root}/work/insert" method="POST">

                <input type="text" name="workName" placeholder="업무 명">
                <!-- <input type="text" name="" placeholder="직원 명"> -->
                <div id="btn-area">
                    <button class="btn btn-primary" type="button" style="width: 30px;" id="plusBtn">+</button>
                    <button class="btn btn-primary" type="button" style="width: 30px;" id="minusBtn">-</button>
                </div>
                
                <fieldset>
                 <legend>업무 내용</legend>
                <!-- 
                 여기에 들어가야함 
                 여기에 추가된 인풋테그들과 체크박스들이    
                 -->
                 </fieldset>
             
            
             </div>
             <a class="modal_close_btn">닫기</a>
             <div id="date">
                 마감날짜
                     <input type="date" name="date"/>
             </div>
             <div id="btn-area" style="margin-left: 400px;"> 
                 <input class="btn btn-primary" id="addBtn" style="font-size: 1.3em;" type="submit" value="추가">
             </div>

            </form>
              
        </div>


        <!-- 모달 창 2 -->
        <div id="my_modal2">
            <h1>업무 할당</h1>
            <br>
            <div id="modal-area">
                <input type="text" placeholder="업무 명">
                <!-- <input type="text" placeholder="직원 명"> -->
                <fieldset id="fieldset">
                 <legend>업무 내용</legend>
                    <!-- 여기에 보여야함 -->
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

        // 닫기 버튼 처리
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
    let divTagCnt = 1; 


        $.ajax({
        url : '${root}/work/work',
        method : 'POST',
        data : {},
        dataType : 'json',
        success :(wv)=>{
            if(wv ==='wv'){

            }
        },
        error  :(e)=>{
            console.log(e);
        }
    });

    addBtn.addEventListener('click', function() {
        let column = document.querySelector('.column1');
        let newDivTag = document.createElement('div');
        alert('추가 완료');
            newDivTag.setAttribute('class', 'list-group-item');
            newDivTag.innerHTML = "추가된 업무들<br>마감일시" + divTagCnt;  //여기에 내가 추가했던 업무 제목이랑 마감일시 박혀야함
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


 // 드래그 앤 드롭
 const columns = document.querySelectorAll(".column1,.column2,.column3");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });


//  input +
   document.getElementById('plusBtn').addEventListener('click', function() {
        var fieldset = document.querySelector('fieldset');

        var inputText = document.createElement('input');
        inputText.setAttribute('type', 'text');
        inputText.setAttribute('name', 'workContent');

        var inputCheckbox = document.createElement('input');
        inputCheckbox.setAttribute('type', 'checkbox');
        inputCheckbox.setAttribute('name', 'chaekListName');
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