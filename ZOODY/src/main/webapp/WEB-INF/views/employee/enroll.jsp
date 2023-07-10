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
    #chart #optionRadio{
        display: grid;
        grid-template-rows: 65px 15px 65px;
        grid-template-columns: 250px 280px 969px;
        border: 1px solid #D7D7D7;
        background-color: white;
        width: 1500px;
        margin-left: 80px;
        margin-top: 40px;
    }
    #chart #optionRadio div{
        display: flex;
        align-items: center;
    }
    #chart #optionRadio div:nth-child(4){grid-column: span 3;}
    #hr01>hr{width: 1500px;}
    #chart #optionRadio div:first-child, #chart #optionRadio div:nth-child(5){
        font-size: 17px;
        margin-left: 25px;
    }
    #chart #optionRadio div:nth-child(2) input, #chart #optionRadio div:nth-child(6) input{
        margin-left: 15px;
    }
    #userBtn{
        margin-left: 80px;
        width: 1500px;
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }
    #userBtn input, #userBtn button{
        width: 160px;
        height: 37px;
        margin-left: 20px;
        color: white;
        border-radius: 10px;
        font-weight: 300;
    }
    #userBtn input{
        background-color: #5189FA;
        margin-right: 20px;
    }
    #userBtn button{
        background-color: #00CBA4;
        border: none;
    }
    #explanEnroll{
        margin-left: 80px;
        margin-top: 10px;
        color: #C5C5C5;
        font-weight: 300;
    }
    #explanEnroll>img{
        width: 15px;
        height: 15px;
    }
    #guideMent01>img{
        width: 15px;
        height: 15px;
    }
    #guideMent01{color: #C5C5C5; font-weight: 300;}
    #side-bar{
        width: 256px;
        height: 890px;
        background-color: white;
        position: absolute;
        left: -255px;
        top: 0px; 
        border-right: 1px solid #c5c5c58b;
        border-top: 1px solid #c5c5c58b;
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

    <div id="wrap">

        <!-- 임시사이드바 -->
        <div id="side-bar"></div>

        <div id="enroll">인사등록</div>

        <div id="chart">
            <form action="/app/employee/enroll" method="post" enctype="multipart/form-data">
                
                <table>
                    <tr id="chart-1">
                        <td rowspan="4"><img src="/zoody/resources/img/profile.png" alt="프로필기본사진"></td>
                        <td>이름</td>
                        <td>소속</td>
                        <td colspan="3">주디 동물원</td>
                    </tr>
                    <tr id="chart-2">
                        <td rowspan="3"><input type="text" name="name" placeholder="이름입력"></td>
                        <td>사번</td>
                        <td><input type="text" name="userNo" placeholder="사번입력" maxlength="6"></td>
                        <td>핸드폰번호</td>
                        <td><input type="tel" name="phone" placeholder="핸드폰번호입력" maxlength="13" oninput="formatPhoneNumber(this)"></td>
                    </tr>
                    <tr id="chart-3">
                        <td>이메일</td>
                        <td><input type="email" name="email" placeholder="이메일입력"></td>
                        <td>내선번호</td>
                        <td><input type="tel" name="companyTel" placeholder="내선번호입력" maxlength="11" oninput="formatCompanyNumber(this)"></td>
                    </tr>
                    <tr id="chart-4">
                        <td>직위/직책</td>
                        <td>
                            <select name="position" id="position" onchange="updateMoney()">
                                <option value="">사원</option>
                                <option value="">주임</option>
                                <option value="">대리</option>
                                <option value="">과장</option>
                                <option value="">차장</option>
                                <option value="">부장</option>
                            </select>
                        </td>
                        <td>대표전화</td>
                        <td><input type="tel" name="representTel" placeholder="내선번호입력" maxlength="11" oninput="formatRepresentNumber(this)"></td>
                    </tr>
                </table>
                
                <div id="enroll-btn">
                    <label for="file">
                        <div class="btn-upload">프로필 등록</div>
                    </label>
                    <input type="file" name="f" id="file" accept=".jpg, .png, .jpeg">
                </div>

                <table id="chart-content"> 
                    <tr id="content-1">
                        <td>입사일</td>
                        <td><input type="date" name="enrollDate"></td>
                        <td>생년월일</td>
                        <td><input type="date" name="birthday"></td>
                        <td>퇴사일</td>
                        <td><input type="date" name="leaveday"></td>
                    </tr>
                    <tr id="content-2">
                        <td>채용구분</td>
                        <td>
                            <select name="userSelect" id="userSelect">
                                <option value="">신입</option>
                                <option value="">경력</option>
                            </select>
                        </td>
                        <td>성별</td>
                        <td>
                            <select name="gender" id="gender">
                                <option value="">남</option>
                                <option value="">여</option>
                            </select>
                        </td>
                        <td>퇴직사유</td>
                        <td><input type="text" name="leaveReason" placeholder="퇴직사유입력"></td>
                    </tr>
                    <tr id="content-3"> 
                        <td>상태</td>
                        <td>
                            <select name="status" id="status">
                                <option value="">재직</option>
                                <option value="">퇴사</option>
                            </select>
                        </td>
                        <td>주소</td>
                        <td><input type="text" name="leaveReason" placeholder="주소입력"></td>
                        <td>급여구분</td>
                        <td id="salary"></td>
                    </tr>
                    <tr id="content-4">
                        <td>직무</td>
                        <td><input type="text" name="job" placeholder="직무입력"></td>
                        <td>프로젝트 참여여부</td>
                        <td>
                            <select name="projectYn" id="projectYn">
                                <option value="">참여</option>
                                <option value="">미참여</option>
                            </select> 
                        </td>
                        <td>직원구분</td>
                        <td>정직원</td>
                    </tr>
                </table>

                <div id="optionRadio">
                    <div>본인 인사정보 수정</div>
                    <div>
                        <input type="radio" checked name="userInfoModify" value="" id="InfoOk">
                        <label for="InfoOk">허용</label>
                        <input type="radio" name="userInfoModify" value="" id="InfoNo">
                        <label for="InfoNo">허용하지 않음</label>
                    </div>
                    <div></div>
                    <div id="hr01"><hr></div>
                    <div>부서장 인사정보 공개</div>
                    <div>
                        <input type="radio" checked name="HeadInfoYn" value="" id="InfoOk2">
                        <label for="InfoOk2">허용</label>
                        <input type="radio" name="HeadInfoYn" value="" id="InfoNo2">
                        <label for="InfoNo2">허용하지 않음</label>
                    </div>
                    <div id="guideMent01">
                        <img src="/zoody/resources/img/icon01.png" alt="아이콘">
                        <a>허용 : 임원에게 부서장의 인사정보를 공개함</a>
                    </div>
                </div>

                <div id="explanEnroll">
                    <img src="/zoody/resources/img/icon01.png" alt="아이콘">
                    <a>허위정보 기입 시 제재를 받을 수 있습니다.</a>
                </div>

                <div id="userBtn">
                    <input type="submit" value="등록" id="userEnroll">
                    <button id="enrollCancel">취소</button>
                </div>
            </form>
        </div>

    </div>

</body>
</html>
<script>
    function formatPhoneNumber(input) {
      var phoneNumber = input.value.replace(/\D/g, '');

      if (phoneNumber.length > 3) {
        phoneNumber = phoneNumber.slice(0, 3) + '-' + phoneNumber.slice(3);
      }
      if (phoneNumber.length > 7) {
        phoneNumber = phoneNumber.slice(0, 8) + '-' + phoneNumber.slice(8);
      }

      input.value = phoneNumber;
    }

    function formatCompanyNumber(input) {
      var companyNumber = input.value.replace(/\D/g, '');

      if (companyNumber.length > 2) {
        companyNumber = companyNumber.slice(0, 2) + '-' + companyNumber.slice(2);
      }
      if (companyNumber.length > 6) {
        companyNumber = companyNumber.slice(0, 6) + '-' + companyNumber.slice(6);
      }

      input.value = companyNumber;
    }

    function formatRepresentNumber(input) {
        formatCompanyNumber(input);
    }

    document.addEventListener("DOMContentLoaded", function() {
         updateMoney();
    });

    function updateMoney() {
        const position = document.querySelector("#position");
        const selectedText = position.options[position.selectedIndex].innerText;
        document.querySelector("#salary").innerText = selectedText;
    }
</script>