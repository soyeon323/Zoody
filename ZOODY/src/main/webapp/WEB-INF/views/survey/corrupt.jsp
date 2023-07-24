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

        <form action="" onsubmit="return validateForm();">
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
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td> <input type="radio"  name="q1"  value="10"></td>
                        <td> <input type="radio"  name="q1"  value="20"></td>
                        <td> <input type="radio"  name="q1"  value="30"></td>
                        <td> <input type="radio"  name="q1"  value="40"></td>
                        <td> <input type="radio"  name="q1"  value="50"></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>동물원 내에서 일부 직원들에게 특혜를 주기 위한 행동을 하는 경우가 있다고 생각한다</td>
                        <td> <input type="radio"  name="q2"  value="10"></td>
                        <td> <input type="radio"  name="q2"  value="20"></td>
                        <td> <input type="radio"  name="q2"  value="30"></td>
                        <td> <input type="radio"  name="q2"  value="40"></td>
                        <td> <input type="radio"  name="q2"  value="50"></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>예산을 부정적인 사용을 위해 의도적으로 편성하는 경향이 있다고 생각한다.</td>
                        <td> <input type="radio"  name="q3"  value="10"></td>
                        <td> <input type="radio"  name="q3"  value="20"></td>
                        <td> <input type="radio"  name="q3"  value="30"></td>
                        <td> <input type="radio"  name="q3"  value="40"></td>
                        <td> <input type="radio"  name="q3"  value="50"></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>임원들은 직원의 이해관계에 치우치지 않고 공정하게 활동하고 있지 않다고 생각한다.</td>
                        <td> <input type="radio"  name="q4"  value="10"></td>
                        <td> <input type="radio"  name="q4"  value="20"></td>
                        <td> <input type="radio"  name="q4"  value="30"></td>
                        <td> <input type="radio"  name="q4"  value="40"></td>
                        <td> <input type="radio"  name="q4"  value="50"></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>동물원 에서 부패 관련 사건에 직접적으로 관여한 적이 있다.</td>
                        <td> <input type="radio"  name="q5"  value="10"></td>
                        <td> <input type="radio"  name="q5"  value="20"></td>
                        <td> <input type="radio"  name="q5"  value="30"></td>
                        <td> <input type="radio"  name="q5"  value="40"></td>
                        <td> <input type="radio"  name="q5"  value="50"></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>동물원 내에서 지년 1년간 금품이나 향응, 편의 제공을 목격한 적이 있다</td>
                        <td> <input type="radio"  name="q6"  value="10"></td>
                        <td> <input type="radio"  name="q6"  value="20"></td>
                        <td> <input type="radio"  name="q6"  value="30"></td>
                        <td> <input type="radio"  name="q6"  value="40"></td>
                        <td> <input type="radio"  name="q6"  value="50"></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>동물원에서는 부정 부패 방지 및 예방을 위해 최선을 다하고 있지 않다고 생각한다.</td>
                        <td> <input type="radio"  name="q7"  value="10"></td>
                        <td> <input type="radio"  name="q7"  value="20"></td>
                        <td> <input type="radio"  name="q7"  value="30"></td>
                        <td> <input type="radio"  name="q7"  value="40"></td>
                        <td> <input type="radio"  name="q7"  value="50"></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>동물원의 부정 부패·청렴 수준이 1 년전에 비해 개선되지 않았다고 생각한다.</td>
                        <td> <input type="radio"  name="q8"  value="10"></td>
                        <td> <input type="radio"  name="q8"  value="20"></td>
                        <td> <input type="radio"  name="q8"  value="30"></td>
                        <td> <input type="radio"  name="q8"  value="40"></td>
                        <td> <input type="radio"  name="q8"  value="50"></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>나는 동물원의 청렴수준을 신뢰하고 있지 있다.</td>
                        <td> <input type="radio"  name="q9"  value="10"></td>
                        <td> <input type="radio"  name="q9"  value="20"></td>
                        <td> <input type="radio"  name="q9"  value="30"></td>
                        <td> <input type="radio"  name="q9"  value="40"></td>
                        <td> <input type="radio"  name="q9"  value="50"></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>동물원 에서 부패 문화나 부패를 조장하는 요인들이 있다</td>
                        <td> <input type="radio"  name="q10"  value="10"></td>
                        <td> <input type="radio"  name="q10"  value="20"></td>
                        <td> <input type="radio"  name="q10"  value="30"></td>
                        <td> <input type="radio"  name="q10"  value="40"></td>
                        <td> <input type="radio"  name="q10"  value="50"></td>
                    </tr>
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
            console.log("총 점수: " + score);   //이 점수로 평균치 계산 해야함


        }
    }

</script>

     
       
        













