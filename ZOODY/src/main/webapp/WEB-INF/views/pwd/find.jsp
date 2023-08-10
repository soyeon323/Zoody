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
		<h1>비밀번호 찾기 (전화번호로... 아직 구현중.. 새로운 비밀번호 발급 할 예정)</h1>
            <form action="${root}/pwd/pwdSetting" method="POST">   
                <span>아이디</span> 
                <input type="text" name="id" id="id" placeholder="사번">
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="button" value="사번 확인" onclick="success();"> 
                <br><br><br>
                    <span>비밀번호 설정</span><span id="lengthMsg" style="color: red; font-size: 0.8em;">(5글자 이상)</span><span id="specialCharMsg" style="color: red;  font-size: 0.8em;"> (특수문자가 하나 이상)</span>
                <input type="password"  placeholder="비밀번호" id="pwdSet1">
                
                <br>
                <span>비밀번호 일치 확인</span>
                <input type="password" name="pwd" placeholder="비밀번호" id="pwdSet2">
                
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em;" type="button" id="pwdCheck" value="비밀번호 일치 확인"> 
                <br><br>
                <input class="btn btn-primary" style="color: whitesmoke; height: 30px; font-size: 0.5em" type="submit" value="비밀번호 설정 하기"> 
            </form>
		</div>
</body>
</html>

<script>
    
    function success() {
        let id = document.getElementById('id').value;
    $.ajax({
        url : '${root}/pwd/setting',
        method : 'POST',
        data : {
            'id' : id,
        },
        dataType : 'json',
        success : (result)=>{
            console.log(result);
           if(result ==1){
            alert('아이디(사번) 인증 완료');
           }else{
            alert('아이디를(사번) 을 다시 확인해 주세요');
           }
        },
        error: ()=>{
            alert('아이디를(사번) 을 다시 확인해 주세요');
        }
    });
   }



  



    // 비밀번호 keyup
    const pwdSet1Input = document.getElementById('pwdSet1');
    pwdSet1Input.addEventListener('keyup', validatePassword);

    // 비밀번호 설정
    function setPassword() {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthMsg = document.getElementById('lengthMsg');
    const specialCharMsg = document.getElementById('specialCharMsg');

    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (lengthValid && specialCharValid) {
        if (pwdSet1 === pwdSet2) {
            // 모든 조건을 만족하고 일치할 경우 비밀번호 설정
            alert('비밀번호 설정이 완료되었습니다.');
            // 여기서 실제로 서버로 비밀번호를 보내거나 다른 처리를 수행해야 합니다.
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    } else {
        alert('비밀번호 조건을 다시 확인해주세요.');
    }
}




// 비밀번호 일치 확인 버튼 클릭 이벤트
const pwdCheck = document.querySelector('#pwdCheck');
pwdCheck.addEventListener('click', () => {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (lengthValid && specialCharValid && pwdSet1 === pwdSet2) {
        alert('비밀번호 설정이 완료되었습니다.');
    } else {
        alert('비밀번호 조건을 다시 확인해주세요.');
    }
});



// 비밀번호 설정하기 버튼 클릭 이벤트
const submitBtn = document.querySelector('input[type="submit"]');
submitBtn.addEventListener('click', (event) => {
    const pwdSet1 = document.getElementById('pwdSet1').value;
    const pwdSet2 = document.getElementById('pwdSet2').value;

    // 비밀번호 조건 검사
    const lengthValid = pwdSet1.length >= 5;
    const specialCharValid = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/.test(pwdSet1);

    if (!lengthValid || !specialCharValid || pwdSet1 !== pwdSet2) {
        alert('비밀번호 조건을 다시 확인해주세요.');
        event.preventDefault(); // 폼 제출 막기
    }
});




    //유효성 검사 
    function validatePassword() {
        const pwdSet1 = pwdSet1Input.value;
        
        const lengthMsg = document.getElementById('lengthMsg');
        const specialCharMsg = document.getElementById('specialCharMsg');

        lengthMsg.style.display = pwdSet1.length < 5 ? 'block' : 'block';
        lengthMsg.style.color = pwdSet1.length < 5 ? 'red' : 'blue';

        const specialChars = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/;
        specialCharMsg.style.display = specialChars.test(pwdSet1) ? 'block' : 'block';
        specialCharMsg.style.color = specialChars.test(pwdSet1) ? 'blue' : 'red';
    }

</script>