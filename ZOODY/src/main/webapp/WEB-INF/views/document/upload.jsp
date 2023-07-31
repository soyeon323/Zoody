<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#document-upload-wrap {
    display: flex;
}
    
</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="document-upload-wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <h1>업로드</h1>
        <input type="file" multiple>

        <!-- 파일 목록을 표시할 공간 -->
        <div id="fileList"></div>
    </div>

</body>
</html>

<script>
    // 파일이 선택되었을 때 실행되는 이벤트 핸들러
    const fileInput = document.querySelector('input[type="file"]');
    const fileListDiv = document.getElementById('fileList');

    fileInput.addEventListener('change', (event) => {
        // 선택한 파일 목록 가져오기
        const files = event.target.files;
        console.log(files.length);

        // 선택한 파일 목록을 화면에 표시
        fileListDiv.innerHTML = '';
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            console.log(i);
            const listItem = document.createElement('div');
            listItem.textContent = "File"+(i + 1) + ":" + file.name;
            console.log(listItem.textContent);
            fileListDiv.appendChild(listItem);
        }
    });
</script>

