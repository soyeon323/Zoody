<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="${root}/resources/css/work/work.css"> -->
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>

<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 드래그 앤 드롭 API-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<style>

/* 드래그 앤 드롭 */
    .container {
    font-family: "Trebuchet MS", sans-serif;
    display: flex;
    gap: 100px;
    justify-content: space-evenly;
    }

    .column {
    flex-basis: 20%;
    background: #ffffff;
    min-height: 50vh;
    padding: 5px;
    border-radius: 6px;
    }

    .column h1 {
    text-align: center;
    font-size: 22px;
    margin-top: 20px;
    }

    .list-group-item {
    background: #fff;
    margin: 20px;
    padding: 20px;
    border-radius: 5px;
    cursor: pointer;
    }

    .list-group-item:hover {
        border: 1px solid black;
    }

    #enroll{
    margin-top: 40px;
    margin-left: 80px;
    font-size: 20px;
    font-weight: 600;
    }

    #wrap{
        width: 1663px;
        height: 93vh;
        position: absolute;
        top: 65px;
        left: 255px;
    }

    .btn{
        font-size: 0.3em;
        padding: 0;
        block-size: 30px;
        background-color: rgb(45, 99, 216);
        margin: auto;
    }

    #popup_open_btn{
        margin-left: 480px;
        margin-bottom: 10px;
    }


    
    /* 모달 */

    #my_modal {
        display: none;
        width: 600px;
        padding: 20px 60px;
        height: 800px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
    }

    #my_modal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
    
    #modal-area{
        display: grid;
        grid-row-gap: 20px;
    }

    #textarea{
        resize: none;
        height: 300px;
    }

</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">
        <div id="enroll">업무 할당</div>
        <button class="btn btn-primary" id="popup_open_btn">업무 추가</button>

        <div class="container">
           
            <div class="column">
               <h1>To-Do</h1>
               <div class="list-group-item" draggable="true">Wash Clothes</div>
               <div class="list-group-item" draggable="true">Take a stroll outside</div>
               <div class="list-group-item" draggable="true">Design Thumbnail</div>
               <div class="list-group-item" draggable="true">Attend Meeting</div>
               <div class="list-group-item" draggable="true">Fix workshop</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>        
            </div>

            <div class="column">
               <h1>Doing</h1>
            </div>

            <div class="column">
               <h1>Done</h1>
            </div>
         </div>


         <!-- 모달창 -->
         <div id="my_modal">
           <h1>업무 할당</h1>
           <br>
           <div id="modal-area">
               <input type="text" name="" placeholder="업무 명">
               <input type="text" name="" placeholder="직원 명">
               <button style="width: 30px;">+</button>
            </div>
           
            <a class="modal_close_btn">닫기</a>
        </div>

    </div>
</body>
</html>

<script>

    // 드래그 앤 드롭
    const columns = document.querySelectorAll(".column");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });

    // 모달
    function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

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

</script>