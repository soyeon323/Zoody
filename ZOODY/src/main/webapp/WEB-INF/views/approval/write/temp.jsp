<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
<link rel="stylesheet" href="${root}/resources/css/approval/write.css">
<script defer src="${root}/resources/js/approval/write/common.js"></script>
</head>

<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
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
						휴 가 신 청 서
					</div>
					<div class="approval-line">
						<table class="approval-line-table">
							<tr class="table-header-rank">
								<th class="vertical-cell" rowspan="4">상신인</th>
								<th class="table-rank sender-rank">${loginMember.rankName}</th>
								<th class="vertical-cell" rowspan="4">결재자</th>
							</tr>
							<tr class="table-body-name">
								<td class="table-name sender-name">${loginMember.name}</td>
							</tr>
							<tr class="approval-result">
								<td class="table-approval"></td>
							</tr>
							<tr class="table-date-area">
								<td class="table-date"></td>
							</tr>
						</table>
					</div>

					<div class="info-inst">

						<div class="approval-info">
							<table class="info-table">
								<tr>
									<th class="info-header">기안자</th>
									<td class="info-text drafter-name">${loginMember.name}</td>
								</tr>
								<tr>
									<th class="info-header">소속</th>
									<td class="info-text drafter-depart">${loginMember.departmentName }</td>
								</tr>
								<tr>
									<th class="info-header">기안일</th>
									<td class="info-text">
										<c:set var="now" value="<%=new java.util.Date()%>" />
									</td>
								</tr>
								<tr>
									<th class="info-header">문서번호</th>
									<td class="info-text"></td>
								</tr>
							</table>
						</div>

						<div class="leave-info">
							<table class="leave-info-table">
								<tr class="leave-table-row">
									<th class="leave-table-header">휴가 시작일</th>
									<td class="leave-table-body">
										<input type="text">
									</td>
								</tr>
								<tr>
									<th class="leave-table-header">휴가 복귀일</th>
									<td class="leave-table-body">
										<input type="text">
									</td>
								</tr>
								<tr>
									<th class="leave-table-header">휴가 일수</th>
									<td class="leave-table-body">
										<input type="text">
									</td>
								</tr>
								<tr>
									<th class="leave-table-header">휴가 유형</th>
									<td class="leave-table-body">
										<input type="text">
									</td>
								</tr>
							</table>
						</div>

					</div>


					<div class="main-text-area">
						<table class="main-text-table">
							<tr>
								<td class="table-title">휴가 사유</td>
							</tr>
							<tr>
								<td class="table-main-area" colspan="2">

									<textarea name="approvalMainText" class="leave-reason" ></textarea>

									<div class="main-form1">위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.</div>
									
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