<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/mail/folder/receive.css">
<script defer src="${root}/resources/js/mail/folder/receive.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="wrap-title">메일</div>
				<button class="send-mail-btn">메일 쓰기</button>
			</div>

			<div class="wrap-main">
				<div class="mail-sidebar">
					<div class="mail-sidebar-header">
						<div class="unread-count">
							안읽음 {7}
						</div>
						<button class="my-important-btn">
							<img src="${root}/resources/img/icon/svg/star.svg" alt="즐겨찾기">
							중요
						</button>
					</div>

					<div class="default-folder-list">
						<button class="folder-btn all-mail-btn">
							<img src="${root}/resources/img/icon/svg/all-mail.svg" alt="전체메일">
							전체메일
						</button>
						<button class="folder-btn selected-folder-btn receive-mail-btn">
							<img src="${root}/resources/img/icon/svg/receive-mail-selected.svg" alt="받은메일">
							받은 메일함
						</button>
						<button class="folder-btn send-mail-list">
							<img src="${root}/resources/img/icon/svg/send-mail.svg" alt="보낸메일">
							보낸 메일함
						</button>
						<button class="folder-btn tome-mail-btn">
							<img src="${root}/resources/img/icon/svg/to-me-mail.svg" alt="내게쓴메일">
							내게 쓴 메일함
						</button>
						<button class="folder-btn dump-mail-btn">
							<img src="${root}/resources/img/icon/svg/dump-mail.svg" alt="휴지통">
							휴지통
						</button>
					</div>

					<div class="custom-list-header">
						내 메일함
						<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="추가">
					</div>
					<div class="custom-folder-list">
						<div class="custom-folder">
							<img src="${root}/resources/img/icon/svg/folder.svg" alt="내폴더">
							{폴더명}
						</div>
						<div class="custom-folder">
							<img src="${root}/resources/img/icon/svg/folder.svg" alt="내폴더">
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
								<div class="unread-count">{14}</div>
								/
								<div class="receive-count">{999}</div>
							</div>
						</div>
						
						<div class="list-header-right">
							<div class="search-input-area">
								<input type="text" class="search-input">
							</div>
							<img class="search-icon" src="${root}/resources/img/icon/svg/search.svg" alt="검색">
						</div>

					</div>

					<div class="mail-list-body">

						<div class="list-table-header">
							<div class="table-header-btns">
								<input type="checkbox" name="selectAll" id="select-all" class="check-btn">
								<button class="header-btn">읽음</button>
								<button class="header-btn">삭제</button>
							</div>
						</div>
						
						<c:forEach items="${mailVoList }" var="mailVo">
							<div class="table-data">
								<div class="check-btn-area">
									<input type="checkbox" class="small-check-btn">
								</div>
								<div class="add-bookmark-area">
									<button class="add-bookmark-btn">
										<img src="${root}/resources/img/icon/svg/small-star.svg" alt="즐겨찾기">
									</button>
								</div>
								<div class="read-check-icon">
									<img src="${root}/resources/img/icon/svg/unread-mail.svg" alt="안읽음">
								</div>
								<div class="attachment-check-icon">
									<img src="${root}/resources/img/icon/svg/attachment.svg" alt="첨부파일">
								</div>
								<div class="mail-sender">
									${mailVo.senderName} &lt ${mailVo.senderMail } &gt
								</div>
								<div class="mail-title">
									${mailVo.title}
								</div>
								<div class="send-date">
									${mailVo.sendDate}
								</div>
							</div>
						</c:forEach>

					</div>

				</div>

			</div>

		</div>
	
	</main>

</body>
</html>