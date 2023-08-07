<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

#upload-modal {
    position: absolute;
    z-index: 9999;
    width: 100%;
    height: 100%;
    background: #26262678;
    display: flex;
    align-items: center;
    justify-content: center;

    
    display: none;
}

.upload-grid-body {
    width: 730;
    height: 700;
    background-color: #ffffff;
    border-radius: 5px;
    box-shadow: 0px 0px 7px -2px rgba(0, 0, 0, 0.25);
    display: grid;
    grid-template-rows: 40px 150px 510px;

    overflow: hidden;
}

.upload-grid-body > div:not(.upload-top-bar) {
    padding: 40 130 0 130;
    border-bottom: 1px solid #D9D9D9;
    border-radius: 0 0 5px 5px;
}

.upload-top-bar{
    background-color: #4876EF;
    width: 730;
    height: 40;
}

.upload-grid-body > div:not(.upload-top-bar) {
    padding: 40 130 0 130;
    border-bottom: 1px solid #D9D9D9;
    border-radius: 0 0 5px 5px;
    font-size: 25;
    font-weight: 500;
}

.upload-meddle {
    /* display: flex; */
    justify-content: space-between;
    flex-wrap: wrap;
    align-items: flex-start;
    width: 470;
    align-content: flex-start;
}

.upload-meddle > form > div:not(.flie-upload-area) {
    font-size: 15;
    font-weight: 400;
    height: 40;
}

.upload-title {
    width: 290;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    box-sizing: border-box;
}

.upload-title > input {
    outline: none;
    border: none;
    font-size: 15;
    width: 80%;
}

.upload-title > span {
    color: #636567;
}

.upload-option-area {
    width: 170;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.upload-option-area > select {
    width: 100%;
    height: 45%;
    outline:1px solid #D9D9D9;
    box-sizing: border-box;
    border-radius: 3px;
    border: #D9D9D9;
}

.upload-radio-area {
    font-size: 13px;
    display: flex;
    align-items: flex-end;
    color: #636567;
}

.flie-upload-area {
    width: 100%;
    height: 260;
    align-self: flex-start;
    border: 1px solid #d9d9d9;
    box-sizing: border-box;
    border-radius: 5px;
    display: grid;
    grid-template-rows: 1fr 8fr;
    margin-top: 12px;
}

.btn-area {
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-evenly;
    margin-top: 10;
}

.btn-area > div {
    width: 85;
    height: 35;
    background-color: #99b3cd;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    
}

#uploadForm > input:nth-child(2) {
    display: none;
}

.upload-submit-btn {
    outline: none;
    background-color: #6088f1;
    border: none;
    border-radius: 5px;
    width: 85;
    height: 35;
}



form#uploadForm {
    padding: 10;
    border-bottom: 1px solid #d9d9d9;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    align-items: flex-start;
    width: 470;
    align-content: flex-start;
}
    
    </style>

<script>
    $(document).ready(function() {
        $("#uploadForm").submit(function(e) {
            e.preventDefault();
            var formData = new FormData($(this)[0]);
            const selectCat =  $("#upload-cat option:selected").val();

            console.log(selectCat);

            console.log(root+"/document/upload");
            let loginUserId = $("#hidden-id").val();
            
            // formData.append("loginUserId", loginUserId); // 추가
            $.ajax({
                url: root+"/document/upload",
                type: "POST",
                data: formData,
                dataType: 'json',
                processData: false,
                contentType: false,
                success: function(response) {
                console.log(response); // 성공 시 서버 응답을 출력
                    $("#result").text(response); // 업로드 성공 시 결과를 화면에 출력
                    console.log(response);
                    $(".list-table > tbody").prepend(`<tr><td>${ response[0].catNo }</td><td>${ response[0].no }</td><td>${ response[0].name }</td> <td>${ response[0].enollDate }</td></tr>`);
                },
                error: function(xhr, status, error) {
                    console.log(xhr.responseText); // 실패 시 서버 응답을 출력
                    $("#result").text("파일 업로드 실패: " + error); // 업로드 실패 시 에러 메시지를 화면에 출력
                }
            });
        });

        $("#select-scope").on("change", function() {
                $("#select-scope option:first-child").hide();
           
        });

        $("#select-directory").on("change", function() {
                $("#select-directory option:first-child").hide();
           
        });

    });

    

</script>
</head>

<body>
    
    <div id="upload-modal">
        <div class="upload-grid-body">
            
            <div class="upload-top-bar"></div>

            
            <div class="upload-header">
                업로드
            </div>
            
            <div class="upload-meddle">
                <form id="uploadForm" enctype="multipart/form-data">
                    <div class="upload-title">
                        <span>제목 |</span>
                        <input type="text">
                    </div>

                
                    <div class="upload-option-area">
                        <select name="scope" id="select-scope">
                            <option checked>공개 범위</option>
                            <option value="1">전사</option>
                            <option value="2">부서</option>
                            <option value="3">개인</option>
                        </select>
                        
                        <select name="directoryNo" id="select-directory">
                            <option checked>폴더 선택</option>
                            <c:forEach items="${ directoryList }" var="list" varStatus="status">
                                <option value="<c:out value="${status.index}" />">${list.directoryName}</option>
                            </c:forEach>
                                

                        </select>
                    </div>

                    <div class="flie-upload-area">
                        
                            <input type="file" name="file">

                            <c:if test="${empty loginMember.name}">
                                <input id="hidden-id" type="text" name="loginMemberId" value="test">
                            </c:if>
                            <c:if test="${not empty loginMember.name}">
                                <input id="hidden-id" type="text" name="loginMemberId"  value="${loginMember.id}">
                            </c:if>

                            
                            <div id="result"></div>
                        
                        </div>
                        

                    <div class="btn-area">
                        <input class="upload-submit-btn" type="submit" value="등록">
                        <div onclick="closeModal()">취소</div>
                    </div>
                </form>

            </div>
        </div>

    </div>
        

            
    

</body>

</html>

<script>

    function closeModal() {
        $("#upload-modal").css("display","none");
    }

</script>
