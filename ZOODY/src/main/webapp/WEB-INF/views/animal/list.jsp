<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동물 목록</title>
<link rel="stylesheet" href="${root}/resources/css/animal/list.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="enroll">
            <a>동물 목록</a>
        </div>

        <div id="back">

            <div id="firstDiv">
                <a>현재 보유 동물 수 </a>
                <select name="searchType" id="classFication">
                    <option value="">조류</option>
                    <option value="">포유류</option>
                    <option value="">양서류</option>
                </select>
                <input type="text" name="searchValue" placeholder="이름 입력">
                <input type="submit" value="검색">
            </div>

            <div id="newEmployee">
                <a href="" class="btn btn-primary">새로운 동물 등록</a>
            </div>
            <div>
                <table id="content">
                    <thead>
                        <tr>
                            <td>번호</td>
                            <td>담당자</td>
                            <td>동물 번호</td>
                            <td>애칭</td>
                            <td>방사장</td>
                            <td>식성</td>
                            <td>서식지</td>
                            <td>등록 일시</td>
                            <td>훈련 일지</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>번호</td>
                            <td>담당자</td>
                            <td>동물 번호</td>
                            <td>애칭</td>
                            <td>방사장</td>
                            <td>식성</td>
                            <td>서식지</td>
                            <td>등록 일시</td>
                            <td><button   onclick="location.href='/zoody/animal/training'" style="font-size: 0.94em;" class="btn btn-primary" id="trainingBtn">훈련 일지 작성</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
        </div>
        
        <div id="page">
            <a href=""><img src="${root}/resources/img/left.png" alt="왼쪽화살표"></a>
            <a href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href=""><img src="${root}/resources/img/right.png" alt="오른쪽화살표"></a>
        </div>
    </div>

</body>
</html>