<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/animal/list.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 드래그 앤 드롭 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>

<style>

    .container {
    font-family: "Trebuchet MS", sans-serif;
    display: flex;
    gap: 30px;
    justify-content: space-evenly;
    }

    .column {
    flex-basis: 20%;
    background: #ffffff;
    min-height: 90vh;
    padding: 5px;
    border-radius: 10px;
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



</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div class="container">
            <div class="column">
               <h1>To-Do</h1>
               <div class="list-group-item" draggable="true">Wash Clothes</div>
               <div class="list-group-item" draggable="true">Take a stroll outside</div>
               <div class="list-group-item" draggable="true">Design Thumbnail</div>
               <div class="list-group-item" draggable="true">Attend Meeting</div>
               <div class="list-group-item" draggable="true">Fix workshop</div>
               <div class="list-group-item" draggable="true">Visit the zoo</div>
            </div>
            <div class="column">
               <h1>Doing</h1>
            </div>
            <div class="column">
               <h1>Done</h1>
            </div>
         </div>

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

</script>