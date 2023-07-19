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
            <div class="community-side-header-title">투표</div>
            <div class="btn-write">투표 작성</div>
        </div>

        <div class="community-side-body">

            <ul class="body-list company-baord">
                <li>진행중인 투표</li>
				<li>마감된 설문</li>
                <li>내가 작성한 설문</li>
            </ul>
        </div>

    </div>
	
</body>
</html>

<script>
$(document).ready(function(){

    $(".btn-write").on("click", function () {
        console.log(123);
        $(location).attr("href","${root}/community/vote/write")

    })

})
</script>