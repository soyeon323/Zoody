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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<link rel="stylesheet" href="${root}/resources/css/attendance/objection.css">
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
        <div id="obj_main">
            <!-- 맨 윗 줄 -->
            <div class="obj_count">
                <p>이의신청 건수</p>
                <svg xmlns="http://www.w3.org/2000/svg" width="26" height="26" viewBox="0 0 26 26" fill="none">
                    <circle cx="13" cy="13" r="13" fill="#EFF5FF"/>
                </svg>
                <p>100</p>
            </div>
            <div class="obj_search">
                <div class="search-area">
                    <p>날짜</p>
                </div>
                <div></div>
                <div class="search-flex">
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example">
                      <option selected>전체</option>
                      <option value="1">상태</option>
                    </select>
                    <div class="search-input">
                      <input type="text" placeholder="내용을 입력하세요.">
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
                    </div>
                  </div>
            </div>
            <div class="obj_table">
                
            </div>
        </div>
    </div>
    
</body>
</html>