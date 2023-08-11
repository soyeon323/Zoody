<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/project/detail.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway:400,300,600,800,900" rel="stylesheet" type="text/css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        locale: 'ko',
        themeSystem: 'bootstrap5',
        headerToolbar: {
        left: 'prev,next',
        center: 'title',
        right: 'today'
        },
      });
      
      calendar.render();

    });
</script>
</head>
<body style="overflow-x: hidden">
<h1>${noList}</h1>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/project/side.jsp" %>

    <div id="wrap">
        <div id="projectName">
            <a>${prjVoList[0].title}</a>
        </div>

        <div id="back">
            <div>
                <div id="todo">
                    <div>
                        <a>Todo+</a>
                    </div>
                    <div>
                        <div id="todoList">
                            <c:forEach items="${todoList}" var="todoList">
                                <div>
                                    <input type="checkbox" name="todoList" data-todo-id="${todo.no}" ${todo.no.checked ? 'checked' : ''}>
                                    <a>${todoList.content}</a>
                                    <button onclick="deleteTodo('${todoList.no}');">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                                            <g clip-path="url(#clip0_458_8737)">
                                              <path d="M18.3346 3.33333H14.168V1.66667C14.168 1.22464 13.9924 0.800716 13.6798 0.488155C13.3673 0.175595 12.9433 0 12.5013 0L7.5013 0C7.05927 0 6.63535 0.175595 6.32279 0.488155C6.01023 0.800716 5.83464 1.22464 5.83464 1.66667V3.33333H1.66797V5H3.33464V17.5C3.33464 18.163 3.59803 18.7989 4.06687 19.2678C4.53571 19.7366 5.17159 20 5.83464 20H14.168C14.831 20 15.4669 19.7366 15.9357 19.2678C16.4046 18.7989 16.668 18.163 16.668 17.5V5H18.3346V3.33333ZM7.5013 1.66667H12.5013V3.33333H7.5013V1.66667ZM15.0013 17.5C15.0013 17.721 14.9135 17.933 14.7572 18.0893C14.6009 18.2455 14.389 18.3333 14.168 18.3333H5.83464C5.61362 18.3333 5.40166 18.2455 5.24538 18.0893C5.0891 17.933 5.0013 17.721 5.0013 17.5V5H15.0013V17.5Z" fill="#888A8C"/>
                                              <path d="M9.16666 8.33203H7.5V14.9987H9.16666V8.33203Z" fill="#888A8C"/>
                                              <path d="M12.5026 8.33203H10.8359V14.9987H12.5026V8.33203Z" fill="#888A8C"/>
                                            </g>
                                            <defs>
                                              <clipPath id="clip0_458_8737">
                                                <rect width="20" height="20" fill="white"/>
                                              </clipPath>
                                            </defs>
                                        </svg>
                                    </button>
                                </div>
                            </c:forEach>
                        </div>  
                        <div id="prjProgress">
                            <div>프로젝트 진행도</div>
                            <c:if test="${empty todoList}">
                 
                            </c:if>
                            <c:if test="${!empty todoList}">
                                <%@ include file="/WEB-INF/views/project/chart.jsp" %>
                            </c:if>
                        </div>
                    </div>
                </div>
                <div id='calendar'></div>
            </div>
            <div>
                <form action="${root}/project/detail" method="POST" onsubmit="return showConfirm();">
                    <input type="hidden" value="${prjVoList[0].no}" name="projectNo">
                    <input type="text" name="content" placeholder="내용을 입력하세요. ToDo를 추가할 수 있습니다.">
                    <input type="submit" value='+'>
                </form>
            </div>
            <div class="community">
                <div class="noticeArea">
                    <div>
                        <a>공지사항</a>
                        <button type="button" onclick="goNotice('${loginMember.id}');">
                            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="12" viewBox="0 0 7 12" fill="none">
                                <path d="M0.706 11.9993L0 11.2933L4.9405 6.35281C5.03424 6.25905 5.08689 6.13189 5.08689 5.99931C5.08689 5.86673 5.03424 5.73958 4.9405 5.64581L0.0085001 0.714813L0.7155 0.0078125L5.6465 4.93881C5.92771 5.2201 6.08568 5.60157 6.08568 5.99931C6.08568 6.39706 5.92771 6.77852 5.6465 7.05981L0.706 11.9993Z" fill="white"/>
                            </svg>
                        </button>
                    </div>
                    <table class="table">
                        <tbody>
                        <c:forEach items="${noticeList}" var="vo">
                            <tr>
                              <td width="110" scope="row">${vo.no}</td>
                              <td width="300">${vo.title}</td>
                              <td width="80">관리자</td>
                              <td width="150">${vo.enrollDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="suggestionArea">
                    <div>
                        <a>건의사항</a>
                        <button type="button" onclick="goSuggestion('${loginMember.id}');">
                            <svg xmlns="http://www.w3.org/2000/svg" width="7" height="12" viewBox="0 0 7 12" fill="none">
                                <path d="M0.706 11.9993L0 11.2933L4.9405 6.35281C5.03424 6.25905 5.08689 6.13189 5.08689 5.99931C5.08689 5.86673 5.03424 5.73958 4.9405 5.64581L0.0085001 0.714813L0.7155 0.0078125L5.6465 4.93881C5.92771 5.2201 6.08568 5.60157 6.08568 5.99931C6.08568 6.39706 5.92771 6.77852 5.6465 7.05981L0.706 11.9993Z" fill="white"/>
                            </svg>
                        </button>
                    </div>
                    <table class="table">
                        <tbody>
                        <c:forEach items="${suggestionList}" var="vo">
                            <tr>
                              <td width="110" scope="row">${vo.no}</td>
                              <td width="300">${vo.title}</td>
                              <td width="80">${vo.name}</td>
                              <td width="150">${vo.enrollDate}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
    
        <!-- 채팅창 모달 -->
        <div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
            <div class="modal-content" style="height: 600px; width: 550px;">
                <div class="modal-header">
                    <div>
                        <a>현재접속자</a>
                        <svg xmlns="http://www.w3.org/2000/svg" width="9" height="9" viewBox="0 0 9 9" fill="none">
                            <circle cx="4.5" cy="4.5" r="4.5" fill="#00CBA4"/>
                        </svg>
                    </div>
                    <div class="connectUser">

                    </div>
                    <div>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <div class="modal-body">
                
                </div>
                <div class="modal-footer">
                <div>
                    <button onclick="contentReset();">
                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none">
                            <path d="M12 0.707L11.293 0L6 5.293L0.707 0L0 0.707L5.293 6L0 11.293L0.707 12L6 6.707L11.293 12L12 11.293L6.707 6L12 0.707Z" fill="#848484"/>
                        </svg>
                    </button>
                </div>
                <div>
                    <input id="contentArea" name="content" placeholder="메세지를 입력하세요." onkeydown="handleKeyPress(event)"></input>
                </div>
                <div>
                    <button onclick="sendMsg();">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                            <g clip-path="url(#clip0_468_9102)">
                            <path d="M5.26543 13.0251L7.90237 15.3989L8.07816 18.71C8.08705 18.8886 8.13115 19.0637 8.20792 19.2252C8.2847 19.3866 8.39263 19.5313 8.52552 19.651C8.61308 19.7295 8.71018 19.7967 8.81454 19.851C9.02447 19.9618 9.25989 20.0154 9.49709 20.0062C9.73429 19.9971 9.96489 19.9256 10.1657 19.799L22.6564 12.1084L5.26543 13.0251Z" fill="#7D7D7D"/>
                            <path d="M5.18013 11.6928L22.5853 10.7773L9.35889 4.45106C9.14515 4.34626 8.90772 4.29917 8.67015 4.31446C8.43259 4.32974 8.20315 4.40688 8.0046 4.53821C7.80605 4.66954 7.64528 4.8505 7.53826 5.06314C7.43123 5.27578 7.38166 5.51271 7.39447 5.75042L7.56863 9.03952L5.18013 11.6928Z" fill="#7D7D7D"/>
                            </g>
                            <defs>
                            <clipPath id="clip0_468_9102">
                                <rect width="16" height="16" fill="white" transform="translate(11.4062 0.703125) rotate(41.9936)"/>
                            </clipPath>
                            </defs>
                        </svg>
                    </button>
                </div>
                </div>
            </div>
            </div>
        </div>
        
    </div>

</body>
</html>
<script>

    //현재 플젝 번호
    const currentChatRoomNo = '${prjVoList[0].no}';
    alert(currentChatRoomNo);


    //엔터로 메세지 전송하기
    function handleKeyPress(event) {
        if (event.keyCode === 13 || event.which === 13) {
            sendMsg();
        }
    }

    //웹소켓 만들기
    let ws = new WebSocket("ws://127.0.0.1:8888/zoody/project");

    //웹소켓이 연결됐을 때 동작할 함수
    ws.onopen = funcOpen;

    //닫았을 때 동작
    ws.onclose = funcClose;

    //에러발생했을때
    ws.onerror = funcError;

    //메세지 받았을 때
    ws.onmessage = funcMessage;

    function funcOpen(){
        console.log("소켓연결됨");
    }

    function funcClose(){
        console.log("소켓닫힘");
    }

    function funcError(){
        console.log("소켓에러남");
    }

    //서버에서 받아온 채팅내용 화면에 보여주기
    let addedUsers = [];
    function funcMessage(event) {
        console.log(event);
        const obj = JSON.parse(event.data);

        if( currentChatRoomNo != obj.projectNo ){
            return;
        }

        const modalBody = document.querySelector(".modal-body");
        const connectUser = document.querySelector(".connectUser");

        if (!addedUsers.includes(obj.nick)) { 
            connectUser.innerHTML += '<a style="color:#656565;">' + obj.nick + '&nbsp&nbsp</a>';
            addedUsers.push(obj.nick); 
        }

        if (obj.nick === '${loginMember.name}') {
            // 내 쪽
            modalBody.innerHTML += '<div id="fromMsg">'
                                    + '<a id="time02">' + obj.time +'</a>'
                                    + '<div id="fromMsgText">'
                                        + obj.msg +
                                    '</div>'
                                +'</div>';
        } else if(obj.nick != '${loginMember.name}') {
            // 상대 쪽
            modalBody.innerHTML += '<div id="profile-area">'
                                    + '<img src="${root}/resources/img/employee/' + obj.profile + '" alt="프로필사진" class="chatProfile">'
                                        + '<a class="name-area">' + obj.nick + '</a>'
                                + '</div>'
                                + '<div id="toMsg">'
                                    + '<div id="toMsgText">'
                                        + obj.msg +
                                    '</div>'
                                    + '<a id="time01">' + obj.time + '</a>'
                                + '</div>';

        }
        connectUser.innerHTML += userHtml;
    }

    function scrollToBottom() {
        var modalScroll = document.querySelector(".modal .modal-content .modal-body");
        modalScroll.scrollTop = modalScroll.scrollHeight;
    }

    //메세지 서버측으로 전송
    function sendMsg(){
        data = {};
        data.msg = document.querySelector("#contentArea").value;
        data.nick = '${loginMember.name}';
        data.time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', hour12: false });
        data.profile = '${loginMember.profile}';
        data.userNo = '${loginMember.no}';
        data.projectNo = '${prjVoList[0].no}';

        ws.send(JSON.stringify(data));

        console.log(data);

        //채팅보냈으면 입력창 초기화
        document.querySelector("#contentArea").value = "";

        scrollToBottom(); // 메시지를 보내고 나서 스크롤을 맨 아래로 이동
    }

    //채팅 글작성 초기화
    function contentReset(){
        document.querySelector("#contentArea").value = "";
    }

    function goNotice(id){
        if(id == 'admin'){
            location.href = '${root}/admin/notice/list';
        }else {
            location.href = '${root}/notice/list';
        }
    }

    function goSuggestion(id){
        if(id == 'admin'){
            location.href = '${root}/admin/suggestion/list';
        }else {
            location.href = '${root}/suggestion/list';
        }
    }

    //할일등록시 confirm창
    function showConfirm(){
        if(confirm("Todo를 등록하시겠습니까?")){
            return true;
        } else {
            return false;
        }
    }

    //휴지통 버튼 누르면 삭제
    function deleteTodo(no){
        if(confirm("해당 Todo를 삭제하시겠습니까?")){
            $.ajax({
                url : '${root}/project/todo/delete',
                type : 'post',
                data : {
                    no : no
                },
                success : () => {
                    swal("삭제되었습니다.");
                    location.reload();
                },
                error : () => {
                    swal("삭제되었습니다.");
                    location.reload();
                }
            })
        } else {
            return;
        }
    }

</script>