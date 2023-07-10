<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${root}/resources/css/addressbook/main-page.css">
<body>

	<main>
		
		<div class="page-header">
			<div class="page-title">조직도</div>
		</div>

		<div class="page-main">

			<div class="addressbook-list">
				<div class="serch-area">
					<input type="text" name="search-input" class="search-input-box">
					<button class="serach-btn">
						<img src="${root}/resources/svg/icon/search.svg" alt="검색" class="search-btn-icon"></img>
					</button>
				</div>

				<div class="list-tree-area">

				</div>
			</div>

			<div class="addressbook-detail">

				<div class="detail-header">
					<div class="detail-title">직원 상세</div>
					<button class="send-mail-shortcuts">메일 보내기</button>
				</div>

				<div class="detail-table-area">
					<table class="detail-table" border="1">
						<tr>
							<td class="profile-data" rowspan="4"><img class="profile-data" src="" alt="프로필 사진"></td>
							<td class="header-cell">이름</td>
							<td class="header-cell">소속</td>
							<td colspan="3">(값) ㅇㅇ동물원 > 동물관리부 > 동물복지1과 > 맹수팀</td>
						</tr>
						<tr>
							<td rowspan="3">이지은</td>
							<td class="header-cell">사번</td>
							<td class="data-cell">(값) 21024317</td>
							<td class="header-cell">핸드폰 번호</td>
							<td>(값) 010-1111-2222</td>
						</tr>
						<tr>
							<td class="header-cell">이메일</td>
							<td class="data-cell">(값) dlwlrma@zoody.co.kr</td>
							<td class="header-cell">내선번호</td>
							<td class="data-cell">(값) 070-333-4444</td>
						</tr>
						<tr>
							<td class="header-cell">작위/직책</td>
							<td class="data-cell">(값) 팀장</td>
							<td class="header-cell">대표전화</td>
							<td class="data-cell">(값) 010-1111-2222</td>
						</tr>
					</table>
				</div>

			</div>

		</div>

	</main>

</body>
</html>