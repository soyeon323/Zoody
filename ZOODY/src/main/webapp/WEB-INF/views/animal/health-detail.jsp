<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/animal/health.css">
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

        <div id="enroll">동물 건강 정보 상세 조회</div>

        <div id="chart">
                <div id="enroll-btn">
                    <label for="file">
                    </label>
                    <input type="file" name="f" id="file" accept=".jpg, .png, .jpeg">
                </div>
                <div id="content-area">
                    <div>건강검진 종합 소견</div>
                    <br>
                    <span>유질환</span>
                    <textarea name="" id="t1" cols="30" rows="10"></textarea>
                    <br>
                    <span>생활 습관 관리</span>
                    <textarea name="" id="t2" cols="30" rows="9"></textarea>
                    <br>
                    <span>의사 소견</span>
                    <textarea name="" id="t3" cols="30" rows="10"></textarea>
                </div>

                <div id="btn-area">
                        <div class="btn-upload">닫기</div>
                </div>
              
        </div>

    </div>

</body>
</html>
<script>
  
</script>