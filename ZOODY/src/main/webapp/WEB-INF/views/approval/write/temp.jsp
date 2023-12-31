<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>

<c:set var="url" value="${pageContex.request.requestURL}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/approval/write.css">
<script defer src="${root}/resources/js/approval/write/common.js"></script>

<c:choose>
	<c:when test="${fn:contains(url, '2')}">
		<script defer src="${root}/resources/js/approval/write/applicationForLeave.js"></script>
	</c:when>
	<c:when test="${fn:contains(url, '3')}">
		<script defer src="${root}/resources/js/approval/write/applicationForExtraWork.js"></script>
	</c:when>
</c:choose>

</head>

<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-left">

				<form action="${root}/approval/write" method="POST" enctype="multipart/form-data"></form>

				<div class="wrap-left-header">
					<div class="category-title">결재문서 양식</div>
					<div class="category-list">
						<button class="change-category-btn">품의서</button>
						<button class="change-category-btn">휴가 신청서</button>
						<button class="change-category-btn">지출 결의서</button>
						<button class="change-category-btn">휴일 / 연장 근무 신청서</button>
					</div>
					<div class="upvote-btn">상신하기</div>
				</div>
				
				<div class="document-form">
					<div class="document-title">
						지 출 결 의 서
					</div>
					
					<div class="info-inst">
						<div class="approval-info">
							<table class="info-table">
								<tr>
									<th class="info-header">기안자</th>
									<td class="info-text drafter-name"></td>
								</tr>
								<tr>
									<th class="info-header">소속</th>
									<td class="info-text drafter-depart"></td>
								</tr>
								<tr>
									<th class="info-header">기안일</th>
									<td class="info-text draft-date">
									</td>
								</tr>
								<tr>
									<th class="info-header">문서번호</th>
									<td class="info-text"></td>
								</tr>
							</table>
						</div>

						<div class="approval-line">
							<table class="approval-line-table">
								<tr class="table-header-rank">
									<th class="vertical-cell" rowspan="4">상신인</th>
									<th class="table-rank sender-rank"></th>
									<th class="vertical-cell" rowspan="4">결재자</th>
								</tr>
								<tr class="table-body-name">
									<td class="table-name sender-name"></td>
									<input class="sender-no" name="SenderNo" type="text">
								</tr>
								<tr class="approval-result">
									<td class="table-approval"></td>
								</tr>
								<tr class="table-date-area">
									<td class="table-date"></td>
								</tr>
							</table>
						</div>

					</div>
					<div class="main-text-area">
						<table class="main-text-table">
							<tr>
								<td class="table-title">제목</td>
								<td class="title-input-cell">
									<input class="title-input" type="text" name="receiptTitle">
								</td>
							</tr>
							<tr>
								<td class="table-main-area" colspan="2">
									<div class="table-area">
										<table class="receipt-table">
											<thead>
												<tr>
													<th class="receipt-category">항목</th>
													<th class="receipt-breakdown">내역</th>
													<th class="receipt-cost">금액</th>
													<th class="receipt-note">비고</th>
												</tr>
											</thead>
	
											<tbody>
												<tr>
													<td>
														<input type="text">
													</td>
													<td>
														<input type="text">
													</td>
													<td>
														<input type="number">
													</td>
													<td>
														<input type="text">
													</td>
												</tr>
											</tbody>
											
										</table>
									</div>
									<div class="main-form1">위 금액을 청구하오니 결재 바랍니다.</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				</form>

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

					

				</div>

			</div>

		</div>

		<div class="modal-wrap">

			<div class="mini-addressbook-wrap">

				<div class="mini-header">
					주소록
					<img class="modal-close-btn" src="${root}/resources/img/icon/svg/small-cross.svg" alt="" class="close-btn">
				</div>

				<div class="mini-main">

					<div class="mini-addressbook">

						<div class="searchbar">
							<div class="search-input-area">
								<input class="search-input" type="text">
							</div>
							<img class="search-icon" src="${root}/resources/img/icon/svg/search.svg" alt="">
						</div>

						<div class="list-tree-area">
							
							<button class="extends-list">
	
								<div class="extend-btn-icon">
									<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="확장">
								</div>
	
								${departmentList[0].name }
	
							</button>
							
							<div class="first-box list-box-area ">
							
								<c:forEach items="${userList}" var="userVo">
									<c:if test="${departmentList[0].no eq userVo.departmentNo }">
										<div class="layer">
											<div class="link-line">┠</div>
											<div class="name-rank">
												<div class="user-no">${userVo.no }</div>
												<div class="user-name">${userVo.name }</div>
												<div class="user-rank"> ${userVo.rankName }</div>
												<div class="user-grade">${userVo.grade}</div>
											</div>
										</div>
									</c:if>
								</c:forEach>
	
								<c:forEach items="${departmentList }" var="departmentVo">

									
								
									<c:if test="${departmentList[0].no eq departmentVo.upperDepartmentNo}">
									
									<button class="extends-list layer">
										<div class="extend-btn-icon">
											<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="확장">
										</div>
			
										${departmentVo.name }
									</button>
									
										<div class="list-box-area">
									
										<c:forEach items="${userList}" var="userVo">
											<c:if test="${departmentVo.no eq userVo.departmentNo }">
												<div class="layer">
													<div class="link-line">┠</div>
													<div class="name-rank">
														<div class="user-no">${userVo.no }</div>
														<div class="user-name">${userVo.name }</div>
														<div class="user-rank"> ${userVo.rankName }</div>
														<div class="user-grade">${userVo.grade}</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									
										<c:forEach items="${departmentList }" var="departmentLowerVo">
									
											<c:if test="${departmentVo.no eq departmentLowerVo.upperDepartmentNo}">
											
											<button class="extends-list layer">
												<div class="extend-btn-icon">
													<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="확장">
												</div>
					
												${departmentLowerVo.name }
											</button>
											
												<div class="list-box-area">
											
												<c:forEach items="${userList}" var="userVo">
													<c:if test="${departmentLowerVo.no eq userVo.departmentNo }">
														<div class="layer">
															<div class="link-line">┠</div>
															<div class="name-rank">
																<div class="user-no">${userVo.no }</div>
																<div class="user-name">${userVo.name }</div>
																<div class="user-rank"> ${userVo.rankName }</div>
																<div class="user-grade">${userVo.grade}</div>
															</div>
														</div>
													</c:if>
												</c:forEach>
											
												<c:forEach items="${departmentList }" var="departmentLowerVo2">
										
													<c:if test="${departmentLowerVo.no eq departmentLowerVo2.upperDepartmentNo}">
													
													<button class="extends-list layer">
														<div class="extend-btn-icon">
															<img src="${root}/resources/img/icon/svg/small-plus.svg" alt="확장">
														</div>
							
														${departmentLowerVo2.name }
													</button>
													
														<div class="list-box-area">
													
														<c:forEach items="${userList}" var="userVo">
															<c:if test="${departmentLowerVo2.no eq userVo.departmentNo }">
																<div class="layer">
																	<div class="link-line">┠</div>
																	<div class="name-rank">
																		<div class="user-no">${userVo.no }</div>
																		<div class="user-name">${userVo.name }</div>
																		<div class="user-rank"> ${userVo.rankName }</div>
																		<div class="user-grade">${userVo.grade}</div>
																	</div>
																</div>
															</c:if>
														</c:forEach>
														
														</div>
													
													</c:if>
												
												</c:forEach>
												
												</div>
											
											</c:if>
										
										</c:forEach>

										</div>
								
									</c:if>
									
							
								</c:forEach>

							</div>
						
						</div>
						
					</div>

					
					<div class="preview">
	
						<div class="preview-header">결재자</div>
	
						<div class="preview-list">

						</div>

						<button class="add-approver">
							추가하기
						</button>

					</div>
					

				</div>

			</div>

		</div>

	</main>

</body>
</html>