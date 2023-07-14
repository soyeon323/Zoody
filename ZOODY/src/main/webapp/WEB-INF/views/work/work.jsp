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
    }

    /* 모달 */

    #modal.modal-overlay {
    display: none;
    }

    #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            backdrop-filter: blur(1.5px);
            -webkit-backdrop-filter: blur(1.5px);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 69, 139, 197, 0.70 );
            box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
            backdrop-filter: blur( 13.5px );
            -webkit-backdrop-filter: blur( 13.5px );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 400px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
    /*  */

</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">
        <div id="enroll">업무 할당</div>
        <button class="btn btn-primary">업무 추가</button>
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

         <!-- 모달  -->

         <!-- <div id="container">
            <h2>Lorem Ipsum</h2>
            <button id="btn-modal">모달 창 열기 버튼</button>
            <div id="lorem-ipsum"></div>
        </div>
        <div id="modal" class="modal-overlay">
            <div class="modal-window">
                <div class="title">
                    <h2>모달</h2>
                </div>
                <div class="close-area">X</div>
                <div class="content">
                    <p>가나다라마바사 아자차카타파하</p>
                    <p>가나다라마바사 아자차카타파하</p>
                    <p>가나다라마바사 아자차카타파하</p>
                    <p>가나다라마바사 아자차카타파하</p>
                    
                </div>
            </div>
        </div> -->


    </div>
</body>
</html>

<script>

    const columns = document.querySelectorAll(".column");
    columns.forEach((column) => {
    new Sortable(column, {
        group: "shared",
    });
    });



    // 모달
    const loremIpsum = document.getElementById("lorem-ipsum")
        fetch("https://baconipsum.com/api/?type=all-meat&paras=200&format=html")
            .then(response => response.text())
            .then(result => loremIpsum.innerHTML = result)


    const closeBtn = modal.querySelector(".close-area")
        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        })

</script>