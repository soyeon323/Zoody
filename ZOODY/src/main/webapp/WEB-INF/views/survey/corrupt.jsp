<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/employee/detail.css">
<link rel="stylesheet" href="${root}/resources/css/survey/survey.css">
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

        <div id="title">부패도 설문 조사</div>

        <form action="${root}/corrupt/survey/score" onsubmit="return validateForm();">
            <table id="table" >
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>측정 문항</th>
        
                        <th>매우 아니다</th>
                        <th>아니다</th>
                        <th>보통이다</th>
                        <th>그렇다</th>
                        <th>매우 그렇다</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${svo}" var="svo">
                        <tr>
                            <td>${svo.no}</td>
                            <td>${svo.content}</td>
                            <td><input type="radio"  name="q${svo.no}"  value="2"></td>
                            <td><input type="radio"  name="q${svo.no}"  value="4"></td>
                            <td><input type="radio"  name="q${svo.no}"  value="6"></td>
                            <td><input type="radio"  name="q${svo.no}"  value="8"></td>
                            <td><input type="radio"  name="q${svo.no}"  value="10"></td> 
                        </tr>
                    </c:forEach>
                </tbody>
              </table>
              <input class="btn btn-primary" style="margin-left: 800px;" type="submit" value="제출"  onclick="score();">
              <input type="button" value="초기화" class="btn btn-success" id="initBtn" onclick="deselect();">
            </form>
           
</body>
</html>

<script>

    //초기화
    function deselect() {
    $("input[type='radio']").prop('checked', false);

    }
    
    function validateForm() {
        var radios = document.querySelectorAll('input[type="radio"]:checked');
        var totalQuestions = 10; // 전체 문항 수

        if (radios.length !== totalQuestions) {
            alert("모든 문항에 체크해주세요.");
            return false;
         }
        }


    // 전체 문항의 합산 점수 가져오기
    function score() {
        var radios = document.querySelectorAll('input[type="radio"]:checked');
        var totalQuestions = 10; // 전체 문항 수
        var score = 0;

        if (radios.length == totalQuestions) {
            for (var i = 0; i < radios.length; i++) {
                score += parseInt(radios[i].value);
            }
            alert(score);
            console.log("총 점수: " + score);   //이 점수로 평균치 계산 해야함
        }
    }

</script>

     
       
        













