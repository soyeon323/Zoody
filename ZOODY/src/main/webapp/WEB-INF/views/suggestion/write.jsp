<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/suggestion/write.css">
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
    <%@ include file="/WEB-INF/views/tempside.jsp" %>

    <div id="wrap">

        <form action="${root}/suggestion/write" method="post" enctype="multipart/form-data">

            <div id="suggestionWrite">
                <a>글쓰기</a>
            </div>
    
            <div id="selectArea">
                <a>To.</a>
                <select name="boardType" id="selectOne" disabled>
                    <option value="">커뮤니티</option>
                </select>
                <select name="boardValue" id="selectTwo" disabled>
                    <option value="">건의사항</option>
                </select>
            </div>
    
            <div id="hr01">
                <hr>
            </div>
            
            <div id="title">
                <a>제목</a>
                <input type="text" name="title">
            </div>
    
            <div id="fileArea">
                <a>파일첨부</a>
                <input type="file" name="f" multiple accept=".jpg, .png, .jpeg">
            </div>

            <div id="tempSave">
                <button><img src="${root}/resources/img/icon/png/tempsave.png" alt="임시저장이미지"> 임시저장</button>
            </div>

            <div id="contentArea">
                <textarea id="summernote" name="content"></textarea>  
            </div>

            <div id="radioArea">
                <div>
                    <a>우클릭 허용</a>
                    <input type="radio" checked name="rightBtn" value="" id="radio01">
                    <label for="radio01">허용</label>
                    <input type="radio" name="rightBtn" value="" id="radio02">
                    <label for="radio02">허용안함</label>
                </div>
                <div>
                    <a>공개 설정</a>
                    <input type="radio" checked name="openOption" value="" id="radio03">
                    <label for="radio03">전체공개</label>
                    <input type="radio" name="openOption" value="" id="radio04">
                    <label for="radio04">관리자/운영자공개</label>
                </div>
            </div>

            <div id="btnArea">
                <input type="submit" value="작성">
                <button>취소</button>
            </div>
        </form>
    
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#summernote').summernote({
            codeviewFilter: false,
            codeviewIframeFilter: false,
            disableXSSProtection: true,
            height: 400,
            minHeight: 400,
            maxHeight: 400,
            focus: true,
            lang: 'ko-KR',
            toolbar: [
                // 스타일 관련 기능
                ['style', ['style']],
                // 글자 크기 설정
                ['fontsize', ['fontsize']],
                // 글꼴 스타일
                ['font', ['bold', 'underline', 'clear']],
                // 글자 색상
                ['color', ['color']],
                // 테이블 삽입
                ['table', ['table']],
                // 문단 스타일
                ['para', ['paragraph']],
                // 에디터 높이 설정
                ['height', ['height']],
                // 이미지, 링크, 동영상 삽입
                ['insert', ['picture', 'link', 'video']],
                // 코드 보기, 전체화면, 도움말
                ['view', ['codeview', 'fullscreen', 'help']],
            ],
            fontSizes: [
                // 글자 크기 선택 옵션
                '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'
            ],
            });
        });
    </script>

</body>
</html>