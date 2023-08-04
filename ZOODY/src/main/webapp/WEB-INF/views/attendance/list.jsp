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
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="${root}/resources/css/attendance/detail.css">
    <link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<title>Document</title>
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
                <p>오영택님</p>
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
            <div class="att_type1">
              <div class="type-flex">
                  <svg xmlns="http://www.w3.org/2000/svg" width="6" height="6" viewBox="0 0 6 6" fill="none">
                      <circle cx="3" cy="3" r="3" fill="#4876EF"/>
                  </svg>
                  <p>정상출근</p>
              </div>
              <p>${currentTypeOne}</p>
            </div>
            <div class="att_type2">
              <div class="type-flex">
                <svg xmlns="http://www.w3.org/2000/svg" width="6" height="6" viewBox="0 0 6 6" fill="none">
                  <circle cx="3" cy="3" r="3" fill="#00CBA4"/>
                </svg>
                <p>지각</p>
              </div>
              <p class="type-p">${currentTypeSix}</p>
            </div>
            <div class="att_type3">
              <div class="type-flex">
                <svg xmlns="http://www.w3.org/2000/svg" width="6" height="6" viewBox="0 0 6 6" fill="none">
                  <circle cx="3" cy="3" r="3" fill="#00BEEA"/>
                </svg>
                <p>휴가</p>
              </div>
              <p class="type-p">${currentTypeLeave}</p>
            </div>
            <div class="att_type4">
              <div class="type-flex">
                <svg xmlns="http://www.w3.org/2000/svg" width="6" height="6" viewBox="0 0 6 6" fill="none">
                  <circle cx="3" cy="3" r="3" fill="#A574EE"/>
                </svg>
                <p>외근</p>
              </div>
              <p class="type-p">${currentTypeFour}</p>
            </div>
            <div class="att_workList">
              <div class="workList-flex">
                <p>표준 외 근무 요청 현황</p>
                <c:if test="${workPv.currentPage > 1}">
                  <a href="${root}/attendance/list?wp=${workPv.currentPage-1}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                      <path d="M6.81317 11.875C6.93677 11.8745 7.05745 11.8373 7.15994 11.7682C7.26243 11.6991 7.34213 11.6012 7.38896 11.4868C7.43579 11.3724 7.44764 11.2467 7.42303 11.1256C7.39841 11.0044 7.33843 10.8933 7.25067 10.8063L4.37566 7.94376C4.31708 7.88566 4.27058 7.81653 4.23885 7.74037C4.20712 7.66421 4.19079 7.58252 4.19079 7.50001C4.19079 7.4175 4.20712 7.33581 4.23885 7.25965C4.27058 7.18349 4.31708 7.11436 4.37566 7.05626L7.25067 4.19376C7.30925 4.13566 7.35574 4.06653 7.38747 3.99037C7.4192 3.91421 7.43554 3.83251 7.43554 3.75001C7.43554 3.6675 7.4192 3.58581 7.38747 3.50965C7.35574 3.43348 7.30925 3.36436 7.25067 3.30626C7.13356 3.18985 6.97516 3.12451 6.81004 3.12451C6.64492 3.12451 6.48652 3.18985 6.36941 3.30626L3.50066 6.17501C3.14953 6.52657 2.95231 7.00313 2.95231 7.50001C2.95231 7.99688 3.14953 8.47344 3.50066 8.82501L6.36941 11.6938C6.42781 11.7517 6.49707 11.7975 6.57322 11.8286C6.64937 11.8597 6.73091 11.8755 6.81317 11.875Z" fill="white"/>
                      <path d="M11.1882 11.875C11.3118 11.8745 11.4325 11.8373 11.5349 11.7682C11.6374 11.6991 11.7171 11.6012 11.764 11.4868C11.8108 11.3724 11.8226 11.2467 11.798 11.1256C11.7734 11.0044 11.7134 10.8933 11.6257 10.8063L8.31942 7.50001L11.6257 4.19376C11.6842 4.13566 11.7307 4.06653 11.7625 3.99037C11.7942 3.91421 11.8105 3.83251 11.8105 3.75001C11.8105 3.6675 11.7942 3.58581 11.7625 3.50965C11.7307 3.43348 11.6842 3.36436 11.6257 3.30626C11.5086 3.18985 11.3502 3.12451 11.185 3.12451C11.0199 3.12451 10.8615 3.18985 10.7444 3.30626L6.99442 7.05626C6.93584 7.11436 6.88934 7.18349 6.85761 7.25965C6.82588 7.33581 6.80954 7.4175 6.80954 7.50001C6.80954 7.58252 6.82588 7.66421 6.85761 7.74037C6.88934 7.81653 6.93584 7.88566 6.99442 7.94376L10.7444 11.6938C10.8028 11.7517 10.8721 11.7975 10.9482 11.8286C11.0244 11.8597 11.1059 11.8755 11.1882 11.875Z" fill="white"/>
                    </svg>
                  </a>
                </c:if>
                <c:if test="${workPv.currentPage < workPv.maxPage}">
                  <a href="${root}/attendance/list?wp=${workPv.currentPage+1}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                      <path d="M8.18683 11.875C8.06323 11.8745 7.94255 11.8373 7.84006 11.7682C7.73757 11.6991 7.65787 11.6012 7.61104 11.4868C7.56421 11.3724 7.55236 11.2467 7.57697 11.1256C7.60159 11.0044 7.66157 10.8933 7.74933 10.8063L10.6243 7.94376C10.6829 7.88566 10.7294 7.81653 10.7611 7.74037C10.7929 7.66421 10.8092 7.58252 10.8092 7.50001C10.8092 7.4175 10.7929 7.33581 10.7611 7.25965C10.7294 7.18349 10.6829 7.11436 10.6243 7.05626L7.74933 4.19376C7.69075 4.13566 7.64426 4.06653 7.61253 3.99037C7.5808 3.91421 7.56446 3.83251 7.56446 3.75001C7.56446 3.6675 7.5808 3.58581 7.61253 3.50965C7.64426 3.43348 7.69075 3.36436 7.74933 3.30626C7.86644 3.18985 8.02484 3.12451 8.18996 3.12451C8.35508 3.12451 8.51348 3.18985 8.63059 3.30626L11.4993 6.17501C11.8505 6.52657 12.0477 7.00313 12.0477 7.50001C12.0477 7.99688 11.8505 8.47344 11.4993 8.82501L8.63059 11.6938C8.57219 11.7517 8.50293 11.7975 8.42678 11.8286C8.35063 11.8597 8.26909 11.8755 8.18683 11.875Z" fill="white"/>
                      <path d="M3.81183 11.875C3.68822 11.8745 3.56755 11.8373 3.46506 11.7682C3.36257 11.6991 3.28287 11.6012 3.23604 11.4868C3.18921 11.3724 3.17736 11.2467 3.20197 11.1256C3.22659 11.0044 3.28657 10.8933 3.37433 10.8063L6.68058 7.50001L3.37433 4.19376C3.31575 4.13566 3.26926 4.06653 3.23753 3.99037C3.2058 3.91421 3.18946 3.83251 3.18946 3.75001C3.18946 3.6675 3.2058 3.58581 3.23753 3.50965C3.26926 3.43348 3.31575 3.36436 3.37433 3.30626C3.49143 3.18985 3.64984 3.12451 3.81496 3.12451C3.98007 3.12451 4.13848 3.18985 4.25558 3.30626L8.00558 7.05626C8.06416 7.11436 8.11066 7.18349 8.14239 7.25965C8.17412 7.33581 8.19046 7.4175 8.19046 7.50001C8.19046 7.58252 8.17412 7.66421 8.14239 7.74037C8.11066 7.81653 8.06416 7.88566 8.00558 7.94376L4.25558 11.6938C4.19718 11.7517 4.12792 11.7975 4.05177 11.8286C3.97563 11.8597 3.89409 11.8755 3.81183 11.875Z" fill="white"/>
                    </svg>
                  </a>
                </c:if>
              </div>
              <div class="work-board">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">날짜</th>
                      <th scope="col">신청 시간</th>
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<c:forEach items="${ewList}" var="ew">
	                    <tr>
	                      <th scope="row">${ew.no}</th>
	                      <td>${ew.enrolldate}</td>
	                      <td>${ew.startTime} ~ ${ew.endTime}</td>
	                      <c:choose> 
	                          <c:when test="${ew.approvalStatus == 0}">
	                            <td>대기</td>
	                          </c:when>
	                          <c:when test="${ew.approvalStatus == 1}">
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
              <div class="workList-input"><input type="button" value="요청하기"></div>
            </div>

            <!-- 두번째 줄 : 검색바 부분 -->
            <div class="search_area">
              <div><button onclick="toggleCheckboxes()">이의신청</button></div>
              <form action="${root}/attendance/list" method="get">
              <div></div> 
                <div class="search-flex">

                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="searchType">
                      <option>상태</option>
                    </select>

                    <div class="search-input">
                      <input type="text" placeholder="검색 내용을 입력하세요." name="searchValue">
                      <button type="submit">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none">
                          <g clip-path="url(#clip0_409_10089)">
                            <path d="M15.9999 15.0579L11.8252 10.8833C12.9096 9.55698 13.4428 7.86465 13.3144 6.15629C13.1861 4.44794 12.406 2.85427 11.1356 1.70493C9.86516 0.555594 8.20158 -0.0614848 6.48895 -0.0186636C4.77632 0.0241577 3.14566 0.723603 1.93426 1.935C0.72287 3.14639 0.0234252 4.77705 -0.019396 6.48968C-0.0622172 8.20232 0.554862 9.86589 1.7042 11.1363C2.85354 12.4067 4.44721 13.1868 6.15556 13.3152C7.86392 13.4435 9.55625 12.9103 10.8825 11.8259L15.0572 16.0006L15.9999 15.0579ZM6.66652 12.0006C5.61169 12.0006 4.58054 11.6878 3.70348 11.1018C2.82642 10.5157 2.14283 9.68277 1.73916 8.70823C1.3355 7.73369 1.22988 6.66134 1.43567 5.62677C1.64145 4.59221 2.14941 3.6419 2.89529 2.89602C3.64117 2.15014 4.59147 1.64219 5.62604 1.4364C6.6606 1.23061 7.73296 1.33623 8.7075 1.7399C9.68204 2.14356 10.515 2.82715 11.101 3.70421C11.6871 4.58127 11.9999 5.61242 11.9999 6.66725C11.9983 8.08125 11.4359 9.43689 10.436 10.4367C9.43615 11.4366 8.08052 11.999 6.66652 12.0006Z" fill="#A4A4A4"/>
                          </g>
                          <defs>
                            <clipPath id="clip0_409_10089">
                              <rect width="16" height="16" fill="white"/>
                            </clipPath>
                          </defs>
                        </svg>
                      </button>
                    </div>

                  </div>
                </div>
              </form>
              
            <!-- 세번째 줄 -->
            <div class="att_myList">
              <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">날짜</th>
                    <th scope="col">출근시간</th>
                    <th scope="col">퇴근시간</th>
                    <th scope="col">초과근무시간</th>
                    <th scope="col">상태</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody id="checkboxContainer">
                  <c:forEach items="${attVoList}" var="att">	
                      <tr>
                        <th scope="row">${att.no}</th>
                        <td>${att.enrolldate}</td>
                        <td>${att.checkInTime}</td>
                        <td>${att.checkOutTime }</td>
                        <c:choose> 
                          <c:when test="${att.plusWorkTime eq '시간 분 초'}">
                            <td>-</td>
                          </c:when>
                          <c:when test="${att.plusWorkTime eq '0시간 0분 0초'}">
                            <td>-</td>
                          </c:when>
                          <c:otherwise>
                            <td>${att.plusWorkTime}</td>
                          </c:otherwise> 
                        </c:choose> 
                        <td>${att.type}</td>
                       	<c:choose>
                       		<c:when test="${att.objectionReason == null}">
                             <td>
                               <!-- Button trigger modal -->
                               <button type="button" class="btn btn-primary toggle-button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="display: none;" data-att-no="${att.no}">
                                 신청
                               </button>
     
                               <!-- Modal -->
                               <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                 <div class="modal-dialog modal-dialog-centered">
                                   <div class="modal-content">
                                     <div class="modal-header">
                                       <h1 class="modal-title fs-5" id="staticBackdropLabel">이의신청</h1>
                                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                     </div>
                                     <div class="modal-body">
                                       <form action="${root}/attendance/list" method="post">
                                         <div class="mb-3">
                                           <label for="recipient-name" class="col-form-label">번호 :</label>
                                           <input type="text" class="form-control" id="recipient-name" name="no">
                                         </div>
                                         <div class="mb-3">
                                           <label for="message-text" class="col-form-label">사유 작성 :</label>
                                           <textarea class="form-control" id="message-text" name="objectionReason"></textarea>
                                         </div>
                                         <div class="modal-footer">
                                           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">작성취소</button>
                                           <button type="submit" class="btn btn-primary" onclick="submitObj();">작성완료</button>
                                        </form>
                                     </div>
                                   </div>
                                 </div>
                               </div>
                             </td>
                            </c:when>
                            <c:when test="${att.objectionReason != null}">
                             <td>
                              <c:choose>
                                <c:when test="${att.approvalStatus == 0}">
                                  <button type="button" class="btn btn-primary toggle-button" style="display: none; background-color: gray; border-color: gray;">
                                    대기
                                  </button>
                                </c:when>
                                <c:when test="${att.approvalStatus == 1}">
                                  <button type="button" class="btn btn-primary toggle-button" style="display: none; background-color: rgb(208, 165, 66); border-color: rgb(208, 165, 66);">
                                    승인
                                  </button>
                                </c:when>
                                <c:when test="${att.approvalStatus == 2}">
                                  <button type="button" class="btn btn-primary toggle-button" style="display: none; background-color: rgb(155, 57, 57); border-color: rgb(155, 57, 57);">
                                    반려
                                  </button>
                                </c:when>
                              </c:choose>
                             </td>
                       		</c:when>
                       	</c:choose>
                      </tr>
                  </c:forEach>
                  
                </tbody>
              </table>
              <div class="list-page">
                <c:if test="${pv.currentPage > 1}">
	                <a href="${root}/attendance/list?page=${pv.currentPage-1}">
	                  <button style="border: none; background-color: #fff;">
	                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
	                      <path d="M7.9499 9.53261C7.8796 9.46288 7.8238 9.37993 7.78573 9.28854C7.74765 9.19714 7.72805 9.09912 7.72805 9.00011C7.72805 8.9011 7.74765 8.80307 7.78573 8.71167C7.8238 8.62028 7.8796 8.53733 7.9499 8.46761L11.3924 5.03261C11.4627 4.96288 11.5185 4.87993 11.5566 4.78854C11.5946 4.69714 11.6142 4.59912 11.6142 4.50011C11.6142 4.4011 11.5946 4.30307 11.5566 4.21167C11.5185 4.12028 11.4627 4.03733 11.3924 3.96761C11.2519 3.82792 11.0618 3.74951 10.8636 3.74951C10.6655 3.74951 10.4754 3.82792 10.3349 3.96761L6.89239 7.41011C6.47104 7.83198 6.23438 8.40385 6.23438 9.00011C6.23438 9.59636 6.47104 10.1682 6.89239 10.5901L10.3349 14.0326C10.4746 14.1712 10.6631 14.2493 10.8599 14.2501C10.9586 14.2507 11.0564 14.2318 11.1478 14.1944C11.2392 14.1571 11.3223 14.1021 11.3924 14.0326C11.4627 13.9629 11.5185 13.8799 11.5566 13.7885C11.5946 13.6971 11.6142 13.5991 11.6142 13.5001C11.6142 13.4011 11.5946 13.3031 11.5566 13.2117C11.5185 13.1203 11.4627 13.0373 11.3924 12.9676L7.9499 9.53261Z" fill="#5B5B5B"/>
	                    </svg>
	                  </button>
	                </a>
                </c:if>
                <c:forEach var="pageNum" begin="${pv.startPage}" end="${pv.endPage}">
                  <c:choose>
                      <c:when test="${pageNum == pv.currentPage}">
                          <button class="active">${pageNum}</button>
                      </c:when>
                      <c:otherwise>
                          <a href="${root}/attendance/list?page=${pageNum}">
                              <button class="nomalBtn">${pageNum}</button>
                          </a>
                      </c:otherwise>
                  </c:choose>
              </c:forEach>
              <c:if test="${pv.currentPage < pv.maxPage}">
                  <a href="${root}/attendance/list?page=${pv.currentPage+1}">
                    <button style="border: none; background-color: #fff;">
                      <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                        <path d="M11.55 7.41011L8.10747 3.96761C7.96695 3.82792 7.77686 3.74951 7.57872 3.74951C7.38058 3.74951 7.1905 3.82792 7.04997 3.96761C6.97968 4.03733 6.92388 4.12028 6.88581 4.21167C6.84773 4.30307 6.82812 4.4011 6.82812 4.50011C6.82812 4.59912 6.84773 4.69714 6.88581 4.78854C6.92388 4.87993 6.97968 4.96288 7.04997 5.03261L10.5 8.46761C10.5703 8.53733 10.6261 8.62028 10.6641 8.71167C10.7022 8.80307 10.7218 8.9011 10.7218 9.00011C10.7218 9.09912 10.7022 9.19714 10.6641 9.28854C10.6261 9.37993 10.5703 9.46288 10.5 9.53261L7.04997 12.9676C6.90875 13.1078 6.82901 13.2984 6.82831 13.4975C6.8276 13.6965 6.90599 13.8876 7.04622 14.0289C7.18646 14.1701 7.37705 14.2498 7.57607 14.2505C7.7751 14.2512 7.96625 14.1728 8.10747 14.0326L11.55 10.5901C11.9713 10.1682 12.208 9.59636 12.208 9.00011C12.208 8.40385 11.9713 7.83198 11.55 7.41011Z" fill="#5B5B5B"/>
                      </svg>
                    </button>
                  </a>
              </c:if>
              </div>
            </div>
            <div class="att_leaveList">
              <div class="leaveList-flex">
                <p>휴가 · 휴직 요청 현황</p>
                <c:if test="${leavePv.currentPage > 1}">
                  <a href="${root}/attendance/list?lp=${leavePv.currentPage-1}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                      <path d="M6.81317 11.875C6.93677 11.8745 7.05745 11.8373 7.15994 11.7682C7.26243 11.6991 7.34213 11.6012 7.38896 11.4868C7.43579 11.3724 7.44764 11.2467 7.42303 11.1256C7.39841 11.0044 7.33843 10.8933 7.25067 10.8063L4.37566 7.94376C4.31708 7.88566 4.27058 7.81653 4.23885 7.74037C4.20712 7.66421 4.19079 7.58252 4.19079 7.50001C4.19079 7.4175 4.20712 7.33581 4.23885 7.25965C4.27058 7.18349 4.31708 7.11436 4.37566 7.05626L7.25067 4.19376C7.30925 4.13566 7.35574 4.06653 7.38747 3.99037C7.4192 3.91421 7.43554 3.83251 7.43554 3.75001C7.43554 3.6675 7.4192 3.58581 7.38747 3.50965C7.35574 3.43348 7.30925 3.36436 7.25067 3.30626C7.13356 3.18985 6.97516 3.12451 6.81004 3.12451C6.64492 3.12451 6.48652 3.18985 6.36941 3.30626L3.50066 6.17501C3.14953 6.52657 2.95231 7.00313 2.95231 7.50001C2.95231 7.99688 3.14953 8.47344 3.50066 8.82501L6.36941 11.6938C6.42781 11.7517 6.49707 11.7975 6.57322 11.8286C6.64937 11.8597 6.73091 11.8755 6.81317 11.875Z" fill="white"/>
                      <path d="M11.1882 11.875C11.3118 11.8745 11.4325 11.8373 11.5349 11.7682C11.6374 11.6991 11.7171 11.6012 11.764 11.4868C11.8108 11.3724 11.8226 11.2467 11.798 11.1256C11.7734 11.0044 11.7134 10.8933 11.6257 10.8063L8.31942 7.50001L11.6257 4.19376C11.6842 4.13566 11.7307 4.06653 11.7625 3.99037C11.7942 3.91421 11.8105 3.83251 11.8105 3.75001C11.8105 3.6675 11.7942 3.58581 11.7625 3.50965C11.7307 3.43348 11.6842 3.36436 11.6257 3.30626C11.5086 3.18985 11.3502 3.12451 11.185 3.12451C11.0199 3.12451 10.8615 3.18985 10.7444 3.30626L6.99442 7.05626C6.93584 7.11436 6.88934 7.18349 6.85761 7.25965C6.82588 7.33581 6.80954 7.4175 6.80954 7.50001C6.80954 7.58252 6.82588 7.66421 6.85761 7.74037C6.88934 7.81653 6.93584 7.88566 6.99442 7.94376L10.7444 11.6938C10.8028 11.7517 10.8721 11.7975 10.9482 11.8286C11.0244 11.8597 11.1059 11.8755 11.1882 11.875Z" fill="white"/>
                    </svg>
                  </a>
                </c:if>
                <c:if test="${leavePv.currentPage < leavePv.maxPage}">
                  <a href="${root}/attendance/list?lp=${leavePv.currentPage+1}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 15 15" fill="none">
                      <path d="M8.18683 11.875C8.06323 11.8745 7.94255 11.8373 7.84006 11.7682C7.73757 11.6991 7.65787 11.6012 7.61104 11.4868C7.56421 11.3724 7.55236 11.2467 7.57697 11.1256C7.60159 11.0044 7.66157 10.8933 7.74933 10.8063L10.6243 7.94376C10.6829 7.88566 10.7294 7.81653 10.7611 7.74037C10.7929 7.66421 10.8092 7.58252 10.8092 7.50001C10.8092 7.4175 10.7929 7.33581 10.7611 7.25965C10.7294 7.18349 10.6829 7.11436 10.6243 7.05626L7.74933 4.19376C7.69075 4.13566 7.64426 4.06653 7.61253 3.99037C7.5808 3.91421 7.56446 3.83251 7.56446 3.75001C7.56446 3.6675 7.5808 3.58581 7.61253 3.50965C7.64426 3.43348 7.69075 3.36436 7.74933 3.30626C7.86644 3.18985 8.02484 3.12451 8.18996 3.12451C8.35508 3.12451 8.51348 3.18985 8.63059 3.30626L11.4993 6.17501C11.8505 6.52657 12.0477 7.00313 12.0477 7.50001C12.0477 7.99688 11.8505 8.47344 11.4993 8.82501L8.63059 11.6938C8.57219 11.7517 8.50293 11.7975 8.42678 11.8286C8.35063 11.8597 8.26909 11.8755 8.18683 11.875Z" fill="white"/>
                      <path d="M3.81183 11.875C3.68822 11.8745 3.56755 11.8373 3.46506 11.7682C3.36257 11.6991 3.28287 11.6012 3.23604 11.4868C3.18921 11.3724 3.17736 11.2467 3.20197 11.1256C3.22659 11.0044 3.28657 10.8933 3.37433 10.8063L6.68058 7.50001L3.37433 4.19376C3.31575 4.13566 3.26926 4.06653 3.23753 3.99037C3.2058 3.91421 3.18946 3.83251 3.18946 3.75001C3.18946 3.6675 3.2058 3.58581 3.23753 3.50965C3.26926 3.43348 3.31575 3.36436 3.37433 3.30626C3.49143 3.18985 3.64984 3.12451 3.81496 3.12451C3.98007 3.12451 4.13848 3.18985 4.25558 3.30626L8.00558 7.05626C8.06416 7.11436 8.11066 7.18349 8.14239 7.25965C8.17412 7.33581 8.19046 7.4175 8.19046 7.50001C8.19046 7.58252 8.17412 7.66421 8.14239 7.74037C8.11066 7.81653 8.06416 7.88566 8.00558 7.94376L4.25558 11.6938C4.19718 11.7517 4.12792 11.7975 4.05177 11.8286C3.97563 11.8597 3.89409 11.8755 3.81183 11.875Z" fill="white"/>
                    </svg>
                  </a>
                </c:if>
              </div>
              <div class="leave-board">
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">날짜</th>
                      <th scope="col">사유</th>
                      <th scope="col">상태</th>
                    </tr>
                  </thead>
                  <tbody>
	                  <c:forEach items="${leVoList}" var="levo">
	                    <tr>
	                      <th scope="row">${levo.no}</th>
	                      <td>${levo.startTime} ~ ${levo.endTime}</td>
	                      <td>${levo.type}</td>
	                      <c:if test="${levo.status eq 0}">
		                      <td>대기</td>
	                      </c:if>
	                      <c:if test="${levo.status eq 1}">
		                      <td style="color: #5189FA">승인</td>
	                      </c:if>
	                      <c:if test="${levo.status eq 2}">
		                      <td style="color: #F85F57;">반려</td>
	                      </c:if>
	                    </tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
              <div class="leaveList-input"><input type="button" value="요청하기"></div>
            </div>
        </div>
    </div>


    <script>
      function submitObj(){
        // <input> 요소의 값 가져오기
        const recipientNameInput = document.getElementById("recipient-name");
        const no = recipientNameInput.value;

        // <textarea> 요소의 값 가져오기
        const messageTextInput = document.getElementById("message-text");
        const objectionReason = messageTextInput.value;

        var params = {
          no : no,
          objectionReason : objectionReason
        }

        $.ajax({
          url : '${root}/attendance/list',
          type : "POST",
          data : params,
          success : function (result) {
              alert("제출 완료");
              location.reload();
          },
          error : function (error) {
            alert("서버 오류");
          }
        })

      }
    </script>
    
    

    <script>
      function toggleCheckboxes() {
        var checkboxContainer = document.getElementById('checkboxContainer');
        var buttons = checkboxContainer.getElementsByClassName('toggle-button');

        for (var i = 0; i < buttons.length; i++) {
          if (buttons[i].style.display === 'none') {
            buttons[i].style.display = 'block'; // 보이도록 설정
          } else {
            buttons[i].style.display = 'none'; // 숨기도록 설정
          }
        }
      };

    </script>

    <script>
      // DOM이 완전히 로드된 후에 이벤트 리스너를 추가
      document.addEventListener("DOMContentLoaded", function() {
        // "신청" 버튼들을 가져옵니다.
        const toggleButtons = document.querySelectorAll(".toggle-button");

        // 각 버튼에 이벤트 리스너를 추가
        toggleButtons.forEach(button => {
          button.addEventListener("click", function() {
            // 버튼이 클릭된 행의 번호를 가져옵니다.
            const attNo = this.getAttribute("data-att-no");
            
            // 모달창 내의 input 요소
            const inputField = document.querySelector("#recipient-name");
            
            // input 필드에 해당 행의 번호를 설정
            inputField.value = attNo;

            inputField.setAttribute("readonly", "readonly");
          });
        });
      });
    </script>

    <script>
      const searchValueTag = document.querySelector("input[name=searchValue]");
      searchValueTag.value = '${searchValue}';
    </script>
    
    <!-- <script>

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
          var loginMemberNo = 1; // 클라이언트에서 적절한 회원 번호를 가져와 설정
          $.ajax({
              url: "${root}/attendance/main",
              type: "POST",
              data: {
                  loginMemberNo: loginMemberNo,
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

    </script> -->

	
    
</body>
</html>