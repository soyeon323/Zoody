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
                <a>현재 보유 동물 수 ${map.getAnimalListCnt}</a>
                <form action="${root}/animal/list" method="GET">
                    <!-- <select name="searchType" id="">
                        <option value="1">아프리카</option>
                        <option value="2">유럽</option>
                        <option value="3">중동</option>
                        <option value="4">아시아</option>
                        <option value="5">북아메리카</option>
                        <option value="6">남아메리카</option>
                        <option value="7">오세아니아</option>
                    </select> -->
                    <input type="text" name="searchValue" placeholder="애칭 입력">
                    <input type="submit" class="btn btn-primary" value="검색">
                </form>
            </div>

            <div id="newEmployee">
                <a href="${root}/animal/enroll" class="btn btn-primary">새로운 동물 등록</a>
            </div>
            <div>
                <table id="content">
                    <thead>
                        <tr>
                            <td>번호</td>
                            <td>애칭</td>
                            <td>방사장</td>
                            <td>식성</td>
                            <td>서식지</td>
                            <td>등록 일시</td>
                            
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${map.animalList}" var="animalList">
                       	<tr onclick="detail('${animalList.no}')">
                            <td>${animalList.no}</td>
                            <td>${animalList.nickName}</td>
                            <td>${animalList.feild}</td>
                            <td>${animalList.taste}</td>
                            <td>${animalList.habitat}</td>
                            <td>${animalList.date}</td>
                            
                        </tr>
                       </c:forEach>
                      
                    </tbody>
                </table>
            </div>
            
        </div>
        
            <div id="page">
                <c:if test="${map.pv.currentPage > 1}">
                    <a href="${root}/animal/list?page=${map.pv.currentPage - 1}">
                        <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                    </a>
                </c:if>
            
                <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" step="1" var="i">
                    
                        <c:if test="${map.pv.currentPage ne i}">
                            <a href="${root}/animal/list?page=${i}">${i}</a>
                        </c:if>

                        <c:if test="${mpa.pv.currentPage == i}">
                            <a style="font-size: 0.5em; display: block;">${i}</a>
                        </c:if>

                </c:forEach>
            
                <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                    <a href="${root}/animal/list?page=${map.pv.currentPage + 1}">
                        <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                    </a>
                </c:if>
            </div>
    </div>

</body>
</html>

<script>

    //동물 상세 조회
    function detail(no){
        $.ajax({
            url : '${root}/animal/detail',
            method : 'GET',
            data : {
                no : 'no'
            },
            success : ()=>{
                location.href = '${root}/animal/detail?no='+no;
            },
            error : (e)=>{
                location.href = '${root}/animal/detail?no='+no;
            }
        });
    }
  
</script>
