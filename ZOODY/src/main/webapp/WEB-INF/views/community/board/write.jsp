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
                        <option value="x">공개 범위를 선택하세요</option>
                        <option value="1">전사</option>
                        <option value="2">부서</option>
                    </select>

                    <select name="Small-Category" id="SC">
                        <option value="3">자유</option>
                        <option value="4">익명</option>
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

<script>
    $(document).ready(function() {
    // Big-Category 선택 값이 변경될 때의 이벤트 핸들러
    var smallCategorySelect = $("#SC");
    var initialBigCategoryValue = $("#BC").val();

    if (initialBigCategoryValue !== "x") {
        $("#BC option[value='x']").remove();
    }

    smallCategorySelect.prop("disabled", true);
    $("#BC").change(function() {
        var selectedBigCategory = $(this).val();
        
        // "공개 범위를 선택하세요" 옵션을 제거
        $("#BC option[value='x']").remove();

        var smallCategorySelect = $("#SC");
        
        // Small-Category의 옵션 설정을 변경
        if (selectedBigCategory === "1") {
            smallCategorySelect.html(
                '<option value="2">익명</option>'
            );
        } else if (selectedBigCategory === "2") {
            smallCategorySelect.html(
                '<option value="3">자유</option>' +
                '<option value="4">익명</option>'
            );
        }
        
        // Big-Category가 선택되었을 때만 Small-Category 활성화
        if (selectedBigCategory !== "x" && selectedBigCategory !== null) {
            smallCategorySelect.prop("disabled", false);
        } else {
            smallCategorySelect.prop("disabled", true);
        }
    });
});


    </script>
    




<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>