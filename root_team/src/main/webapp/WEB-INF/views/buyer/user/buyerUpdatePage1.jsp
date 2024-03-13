<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.BuyerVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root account</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage1.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/birthdayRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/birthdayIO.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdatePage1.js"></script>
</head>

<body>
	<div class="wrap">
		<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>
		<section>
			<%@ include file="buyerUpdateSideMenu.jsp"%>

			<!-- #region 메인 컨텐츠 메뉴 -->
			<div class="m_userinfo_mainPage">
				<div class="m_userinfo_main_title">개인정보</div>
				<div class="m_userinfo_main_content">연락 가능한 전화번호 및 이메일 주소를
					포함하여 개인 정보를 관리하십시오.</div>
				<div class="m_userinfo_main_content_region">
					<div class="m_userinfo_content" id="m_userinfo_contentname">
						<div class="m_userinfo_content_nametitle">이름</div>
						<div class="m_userinfo_content_namesub">
							${buyer.b_firstname}&nbsp;${buyer.b_lastname}</div>
					</div>
					<div class="m_userinfo_content" id="m_userinfo_contentday">
						<div class="m_userinfo_content_nametitle">생년월일</div>
						<div class="m_userinfo_content_namesub">
							<fmt:parseDate var="date" value="${buyer.b_birth}"
								pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate value="${date}" pattern="yyyy.MM.dd" />
						</div>
					</div>
				</div>
				<div class="m_userinfo_main_content_region">
					<div class="m_userinfo_content" id="genderBox">
						<div class="m_userinfo_content_nametitle">성별</div>
						<div class="m_userinfo_content_namesub">
						<c:choose>
							<c:when test="${buyer.b_gender eq 'F'}">
								여자
							</c:when>
							<c:when test="${buyer.b_gender eq 'M'}">
								남자
							</c:when>
							<c:otherwise>
								미선택
							</c:otherwise>			
						</c:choose>					
						</div>
					</div>
					<div class="m_userinfo_content_temp" id="m_userinfo_contentday">
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 이름 생일 수정 박스 -->
			<div class="m_userinfo_updatename_region_buer" id="main_region_buer"></div>
			<div class="m_userinfo_updatename_region" id="main_region_name">
				<div class="m_userinfo_updatename_region_name">이름</div>
				<form name="buyerUpdate" method="post"
					action="buyerUpdateProcess.do">
					<input type="hidden" name="b_idx" value="${buyer.b_idx}">
					<div class="_inputRegion"
						id="firstNameRegion">
						<input type="text" name="b_firstname" placeholder=" "
							class="" id="firstNameInput">
							<span class=""
								id="firstNametitle">성</span>
						<div class="m_userinfo_updatename_region_reuslt" id="firstNameMsg"></div>
					</div>
					<div class="_inputRegion" id="lastNameRegion">
						<input type="text" name="b_lastname" placeholder=" "
							class="" id="lastNameInput">
							<span class=""
								id="lastNametitle">이름</span>
						<div class="m_userinfo_updatename_region_reuslt" id="lastNameMsg"></div>
					</div>
					<div
						class="m_userinfo_updatename_region_submit m_userinfo_updatename_region_hr2"
						id="edsubmit2">
						<label>
							<div class="m_userinfo_updatename_region_submited">수정</div> <input
							type="submit" disabled="disabled"
							class="m_userinfo_updatename_region_submit1" id="namesubmit1">
						</label>
					</div>
				</form>
			</div>
			<div class="m_userinfo_updatename_region"
				id="m_userinfo_updatename_region_bday">
				<div class="m_userinfo_updatename_region_bdaytitle">생년월일</div>
				<div class="m_userinfo_updatename_region_bdaysub">생년월일은 연령대에
					적합한 서비스를 결정하는 데 사용됩니다.</div>
				<form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
					<input type="hidden" name="b_idx" value="${buyer.b_idx}">
					<div class="m_userinfo_updatename_region_inbday">
						<div class="_inputRegionBir" id="yyyyregion">
							<label> <input type="text" name="b_birth" placeholder=" "
								class="" id="yyyyinput"
								maxlength="8" autocomplete='off'>
								<span class="" id="yyyytext">생년월일</span>
								<div id="result" class="m_userinfo_updatename_region_resultyyyy">yyyy년
									mm월 dd일</div>
							</label>
							<div class="m_userinfo_updatename_region_reuslt" id="resultmsg"></div>
						</div>
						<div
							class="m_userinfo_updatename_region_submit m_userinfo_updatename_region_hr2"
							id="edsubmit">
							<label>
								<div class="m_userinfo_updatename_region_submited">수정</div> <input
								type="submit" disabled="disabled"
								class="m_userinfo_updatename_region_submit1" id="submit">
							</label>
						</div>
					</div>
				</form>
			</div>
			<div class="m_userinfo_genderRegion" id="genderRegion">
				<form name="buyerUpdate" method="post" action="buyerInfoUpdateProcess.do">
				<input type="hidden" name="b_idx" value="${buyer.b_idx}">
					<div class="m_userinfo_genderTitle">성별</div>
					<label>
						<div class="m_userinfo_flex">
							<div class="m_userinfo_selectGenderTitle">남자</div>
							<input type="radio" name="b_gender" value="M" class="m_userinfo_selectGender">
						</div>
					</label> <label>
						<div class="m_userinfo_flex">
							<div class="m_userinfo_selectGenderTitle">여자</div>
							<input type="radio" name="b_gender" value="F" class="m_userinfo_selectGender">
						</div>
					</label>
					<div class="m_userinfo_updatename_region_submit hr2"
						id="Gendersubmit">
						<label>
							<div class="m_userinfo_updatename_region_submited">수정</div> <input
							type="submit" class="m_userinfo_updatename_region_submit1"
							id="gendersubmit">
						</label>
					</div>
				</form>
			</div>
		</section>
	</div>
	<footer>
		<%@ include file="../common/global_footer.jsp"%>
	</footer>
	<!-- #endregion -->
</body>
</html>