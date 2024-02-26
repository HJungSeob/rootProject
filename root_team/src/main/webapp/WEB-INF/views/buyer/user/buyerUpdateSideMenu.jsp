<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdateSideMenu.css">
<script>
	$(function() {
		$('#page').click(function() {
	        $('#page').addClass('select');
	        $('#page1').removeClass('select');
	        $('#page2').removeClass('select');
	        $('#page3').removeClass('select');
	    });
	    
	    $('#page1').click(function() {
	        $('#page').removeClass('select');
	        $('#page1').addClass('select');
	        $('#page2').removeClass('select');
	        $('#page3').removeClass('select');
	    });
	    
	    $('#page2').click(function() {
	        $('#page').removeClass('select');
	        $('#page1').removeClass('select');
	        $('#page2').addClass('select');
	        $('#page3').removeClass('select');
	    });
	    
	    $('#page3').click(function() {
	        $('#page').removeClass('select');
	        $('#page1').removeClass('select');
	        $('#page2').removeClass('select');
	        $('#page3').addClass('select');
	    });
	})
</script>
</head>

<div class="m_userinfo_header1">
	<div class="m_userinfo_header">
		<div class="m_userinfo_header_acc">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerServiceInfo.do?b_idx=${buyer.b_idx}">계정</a>
			| Root ID 관리
		</div>
		<div class="m_userinfo_loar">
			<a href="${pageContext.request.contextPath}/buyer/buyerLogout.do"
				class="m_userinfo_logout">로그아웃
				<div class="arrow_small a12"></div>
			</a>
		</div>
	</div>
</div>
<!-- #endregion -->
<div class="m_userinfo_mainregion">
	<!--  #region 사이드 메뉴 -->
	<div class="m_userinfo_sideregion">
		<div class="m_userinfo_proflie"></div>
		<div class="m_userinfo_username">${buyer.b_nickname}</div>
		<div class="m_userinfo_useremail">${buyer.b_email}</div>
		<div class="m_userinfo_side_region"></div>
		<div class="m_userinfo_side">
			<a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage.do"
				class="m_userinfo_sidemanu" id="page">공개 프로필</a>
		</div>
		<div class="m_userinfo_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do"
				class="m_userinfo_sidemanu" id="page1">개인 정보</a>
		</div>
		<div class="m_userinfo_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage2.do"
				class="m_userinfo_sidemanu" id="page2">로그인 및 보안</a>
		</div>
		<div class="m_userinfo_side">
			<a
				href="${pageContext.request.contextPath}/buyer/buyerUpdatePage3.do"
				class="m_userinfo_sidemanu" id="page3">결제 관리</a>
		</div>
	</div>
	<!-- #endregion -->