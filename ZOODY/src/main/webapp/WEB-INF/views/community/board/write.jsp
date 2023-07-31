<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="${root}/resources/css/community/write.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	
	<%@ include file="/WEB-INF/views/header.jsp" %>
    <%@ include file="/WEB-INF/views/side.jsp" %>
    <div id="wrap">
        
        <div id="write-wrap">

            <div class="write-wrap-header">글쓰기</div>

            <div class="write-wrap-body">

                <div class="write-body-top">
                    <div>To.</div>

                    <select name="Big-Category" id="BC">
                        <option value="1">전사</option>
                        <option value="2">부서</option>
                    </select>

                    <select name="Small-Category" id="SC">
                        <option value="1">자유</option>
                        <option value="2">익명</option>
                    </select>
                </div>

                <div class="write-body-meddle">
                    <div>제목</div> <input class="title" type="text">
                    <div>파일 첨부</div> <input class="file" type="file">
                </div>


                <div class="write-body-bottom">

                    <textarea name="content" id="summernote" value=""></textarea>

                </div>

            </div>
            <div class="write-wrap-foot">

                <div class="right-click-area">
                    <div>우클릭 허용</div>
                    <input type="radio" name="right-click" value="yes" checked><div>허용</div>
                    <input type="radio" name="right-click" value="no"><div>허용안함</div>

                </div>

                <div class="write-wrap-foot-btns">
                    <div class="registration-btn">등록</div>
                    <div class="cancel-btn" onclick="history.back()">취소</div>
                </div>

            </div>

        </div>
        
	</div>
    
</body>
</html>

<script src="${root}/resources/js/community/write.js"></script>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>