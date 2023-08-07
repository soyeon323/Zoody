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
                <div id="content-area">
                    <div>검진일시 : ${hvo.checkupDate}</div>
                    <div>건강검진 종합 소견</div>
                    <br>
                    <form action="${root}/animal/health/edit" method="POST">
                        <input type="hidden" value="${hvo.no}">
                        <span>유질환</span>
                        <textarea id="t1" cols="30" rows="10" readonly>${hvo.disease}</textarea>
                        <textarea name="disease"  id="t11" cols="30" rows="10" style="display: none;">${hvo.disease}</textarea>
                        
                        <br>
                        <span>생활 습관 관리</span>
                        <textarea  id="t2" cols="30" rows="9" readonly>${hvo.lifeStyleManagement}</textarea>
                        <textarea name="lifeStyleManagement" id="t22" cols="30" rows="9" style="display: none;">${hvo.lifeStyleManagement}</textarea>
                        <br>
                        <span>의사 소견</span>
                        <textarea  id="t3" cols="30" rows="10" readonly>${hvo.stateOfHealth}</textarea>
                        <textarea name="stateOfHealth" id="t33" cols="30" rows="10" style="display: none;" >${hvo.stateOfHealth}</textarea>
                    </div>

                    <div id="btn-area">
                            <div class="btn-upload" onclick="back()">닫기</div>
                            <input type="submit" class="btn-upload"  style="display: none;" value="수정하기"/>
                            <input type="button" style="" class="btn-upload" value="수정">
                    </div>
                        
                    </form>
                    
        </div>
    </div>

</body>
</html>
<script>
    const t1 = document.querySelector('#t1');
    const t2 = document.querySelector('#t2');
    const t3 = document.querySelector('#t3');

    const t11 = document.querySelector('#t11');
    const t22 = document.querySelector('#t22');
    const t33 = document.querySelector('#t33');
    
    
    const inputBtn = document.querySelector('input[type="submit"]');
    
    const btn = document.querySelector('input[type="button"]');
    btn.addEventListener('click' ,function () {
        t1.style.display='none';
        t2.style.display='none';
        t3.style.display='none';

        t11.style.display='block';
        t22.style.display='block';
        t33.style.display='block';
        inputBtn.style.display='block';
        btn.style.display='none';
    });

  function back() {
    location.href = "${root}/animal/health/list?page=1";
  }
</script>