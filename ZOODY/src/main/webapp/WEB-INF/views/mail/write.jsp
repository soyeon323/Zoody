<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/summernote/summernote-lite.css">
<script defer src="${root}/resources/summernote/summernote-lite.js"></script>

<link rel="stylesheet" href="${root}/resources/css/mail/write.css">
<script defer src="${root}/resources/js/mail/write.js"></script>
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

				<div class="mail-write-area">

					<form class="mail-send-form" action="${root}/mail/send" method="post" enctype="multipart/form-data">

						<div class="write-area-header">
							<div class="header-title">메일 쓰기</div>
							<input type="submit" class="send-mail-btn" value="메일 보내기"></input>
						</div>
	
						<div class="mail-setting-area">
	
							<div class="receiver-setting">
								<div class="setting-name">받는 사람</div>
								<div class="receivers-area">
									<div class="elems-area reciver-elems"></div>
									<input type="text" class="setting-input-area receiver-input-area">
								</div>
								<button type="button" class="addressbook-btn">주소록</button>
							</div>
	
							<div class="receiver-setting">
								<div class="setting-name">참조</div>
								<div class="cc-area">
									<div class="elems-area cc-elems"></div>
									<input type="text" class="setting-input-area cc-input-area">
								</div>
							</div>
	
							<div class="receiver-setting">
								<div class="setting-name">숨은 참조</div>
								<div class="bcc-area">
									<div class="elems-area bcc-elems"></div>
									<input type="text" class="setting-input-area bcc-input-area">
								</div>
							</div>
	
							<div class="receiver-setting">
								<div class="setting-name">제목</div>
								<input type="text" name="title" class="title-input-area">
							</div>
	
							<div class="receiver-setting">
								<div class="setting-name">첨부 파일</div>
								<label class="attachment-label" for="attachment-file">내 PC</label>
								<input class="add-attachment-input" name="attachmentFileList" id="attachment-file" type="file" multiple>
							</div>
							<div class="receiver-setting">
								<div class="setting-name"></div>
								<div class="attachment-list-area">
	
								</div>
							</div>

						</div>


						<!-- 메일 본문 -->
						<div class="mail-content-area">
							<textarea class="mail-content" id="summernote" name="content"></textarea>
						</div>

					</form>

				</div>

			</div>

		</div>
	
	</main>

</body>
</html>