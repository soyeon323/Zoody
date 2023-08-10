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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/meetingroom/reserve.css">
<link rel="stylesheet" href="${root}/resources/css/attendance/objection.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Document</title>
</head>
<body>
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="mt_wrap">
        <div>
            <%@ include file="/WEB-INF/views/side.jsp" %>
        </div>
        <div id="mt_main">
            <!-- 맨 윗 줄 -->
            <div class="mt_link">
                <div style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="${root}/calendar/main">일정등록</a></li>
                      <li class="breadcrumb-item"><a href="${root}/meetingroom/reserve">회의실 상세 예약</a></li>
                      <li class="breadcrumb-item active" aria-current="page">내 예약 현황 확인</li>
                    </ol>
                </div>
            </div>

            <!-- <div class="re_box"> -->
                <div class="obj_table">
                    <table class="table">
                      <thead>
                        <tr style="height: 30px;">
                          <th scope="col">#</th>
                          <th scope="col">예약일</th>
                          <th scope="col">시작시간</th>
                          <th scope="col">종료시간</th>
                          <th scope="col">장소</th>
                          <th scope="col">상태</th>
                        </tr>
                      </thead>
                      <tbody>
                          <c:forEach items="${reserveList}" var="res">
                            <tr>
                              <th scope="row">${res.no}</th>
                              <td>${res.date}</td>
                              <td>${res.startTime}</td>
                              <td>${res.endTime} ${allVo.rankName}</td>
                              <td>${res.name}</td>
                              <td><button>취소</button></td>
                          </c:forEach>
                      </tbody>
                    </table>
                    <div class="list-page">
                      <c:if test="${allPv.currentPage > 1}">
                          <a href="${root}/attendance/admin/allList?page=${allPv.currentPage-1}">
                            <button style="border: none; background-color: #fff;">
                              <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                                <path d="M7.9499 9.53261C7.8796 9.46288 7.8238 9.37993 7.78573 9.28854C7.74765 9.19714 7.72805 9.09912 7.72805 9.00011C7.72805 8.9011 7.74765 8.80307 7.78573 8.71167C7.8238 8.62028 7.8796 8.53733 7.9499 8.46761L11.3924 5.03261C11.4627 4.96288 11.5185 4.87993 11.5566 4.78854C11.5946 4.69714 11.6142 4.59912 11.6142 4.50011C11.6142 4.4011 11.5946 4.30307 11.5566 4.21167C11.5185 4.12028 11.4627 4.03733 11.3924 3.96761C11.2519 3.82792 11.0618 3.74951 10.8636 3.74951C10.6655 3.74951 10.4754 3.82792 10.3349 3.96761L6.89239 7.41011C6.47104 7.83198 6.23438 8.40385 6.23438 9.00011C6.23438 9.59636 6.47104 10.1682 6.89239 10.5901L10.3349 14.0326C10.4746 14.1712 10.6631 14.2493 10.8599 14.2501C10.9586 14.2507 11.0564 14.2318 11.1478 14.1944C11.2392 14.1571 11.3223 14.1021 11.3924 14.0326C11.4627 13.9629 11.5185 13.8799 11.5566 13.7885C11.5946 13.6971 11.6142 13.5991 11.6142 13.5001C11.6142 13.4011 11.5946 13.3031 11.5566 13.2117C11.5185 13.1203 11.4627 13.0373 11.3924 12.9676L7.9499 9.53261Z" fill="#5B5B5B"/>
                              </svg>
                            </button>
                          </a>
                      </c:if>
                      <c:forEach var="pageNum" begin="${allPv.startPage}" end="${allPv.endPage}">
                        <c:choose>
                            <c:when test="${pageNum == allPv.currentPage}">
                                <button class="active">${pageNum}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${root}/attendance/admin/allList?page=${pageNum}">
                                    <button class="nomalBtn">${pageNum}</button>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${allPv.currentPage < allPv.maxPage}">
                        <a href="${root}/attendance/admin/allList?page=${allPv.currentPage+1}">
                          <button style="border: none; background-color: #fff;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18" fill="none">
                              <path d="M11.55 7.41011L8.10747 3.96761C7.96695 3.82792 7.77686 3.74951 7.57872 3.74951C7.38058 3.74951 7.1905 3.82792 7.04997 3.96761C6.97968 4.03733 6.92388 4.12028 6.88581 4.21167C6.84773 4.30307 6.82812 4.4011 6.82812 4.50011C6.82812 4.59912 6.84773 4.69714 6.88581 4.78854C6.92388 4.87993 6.97968 4.96288 7.04997 5.03261L10.5 8.46761C10.5703 8.53733 10.6261 8.62028 10.6641 8.71167C10.7022 8.80307 10.7218 8.9011 10.7218 9.00011C10.7218 9.09912 10.7022 9.19714 10.6641 9.28854C10.6261 9.37993 10.5703 9.46288 10.5 9.53261L7.04997 12.9676C6.90875 13.1078 6.82901 13.2984 6.82831 13.4975C6.8276 13.6965 6.90599 13.8876 7.04622 14.0289C7.18646 14.1701 7.37705 14.2498 7.57607 14.2505C7.7751 14.2512 7.96625 14.1728 8.10747 14.0326L11.55 10.5901C11.9713 10.1682 12.208 9.59636 12.208 9.00011C12.208 8.40385 11.9713 7.83198 11.55 7.41011Z" fill="#5B5B5B"/>
                            </svg>
                          </button>
                        </a>
                    </c:if>
                    </div>
                  </div>
              </div>
            <!-- </div> -->
        </div>
    </div>


</body>
</html>