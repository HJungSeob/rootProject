<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdateSideMenu.css">
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdateSideMenu.js"></script>
</head>

<div class="m_buyerUpdateSideMenu_header1">
	<div class="m_buyerUpdateSideMenu_header">
		<div class="m_buyerUpdateSideMenu_header_acc">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerServiceInfo.do?b_idx=${buyer.b_idx}">계정</a>
			| Root ID 관리
		</div>
		<div class="m_buyerUpdateSideMenu_loar">
			<a href="${pageContext.request.contextPath}/buyer/buyerLogout.do"
				class="m_buyerUpdateSideMenu_logout">로그아웃
				<div class="arrow_small a12"></div>
			</a>
		</div>
	</div>
</div>
<!-- #endregion -->
<div class="m_buyerUpdateSideMenu_mainregion">
	<div class="m_buyerUpdateSideMenu_sideregion">
		<div class="m_buyerUpdateSideMenu_proflie"></div>
		<div class="m_buyerUpdateSideMenu_username">${buyer.b_nickname}</div>
		<div class="m_buyerUpdateSideMenu_useremail">${buyer.b_email}</div>
		<div class="m_buyerUpdateSideMenu_side_region"></div>
		<div class="m_buyerUpdateSideMenu_side">
			<a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage.do"
				class="m_buyerUpdateSideMenu_sidemanu" id="page">공개 프로필</a>
		</div>
		<div class="m_buyerUpdateSideMenu_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do"
				class="m_buyerUpdateSideMenu_sidemanu" id="page1">개인 정보</a>
		</div>
		<div class="m_buyerUpdateSideMenu_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage2.do"
				class="m_buyerUpdateSideMenu_sidemanu" id="page2">로그인 및 보안</a>
		</div>
		<div class="m_buyerUpdateSideMenu_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage3.do"
				class="m_buyerUpdateSideMenu_sidemanu" id="page3">결제 관리</a>
		</div>
		<div class="m_buyerUpdateSideMenu_side">
			<div class="m_buyerUpdateSideMenu_sidemanu_cancel" id="cancelOpenBtn">회원
				탈퇴</div>
		</div>
	</div>
	<div class="m_buyerUpdateSideMenu_cancelBlur" id="cancelBlur"></div>
	<div class="m_buyerUpdateSideMenu_cancelRegion" id="cancelRegion">
		<form name="buyerCancel" method="get" action="buyerCancelProcess.do">
			<div class="m_buyerUpdateSideMenu_cancelTitle">회원탈퇴</div>
			<div id="cancelPage1">
				<div class="m_buyerUpdateSideMenu_cancelSubTitle">계정을 삭제하시려면 암호를 입력해 주세요.</div>
				<div class="m_buyerUpdateSideMenu_exPwRegion" id="exPwRegion">
					<label>
						<input type="password" class="m_buyerUpdateSideMenu_exPwInput" id="exPwInput">
						<div class="m_buyerUpdateSideMenu_exPwTitle" id="exPwTitle">현재암호</div>
					</label>
					<div class="m_buyerUpdateSideMenu_exPwMsg" id="exPwMsg"></div>
				</div>
				<div class="m_buyerUpdateSideMenu_cancelNextBtn">
					<label>
						<div class="m_buyerUpdateSideMenu_cancelNextBtnName">계정삭제</div> <input
						type="button" class="m_buyerUpdateSideMenu_none" id="nextCancelBtn" disabled="disabled">
					</label>
				</div>
			</div>
			<div id="cancelPage2" class="m_buyerUpdateSideMenu_none">
				<div class="m_buyerUpdateSideMenu_checkTitle">정말 계정을 삭제하시겠습니까?</div>
				<div class="m_buyerUpdateSideMenu_cancelNextBtn">
					<label>
						<div class="m_buyerUpdateSideMenu_cancelSubmitBtn">삭제</div>
						<input type="submit" class="m_buyerUpdateSideMenu_none" disabled="disabled" id="cancelOkBtn">
					</label>
				</div>
			</div>
		</form>
	</div>