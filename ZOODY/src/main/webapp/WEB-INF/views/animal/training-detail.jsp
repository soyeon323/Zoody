<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

    <!DOCTYPE html>
    <!-- summerNote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<html>
<head>
<link rel="stylesheet" href="${root}/resources/css/animal/training.css">
<meta charset="UTF-8">
<title>Insert title here</title>
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

        <div id="enroll">훈련 일지상세 조회</div>
                <div id="content-area">
                    <br>
                    <span>제목</span>
                    <textarea name="title" id="t1" cols="30" rows="10">${vo.trainingTitle}</textarea>
                  
                    <span>훈련 내용</span >
                    <div style="resize: no;" name="content" id="summernote" readonly cols="30" rows="10">${vo.trainingContent}</div>
                </div>
               
                <div id="btn-area">
                        <a href="${root}/animal/training/list?page=1"><div class="btn-upload">닫기</div></a>
                </div>
        </div>

    </div>

</body>
</html>

<script>

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

</script>
