<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/setup.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Zoody</title>
</head>
<link rel="stylesheet" href="${root}/resources/css/approval/main-page.css">
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
					<button class="new-approval-btn">새결재 작성하기</button>
				</div>
			</div>
		
			<div class="wrap-body">
				<div class="approval-box ongoing-approval">
					<div class="approval-info">
						<div class="info-upper-line">
							<div class="approval-title">
								(값) 혹한기 대비 물자 구매 품의서
							</div>
							<div class="approval-state ongoing">
								진 행 중
							</div>
						</div>
						<div class="info-lower-line">
							<div class="wirter">
								기안자 : (값) 유정연
							</div>
							<div class="enroll-date">
								기안 일자 : (값) 2023-07-11
							</div>
							<div class="category">
								결재양식 : (값) 품의서
							</div>
						</div>
					</div>
					<button class="detail-btn">
						상세 조회
					</button>
				</div>

				<div class="approval-box rejected-approval">
					<div class="approval-info">
						<div class="info-upper-line">
							<div class="approval-title">
								(값) 휴가 신청서
							</div>
							<div class="approval-state rejected">
								반 려
							</div>
						</div>
						<div class="info-lower-line">
							<div class="wirter">
								기안자 : (값) 유정연
							</div>
							<div class="enroll-date">
								기안 일자 : (값) 2023-07-11
							</div>
							<div class="category">
								결재양식 : (값) 휴가 신청서
							</div>
						</div>
					</div>
					<button class="detail-btn">
						상세 조회
					</button>
				</div>

				<div class="approval-box delayed-approval">
					<div class="approval-info">
						<div class="info-upper-line">
							<div class="approval-title">
								(값) 23-06 맹수팀 진료관련 지출 결의서
							</div>
							<div class="approval-state delayed">
								지연됨
							</div>
						</div>
						<div class="info-lower-line">
							<div class="wirter">
								기안자 : (값) 유정연
							</div>
							<div class="enroll-date">
								기안 일자 : (값) 2023-07-11
							</div>
							<div class="category">
								결재양식 : (값) 지출 결의서
							</div>
						</div>
					</div>
					<button class="detail-btn">
						상세 조회
					</button>
				</div>

			</div>

		</div>
	
	</main>

</body>
</html>