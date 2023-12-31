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
<!-- CSS only -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/attendance/attendance.css">

<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
<title>Document</title>

<style>

.swal-text {
    font-size: 14px;
    letter-spacing: 0.4px;
}

.fc .fc-daygrid-day-frame {
    height: 10px;
}

:root {
    --fc-daygrid-event-dot-width: 5.5px;
}

.fc-daygrid-dot-event .fc-event-title {
    font-size: 5px;
    font-weight: 400;
}

.fc-direction-ltr .fc-daygrid-event .fc-event-time {
    display: none;
}

element.style {
    /* width: auto; */
    height: 266.593px;
}

#calendar-wrap{
    border: none;
    display: grid;
    align-items: center;
    padding: 24px;
  }

  /* 캘린더 조상 */
  .fc {
    font-size: 14px;
  }
  
  .fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {
    min-height: 0.1em;
    position: relative;
  }
  
  .fc-theme-standard td {
    border: none;
    
  }
  
  .fc .fc-daygrid-day-top {
    display: flex;
    justify-content: center;
  }
  
  /* 오늘 날짜 */
  .fc .fc-daygrid-day.fc-day-today {
    background-color: rgba(72, 119, 239, 0.171);
    border-radius: 5px;
  }
  
    td.fc-day.fc-day-fri.fc-day-today.fc-daygrid-day:hover {
      background-color: #4877efc4;
      color: #fff;
    }
  
  .fc-day-today > .fc-daygrid-day-frame.fc-scrollgrid-sync-inner >.fc-daygrid-day-top {
    box-sizing: border-box;
  }
  
  /* items */
  .fc .fc-daygrid-body-unbalanced .fc-daygrid-day-events {
    min-height: 10;
  }
  
  /* table */
  .fc .fc-scrollgrid-liquid {
      height: 100%;
      border: none;
  }
  
  
  /* table header items*/
  table td[class*=col-], table th[class*=col-] {
      border: none;
  }
  
  </style>
