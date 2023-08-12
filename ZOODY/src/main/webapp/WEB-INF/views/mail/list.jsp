<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/mail/list.css">
<script defer src="${root}/resources/js/mail/list.js"></script>
</head>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="wrap-title">메일</div>
				<a href="${root}/mail/write">
					<button class="send-mail-btn">메일 쓰기</button>
				</a>
			</div>

			<div class="wrap-main">
				<div class="mail-sidebar">
					<div class="mail-sidebar-header">
						<div class="unread-count">
							안읽음 ${unread}
						</div>
						<button class="my-important-btn">
							<a href="${root}/mail/list?folder=bookmark" class="my-important-btn">
								<img src="${root}/resources/img/icon/svg/star.svg" alt="즐겨찾기">
								중요
							</a>
						</button>
					</div>

					<div class="default-folder-list">
						<a href="${root}/mail/list?folder=all" class="folder-btn all-mail-btn">
							<img src="${root}/resources/img/icon/svg/all-mail.svg" alt="전체메일">
							<div>전체메일</div>
						</a>
						<a href="${root}/mail/list?folder=receive" class="folder-btn receive-mail-btn">
							<img src="${root}/resources/img/icon/svg/receive-mail.svg" alt="받은메일">
							받은 메일함
						</a>
						<a href="${root}/mail/list?folder=send" class="folder-btn send-mail-list">
							<img src="${root}/resources/img/icon/svg/send-mail.svg" alt="보낸메일">
							보낸 메일함
						</a>
						<a href="${root}/mail/list?folder=to-me" class="folder-btn tome-mail-btn">
							<img src="${root}/resources/img/icon/svg/to-me-mail.svg" alt="내게쓴메일">
							내게 쓴 메일함
						</a>
						<a href="${root}/mail/list?folder=dump" class="folder-btn dump-mail-btn">
							<img src="${root}/resources/img/icon/svg/dump-mail.svg" alt="휴지통">
							휴지통
						</a>
					</div>

					<div class="custom-list-header">
						내 메일함
						<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="추가" class="folder-add-btn">
					</div>
					<div class="custom-folder-list">
						<c:forEach items="${mailBoxList}" var="mailBox" >

							<div class="custom-folder" id="${mailBox.no}">
								<img src="${root}/resources/img/icon/svg/folder.svg" alt="내폴더">
								<a href="${root}/mail/list?folder=${mailBox.no}" class="folder-name">${mailBox.name}</a>
								<img src="${root}/resources/img/icon/svg/small-cross.svg" alt="삭제" class="folder-delete-btn">
							</div>

						</c:forEach>
					</div>

				</div>

				<div class="mail-list-area">
					<div class="mail-list-header">
						<div class="list-header-left">
							<div class="list-header-title">
								메일
							</div>
							<div class="unread-receive">
								<div class="unread-count">${unread}</div>
								/
								<div class="receive-count">${mailCount}</div>
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
								<button class="header-btn read-check-btn">읽음</button>
								<button class="header-btn dump-btn">삭제</button>
							</div>
						</div>

						<c:forEach items="${mailVoList }" var="mailVo">

							<c:choose>
								<c:when test="${mailVo.readCheck eq 'O' || mailVo.readCheck2 eq 'O'}"><div class="table-data readed-data"></c:when>
								<c:otherwise><div class="table-data"></c:otherwise>
							</c:choose>
							
								<div class="check-btn-area">
									<input type="checkbox" name="mailcheck" class="small-check-btn">
									<label for="mailcheck" id="${mailVo.no}"></label>
								</div>
								<div class="add-bookmark-area">
									<button class="add-bookmark-btn" id="${mailVo.no}" value="${mailVo.bookmarkCheck}">
										<c:if test="${mailVo.bookmarkCheck eq 'X' }">
											<img src="${root}/resources/img/icon/svg/small-star.svg" alt="즐겨찾기">
										</c:if>
										<c:if test="${mailVo.bookmarkCheck eq 'O' }">
											<img src="${root}/resources/img/icon/svg/active-small-star.svg" alt="즐겨찾기">
										</c:if>
									</button>
								</div>
								<div class="read-check-icon">

									<c:choose>
										<c:when test="${mailVo.readCheck eq 'O' || mailVo.readCheck2 eq 'O'}"><img src="${root}/resources/img/icon/svg/read-mail.svg" alt="읽음"></c:when>
										<c:otherwise><img src="${root}/resources/img/icon/svg/unread-mail.svg" alt="안읽음"></c:otherwise>
									</c:choose>

								</div>
								<div class="attachment-check-icon">
									<c:if test="${mailVo.mailAttachmentCnt ne null}">
										<img src="${root}/resources/img/icon/svg/attachment.svg" alt="첨부파일">
									</c:if>
								</div>
								<div class="mail-sender">
									${mailVo.senderName} &lt ${mailVo.senderMail } &gt
								</div>
								<div class="mail-title">
									<a href="${root}/mail/detail?no=${mailVo.no}">
										${mailVo.title}
									</a>
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