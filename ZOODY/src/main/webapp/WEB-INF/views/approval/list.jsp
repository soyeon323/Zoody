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
<body>

	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div class="main-wrap">
	
		<%@ include file="/WEB-INF/views/side.jsp" %>
		
		<div class="wrap">
		
			<div class="wrap-header">
				<div class="category-list">
					<button class="category-box my-upvote my-upvote-active">
						<div class="category-title">내 상신 문서</div>
						<div class="number-of-case">
							<span class="my-upvote-number">(값)12</span>
							<span class="category-title">건</span>
						</div>
					</button>

					<button class="category-box unread-approval">
						<div class="category-title">확인하지 않은 결재 요청</div>
						<div class="number-of-case">
							<span class="unread-approval-number">(값)8</span>
							<span class="category-title">건</span>
						</div>
					</button>

					<button class="category-box unread-cc">
						<div class="category-title">확인하지 않은 수신 참조</div>
						<div class="number-of-case">
							<span class="unread-cc-number">(값)104</span>
							<span class="category-title">건</span>
						</div>
					</button>

					<button class="category-box my-approval">
						<div class="category-title">결재 내역 보기</div>
						<div class="number-of-case">
							<span class="my-approval-number">(값)31</span>
							<span class="category-title">건</span>
						</div>
					</button>

				</div>

				<div class="new-approval">
					<a href="${root}/approval/write/1" class="new-approval-btn">새결재 작성하기</a>
				</div>
			</div>
		
			<div class="wrap-body">

                <c:forEach items="${approvalVoList}" var="approvalVo">

                    <div class="approval-box ongoing-approval">
                        <div class="approval-info">
                            <div class="info-upper-line">
                                <div class="approval-title">
                                    ${approvalVo.title}
                                </div>
                                <div class="approval-state ongoing">
                                    진 행 중
                                </div>
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
                        <button class="detail-btn">
                            상세 조회
                        </button>
                    </div>

                </c:forEach>

			</div>

		</div>
	
	</main>

</body>
</html>