<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>   
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/community/vote/write.css">
</head>
<body>

    <%@ include file="/WEB-INF/views/header.jsp" %>
    
    
    <div id="wrap">
        <%@ include file="/WEB-INF/views/side.jsp" %>
        <%@ include file="/WEB-INF/views/community/vote/voteSide.jsp" %>
        
        <form  id="vote-form" action="">
            <span>투표 작성</span>
            <div class="write-area">
                <div class="vote-optipn-area">
                    <div class="vote-optipn-area-1">
                        <div class="thumbnail-area">
                            사진
                        </div>
    
                        <div>
                            <span>투표 제목</span>
                            <input name="title" type="text">
                        </div>
                        <div>
                            <span>투표 기간</span> 
                            <input name="start-date" class="start-date" type="date">
                            ~
                            <input name="end-date" class="end-date"  type="date">
                        </div>
    
                        <div class="vote-target">
                            <span>투표 대상자</span>
                            <label>전사
                                <input name="scope" type="radio" checked>
                            </label>
                            <label>
                                부서<input name="scope" type="radio">
                            </label>
                        </div>
    
                        <div class="vote-target">
                            <span>투표 결과 공개</span>
                            <label>공개
                                <input name="public-scope" type="radio" checked>
                            </label>
                            <label>비공개
                                <input name="public-scope" type="radio">
                            </label>
                        </div>
                    </div>
                    <br><br><br><br><br><br><br>
                    
                    <div class="vote-optipn-area-2">
                        
                        <label for="">시작 안내 문구 
                            <textarea name="guide" id="" cols="30" rows="10"></textarea>
                        </label>

                        <label for="">
                            문항
                            <input name="question" type="text">
                        </label>

                        <label for="">
                            다중 투표
                            <div>
                                <input name="multipleVote" type="checkbox">
                            </div>
                        </label>

                        <label for="">
                            보기
                            <div>
                                <input type="radio">
                                <input name="item" type="text">
                            </div>
                        </label>

                        <div>+ 문항추가</div>

                    </div>
                   

                </div>
                
                
                <div class="vote-progress-area">
                    <div>투표 설정</div>
                    <div>투표 문항</div>
                </div>

            </div>
            
            <div>
                <input type="submit" value="등록">
                <input type="button" value="취소">
            </div>

        </form>

    </div>

</body>
</html>

<script>
    $(document).ready(function() {
        var today = new Date();
        var year = today.getFullYear();
        var month = String(today.getMonth() + 1).padStart(2, "0");
        var day = String(today.getDate()).padStart(2, "0");
        var formattedDate = year + "-" + month + "-" + day;

        $(".start-date").val(formattedDate);
        $(".end-date").val(formattedDate);
        
        // 폼 제출(submit) 이벤트 감지
        $("#vote-form").submit(function(event) {

            console.log(123);

            event.preventDefault(); // 기본 제출 동작 막기

            // 폼 데이터를 직렬화하여 문자열로 변환
            var formData = $(this).serialize();

            console.log(formData);

            // AJAX 요청 보내기
            $.ajax({
                url: root+ "community/vote/write", 
                type: "POST", // HTTP 요청 방식 (POST)
                data: formData, // 폼 데이터
                success: function(response) {
                    // 요청이 성공적으로 처리되었을 때 실행될 코드
                    console.log("데이터 전송 성공:", response);
                },
                error: function(error) {
                    // 요청이 실패했을 때 실행될 코드
                    console.error("데이터 전송 실패:", error);
                }
            });
        });
    });
</script>