</head>
<body>

    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="att_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="att_main">
            <!-- 첫번째 줄 -->
            <div class="att_check" >
                <p>반갑습니다</p>
                <p>${loginMember.name}님</p>
                <button type="submit" name="check-first" id="checkInBtn"  onclick="handleCheckIn()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <g clip-path="url(#clip0_325_6756)">
                          <path d="M15.8045 10.8827C15.6795 10.7577 15.5099 10.6875 15.3331 10.6875C15.1564 10.6875 14.9868 10.7577 14.8618 10.8827L11.1105 14.6347L9.31848 12.866C9.19471 12.7392 9.02561 12.6667 8.84839 12.6645C8.67117 12.6623 8.50034 12.7306 8.37348 12.8544C8.24661 12.9781 8.17411 13.1472 8.17193 13.3244C8.16974 13.5017 8.23804 13.6725 8.36181 13.7994L10.1911 15.5994C10.3059 15.7231 10.4445 15.8223 10.5986 15.891C10.7527 15.9598 10.9191 15.9966 11.0878 15.9994H11.1098C11.2752 15.9999 11.439 15.9676 11.5918 15.9043C11.7446 15.841 11.8833 15.748 11.9998 15.6307L15.8045 11.8254C15.9295 11.7003 15.9997 11.5308 15.9997 11.354C15.9997 11.1772 15.9295 11.0077 15.8045 10.8827Z" fill="#4876EF"/>
                          <path d="M7.39333 14.6387C6.10603 14.5211 4.88069 14.0317 3.86648 13.2302C2.85228 12.4287 2.09297 11.3497 1.68098 10.1244C1.269 8.89915 1.22211 7.58054 1.54604 6.32911C1.86996 5.07769 2.55072 3.94743 3.50544 3.07593C4.46016 2.20443 5.64765 1.62929 6.92335 1.42053C8.19905 1.21177 9.50793 1.37839 10.6906 1.9001C11.8734 2.42182 12.8789 3.27613 13.5848 4.35902C14.2907 5.44192 14.6666 6.70669 14.6667 7.99936C14.6667 8.20402 14.6567 8.40669 14.6393 8.60669C14.6312 8.6941 14.6404 8.78226 14.6664 8.86611C14.6924 8.94996 14.7347 9.02784 14.7909 9.0953C14.847 9.16276 14.916 9.21845 14.9938 9.25919C15.0715 9.29993 15.1566 9.32491 15.244 9.33269C15.3314 9.34148 15.4196 9.33273 15.5036 9.30694C15.5875 9.28116 15.6655 9.23886 15.7329 9.18253C15.8003 9.12621 15.8557 9.05699 15.896 8.97894C15.9362 8.90089 15.9605 8.81558 15.9673 8.72802C15.9887 8.48602 16 8.24402 16 7.99936C15.9999 6.4481 15.5488 4.93032 14.7017 3.63082C13.8545 2.33131 12.6478 1.30614 11.2285 0.680123C9.80912 0.0541021 8.2384 -0.145764 6.70752 0.104858C5.17664 0.35548 3.75164 1.04578 2.60603 2.09171C1.46041 3.13764 0.643599 4.49408 0.255034 5.99589C-0.133531 7.4977 -0.0770852 9.08008 0.4175 10.5504C0.912085 12.0207 1.82347 13.3155 3.0407 14.2771C4.25793 15.2388 5.72849 15.8258 7.27333 15.9667H7.334C7.51081 15.9746 7.68351 15.9119 7.81409 15.7924C7.94468 15.6729 8.02247 15.5065 8.03033 15.3297C8.0382 15.1529 7.97551 14.9802 7.85605 14.8496C7.73659 14.719 7.57015 14.6412 7.39333 14.6334V14.6387Z" fill="#4876EF"/>
                          <path d="M7.33436 4.66667V7.724L5.5297 9.52866C5.46602 9.59016 5.41524 9.66372 5.3803 9.74506C5.34536 9.82639 5.32697 9.91387 5.3262 10.0024C5.32543 10.0909 5.3423 10.1787 5.37582 10.2606C5.40934 10.3426 5.45884 10.417 5.52143 10.4796C5.58403 10.5422 5.65846 10.5917 5.74039 10.6252C5.82232 10.6587 5.91011 10.6756 5.99863 10.6748C6.08715 10.6741 6.17463 10.6557 6.25596 10.6207C6.3373 10.5858 6.41086 10.535 6.47236 10.4713L8.47235 8.47133C8.59739 8.34633 8.66765 8.17679 8.66769 7.99999V4.66667C8.66769 4.48986 8.59745 4.32029 8.47243 4.19526C8.3474 4.07024 8.17783 4 8.00102 4C7.82421 4 7.65464 4.07024 7.52962 4.19526C7.4046 4.32029 7.33436 4.48986 7.33436 4.66667Z" fill="#4876EF"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_325_6756">
                            <rect width="16" height="16" fill="white"/>
                          </clipPath>
                        </defs>
                    </svg>
                    출근 등록
                </button>
                <button type="submit" name="check-second" id="checkOutBtn" onclick="handleCheckOut()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <g clip-path="url(#clip0_325_6805)">
                          <path d="M15.805 10.1957C15.68 10.0707 15.5105 10.0005 15.3337 10.0005C15.1569 10.0005 14.9874 10.0707 14.8624 10.1957L13.0004 12.0577L11.1384 10.1957C11.0126 10.0742 10.8442 10.007 10.6694 10.0086C10.4946 10.0101 10.3274 10.0802 10.2038 10.2038C10.0802 10.3274 10.0101 10.4946 10.0086 10.6694C10.0071 10.8442 10.0743 11.0126 10.1957 11.1383L12.0577 13.0003L10.1957 14.8623C10.132 14.9238 10.0813 14.9974 10.0463 15.0787C10.0114 15.1601 9.99298 15.2476 9.99221 15.3361C9.99144 15.4246 10.0083 15.5124 10.0418 15.5943C10.0754 15.6762 10.1249 15.7507 10.1874 15.8133C10.25 15.8759 10.3245 15.9254 10.4064 15.9589C10.4883 15.9924 10.5761 16.0093 10.6646 16.0085C10.7532 16.0077 10.8406 15.9893 10.922 15.9544C11.0033 15.9195 11.0769 15.8687 11.1384 15.805L13.0004 13.943L14.8624 15.805C14.9881 15.9264 15.1565 15.9936 15.3313 15.9921C15.5061 15.9906 15.6733 15.9205 15.7969 15.7969C15.9205 15.6733 15.9906 15.5061 15.9922 15.3313C15.9937 15.1565 15.9265 14.9881 15.805 14.8623L13.943 13.0003L15.805 11.1383C15.93 11.0133 16.0002 10.8438 16.0002 10.667C16.0002 10.4902 15.93 10.3207 15.805 10.1957Z" fill="#00CBA4"/>
                          <path d="M8 14.6667C6.68146 14.6667 5.39253 14.2757 4.2962 13.5431C3.19987 12.8106 2.34539 11.7694 1.84081 10.5512C1.33622 9.33305 1.2042 7.99261 1.46144 6.6994C1.71867 5.4062 2.35361 4.21831 3.28596 3.28596C4.21831 2.35361 5.4062 1.71867 6.6994 1.46144C7.99261 1.2042 9.33305 1.33622 10.5512 1.84081C11.7694 2.34539 12.8106 3.19987 13.5431 4.2962C14.2757 5.39253 14.6667 6.68146 14.6667 8C14.6667 8.17682 14.7369 8.34638 14.8619 8.47141C14.987 8.59643 15.1565 8.66667 15.3333 8.66667C15.5101 8.66667 15.6797 8.59643 15.8047 8.47141C15.9298 8.34638 16 8.17682 16 8C16 6.41775 15.5308 4.87104 14.6518 3.55544C13.7727 2.23985 12.5233 1.21447 11.0615 0.608967C9.59966 0.00346629 7.99113 -0.15496 6.43928 0.153721C4.88743 0.462403 3.46197 1.22433 2.34315 2.34315C1.22433 3.46197 0.462403 4.88743 0.153721 6.43928C-0.15496 7.99113 0.00346629 9.59966 0.608967 11.0615C1.21447 12.5233 2.23985 13.7727 3.55544 14.6518C4.87104 15.5308 6.41775 16 8 16C8.17682 16 8.34638 15.9298 8.47141 15.8047C8.59643 15.6797 8.66667 15.5101 8.66667 15.3333C8.66667 15.1565 8.59643 14.987 8.47141 14.8619C8.34638 14.7369 8.17682 14.6667 8 14.6667Z" fill="#00CBA4"/>
                          <path d="M8.00102 4C7.82421 4 7.65464 4.07024 7.52962 4.19526C7.4046 4.32029 7.33436 4.48986 7.33436 4.66667V7.724L5.5297 9.52866C5.46602 9.59016 5.41524 9.66372 5.3803 9.74506C5.34536 9.82639 5.32697 9.91387 5.3262 10.0024C5.32543 10.0909 5.3423 10.1787 5.37582 10.2606C5.40934 10.3426 5.45884 10.417 5.52143 10.4796C5.58403 10.5422 5.65846 10.5917 5.74039 10.6252C5.82232 10.6587 5.91011 10.6756 5.99863 10.6748C6.08715 10.6741 6.17463 10.6557 6.25596 10.6207C6.3373 10.5858 6.41086 10.535 6.47236 10.4713L8.47235 8.47133C8.59739 8.34633 8.66765 8.17679 8.66769 7.99999V4.66667C8.66769 4.48986 8.59745 4.32029 8.47243 4.19526C8.3474 4.07024 8.17783 4 8.00102 4Z" fill="#00CBA4"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_325_6805">
                            <rect width="16" height="16" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                      퇴근 등록
                </button>
            </div>
            <div class="count1">
                <div class="count-flex">
                    <p>나의 잔여 휴가</p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none">
                        <g clip-path="url(#clip0_364_6679)">
                          <path d="M6 0C4.81331 0 3.65328 0.351894 2.66658 1.01118C1.67989 1.67047 0.910851 2.60754 0.456726 3.7039C0.00259972 4.80026 -0.11622 6.00666 0.115291 7.17054C0.346802 8.33443 0.918247 9.40353 1.75736 10.2426C2.59648 11.0818 3.66558 11.6532 4.82946 11.8847C5.99335 12.1162 7.19975 11.9974 8.2961 11.5433C9.39246 11.0892 10.3295 10.3201 10.9888 9.33342C11.6481 8.34673 12 7.18669 12 6C11.9983 4.40923 11.3656 2.88411 10.2407 1.75926C9.1159 0.634414 7.59077 0.00172054 6 0V0ZM6 11C5.0111 11 4.0444 10.7068 3.22215 10.1573C2.39991 9.60794 1.75904 8.82705 1.38061 7.91342C1.00217 6.99979 0.90315 5.99445 1.09608 5.02455C1.289 4.05464 1.76521 3.16373 2.46447 2.46447C3.16373 1.7652 4.05465 1.289 5.02455 1.09607C5.99446 0.903148 6.99979 1.00216 7.91342 1.3806C8.82705 1.75904 9.60794 2.3999 10.1574 3.22215C10.7068 4.04439 11 5.01109 11 6C10.9985 7.32564 10.4713 8.59656 9.53393 9.53393C8.59656 10.4713 7.32564 10.9985 6 11Z" fill="white"/>
                          <path d="M6 2.50012C5.86739 2.50012 5.74022 2.5528 5.64645 2.64657C5.55268 2.74034 5.5 2.86751 5.5 3.00012V7.00012C5.5 7.13273 5.55268 7.25991 5.64645 7.35368C5.74022 7.44744 5.86739 7.50012 6 7.50012C6.13261 7.50012 6.25979 7.44744 6.35356 7.35368C6.44733 7.25991 6.50001 7.13273 6.50001 7.00012V3.00012C6.50001 2.86751 6.44733 2.74034 6.35356 2.64657C6.25979 2.5528 6.13261 2.50012 6 2.50012Z" fill="white"/>
                          <path d="M6.50001 9.00012C6.50001 8.72398 6.27615 8.50012 6 8.50012C5.72386 8.50012 5.5 8.72398 5.5 9.00012C5.5 9.27627 5.72386 9.50013 6 9.50013C6.27615 9.50013 6.50001 9.27627 6.50001 9.00012Z" fill="white"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_364_6679">
                            <rect width="12" height="12" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                </div>
                <p>${loginMember.leaveCount}</p>
                <a href="">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <path d="M8.73419 12.6666C8.60234 12.6661 8.47361 12.6264 8.36429 12.5527C8.25497 12.479 8.16996 12.3745 8.12001 12.2525C8.07006 12.1305 8.05741 11.9964 8.08367 11.8672C8.10992 11.738 8.1739 11.6195 8.26752 11.5266L11.3342 8.47329C11.3967 8.41132 11.4463 8.33758 11.4801 8.25634C11.514 8.1751 11.5314 8.08797 11.5314 7.99996C11.5314 7.91195 11.514 7.82481 11.4801 7.74357C11.4463 7.66233 11.3967 7.5886 11.3342 7.52663L8.26752 4.47329C8.20503 4.41132 8.15544 4.33758 8.12159 4.25634C8.08774 4.1751 8.07032 4.08797 8.07032 3.99996C8.07032 3.91195 8.08774 3.82481 8.12159 3.74357C8.15544 3.66233 8.20503 3.5886 8.26752 3.52663C8.39243 3.40246 8.56139 3.33276 8.73752 3.33276C8.91364 3.33276 9.08261 3.40246 9.20752 3.52663L12.2675 6.58663C12.6421 6.96163 12.8524 7.46996 12.8524 7.99996C12.8524 8.52996 12.6421 9.03829 12.2675 9.41329L9.20752 12.4733C9.14523 12.5351 9.07135 12.584 8.99012 12.6171C8.9089 12.6503 8.82192 12.6671 8.73419 12.6666Z" fill="white"/>
                        <path d="M4.06622 12.6666C3.93437 12.6661 3.80564 12.6264 3.69632 12.5527C3.587 12.479 3.50199 12.3745 3.45204 12.2525C3.40209 12.1305 3.38944 11.9964 3.4157 11.8672C3.44195 11.738 3.50593 11.6195 3.59955 11.5266L7.12622 7.99996L3.59955 4.47329C3.53706 4.41132 3.48747 4.33758 3.45362 4.25634C3.41978 4.1751 3.40235 4.08797 3.40235 3.99996C3.40235 3.91195 3.41978 3.82481 3.45362 3.74357C3.48747 3.66233 3.53706 3.5886 3.59955 3.52663C3.72446 3.40246 3.89342 3.33276 4.06955 3.33276C4.24567 3.33276 4.41464 3.40246 4.53955 3.52663L8.53955 7.52663C8.60204 7.5886 8.65163 7.66233 8.68548 7.74357C8.71932 7.82481 8.73675 7.91195 8.73675 7.99996C8.73675 8.08797 8.71932 8.1751 8.68548 8.25634C8.65163 8.33758 8.60204 8.41132 8.53955 8.47329L4.53955 12.4733C4.47726 12.5351 4.40338 12.584 4.32215 12.6171C4.24093 12.6503 4.15395 12.6671 4.06622 12.6666Z" fill="white"/>
                    </svg>
                </a>
            </div>
            <div class="count2">
                <div class="count-flex2">
                    <p>나의 연차 현황</p>
                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none">
                        <g clip-path="url(#clip0_364_6679)">
                          <path d="M6 0C4.81331 0 3.65328 0.351894 2.66658 1.01118C1.67989 1.67047 0.910851 2.60754 0.456726 3.7039C0.00259972 4.80026 -0.11622 6.00666 0.115291 7.17054C0.346802 8.33443 0.918247 9.40353 1.75736 10.2426C2.59648 11.0818 3.66558 11.6532 4.82946 11.8847C5.99335 12.1162 7.19975 11.9974 8.2961 11.5433C9.39246 11.0892 10.3295 10.3201 10.9888 9.33342C11.6481 8.34673 12 7.18669 12 6C11.9983 4.40923 11.3656 2.88411 10.2407 1.75926C9.1159 0.634414 7.59077 0.00172054 6 0V0ZM6 11C5.0111 11 4.0444 10.7068 3.22215 10.1573C2.39991 9.60794 1.75904 8.82705 1.38061 7.91342C1.00217 6.99979 0.90315 5.99445 1.09608 5.02455C1.289 4.05464 1.76521 3.16373 2.46447 2.46447C3.16373 1.7652 4.05465 1.289 5.02455 1.09607C5.99446 0.903148 6.99979 1.00216 7.91342 1.3806C8.82705 1.75904 9.60794 2.3999 10.1574 3.22215C10.7068 4.04439 11 5.01109 11 6C10.9985 7.32564 10.4713 8.59656 9.53393 9.53393C8.59656 10.4713 7.32564 10.9985 6 11Z" fill="white"/>
                          <path d="M6 2.50012C5.86739 2.50012 5.74022 2.5528 5.64645 2.64657C5.55268 2.74034 5.5 2.86751 5.5 3.00012V7.00012C5.5 7.13273 5.55268 7.25991 5.64645 7.35368C5.74022 7.44744 5.86739 7.50012 6 7.50012C6.13261 7.50012 6.25979 7.44744 6.35356 7.35368C6.44733 7.25991 6.50001 7.13273 6.50001 7.00012V3.00012C6.50001 2.86751 6.44733 2.74034 6.35356 2.64657C6.25979 2.5528 6.13261 2.50012 6 2.50012Z" fill="white"/>
                          <path d="M6.50001 9.00012C6.50001 8.72398 6.27615 8.50012 6 8.50012C5.72386 8.50012 5.5 8.72398 5.5 9.00012C5.5 9.27627 5.72386 9.50013 6 9.50013C6.27615 9.50013 6.50001 9.27627 6.50001 9.00012Z" fill="white"/>
                        </g>
                        <defs>
                          <clipPath id="clip0_364_6679">
                            <rect width="12" height="12" fill="white"/>
                          </clipPath>
                        </defs>
                      </svg>
                </div>
                <p>9</p>
                <a href="${root}/attendance/list">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                        <path d="M8.73419 12.6666C8.60234 12.6661 8.47361 12.6264 8.36429 12.5527C8.25497 12.479 8.16996 12.3745 8.12001 12.2525C8.07006 12.1305 8.05741 11.9964 8.08367 11.8672C8.10992 11.738 8.1739 11.6195 8.26752 11.5266L11.3342 8.47329C11.3967 8.41132 11.4463 8.33758 11.4801 8.25634C11.514 8.1751 11.5314 8.08797 11.5314 7.99996C11.5314 7.91195 11.514 7.82481 11.4801 7.74357C11.4463 7.66233 11.3967 7.5886 11.3342 7.52663L8.26752 4.47329C8.20503 4.41132 8.15544 4.33758 8.12159 4.25634C8.08774 4.1751 8.07032 4.08797 8.07032 3.99996C8.07032 3.91195 8.08774 3.82481 8.12159 3.74357C8.15544 3.66233 8.20503 3.5886 8.26752 3.52663C8.39243 3.40246 8.56139 3.33276 8.73752 3.33276C8.91364 3.33276 9.08261 3.40246 9.20752 3.52663L12.2675 6.58663C12.6421 6.96163 12.8524 7.46996 12.8524 7.99996C12.8524 8.52996 12.6421 9.03829 12.2675 9.41329L9.20752 12.4733C9.14523 12.5351 9.07135 12.584 8.99012 12.6171C8.9089 12.6503 8.82192 12.6671 8.73419 12.6666Z" fill="white"/>
                        <path d="M4.06622 12.6666C3.93437 12.6661 3.80564 12.6264 3.69632 12.5527C3.587 12.479 3.50199 12.3745 3.45204 12.2525C3.40209 12.1305 3.38944 11.9964 3.4157 11.8672C3.44195 11.738 3.50593 11.6195 3.59955 11.5266L7.12622 7.99996L3.59955 4.47329C3.53706 4.41132 3.48747 4.33758 3.45362 4.25634C3.41978 4.1751 3.40235 4.08797 3.40235 3.99996C3.40235 3.91195 3.41978 3.82481 3.45362 3.74357C3.48747 3.66233 3.53706 3.5886 3.59955 3.52663C3.72446 3.40246 3.89342 3.33276 4.06955 3.33276C4.24567 3.33276 4.41464 3.40246 4.53955 3.52663L8.53955 7.52663C8.60204 7.5886 8.65163 7.66233 8.68548 7.74357C8.71932 7.82481 8.73675 7.91195 8.73675 7.99996C8.73675 8.08797 8.71932 8.1751 8.68548 8.25634C8.65163 8.33758 8.60204 8.41132 8.53955 8.47329L4.53955 12.4733C4.47726 12.5351 4.40338 12.584 4.32215 12.6171C4.24093 12.6503 4.15395 12.6671 4.06622 12.6666Z" fill="white"/>
                    </svg>
                </a>
            </div>
            <div class="att_total">
              <div class="total-title">
                <p>총 근무일수</p>
                <div class="total-title-flex">
                  <p>${allAttCnt}</p>
                  <p>일</p>
                </div>
              </div>
              <div class="total-grap">
                <div class="grap-flex">
                  <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" viewBox="0 0 5 5" fill="none">
                    <circle cx="2.5" cy="2.5" r="2.5" fill="#00BEEA"/>
                  </svg>
                  <p>출석</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" viewBox="0 0 5 5" fill="none">
                    <circle cx="2.5" cy="2.5" r="2.5" fill="#EF4898"/>
                  </svg>
                  <p>지각</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" viewBox="0 0 5 5" fill="none">
                    <circle cx="2.5" cy="2.5" r="2.5" fill="#00CBA4"/>
                  </svg>
                  <p>외근</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="5" height="5" viewBox="0 0 5 5" fill="none">
                    <circle cx="2.5" cy="2.5" r="2.5" fill="#A574EE"/>
                  </svg>
                  <p>휴가</p>
                </div>
                <!-- 프로그레스 -->
                <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-label="Segment one" style="width: ${currentTypeOnePercentage}%" aria-valuenow="${currentTypeOnePercentage}" aria-valuemin="0" aria-valuemax="100"></div>
                  <div class="progress-bar bg-success" role="progressbar" aria-label="Segment two" style="width: ${currentTypeSixPercentage}%; background-color: #EF4898!important;" aria-valuenow="${currentTypeSixPercentage}" aria-valuemin="0" aria-valuemax="100"></div>
                  <div class="progress-bar bg-info" role="progressbar" aria-label="Segment three" style="width: ${currentTypeFourPercentage}%" aria-valuenow="${currentTypeFourPercentage}" aria-valuemin="0" aria-valuemax="100"></div>
                  <div class="progress-bar bg-info2" role="progressbar" aria-label="Segment three" style="width: ${currentTypeLeavePercentage}%" aria-valuenow="${currentTypeLeavePercentage}" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
              </div>
              <div class="total-percent">
                <svg xmlns="http://www.w3.org/2000/svg" width="2" height="68" viewBox="0 0 2 68" fill="none">
                  <path d="M0.499997 67C0.499997 67.2761 0.723855 67.5 0.999997 67.5C1.27614 67.5 1.5 67.2761 1.5 67L0.499997 67ZM0.5 -2.18558e-08L0.499997 67L1.5 67L1.5 2.18558e-08L0.5 -2.18558e-08Z" fill="#EEEEEE"/>
                </svg>
                <div class="total-percent-flex">
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <circle cx="5" cy="5" r="5" fill="#00BEEA"/>
                  </svg>
                  <p>${currentTypeOnePercentage}%</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <circle cx="5" cy="5" r="5" fill="#EF4898"/>
                  </svg>
                  <p>${currentTypeSixPercentage}%</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <circle cx="5" cy="5" r="5" fill="#00CBA4"/>
                  </svg>
                  <p>${currentTypeFourPercentage}%</p>
                  <svg xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 10 10" fill="none">
                    <circle cx="5" cy="5" r="5" fill="#A574EE"/>
                  </svg>
                  <p>${currentTypeLeavePercentage}%</p>
                </div>
              </div>
            </div>

            <!-- 두번째 줄 -->
            <div class="att_calendar">
              <div id="calendar-wrap">
                <div id="calendar"></div>
              </div>
            </div>
            <div class="att_grap">
              <div class="grap-title">
                <p>주간 근무 현황</p>
                <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 10" fill="none">
                  <g clip-path="url(#clip0_325_7076)">
                    <path d="M6.31787 10C5.22747 10 4.16155 9.70676 3.25491 9.15735C2.34827 8.60794 1.64164 7.82705 1.22436 6.91342C0.807076 5.99979 0.697897 4.99446 0.910624 4.02455C1.12335 3.05465 1.64843 2.16373 2.41946 1.46447C3.1905 0.765206 4.17285 0.289002 5.2423 0.0960758C6.31176 -0.0968503 7.42027 0.00216643 8.42768 0.380605C9.43508 0.759043 10.2961 1.39991 10.9019 2.22215C11.5077 3.0444 11.8311 4.0111 11.8311 5C11.8295 6.32564 11.2481 7.59658 10.2145 8.53395C9.18096 9.47132 7.77957 9.99857 6.31787 10ZM6.31787 0.833336C5.4092 0.833336 4.52094 1.07771 3.76541 1.53555C3.00987 1.99338 2.42101 2.64413 2.07328 3.40549C1.72554 4.16685 1.63456 5.00462 1.81183 5.81288C1.98911 6.62113 2.42667 7.36356 3.0692 7.94628C3.71173 8.529 4.53036 8.92584 5.42157 9.08661C6.31278 9.24738 7.23654 9.16487 8.07604 8.8495C8.91554 8.53414 9.63308 8.00008 10.1379 7.31488C10.6427 6.62967 10.9122 5.82409 10.9122 5C10.9109 3.89531 10.4264 2.8362 9.56507 2.05506C8.70376 1.27393 7.53595 0.834549 6.31787 0.833336Z" fill="#96A0B5"/>
                    <path d="M6.77824 2.08325H5.85938V6.24992H6.77824V2.08325Z" fill="#96A0B5"/>
                    <path d="M6.77824 7.08325H5.85938V7.91659H6.77824V7.08325Z" fill="#96A0B5"/>
                  </g>
                  <defs>
                    <clipPath id="clip0_325_7076">
                      <rect width="11.0264" height="12" fill="white" transform="translate(0.804688)"/>
                    </clipPath>
                  </defs>
                </svg>
                <p>주 최대 근무시간이 넘지 않게 주의하세요</p>
              </div>
              <div style="padding-left: 20px; padding-right: 20px; padding-top: 20px;">
                <canvas id="myChart" width="1164" height="300" style="display: block; box-sizing: border-box; height: 300px; width: 1164px;"></canvas>
              </div>
            </div>

            <!-- 세번째 줄 -->
            <div class="att_leave">
              <div class="leave-flex">
                <p>휴가 · 휴직 요청 현황</p>
                <a href="${root}/attendance/list">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M8.9831 5.76339L6.3056 3.08589C6.1963 2.97724 6.04845 2.91626 5.89435 2.91626C5.74024 2.91626 5.59239 2.97724 5.4831 3.08589C5.42842 3.14012 5.38502 3.20463 5.35541 3.27572C5.32579 3.3468 5.31055 3.42305 5.31055 3.50006C5.31055 3.57706 5.32579 3.65331 5.35541 3.72439C5.38502 3.79548 5.42842 3.85999 5.4831 3.91422L8.16643 6.58589C8.2211 6.64012 8.2645 6.70463 8.29412 6.77572C8.32373 6.8468 8.33898 6.92305 8.33898 7.00006C8.33898 7.07706 8.32373 7.15331 8.29412 7.22439C8.2645 7.29548 8.2211 7.35999 8.16643 7.41422L5.4831 10.0859C5.37325 10.195 5.31124 10.3432 5.31069 10.498C5.31014 10.6528 5.37111 10.8015 5.48018 10.9113C5.58925 11.0212 5.73749 11.0832 5.89228 11.0837C6.04708 11.0843 6.19575 11.0233 6.3056 10.9142L8.9831 8.23672C9.31081 7.9086 9.49489 7.46381 9.49489 7.00006C9.49489 6.5363 9.31081 6.09152 8.9831 5.76339Z" fill="white"/>
                  </svg>
                </a>
              </div>
              <hr>
              <table class="table table-borderless">
                  <tbody>
                  	<c:forEach items="${mainLeList}" var="mainLeVo">
	                    <tr>
	                      <th scope="row">${mainLeVo.no}</th>
	                      <td>${mainLeVo.startTime} ~ ${mainLeVo.endTime}</td>
	                      <td>${mainLeVo.type}</td>
	                      <c:choose> 
                          <c:when test="${mainLeVo.status == 0}">
                                        <td>대기</td>
                          </c:when>
                          <c:when test="${mainLeVo.status == 1}">
                                        <td style="color: #5189FA">승인</td>
                          </c:when>
                          <c:otherwise>
                                        <td style="color: #F85F57;">반려</td>
                          </c:otherwise> 
                        </c:choose> 
	                    </tr>
                  	</c:forEach>
                  </tbody>
                </table>
            </div>
            <div class="att_work">
              <div class="work-flex">
                <p>표준 외 근무 요청 현황</p>
                <a href="${root}/attendance/list">
                  <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                    <path d="M8.9831 5.76339L6.3056 3.08589C6.1963 2.97724 6.04845 2.91626 5.89435 2.91626C5.74024 2.91626 5.59239 2.97724 5.4831 3.08589C5.42842 3.14012 5.38502 3.20463 5.35541 3.27572C5.32579 3.3468 5.31055 3.42305 5.31055 3.50006C5.31055 3.57706 5.32579 3.65331 5.35541 3.72439C5.38502 3.79548 5.42842 3.85999 5.4831 3.91422L8.16643 6.58589C8.2211 6.64012 8.2645 6.70463 8.29412 6.77572C8.32373 6.8468 8.33898 6.92305 8.33898 7.00006C8.33898 7.07706 8.32373 7.15331 8.29412 7.22439C8.2645 7.29548 8.2211 7.35999 8.16643 7.41422L5.4831 10.0859C5.37325 10.195 5.31124 10.3432 5.31069 10.498C5.31014 10.6528 5.37111 10.8015 5.48018 10.9113C5.58925 11.0212 5.73749 11.0832 5.89228 11.0837C6.04708 11.0843 6.19575 11.0233 6.3056 10.9142L8.9831 8.23672C9.31081 7.9086 9.49489 7.46381 9.49489 7.00006C9.49489 6.5363 9.31081 6.09152 8.9831 5.76339Z" fill="white"/>
                  </svg>
                </a>
              </div>
              <hr>
              <table class="table table-borderless">
                  <tbody>
                  <c:forEach items="${mainWorkList}" var="work">
                    <tr>
                      <th scope="row">${work.no}</th>
                      <td>${work.enrolldate}</td>
                      <td>${work.startTime} ~ ${work.endTime}</td>
                      <c:choose> 
                          <c:when test="${work.approvalStatus == 0}">
                                        <td>대기</td>
                          </c:when>
                          <c:when test="${work.approvalStatus == 1}">
                                        <td style="color: #5189FA">승인</td>
                          </c:when>
                          <c:otherwise>
                                        <td style="color: #F85F57;">반려</td>
                          </c:otherwise> 
                        </c:choose> 
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="att_department">
                <p>부서별 출근 현황</p>
                <div class="overflow-auto">
                <table class="table table-borderless">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">직급</th>
                      <th scope="col">이름</th>
                      <th scope="col">출근시간</th>
                      <th scope="col">퇴근시간</th>
                      <th scope="col">초과근무시간</th>
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                <tbody>
                <c:forEach items="${deList}" var="de">
                  <tr>
                    <th scope="row">${de.no}</th>
                    <td>${de.rankName}</td>
                    <td>${de.name}</td>
                    <td>${de.checkInTime}</td>
                    <td>${de.checkOutTime}</td>
                    <td>${de.plusWorkTime}</td>
                    <td>${de.type}</td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>
            </div>

            <!-- 네번째 줄 -->
            <div class="att_my">
                <p>내 출결 현황</p>
                <hr>
                <table class="table table-borderless">
                    <tbody>
                    	<c:forEach items="${mainAttList}" var="mAttVo">
	                      <tr>
	                      	<td>${mAttVo.no}</td>
	                        <th scope="row">${mAttVo.enrolldate}</th>
	                        <td>[출근] ${mAttVo.checkInTime}</td>
	                        <td>[퇴근] ${mAttVo.checkOutTime}</td>
	                        <td>[초과근무] ${mAttVo.plusWorkTime}</td>
	                        <td>[상태] ${mAttVo.type}</td>
	                      </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>

    <script>

      document.addEventListener('DOMContentLoaded', function() {
        $(function(){
          var request = $.ajax({
            url : "${root}/attendance/monthList",
            method : "GET",
            dataType : "json"
          });

          request.done(function(data){
            console.log(data);

            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
              themeSystem: 'bootstrap5',
              headerToolbar: {
                left: 'prev,next',
                center: 'title',
                right: 'today'
              },
              locale: 'ko',
              events: data,
              businessHours: true,
              eventClick : function(info){

                console.log(info);
                console.log(info.event);
                console.log(info.event.start);
                console.log(info.event.end);

                var start = info.event.start;
                var end = info.event.end;
                var title = info.event.title;

                // moment 객체로 변환 후 원하는 형식으로 포맷팅
                var formatStart = moment(start).format("MM월 DD일 - HH시 mm분");
                var formatEnd = end ? moment(end).format("MM월 DD일 - HH시 mm분") : "-";
                // end ? moment(end).format("YYYY/MM/DD HH:mm") 

                console.log("출근시간 : " + start + "\n퇴근시간 : " + end);
                var message = "출근시간 : " + formatStart + "\n퇴근시간 : " + formatEnd;

                swal(title,message,'info');
              },
              dayCellContent : function(info){
                var number = document.createElement("a");
                number.classList.add("fc-daygrid-day-number");
                number.innerHTML = info.dayNumberText.replace("일","").replace("日","");
                if(info.view.type === "dayGridMonth"){
                  return{
                    html : number.outerHTML
                  };
                }
                return{
                  domNodes:[]
                };
              },
            });
      
            calendar.render();

          })

        })
    });

    </script>
    

    

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>

      // $(document).ready(function(){
      //   getGraph();
      //   getSumGraph();
      // })

      // function getSumGraph(){
      //   let sumList = [];

      //   $.ajax({
      //     url : '${root}/attendance/weekChart',
      //     dataType : "json",
      //     type : "GET",
      //     success : function(data){
      //       for(let i = 0; i<data.length; i++){
      //         sumList.push(data[i]);
      //       }
            new Chart(document.getElementById("myChart"),{
              
              type : 'bar',
              data : {
                labels : ["4주 전", "3주 전", "2주 전", "1주 전"],
                datasets : [{
                  label : "주간 근무 시간(시간 단위)",
                  backgroundColor : [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(255, 159, 64, 0.2)',
                    'rgba(255, 205, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)'
                  ],
                  borderColor : [
                    'rgb(255, 99, 132)',
                    'rgb(255, 159, 64)',
                    'rgb(255, 205, 86)',
                    'rgb(75, 192, 192)'                 
                  ],
                  borderWidth : 1,
                  data : [49,42,40,40,43]
                }]
              },
              options : {
                legend : {display : true},
                animation: {
                    animateScale: true
                },
                responsive: false
              }
              
            })
      //     },
      //     error:function(){
      //       alert("실패");
      //     }
      //   })
      // }

    </script>


    <script>

      // 출퇴근 등록 버튼 영역 ------------------------------------
      function handleCheckIn() {
        checkInOutWork('check-in');
      }

      function handleCheckOut() {
          checkInOutWork('check-out');
      }

      function markButtonAsClicked(buttonType) {
      }

      function checkInOutWork(action) {
          $.ajax({
              url: "${root}/attendance/main",
              type: "POST",
              data: {
                  action: action // 출근 버튼인지 퇴근 버튼인지 구분하는 파라미터
              },
              success: function(result) {
                  console.log(result);
                  if (result === "already-checked-in") {
                      alert("이미 출근 등록을 완료했습니다.");
                  } else if (result === "already-checked-out") {
                      alert("이미 퇴근 등록을 완료했습니다.");
                  } else if (action === "check-in") {
                      alert("출근 완료");
                  } else if (action === "check-out") {
                      alert("퇴근 완료");
                  }
                  location.reload();
              },
              error: function(error) {
                  console.error(error);
              },
          });
      }

    </script>
    
</body>
</html>