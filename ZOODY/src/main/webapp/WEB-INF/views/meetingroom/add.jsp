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
<link rel="stylesheet" href="${root}/resources/css/meetingroom/add.css">
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
                <div aria-label="breadcrumb">
                    <ol class="breadcrumb">
                      <li class="breadcrumb-item"><a href="#">일정등록</a></li>
                      <li class="breadcrumb-item"><a href="${root}/meetingroom/reserve">회의실 상세 예약</a></li>
                      <li class="breadcrumb-item active" aria-current="page">회의실 등록</li>
                    </ol>
                </div>
            </div>
            <div class="add-form">
                <table class="board_view">
                    <colgroup>
                        <col width="15%">
                        <col width="40%">
                        <col width="15%">
                        <col width="*">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>회의실명</th>
                            <td colspan="4"><input type="text"></td>
                        </tr>
                        <tr>
                            <th>수용가능인원</th>
                            <td><input type="number" name="" id=""></td>
                            <th>개방시간</th>
                            <td><input type="time" name="" id=""> ~ <input type="time" name="" id=""></td>
                        </tr>
                        <!-- 후기게시판과 큐엔에이 게시판에만 보임 -->
                        <tr>
                            <th>정보</th>
                            <td colspan="4" style="height: 500px;"></td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="4"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</body>
</html>