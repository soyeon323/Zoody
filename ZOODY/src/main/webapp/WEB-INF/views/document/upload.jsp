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

#grid-wrap {
    display: grid;
    position: absolute;
    left: 300px;
    top: 75px;
    align-items: start;
    justify-items: stretch;
    align-content: stretch;
}

</style>
</head>
<body>
    
    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    <div id="document-upload-wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>

        <div id="grid-wrap">

            <h1>업로드</h1>
            <input type="file" multiple>
    
            <button onclick="checkValue()"></button>
    
            <!-- 파일 목록을 표시할 공간 -->
            <div id="fileList"></div>

        </div>
    </div>

</body>
</html>

<script>
    // 파일이 선택되었을 때 실행되는 이벤트 핸들러
    const fileInput = document.querySelector('input[type="file"]');
    const fileListDiv = document.getElementById('fileList');
    let fileContents = {}; // 파일 내용을 저장할 객체

    fileInput.addEventListener('change', (event) => {
        // 선택한 파일 목록 가져오기
        const files = event.target.files;
        console.log(files.length);

        // 선택한 파일 목록을 화면에 표시
        fileListDiv.innerHTML = '';
        for (let i = 0; i < files.length; i++) {
            const file = files[i];
            console.log("File" + (i + 1) + ":" + file.name);

            // 파일 내용 읽어와서 변수에 저장
            const reader = new FileReader();
            reader.onload = function (e) {
                const fileContent = e.target.result;
                console.log("File" + (i + 1) + " Content:");
                // console.log(fileContent);

                console.log(e.target);

                // 파일 내용을 변수에 저장
                fileContents[file.name] = fileContent;

                // 선택한 파일 목록을 화면에 표시
                const listItem = document.createElement('div');
                listItem.textContent = "File" + (i + 1) + ":" + file.name;
                fileListDiv.appendChild(listItem);
            };
            reader.readAsText(file);
        }
    });

    // 나중에 사용하려는 경우, fileContents 객체를 사용하여 파일 이름에 해당하는 내용을 가져올 수 있습니다.
    function getFileContent(fileName) {
        return fileContents[fileName];
    }


    function checkValue() {
        const x = $("#document-upload-wrap > input").target;
        console.log(x);
    }
</script>


