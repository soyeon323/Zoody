<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/setup.jsp" %>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
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
            
            <div class="form-group email-form">
                <label for="email">이메일</label>
                <div class="input-group">
               <input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
               <select class="form-control" name="userEmail2" id="userEmail2" >
               <option>@naver.com</option>
               <option>@daum.net</option>
               <option>@gmail.com</option>
               <option>@hanmail.com</option>
                <option>@yahoo.co.kr</option>
               </select>
            </div>   
           <div class="input-group-addon">
               <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
           </div>
               <div class="mail-check-box">
           <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
           </div>
               <span id="mail-check-warn"></span>
           </div>
		</div>
</body>
</html>

<script>

$('#mail-Check-Btn').click(function() {
		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인  ghdh21@naver.com
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		$.ajax({
			url : '${root}/mail/email?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			type : 'get',
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); 
	});

    // 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});

</script>
