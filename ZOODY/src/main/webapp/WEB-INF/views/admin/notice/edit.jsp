<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/admin/notice/edit.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<body style="overflow-x: hidden">
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/admin/side.jsp" %>

    <div id="wrap">

        <form action="${root}/admin/notice/edit" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="no" value="${vo.no}">
            <div id="write">
                <a>글쓰기</a>
            </div>
    
            <div id="selectArea">
                <a>To.</a>
                <select name="boardType" id="selectOne" disabled>
                    <option value="">관리자게시판</option>
                </select>
                <select name="boardValue" id="selectTwo" disabled>
                    <option value="">공지사항</option>
                </select>
            </div>
    
            <div id="hr01">
                <hr>
            </div>
            
            <div id="title">
                <a>제목</a>
                <input type="text" name="title" value="${vo.title}">
            </div>
    
            <div id="fileArea">
                <a>파일첨부</a>
                <input type="file" name="f" multiple accept=".jpg, .jpeg, .png" onchange="imgUpload(event)">
                <div id="image_container">
                    <img src="${root}/resources/img/notice/${vo.changeName}" width="25px" alt="">
                </div>
            </div>

            <div id="tempSave">
                <button onclick="tempSaveText();" type="button"><img src="${root}/resources/img/icon/png/tempsave.png" alt="임시저장이미지"> 임시저장</button>
            </div>

            <div id="contentArea">
                <textarea id="summernote" name="content">${vo.content}</textarea>  
            </div>

            <div id="radioArea">
                <div>
                    <a>우클릭 허용</a>
                    <input type="radio"  ${vo.rightclickYn == 'Y' ? 'checked' : ''} name="rightclickYn" value="Y" id="radio01">
                    <label for="radio01">허용</label>
                    <input type="radio"  ${vo.rightclickYn == 'N' ? 'checked' : ''} name="rightclickYn" value="N" id="radio02">
                    <label for="radio02">허용안함</label>
                </div>
                <div>
                    <a>댓글 작성</a>
                    <input type="radio" ${vo.commentYn == 'Y' ? 'checked' : ''} name="commentYn" value="Y" id="radio03">
                    <label for="radio03">허용</label>
                    <input type="radio" ${vo.commentYn == 'N' ? 'checked' : ''} name="commentYn" value="N" id="radio04">
                    <label for="radio04">허용안함</label>
                </div>
            </div>

            <div id="btnArea">
                <input type="submit" value="수정">
                <button onclick="cancel();" type="button">취소</button>
            </div>
        </form>
    
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 400,
            maxHeight: 400,
            minHeight: 400,
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

    //이미지 미리보기
    function imgUpload(event){
        var files = event.target.files;
        var container = document.querySelector("#image_container");
        container.innerHTML = ""; 

        for (var i = 0; i < files.length; i++) {
            var reader = new FileReader();
            var img = new Image();

            reader.onload = (function (img) {
                return function (e) {
                    img.src = e.target.result;
                    img.style.width = '30px';
                    img.style.height = '30px'; 
                    container.appendChild(img);
                };
            })(img);

            reader.readAsDataURL(files[i]);
        }
     }

       // 임시저장
       function tempSaveText() {
            
            const textarea = document.querySelector("#summernote");
            const textValue = textarea.value;
            const title = document.querySelector("input[name='title']").value; 

            localStorage.setItem("textArea", textValue);
            localStorage.setItem("titleArea", title); 

            console.log(localStorage.getItem("textArea"));
            console.log(localStorage.getItem("titleArea")); 

            const currentTime = new Date();
            const currentTimeString = currentTime.toLocaleString();

            alert(currentTimeString + " 임시저장 완료");
        }

        window.onload = () => {
            if (localStorage.getItem("textArea")) {
                if (confirm("임시저장된 글이 있습니다. 불러오시겠습니까?")) {
                    document.querySelector("input[name='title']").value = localStorage.getItem("titleArea");
                    $("#summernote").summernote("code", localStorage.getItem("textArea"));
                } else {
                    localStorage.removeItem("textArea");
                    localStorage.removeItem("titleArea");
                }
            }
        };

        //게시글작성 취소
        function cancel(){
            
            if(confirm("게시글 작성을 취소하시겠습니까?")){
                location.href = "${root}/admin/notice/list";
            }
            return;
        };
    </script>

</body>
</html>