<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<!-- #region 상단 -->
			<div class="m_userinfopayup_header1">
				<div class="m_userinfopayup_header">
					<div class="m_userinfopayup_header_acc">Root ID</div>
					<div class="m_userinfopayup_loar">
						<a href="#" class="m_userinfopayup_logout">로그아웃
							<div class="arrow_small_right a12"></div>
						</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->
			<div class="m_userinfopayup_mainregion">
				<!--  #region 사이드 메뉴 -->
				<div class="m_userinfopayup_sideregion">
					<div class="m_userinfopayup_proflie"></div>
					<div class="m_userinfopayup_username">이름</div>
					<div class="m_userinfopayup_useremail">이메일</div>
					<div class="m_userinfopayup_side_region"></div>
					<div class="m_userinfopayup_side">
						<a
							href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do"
							class="m_userinfopayup_sidemanu">개인 정보</a>
					</div>
					<div class="m_userinfopayup_side">
						<a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage2.do"
							class="m_userinfopayup_sidemanu">로그인 및 보안</a>
					</div>
					<div class="m_userinfopayup_side">
						<a
							href="${pageContext.request.contextPath}/buyer/buyerUpdatePage3.do"
							class="m_userinfopayup_sidemanu_select">결제 관리</a>
					</div>
				</div>
				<!-- #endregion -->

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

			</div>
		</section>
		<footer>
			<%@ include file="../common/global_footer.jsp"%>
		</footer>
	</div>
</body>

</html>