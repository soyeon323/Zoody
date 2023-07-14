<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/mail/write.css">
<script type="text/javascript" src="${root}/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<main>
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="wrap-title">메일</div>
			</div>

			<div class="wrap-main">
				<div class="mail-sidebar">
					<div class="mail-sidebar-header">
						<div class="unread-count">
							안읽음 {7}
						</div>
						<button class="my-important-btn">
							<img src="${root}/resources/svg/icon/star.svg" alt="즐겨찾기">
							중요
						</button>
					</div>

					<div class="default-folder-list">
						<button class="folder-btn all-mail-btn">
							<img src="${root}/resources/svg/icon/all-mail.svg" alt="전체메일">
							전체메일
						</button>
						<button class="folder-btn selected-folder-btn receive-mail-btn">
							<img src="${root}/resources/svg/icon/receive-mail-selected.svg" alt="받은메일">
							받은 메일함
						</button>
						<button class="folder-btn send-mail-list">
							<img src="${root}/resources/svg/icon/send-mail.svg" alt="보낸메일">
							보낸 메일함
						</button>
						<button class="folder-btn tome-mail-btn">
							<img src="${root}/resources/svg/icon/to-me-mail.svg" alt="내게쓴메일">
							내게 쓴 메일함
						</button>
						<button class="folder-btn dump-mail-btn">
							<img src="${root}/resources/svg/icon/dump-mail.svg" alt="휴지통">
							휴지통
						</button>
					</div>

					<div class="custom-list-header">
						내 메일함
						<img src="${root}/resources/svg/icon/small-plus.svg" alt="추가">
					</div>
					<div class="custom-folder-list">
						<div class="custom-folder">
							<img src="${root}/resources/svg/icon/folder.svg" alt="내폴더">
							{폴더명}
						</div>
						<div class="custom-folder">
							<img src="${root}/resources/svg/icon/folder.svg" alt="내폴더">
							{새폴더2}
						</div>
					</div>

				</div>

				<div class="mail-write-area">
					<div class="write-area-header">
						<div class="header-title">메일 쓰기</div>
						<button class="send-mail-btn">메일 보내기</button>
					</div>

					<div class="mail-setting-area">

						<div class="receiver-setting">
							<div class="setting-name">받는 사람</div>
							<input type="text" class="setting-input-area">
							<button class="addressbook-btn">주소록</button>
						</div>

						<div class="receiver-setting">
							<div class="setting-name">참조</div>
							<input type="text" class="setting-input-area">
						</div>

						<div class="receiver-setting">
							<div class="setting-name">숨은 참조</div>
							<input type="text" class="setting-input-area">
						</div>

						<div class="receiver-setting">
							<div class="setting-name">제목</div>
							<input type="text" class="setting-input-area">
						</div>

						<div class="receiver-setting">
							<div class="setting-name">첨부 파일</div>
							<div class="attachment-add-btn">내 PC</div>
						</div>
						<div class="receiver-setting">
							<div class="setting-name"></div>
							<div class="attachment-list-area">

							</div>
						</div>
					</div>

					

				</div>

			</div>

		</div>
	
	</main>

</body>
</html>