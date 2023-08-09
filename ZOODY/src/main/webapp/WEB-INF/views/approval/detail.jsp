<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>

<c:set var="url" value="${pageContex.request.requestURL}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/approval/detail.css">
<script defer src="${root}/resources/js/approval/detail.js"></script>

</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-left">

				<div class="approve-btn-area">
					<button class="approve-send-btn">
						결재하기
					</button>
				</div>

				${approvalVo.form}

			</div>

			<div class="wrap-right">
				<div class="title-area">
					<div class="set-approver preview-setting-btn">결재자 설정</div>

					<div class="set-cc unseleted-setting-btn preview-setting-btn">참조자 설정</div>
				</div>
				<div class="approver-list preview-area">


				</div>

				<div class="cc-list preview-area unselected-preview">


				</div>

			</div>

		</div>

	</main>

</body>
</html>