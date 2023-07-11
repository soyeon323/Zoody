<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap{
        width: 1663px;
        height: 93vh;
        position: absolute;
        top: 65px;
        left: 255px;
    }
    #enroll{
        font-size: 20px;
        font-weight: 600;
        margin-top: 40px;
        margin-left: 80px;
    }
    #chart table,#chart td,#chart th {
        border: 1px solid #D7D7D7;
        background-color: white;
        border-collapse: collapse;
        text-align: center;
        vertical-align: middle;
    }
    #chart table{
        margin-left: 80px;
        margin-top: 30px;
        width: 1500px;
        height: 200px;
    }
    #chart-1 td:first-child, #chart-1 td:nth-child(2), #chart-1 td:nth-child(3), #chart-3 td:nth-child(3){
        width: 210px;
    } 
    #chart-1 td:nth-child(2), #chart-1 td:nth-child(3), #chart-2 td:nth-child(2),
    #chart-3 td:first-child, #chart-4 td:first-child, #chart-2 td:nth-child(4),
    #chart-3 td:nth-child(3), #chart-4 td:nth-child(3){
        background-color: #ececec95;
        color: #4B4B4B;
        height: 50px;
    }

    #chart-1 td:nth-child(4), #chart-2 td:first-child, #chart-2 td:nth-child(3), #chart-2 td:nth-child(5),
    #chart-3 td:nth-child(2), #chart-3 td:nth-child(4), #chart-4 td:nth-child(2), #chart-4 td:nth-child(4){
        font-size: 17px;
    }
    #chart-1 img{
        display: block; 
        margin: 0 auto;
        vertical-align: middle;
    }
    .btn-upload {
        width: 160px;
        height: 37px;
        background: #00BEEA;
        border: 1px solid #E0E0E0;
        color: white;
        border-radius: 10px;
        font-weight: 300;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 10px;
        margin-left: 105px;
    }
    input::placeholder {color:#c5c5c5; font-weight: 300;}
    #file {display: none;}
    input{
        border: none;
        text-align: center;
    }
    select{
        width: 100px;
        text-align: center;
    }
    #content-1 td:first-child, #content-1 td:nth-child(3), #content-1 td:nth-child(5),
    #content-2 td:first-child, #content-2 td:nth-child(3), #content-2 td:nth-child(5),
    #content-3 td:first-child, #content-3 td:nth-child(3), #content-3 td:nth-child(5),
    #content-4 td:first-child, #content-4 td:nth-child(3), #content-4 td:nth-child(5){
        background-color: #ececec95;
        color: #4B4B4B;
        width: 180px; 
    }

    #content-1 td:nth-child(2), #content-1 td:nth-child(4){
        width: 329px;
    }

    #btn-area{
        display: flex;
        justify-content: space-evenly;
    }

    .btn-upload:hover{
        background-color: rgb(56, 211, 115);
    }

    .btn-upload:nth-child(2):hover{
        background-color: rgb(211, 79, 56);
    }

    #content-area{
        margin-left: 100px;
        margin-top: 30px;
    }
    #content-area{
        display: grid;
        grid-gap: 10px;
    }

    #t1 ,#t2 ,#t3{
        resize: none;
        width: 100%;
    }

    #t1{
        height: 30px;

    }
    </style>
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

        <div id="enroll">훈련 일지 작성 </div>

                <div id="content-area">
                    <br>
                    <span>제목</span>
                    <textarea name="" id="t1" cols="30" rows="10"></textarea>
                  
                    <span>의사 소견</span>
                    <textarea name="" id="t3" cols="30" rows="10"></textarea>
                </div>
                <div id="btn-area">
                        <div class="btn-upload">등록</div>
                        <div class="btn-upload">닫기</div>
                </div>
              
            </form>
        </div>

    </div>

</body>
</html>
<script>
  
</script>