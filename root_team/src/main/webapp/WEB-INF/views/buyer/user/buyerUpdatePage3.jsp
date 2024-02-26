<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.BuyerVO"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root account</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage3.css">
</head>

<body>
	<div class="wrap">
		<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>
		<section>
			<%@ include file="buyerUpdateSideMenu.jsp"%>

			<!-- #region 메인 컨텐츠 메뉴 -->
			<div class="m_userinfopayup_mainPage">
				<div class="m_userinfopayup_main_title">결제 관리</div>
				<div class="m_userinfopayup_main_content_region">
					<div class="m_userinfopayup_content"
						id="m_userinfopayup_contentname1">
						<div class="m_userinfopayup_content_nametitle">저장된 결제 방법</div>
						<div class="m_userinfopayup_content_namesub">카드번호</div>
					</div>
					<div class="m_userinfopayup_content1">
						<div class="m_userinfopayup_content_namesub">구입에 사용하는 기본 결제
							방법입니다.</div>
						<div class="m_userinfopayup_content_namesuba">
							<a href="" class="m_userinfopayup_content_namesuba">세부사항 보기</a>
						</div>
					</div>
				</div>
			</div>
			<!-- #endregion -->
		</section>

	</div>
	<footer>
		<%@ include file="../common/global_footer.jsp"%>
	</footer>
</body>

</html>