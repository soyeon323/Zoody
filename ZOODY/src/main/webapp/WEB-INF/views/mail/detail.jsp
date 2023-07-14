<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/mail/detail.css">
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<main>
	
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

				<div class="mail-list-area">
					<div class="mail-list-header">
						<div class="list-header-left">
							<div class="list-header-title">
								<button class="back-btn">
									<img src="${root}/resources/svg/icon/right-direction.svg" alt="뒤로">
								</button>
								받은 메일함
							</div>
							<div class="unread-receive">
								<div class="unread-count">{14}</div>
								/
								<div class="receive-count">{999}</div>
							</div>
						</div>
					</div>

					<div class="mail-detail-area">

						<div class="detail-header-bar">
							<div class="reply-btn">답장</div>
							<div class="delete-btn">삭제</div>
							<div class="unread-btn">안읽음</div>
							<div class="move-btn">
								이동
								<img src="${root}/resources/svg/icon/down-direction.svg" alt="확장">
							</div>
						</div>

						<div class="detail-title-area">
							<button class="bookmark-btn">
								<img src="${root}/resources/svg/icon/star.svg" alt="중요">
							</button>
							<div class="mail-title">
								{ [보고] 2023 하반기 퇴직희망자 명단 }
							</div>
						</div>

						<div class="sender-info">
							<div class="mail-header-text">보낸 사람</div>
							<div class="mail-sender">
								{ 주호민 (homin_zoo@zoody.co.kr) }
							</div>
						</div>

						<div class="receiver-info">
							<div class="mail-header-text">받는 사람</div>
							<div class="mail-receivers">
								<div class="mail-receiver">{ 박지민 (j_m@zoody.co.kr) }</div>
								<div class="mail-receiver">{ 김남준 (rkiive@zoody.co.kr) }</div>
							</div>
						</div>

						<div class="mail-send-date">
							{ 2023년 7월 17일 (월) 오후 04:30 }
						</div>

						<div class="attachment-area">
							<div class="attachment-text">첨부 파일</div>
							<div class="attachment-elem">
								<button class="download-attachment-btn">
									<img src="${root}/resources/svg/icon/small-plus.svg" alt="다운로드">
								</button>
								<div class="attachment-name">
									{ 2023년 하반기 퇴직희망자 명단.xlsx }
								</div>
							</div>
							<div class="attachment-elem">
								<button class="download-attachment-btn">
									<img src="${root}/resources/svg/icon/small-plus.svg" alt="다운로드">
								</button>
								<div class="attachment-name">
									{ 2023년 하반기 퇴직희망자 명단.hwp }
								</div>
							</div>
						</div>

					</div>

				</div>

			</div>

		</div>
	
	</main>

</body>
</html>