<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/community/communitySide.css">
</head>
<body>
	
	<div id="community-side">
        
        <div class="community-side-header">
            <div class="community-side-header-title">게시판</div>
            <div class="btn-write">글쓰기</div>
        </div>

        <div class="community-side-body">

            <ul class="body-list company-baord"> 전사 게시판
                <li onclick="goToNotice()">공지사항</li>
                <li onclick="goToCatNoBoard(2)"">익명 게시판</li>
            </ul>

            <ul class="body-list department-baord">부서 게시판
                <li onclick="goToCatNoBoard(3)">자유 게시판</li>
                <li onclick="goToCatNoBoard(4)">익명 게시판</li>
            </ul>
        </div>

    </div>
	
</body>
</html>

<script src="${root}/resources/js/community/communitySide.js"></script>
<script>
    function goToNotice() {
        window.location.replace(root+"/notice/list");
    }

    function goToCatNoBoard(no) {
        window.location.replace(root+"/community/board/list?catNo="+ no);
    }

</script>