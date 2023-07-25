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
    <h1>${no}</h1>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>

    <div id="wrap">

        <div id="enroll">동물 건강 검진 작성</div>

        <div id="chart">
           
                <div id="enroll-btn">
                    <label for="file">
                    </label>
                    <input type="file" name="f" id="file" accept=".jpg, .png, .jpeg">
                </div>
                <form action="${root}/animal/health/write" method="post" >
                <div id="content-area">
                    <div>건강검진 종합 소견 작성</div>
                    <br>
                    <span>유질환</span>
                    <textarea name="disease" id="t1" cols="30" rows="10"></textarea>
                    <br>
                    <span>생활 습관 관리</span>
                    <textarea name="lifeStyleManagement" id="t2" cols="30" rows="9"></textarea>
                    <br>
                    <span>의사 소견</span>
                    <textarea name="content" id="t3" cols="30" rows="10"></textarea>
                </div>  
                  

                <div id="btn-area">
                        <input type="submit" class="btn-upload" value="작성">
                        <div class="btn-upload" onclick="f01();">닫기</div>
                </div>
              
            </form>
        </div>

    </div>

</body>
</html>
<script>
    function f01() {
        location.href='${root}/animal/list?page=1';
    }
</script>