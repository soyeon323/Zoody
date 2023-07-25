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
            <a>동물 훈련 일지 조회</a>
        </div>

        <div id="back">

            <div id="firstDiv">
                <input type="text" name="searchValue" placeholder="애칭 입력">
                <input type="submit" value="검색">
            </div>

            <div id="newEmployee">
            </div>
            <div>
                <table id="content">
                    <thead>
                        <tr>
                            <td>번호</td>
                            <td>애칭</td>
                            <td>훈련일지 제목</td>
                            <td>작성 날짜</td>
                        </tr>
                    </thead>
                    <tbody>
                       <c:forEach items="${map.trainingVo}" var="trainingVo">
                        <tr onclick="trainingdetail('${trainingVo.no}');">
                            <td>${trainingVo.trainingNo}</td>
                            <td>${trainingVo.nickName}</td>
                            <td>${trainingVo.title}</td>
                            <td>${trainingVo.date}</td>
                        </tr>
                       </c:forEach>
                      
                    </tbody>
                </table>
            </div>
            
        </div>
        
            <div id="page">
                <c:if test="${map.pv.currentPage > 1}">
                    <a href="${root}/animal/training/list?page=${map.pv.currentPage - 1}">
                        <img src="${root}/resources/img/icon/png/left.png" alt="왼쪽화살표">
                    </a>
                </c:if>
            
                <c:forEach begin="${map.pv.startPage}" end="${map.pv.endPage}" step="1" var="i">
                    
                        <c:if test="${map.pv.currentPage ne i}">
                            <a href="${root}/animal/training/list?page=${i}">${i}</a>
                        </c:if>

                        <c:if test="${mpa.pv.currentPage == i}">
                            <a style="font-size: 0.5em; display: block;">${i}</a>
                        </c:if>

                </c:forEach>
            
                <c:if test="${map.pv.currentPage < map.pv.maxPage}">
                    <a href="${root}/animal/training/list?page=${map.pv.currentPage + 1}">
                        <img src="${root}/resources/img/icon/png/right.png" alt="오른쪽화살표">
                    </a>
                </c:if>
            </div>
    </div>

</body>
</html>

<script>

    //훈련일지 작성
    function trainingWrite(no){

        location.href = "${root}/animal/training?animalNo="+no;

        // $.ajax({
        //     url : '${root}/animal/training',
        //     method : 'GET',
        //     data : {
        //         no : 'no'
        //     },
        //     success : ()=>{
        //         location.href = '${root}/animal/training?no='+no;
        //     },
        //     error : (e)=>{
        //         location.href = '${root}/animal/training?no='+no;
        //     }
        // });
    }

    //훈련 일지 상세 조회
    function trainingdetail(no){

        $.ajax({
            url : '${root}/animal/training/detail',
            method : 'GET',
            // data : {
            //     no : no
            // },
            success : ()=>{
                location.href = '${root}/animal/training/detail?no='+no;
            },
            error : ()=>{
                location.href = '${root}/animal/training/detail?no='+no;
            }
        });
    }
  
</script>
