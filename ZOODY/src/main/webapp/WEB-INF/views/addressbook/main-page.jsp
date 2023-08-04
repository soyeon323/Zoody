<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
</head>
<link rel="stylesheet" href="${root}/resources/css/addressbook/main-page.css">
<script defer src="${root}/resources/js/addressbook/main-page.js"></script>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>

	<div class="main-wrap">
	
	    <%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="page-header">
				<div class="page-title">조직도</div>
			</div>
	
			<div class="page-main">
	
				<div class="addressbook-list">
					<div class="serch-area">
						<div class="search-input-box">
							<input type="text" name="search-input" class="search-input">
						</div>
						<button class="serach-btn">
							<img src="${root}/resources/img/icon/svg/search.svg" alt="검색" class="search-btn-icon"></img>
						</button>
					</div>
	
					<div class="list-tree-area">
							
							<button class="extends-list" id="${departmentList[0].no}">
	
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
											</div>
										</div>
									</c:if>
								</c:forEach>
	
								<c:forEach items="${departmentList }" var="departmentVo">

									
								
									<c:if test="${departmentList[0].no eq departmentVo.upperDepartmentNo}">
									
									<button class="extends-list layer" id="${departmentVo.no}">
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
													</div>
												</div>
											</c:if>
										</c:forEach>
									
										<c:forEach items="${departmentList }" var="departmentLowerVo">
									
											<c:if test="${departmentVo.no eq departmentLowerVo.upperDepartmentNo}">
											
											<button class="extends-list layer" id="${departmentLowerVo.no}">
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
															</div>
														</div>
													</c:if>
												</c:forEach>
											
												<c:forEach items="${departmentList }" var="departmentLowerVo2">
										
													<c:if test="${departmentLowerVo.no eq departmentLowerVo2.upperDepartmentNo}">
													
													<button class="extends-list layer" id="${departmentLowerVo2.no}">
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
	
				<div class="addressbook-detail">
	
					<div class="detail-header">
						<div class="detail-title">직원 상세</div>
						<button class="send-mail-shortcuts">메일 보내기</button>
					</div>
	
					<div class="detail-table-area">

						<div class="profile-area">
							<img class="detail-profile-img" src="${root}/resources/img/employee/test-profile.png" alt="프로필 사진">
						</div>

						<table class="detail-table">
							<tr>
								<td class="header-cell center-align-cell">
									이름
								</td>
								<td class="header-cell center-align-cell">
									소속
								</td>
								<td class="center-align-cell department-cell" colspan="3">
								</td>
							</tr>
							<tr>
								<td class="center-align-cell name-cell" rowspan="3">
								</td>
								<td class="header-cell center-align-cell">
									사번
								</td>
								<td class="data-cell user-no-cell">
								</td>
								<td class="header-cell center-align-cell">
									핸드폰 번호
								</td>
								<td class="data-cell phone-cell">
								</td>
							</tr>
							<tr>
								<td class="header-cell center-align-cell">
									이메일
								</td>
								<td class="data-cell email-cell">
								</td>
								<td class="header-cell center-align-cell">
									내선번호
								</td>
								<td class="data-cell office-num-cell">
								</td>
							</tr>
							<tr>
								<td class="header-cell center-align-cell">
									직위/직책
								</td>
								<td class="data-cell position-cell">
								</td>
								<td class="header-cell center-align-cell">
									대표번호
								</td>
								<td class="data-cell ">
								</td>
							</tr>
						</table>
					</div>
	
				</div>
	
			</div>
		
		</div>

	</main>

</body>
</html>