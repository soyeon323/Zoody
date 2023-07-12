<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/mail/folder/receive.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<main>
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="wrap-title">메일</div>
				<button class="send-mail btn">메일 쓰기</button>
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
						<button class="folder-btn send-mail-btn">
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

				<div class="mail-list-area">
					<div class="mail-list-header">
						<div class="list-header-left">
							<div class="list-header-title">
								받은 메일함
							</div>
							<div class="unread-receive">
								<div class="unread-count">{7}</div>
								/
								<div class="receive-count">{101}</div>
							</div>
						</div>
						
						<div class="list-header-right">
							<input type="text" class="serch-input-area">
							<img src="${root}/resources/svg/icon/search.svg" alt="검색">
						</div>

					</div>
				</div>
			</div>

		</div>
	
	</main>

</body>
</html>