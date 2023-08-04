<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    $(document).ready(function() {
        $("#uploadForm").submit(function(e) {
            e.preventDefault();
            var formData = new FormData($(this)[0]);
            let x = $("#uploadForm > input[type='text']").text;

            
            console.log(root+"/document/upload");
            let loginUserId = $("input[type='text']").val();
            console.log("Text Input Value:", loginUserId);
            
            formData.append("textInputValue", loginUserId); // 추가
            $.ajax({
                url: root+"/document/upload",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function(response) {
                    $("#result").text(response);
                },
                error: function(xhr, status, error) {
                    $("#result").text("파일 업로드 실패: " + error);
                }
            });
        });
    });
</script>
</head>
<body>
<h1>파일 업로드 예제 (AJAX)</h1>
<form id="uploadForm" enctype="multipart/form-data">
    <input type="file" name="file">
    <input type="text" value="test">
    <input type="submit" value="Upload">
</form>
<div id="result"></div>
</body>
</html>


