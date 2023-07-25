<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/animal/enroll.css">
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

        <div id="enroll">동물 등록</div>

        <div id="chart">
            <form action="${root}/animal/enroll" method="post" enctype="multipart/form-data">
                
                <table>
                    <tr id="chart-1">
                        <td rowspan="4" id="image_container"><img ></td>
                        <td>이름</td>
                        <td>계 통</td>
                        <td colspan="3">
                            <select name="animalClassificationNo" id="position">
                                <option value="1">포유류</option>
                                <option value="2">조류</option>
                                <option value="3">파충류</option>
                                <option value="4">양서류</option>
                                <option value="5">어류</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="chart-2">
                        <td rowspan="2"><input type="text" name="name" placeholder="이름입력"></td>
                        <td>담당 부서</td>
                        <td>
                             <select name="departmentNo" id="position">
                            <option value="1">자연학습</option>
                            <option value="2">조류팀</option>
                            <option value="3">남미팀</option>
                            <option value="4">맹수팀</option>
                            <option value="5">동양팀</option>
                            <option value="6">대동물</option>
                            <option value="7">어린이동물</option>
                            <option value="8">아프리카</option>
                            <option value="9">유인원</option>
                            <option value="10">생태연구</option>
                            <option value="11">분석연구</option>
                            </select>
                        </td>
                        <td>식 성</td>
                        <td>
                            <select name="tasteNo" id="position">
                                <option value="1">초식</option>
                                <option value="2">육식</option>
                                <option value="3">잡식</option>
                            </select>
                        </td>

                    </tr>

                    <tr id="chart-3">
                        <td>방사장</td>
                        <td><input name="feild" placeholder="방사장" ></td>


                        <td>서식지 </td>
                        <td>
                            <select name="habitatNo" id="position">
                                <option value="1">아프리카</option>
                                <option value="2">유럽</option>
                                <option value="3">중동</option>
                                <option value="4">아시아</option>
                                <option value="5">북아메리카</option>
                                <option value="6">남아메리카</option>
                                <option value="7">오세아니아</option>
                                
                            </select>
                        </td>
                       
                    </tr>

                    <tr id="chart-4">
                    
                    </tr>
                      <tr id="chart-4">
                        <td>등록 일시</td>
                        <td><input type="date" name="date"></td>

                        <td>멸종 위기</td>
                        <td>
                            <select name="endangeredRatingNo" id="position">
                                <option value="1">절멸(EX)</option>
                                <option value="2">야생절멸(EW)</option>
                                <option value="3">위급(CR)</option>
                                <option value="4">위기(EN)</option>
                                <option value="5">취약(VU)</option>
                                <option value="6">준위협(NT)</option>
                                <option value="7">최소관심(LC)</option>
                                <option value="8">정보부족(DD)</option>
                                <option value="9">미평가(NE)</option>
                            </select>
                        </td>

                        <td>애칭</td>
                        <td><input name="nickName" placeholder="애칭" ></td>

                    </tr>
                </table>
                <div style="margin-left: 80px; color:gray">※허위 사실 기제시 제제를 받습니다.</div>
                <div id="enroll-btn">
                    <label for="file">
                        <div class="btn-upload">프로필 등록</div>
                    </label>
                    <input type="file" name="f" id="file" accept=".jpg, .png, .jpeg" onchange="imgUpload(event)">
                </div>

                <div id="btn-area">
                        <input type="submit" class="btn btn-primary" value="등록">
                        <input type="button" class="btn btn-primary" value="취소" onclick="list();">
                </div>
              
            </form>
        </div>

    </div>

</body>
</html>
<script>
  
     //이미지 미리보기
     function imgUpload(event){
        var reader = new FileReader();

        reader.onload = function(event) {
        var originImg = document.querySelector("#image_container>img");
        var img = document.createElement("img");
        img.style.width = '208px';
        img.style.height ='198px';
        originImg.style.display = 'none';
        img.setAttribute("src", event.target.result);
        document.querySelector("#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }

    function list(){
        location.href = "${root}/animal/list";
    }

</script>