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

        <div id="enroll">
            <a>인사상세조회</a>
            <a>내용을 클릭하여 수정할 수 있습니다.</a>
        </div>

        <div id="chart">
            <form action="${root}/employee/detail" method="post" enctype="multipart/form-data">
                <input type="hidden" value="${vo.no}" name="no">
                <table>
                    <tr id="chart-1">
                        <td rowspan="4" id="image_container"><img src="${root}/resources/img/employee/${vo.profile}" alt="프로필기본사진"></td>
                        <td>이름</td>
                        <td>소속</td>
                        <td colspan="3">주디 동물원</td>
                    </tr>
                    <tr id="chart-2">
                        <td rowspan="3"><input type="text" name="name" value="${vo.name}"></td>
                        <td>사번</td>
                        <td><input type="text" name="id" value="${vo.id}" disabled></td>
                        <td>핸드폰번호</td>
                        <td><input type="tel" name="phone" value="${vo.phone}" maxlength="13" oninput="formatPhoneNumber(this)"></td>
                    </tr>
                    <tr id="chart-3">
                        <td>이메일</td>
                        <td><input type="email" name="mail" value="${vo.mail}"></td>
                        <td>내선번호</td>
                        <td><input type="tel" name="officeNumber" value="${vo.officeNumber}" maxlength="11" oninput="formatCompanyNumber(this)"></td>
                    </tr>
                    <tr id="chart-4">
                        <td>직위/직책</td>
                        <td>
                            <select name="rankNo" id="position" onchange="updateMoney()">
                                <option value="4" ${vo.rankNo == 4 ? 'selected' : ''}>팀장</option>
                                <option value="32" ${vo.rankNo == 32 ? 'selected' : ''}>실장</option>
                                <option value="31" ${vo.rankNo == 31 ? 'selected' : ''}>과장</option>
                                <option value="2" ${vo.rankNo == 2 ? 'selected' : ''}>부장</option>
                                <option value="1" ${vo.rankNo == 1 ? 'selected' : ''}>동물원장</option>
                            </select>
                        </td>
                        <td>대표전화</td>
                        <td><input type="tel" name="representTel" placeholder="02-123-4657" maxlength="11" oninput="formatRepresentNumber(this)"></td>
                    </tr>
                </table>
                
                <div id="enroll-btn">
                    <label for="file">
                        <div class="btn-upload">프로필 등록</div>
                    </label>
                    <input type="file" name="f" id="file" accept=".jpg, .png, .jpeg" onchange="imgUpload(event)">
                </div>

                <table id="chart-content"> 
                    <tr id="content-1">
                        <td>입사일</td>
                        <td><input type="text" name="registrationDate" value="${vo.registrationDate}"></td>
                        <td>생년월일</td>
                        <td><input type="text" name="birthDate" value="${vo.birthDate}"></td>
                        <td>퇴사일</td>
                        <td><input type="text" name="leaveDate" value="${vo.leaveDate}"></td>
                    </tr>
                    <tr id="content-2">
                        <td>채용구분</td>
                        <td>
                            <select name="divisionNo" id="userSelect">
                                <option value="1" ${vo.divisionNo == 1 ? 'selected' : ''}>신입</option>
                                <option value="2" ${vo.divisionNo == 2 ? 'selected' : ''}>경력</option>
                            </select>
                        </td>
                        <td>성별</td>
                        <td>
                            <select name="gender" id="gender">
                                <option value="1" ${vo.gender == 1 ? 'selected' : ''}>남</option>
                                <option value="2" ${vo.gender == 2 ? 'selected' : ''}>여</option>
                            </select>
                        </td>
                        <td>퇴직사유</td>
                        <td><input type="text" name="leaveReason" value="${vo.leaveReason}"></td>
                    </tr>
                    <tr id="content-3"> 
                        <td>상태</td>
                        <td>
                            <select name="stateNo" id="status">
                                <option value="1" ${vo.stateNo == 1 ? 'selected' : ''}>재직</option>
                                <option value="3" ${vo.stateNo == 3 ? 'selected' : ''}>퇴사</option>
                            </select>
                        </td>
                        <td>주소</td>
                        <td><input type="text" name="address" value="${vo.address}" onclick="openAddress();" id="addressInput"></td>
                        <td>급여구분</td>
                        <td id="salary"></td>
                    </tr>
                    <tr id="content-4">
                        <td>잔여휴가일</td>
                        <td><input type="text" name="leaveCount" value="${vo.leaveCount}"></td>
                        <td>부서</td>
                        <td>
                            <select name="departmentNo" id="department">
                                <option value="111" ${vo.departmentNo == 111 ? 'selected' : ''}>총무과</option>
                                <option value="112" ${vo.departmentNo == 112 ? 'selected' : ''}>운영과</option>
                                <option value="113" ${vo.departmentNo == 113 ? 'selected' : ''}>시설과</option>
                                <option value="114" ${vo.departmentNo == 114 ? 'selected' : ''}>조경과</option>
                                <option value="121" ${vo.departmentNo == 121 ? 'selected' : ''}>동물기획과</option>
                                <option value="122" ${vo.departmentNo == 122 ? 'selected' : ''}>동물복지1과</option>
                                <option value="123" ${vo.departmentNo == 123 ? 'selected' : ''}>동물복지2과</option>
                                <option value="124" ${vo.departmentNo == 124 ? 'selected' : ''}>종보전 연구실</option>
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
                        <img src="${root}/resources/img/icon/png/icon01.png" alt="아이콘">
                        <a>허용 : 임원에게 부서장의 인사정보를 공개함</a>
                    </div>
                </div>

                <div id="explanEnroll">
                    <img src="${root}/resources/img/icon/png/icon01.png" alt="아이콘">
                    <a>허위정보 기입 시 제재를 받을 수 있습니다.</a>
                </div>

                <div id="userBtn">
                    <input type="submit" value="수정" id="userEnroll">
                    <button id="enrollCancel" type="button" onclick="editCancel();">취소</button>
                </div>
            </form>
        </div>

    </div>

</body>
</html>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

    //이미지 미리보기
    function imgUpload(event){
        var reader = new FileReader();

        reader.onload = function(event) {
        var originImg = document.querySelector("#image_container>img");
        var img = document.createElement("img");
        originImg.style.display = 'none';
        img.setAttribute("src", event.target.result);
        document.querySelector("#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }

    //주소입력 api열기
    function openAddress(){
        new daum.Postcode({
        oncomplete: function(data) {
            document.querySelector("#addressInput").value = data.address;
        }
    }).open();
    }
    
    //취소하면 목록으로
    function editCancel(){
        if(confirm("목록으로 돌아가시겠습니까?")) {
            location.href = '${root}/employee/list';
        }
        return;
    }
</script>