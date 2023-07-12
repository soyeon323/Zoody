<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/approval/write/letter-of-approval.css">
</head>

<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<main>
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-left">

				<div class="wrap-left-header">
					<div class="category-title">결재문서 양식</div>
					<div class="category-list">
						<button class="change-category-btn selected-category">품의서</button>
						<button class="change-category-btn">휴가 신청서</button>
						<button class="change-category-btn">지출 결의서</button>
						<button class="change-category-btn">휴일 / 연장 근무 신청서</button>
					</div>
					<div class="upvote-btn">상신하기</div>
				</div>
				<div class="document-form">
					<div class="document-title">
						품 의 서
					</div>
					<div class="approval-line">
						<table class="approval-line-table">
							<tr>
								<th class="vertical-cell" rowspan="4">상신인</th>
								<th class="table-rank">{팀원}</th>
								<th class="vertical-cell" rowspan="4">결재자</th>
								<th class="table-rank">{팀장}</th>
								<th class="table-rank">{과장}</th>
								<th class="table-rank">{부장}</th>
							</tr>
							<tr>
								<td class="table-name">{박재한}</td>
								<td class="table-name">{이지은}</td>
								<td class="table-name">{주호민}</td>
								<td class="table-name">{유지민}</td>
							</tr>
							<tr>
								<td class="table-approval"></td>
								<td class="table-approval"></td>
								<td class="table-approval"></td>
								<td class="table-approval"></td>
							</tr>
							<tr>
								<td class="table-date"></td>
								<td class="table-date"></td>
								<td class="table-date"></td>
								<td class="table-date"></td>
							</tr>
						</table>
					</div>

					<div class="info-inst">

						<div class="approval-info">
							<table class="info-table">
								<tr>
									<th class="info-header">기안자</th>
									<td class="info-text">{박재한}</td>
								</tr>
								<tr>
									<th class="info-header">소속</th>
									<td class="info-text">{동물복지1과 > 맹수팀 }</td>
								</tr>
								<tr>
									<th class="info-header">기안일</th>
									<td class="info-text">{2023-07-03 (월)}</td>
								</tr>
								<tr>
									<th class="info-header">문서번호</th>
									<td class="info-text">{ad052347}</td>
								</tr>
							</table>
						</div>

						<div class="approval-inst">
							<table>
								<tr>
									<th class="inst-header">결재자 지시사항</th>
								</tr>
								<tr>
									<td class="inst-text"></td>
								</tr>
							</table>
						</div>

					</div>


					<div class="main-text-area">
						<table class="main-text-table">
							<tr>
								<td class="table-title">제목</td>
								<td class="title-input-cell">
									<input class="title-input" type="text" name="approvalTitle">
								</td>
							</tr>
							<tr>
								<td class="table-main-area" colspan="2">
									<div class="main-form1">아래와 같이 보고하오니 검토 후 재가 바랍니다.</div>
									<div class="main-form2">-아 래-</div>
		
									<textarea name="approvalMainText" id="approval-main-text"></textarea>
								</td>
							</tr>
						</table>
					</div>

				</div>

			</div>

			<div class="wrap-right">
				<div class="title-area">
					결재자 설정
				</div>
				<div class="btn-area">
					<button class="add-btn">
						추가
					</button>
					<button class="delete-btn">
						삭제
					</button>
				</div>
				<div class="preview-area">

					<div class="approver">
						<div class="profile-area">
							<img class="profile-img" alt="프로필 사진" src="${root}/resources/png/profile/test-profile.png">
						</div>
						<div class="info-area">
							<div class="name-rank">
								<div class="approver-name">{이지은}</div>
								<div class="approver-rank">{팀장}</div>
							</div>
							<div class="department">
								<div>소속 : </div>
								{동물원 > 동물복지1과}
							</div>
						</div>
					</div>

					<div class="approver selecte-approver">
						<div class="profile-area">
							<img class="profile-img" alt="프로필 사진" src="${root}/resources/png/profile/test-profile.png">
						</div>
						<div class="info-area">
							<div class="name-rank">
								<div class="approver-name">{주호민}</div>
								<div class="approver-rank">{과장}</div>
							</div>
							<div class="department">
								<div>소속 : </div>
								{동물원 > 동물복지1과}
							</div>
						</div>
					</div>

					<div class="approver">
						<div class="profile-area">
							<img class="profile-img" alt="프로필 사진" src="${root}/resources/png/profile/test-profile.png">
						</div>
						<div class="info-area">
							<div class="name-rank">
								<div class="approver-name">{유지민}</div>
								<div class="approver-rank">{부장}</div>
							</div>
							<div class="department">
								<div>소속 : </div>
								{동물원}
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
	
	</main>

</body>
</html>