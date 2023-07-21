<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${root}/resources/css/pwd/pwd-setting.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
</style>
</head>
<body>
		<div id="wrap">
            <form>
                <!-- action="${zoody}/" method="POST" -->
                <span>아이디 (사번)</span> <span id="span">아이디 인증 완료</span>
                <input type="text" name="id" id="id" placeholder="사번">
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="사번 확인" onclick="success();"> 
                <br><br><br>
                <span>초기 비밀번호</span>
                <input type="text" name="" placeholder="초기 비밀번호" id="pwdSet1">
                <br>
                <span>초기 비밀번호</span>
                <input type="text" name="" placeholder="초기 비밀번호" id="pwdSet2">
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em;" type="submit" value="비밀번호 일치 확인"> 
                <br><br>
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="비밀번호 설정 하기"> 
            </form>
		</div>
</body>
</html>

<script>

    //아이디 인증시 innerHTML 초록색 글씨로 '인증 완료' 라고 띄울 예정
    let span = document.getElementById('span');
    span.style.display = 'none';


   function success() {

    let id = document.getElementById('id');

    $.ajax({
        url : '${root}/pwd/setting',
        method : 'POST',
        data : {
            'id' : id,
        },
        success : ()=>{
            alert('통신 성공');
           if(result == 1){
            alert('아이디(사번) 인증 완료');
           }else{
            alert('아이디를(사번) 을 다시 확인해 주세요');
           }
        },
        error: (e)=>{
            alert(e);
        }
    });
   }

</script>