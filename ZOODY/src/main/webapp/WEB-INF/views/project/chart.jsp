<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.min.js" integrity="sha512-6kvhZ/39gRVLmoM/6JxbbJVTYzL/gnbDVsHACLx/31IREU4l3sI7yeO0d4gw8xU5Mpmm/17LMaDHOCf+TvuC2Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-circle-progress/1.2.2/circle-progress.js" integrity="sha512-8tHhvNIEwJiw6wQDCVob7hCrwfECKknmtZAdP8JdqZcQ6OEAf1aaErJAzTAL5tQYrcrJOhqS2P3laAuwk4+e5g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="${root}/resources/css/home/chart.css">
<style>

    .chart-body {
        width: 100%;
        height: 100%;
        display: grid;
        grid-template-columns: 1fr 1fr;
        align-items: center;
        justify-content: space-around;
        flex-direction: row;
        margin-left: 90px;
        margin-top: 30px;
    }

    .second {
        justify-self: center;
        align-self: center;
        position:relative;  
        /* width:400px;      */
        display: flex;
        justify-content: center;
    }
    .second > canvas {}
    .second > strong {
        position: absolute;
        margin-top: 60px;
        margin-left: 8px;
        width: 97.05;
        height: 40;
        /* margin: -50px 0 0 -55px; */
        font-size: 2rem;
        display: flex;
        justify-content: center;
        align-items: center;
        color: #8c8c8c;
    }

    .second > strong:hover {
        color: #374957;
    }

    .project-info-area {
        display: grid;
        height: 100%;
        flex-direction: column;
        grid-template-rows: 2fr 5fr;
        width: 80%;
        justify-self: center;
        align-items: stretch;
    }

    .project-info-area > span:first-child {
        align-self: end;
    }

    .project-info-area > span:nth-child(2) {
        margin-top: 10;
        margin-left: 3;
        font-size: 14;
        color: #8c8c8c;
    }
    
</style>
</head>

<div class="chart-body">
    
    <div class='second circle'>
        <strong></strong>
    </div>

</div>

<script>
    // JavaScript 코드
    $(function () {
    var perNum = 0;

    $('.second.circle').circleProgress({
        value: perNum / 100,
        startAngle: 300,
        size: 150,
        fill: {
            gradient: ["#4876ef", "#00cba4"],
            gradientAngle: Math.PI / 2
        },
        animation: {
            duration: 200,
            easing: "swing"
        },
        lineCap: "round",
        reverse: true
    }).on('circle-animation-progress', function (event, progress) {
        const numChecked = document.querySelectorAll("input[type='checkbox']:checked").length;
        const totalTodos = document.querySelectorAll("input[type='checkbox']").length;
        perNum = (numChecked / totalTodos) * 100;

        $(this).find('strong').html(Math.round(perNum) + '<i>%</i>');
        $(this).circleProgress('value', perNum / 100);

        saveCheckboxState();
    });

    function saveCheckboxState() {
        const todoList = {};
        $("input[type='checkbox']").each(function () {
            const todoId = $(this).data('todo-id');
            const isChecked = $(this).prop('checked');
            todoList[todoId] = isChecked;
        });
        localStorage.setItem('todoList', JSON.stringify(todoList));
    }

    function restoreCheckboxState() {
        const savedTodoList = localStorage.getItem('todoList');
        const todoList = JSON.parse(savedTodoList) || {};
        $("input[type='checkbox']").each(function () {
            const todoId = $(this).data('todo-id');
            const isChecked = todoList[todoId];
            $(this).prop('checked', isChecked || false);
        });
    }

    // 페이지 로드 시 체크박스 상태를 복원
    restoreCheckboxState();

    // 페이지를 떠날 때(언로드될 때) 로컬 저장소에 체크박스 상태를 저장
    $(window).on('beforeunload', function () {
        saveCheckboxState();
    });

    // 체크박스를 클릭할 때마다 로컬 저장소에 체크박스 상태를 저장
    $("input[type='checkbox']").on('click', function () {
        saveCheckboxState();
    });
});
</script>