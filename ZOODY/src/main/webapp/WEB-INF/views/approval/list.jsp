<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
</head>
<link rel="stylesheet" href="${root}/resources/css/approval/list.css">
<script defer src="${root}/resources/js/approval/list.js"></script>
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="category-list">
					<a href="${root}/approval/list?category=1" class="category-box my-approvl">
						<div class="category-title">내가 받은 결재 문서</div>
						<div class="number-of-case">
							<span class="my-approvl-number">${receiveCnt}</span>
							<span class="category-title">건</span>
						</div>
					</a>

					<a href="${root}/approval/list?category=2" class="category-box standby-approval">
						<div class="category-title">내 결재 대기 중인 문서</div>
						<div class="number-of-case">
							<span class="standby-approval-number">${standbyCtn}</span>
							<span class="category-title">건</span>
						</div>
					</a>

					<a href="${root}/approval/list?category=3" class="category-box unread-cc">
						<div class="category-title">참조 결재 문서</div>
						<div class="number-of-case">
							<span class="unread-cc-number">${ccCtn}</span>
							<span class="category-title">건</span>
						</div>
					</a>

					<a href="${root}/approval/list?category=4" class="category-box my-upvote">
						<div class="category-title">내 상신 문서</div>
						<div class="number-of-case">
							<span class="my-upvote-number">${upvoteCnt}</span>
							<span class="category-title">건</span>
						</div>
					</a>

				</div>

				<div class="new-approval">
					<a href="${root}/approval/write/1" class="new-approval-btn">새결재 작성하기</a>
				</div>
			</div>
		
			<div class="wrap-body">

                <c:forEach items="${approvalVoList}" var="approvalVo">

					<c:choose>
						<c:when test="${approvalVo.result eq '진행중'}">
							<div class="approval-box ongoing-approval">
						</c:when>
						<c:when test="${approvalVo.result eq '반려'}">
							<div class="approval-box rejected-approval">
						</c:when>
						<c:when test="${approvalVo.result eq '결재완료' || approvalVo.result eq '전결'}">
							<div class="approval-box completed-approval">
						</c:when>
					</c:choose>
                    
                        <div class="approval-info">
                            <div class="info-upper-line">
                                <div class="approval-title">
                                    ${approvalVo.title}
                                </div>
								<c:choose>
									<c:when test="${approvalVo.result eq '진행중'}">
										<div class="approval-state ongoing">
											진 행 중
										</div>
									</c:when>
									<c:when test="${approvalVo.result eq '반려'}">
										<div class="approval-state rejected">
											반 려 됨
										</div>
									</c:when>
									<c:when test="${approvalVo.result eq '결재완료' || approvalVo.result == '전결'}">
										<div class="approval-state completed">
											결 재 완 료
										</div>
									</c:when>
								</c:choose>
                                
                            </div>
                            <div class="info-lower-line">
                                <div class="wirter">
                                    기안자 : ${approvalVo.drafterName}
                                </div>
                                <div class="enroll-date">
                                    기안 일자 : ${approvalVo.requestDate}
                                </div>
                                <div class="category">
                                    결재양식 : ${approvalVo.categoryName}
                                </div>
                            </div>
                        </div>
                        <a href="${root}/approval/detail?no=${approvalVo.no}" class="detail-btn">
                            상세 조회
                        </a>
                    </div>

                </c:forEach>

			</div>

		</div>
	
	</main>

</body>
</html>