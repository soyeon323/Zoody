<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/animal/detail.css">
  
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

        <div id="enroll">동물 상세 조회</div>
        <div id="chart">
            <form action="${root}/animal/enroll" method="post" enctype="multipart/form-data">
                
                <table>
                    <tr id="chart-1">
                        <td rowspan="4"><img src="/zoody/resources/img/profile.png" alt="동물사진"></td>
                        <td>이름</td>
                        <td>계 통</td>
                        <td colspan="3">
                            <select name="position" id="position">
                                <option value="">양서류</option>
                                <option value="">포유류</option>
                                <option value="">조류</option>
                            </select>
                        </td>
                    </tr>
                    <tr id="chart-2">
                        <td rowspan="3"><input type="text" name="name" placeholder="이름입력"></td>
                        <td>담당자</td>
                        <td><input type="text" name="" placeholder="담당자" maxlength="6"></td>
                        <td>담당 부서</td>
                        <td><input type="tel" name="" placeholder="담당 부서" maxlength="13"></td>
                    </tr>
                    <tr id="chart-3">
                        <td>애칭</td>
                        <td><input type="email" name="" placeholder="애칭"></td>
                        <td>방사장</td>
                        <td><input type="tel" name="" placeholder="방사장" maxlength="11" ></td>
                    </tr>
                    <tr id="chart-4">
                        <td>멸종 위기</td>
                        <td>
                            <select name="position" id="position">
                                <option value="">절멸(EX)</option>
                                <option value="">야생절멸(EW)</option>
                                <option value="">위급(CR)</option>
                                <option value="">위기(EN)</option>
                                <option value="">취약(VU)</option>
                                <option value="">준위협(NT)</option>
                                <option value="">최소관심(LC)</option>
                                <option value="">정보부족(DD)</option>
                                <option value="">미평가(NE)</option>
                            </select>
                        </td>
                        <td>식 성</td>
                        <td><input type="text" name="" placeholder="식성" maxlength="11"></td>
                    </tr>
                      <tr id="chart-4">
                        <td>등록 일시</td>
                        <td><input type="date" name="enrollDate"></td>
                        <td>서식지</td>
                        <td><input type="text" name="" placeholder="서식지"></td>
                        
                    </tr>
                </table>
                
                <div id="enroll-btn">
                        <div class="btn-upload"><a href="${root}/animal/health/write">건강검진 작성</a></div>
                </div>


                <div id="content-area">
                    <div>건강검진 종합 소견</div>
                    <br>
                    <span>유질환</span>
                    <textarea name="" id="t1" cols="30" rows="10">유질환내용</textarea>
                    <br>
                    <span>생활 습관 관리</span>
                    <textarea name="" id="t2" cols="30" rows="9">생활습관 관리 내용</textarea>
                    <br>
                    <span>의사 소견</span>
                    <textarea name="" id="t3" cols="30" rows="10">의사 소견 내용1</textarea>
                </div>


                <div id="btn-area">
                        <div class="btn-upload">훈련 일지 작성</div>
                        <div class="btn-upload" id="healthDetail">건강 정보 조회</div>
                        <div class="btn-upload">닫기</div>
                </div>
              
            </form>
        </div>
    </div>
</body>
</html>
<script>
    
    var healthBtn = document.querySelector('.btn-upload:nth-child(2)');

    var contentArea = document.getElementById('content-area');

    contentArea.style.display = 'none';

    healthBtn.addEventListener('click', function() {

        if (contentArea.style.display === 'none') {
            contentArea.style.display = 'grid';
        } else {
            contentArea.style.display = 'none';
        }
    });


    //건강 정보 조회
    const healthDetail = document.querySelector('#healthDetail');
    healthDetail.addEventListener('click' ,()=>{

        $.ajax({
        url :'${root}/animal/health',
        method :'post',
        data:{},
        success : ()=>{
            console.log('success');
        },
        error : (e)=>{
            alert('false..');
        }

    });

    });

    

</script>