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
        <form action="${root}/meetingroom/add" method="POST">
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
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th>회의실명</th>
                                <td>
                                    <input type="text" class="form-control" id="formGroupExampleInput" name="name">
                                </td>
                            </tr>
                            <tr>
                                <th>개방시간</th>
                                <td>
                                    <input class="form-control" type="text" placeholder="오전 9:00 - 오후 6:00" aria-label="Disabled input example" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>수용가능인원</th>
                                <td>
                                    <input type="number" name="capacity" id="">
                                </td>
                            </tr>
                            <tr>
                                <th>정보</th>
                                <td style="height: 500px;">
                                    <div class="form-floating">
                                        <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="info"></textarea>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>회의실 썸네일</th>
                                <td>
                                    <div class="mb-3">
                                        <input class="form-control form-control-sm" type="file" id="formFileSm" name="originName">
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="add-btn">
                        <input type="submit" value="등록완료">
                    </div>
                </div>
            </div>
        </form>
    </div>

    
</body>
</html>