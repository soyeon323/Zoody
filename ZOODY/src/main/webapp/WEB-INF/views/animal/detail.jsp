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
  <!-- summerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>
    <!-- summerNote -->
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <div id="wrap">

        <div id="enroll">동물 상세 조회</div>
        <div id="chart">
                
                <table>
                    <tr id="chart-1">
                        <td rowspan="4"><img src="${root}/resources/img/animal/${animalVo.profile}" alt="${animalVo.profile}" style="width: 208px; height: 198px;"></td>
                        <td>이름</td>
                        <td>계 통</td>
                        <td colspan="3">
                            ${animalVo.animalClassificationName}
                        </td>
                    </tr>
                    <tr id="chart-2">
                        <td rowspan="3"><input type="text" name="name" placeholder="이름입력" value="${animalVo.name}"></td>
                        <td>담당 부서</td>
                        <td><input type="tel" name="departmentNo" placeholder="담당 부서" maxlength="13" value="${animalVo.departmentName}"></td>
                    </tr>
                    <tr id="chart-3">
                        <td>애칭</td>
                        <td><input type="email" name="nickName" value="${animalVo.nickName}"></td>
                        <td>방사장</td>
                        <td><input type="tel" name="feild" placeholder="방사장" value="${animalVo.feild}"></td>
                    </tr>
                    <tr id="chart-4">
                        <td>멸종 위기</td>
                        <td>
                           ${animalVo.endangered}
                        </td>
                        <td>식 성</td>
                        <td><input type="text" name="tasteNo" placeholder="식성" maxlength="11" value="${animalVo.taste}"></td>
                    </tr>
                      <tr id="chart-4">
                        <td>등록 일시</td>
                        <td><input value="${animalVo.date}"></td>
                        <td>서식지</td>
                        <td><input type="text" value="${animalVo.habitat}"></td>
                        
                    </tr>
                </table>
                
                <div id="enroll-btn">
                        <div class="btn-upload" onclick="die()" ><a>폐사 처리</a></div>
                </div>

                <div id="btn-area">
                    <div class="btn-upload" id="trainingWriteBtn">훈련 일지 작성</div>
                    <div class="btn-upload" id="healthDetail" >건강 검진 작성</div>
            </div>

                <form action="${root}/animal/health/write" method="POST">
                    <div id="content-area">
                        <input type="hidden" value="${animalVo.no}" name="animalNo">
                        <div>건강검진 종합 소견</div>
                        <br>
                        <span>유질환</span>
                        <textarea name="disease" id="t1" cols="30" rows="10"></textarea>
                        <br>
                        <span>생활 습관 관리</span>
                        <textarea name="lifeStyleManagement" id="t2" cols="30" rows="9"></textarea>
                        <br>
                        <span>건강 상태</span>
                        <textarea name="stateOfHealth" id="t3" cols="30" rows="10"></textarea>

                            <input type="submit" value="작성하기"  class="btn-upload">
                    </div>
    
                </form>
               
                <form action="${root}/animal/training/write" method="POST">
                    <div id="content-area2">
                        <div id="enroll">훈련 일지 작성 </div>
                        <input type="hidden" value="${animalVo.no}" name="animalNo">
                         <div id="content-area">
                            <br>
                            <span>제목</span>
                            <textarea name="trainingTitle" id="t1" cols="30" rows="10"></textarea>

                            <span>훈련 내용</span >
                            <textarea name="trainingContent" id="summernote" cols="30" rows="10"></textarea>
                        </div>
                            <input type="submit" value="작성"  class="btn-upload">
                  
                </form>

                </div>
               
            </div>

        </div>
    </div>
</body>
</html>
<script>
    
    //건강검진 작성 숨기기
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



    //훈련 일지 작성 숨기기
    var trainingWriteBtn = document.querySelector('#trainingWriteBtn');

    var contentArea2 = document.getElementById('content-area2');

    contentArea2.style.display = 'none';

    trainingWriteBtn.addEventListener('click', function() {

        if (contentArea2.style.display === 'none') {
            contentArea2.style.display = 'block';
        } else {
            contentArea2.style.display = 'none';
        }
    });


    

 // sunnerNote
 $('#summernote').summernote({
        	placeholder: '내용입력',
        	tabsize: 2,
        	height: 500,
        	maxHeight:800,
        	minHeight:500,
        	width: 1500,
		callbacks : {
			onImageUpload : f01
		},
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });

      function f01(FileList) {

        const fd = new FormData();
        for(let file of FileList){
            fd.append("f" , file);
        }

        $.ajax({
            url :'' ,
            type : 'post',
            data : fd,
            processData : false,
            contentType : false,
            dataType:'json',
            success : (changeNameList)=>{
                console.log(changeNameList);
                for(let changeName of changeNameList){
                    $('#summernote').summernote('insertImage' , '${root}/static/img/board-img/' + changeName);
                }
            },
            error : (e)=>{
                alert(e);
            }
        });
        }

        //동물 폐사 처리
        function die() {
            const result = confirm('폐사처리 하시겠습니까?');

            if(result){
                $.ajax({
                url : '${root}/animal/die',
                data :{
                    no : '${animalVo.no}'
                },
                type : 'POST',
                success : (serverNo)=>{
                    location.href = '${root}/animal/list?page=1';
                },
                error : ()=>{
                    location.href = '${root}/animal/list?page=1';
                }
            });
            }
          
        }

</script>