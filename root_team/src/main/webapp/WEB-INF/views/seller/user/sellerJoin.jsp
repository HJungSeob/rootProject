<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ENT Root ID 생성 - Root</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/seller/user/sellerJoin.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/sellerjoinService.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/taxidRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/taxidAutoHyphen.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/joinNextPage.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/birthdayIO.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/birthdayRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/passwordRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/sellercheckjoin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/terms.js"></script>
</head>

<body>
	<div class="wrap">
		<header>
			<%@ include file="../../buyer/common/global_header.jsp"%>
		</header>
		<section>
			<!-- #region 상단 타이틀 -->
			<div class="m_sellerJoin_title">
				<div class="m_sellerJoin_tiregion">
					<div class="m_sellerJoin_tiregionti">ENT Root ID</div>
					<div class="m_sellerJoin_tiregionre">
						<a href="#" class="m_sellerJoin_tiregionss">로그인</a> <a href="#"
							class="m_sellerJoin_tiregionss">ENT Root ID 생성</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<div class="m_sellerJoin_mainRegion">
				<form>
					<!-- #region 페이지1 -->
					<div class="m_sellerJoin_maintitle">ENT Root ID 생성</div>
					<div class="m_sellerJoin_subtitle">하나의 ENT Root ID로 모든 Root
						서비스를 이용할 수 있습니다.</div>
					<div id="joinPage1" class="m_sellerJoin_page1">
						<div class="m_sellerJoin_telRegion" id="telRegion">
							<label> <input type="tel" name="tel"
								class="m_sellerJoin_telInput" id="telInput" maxlength="13">
								<div class="m_sellerJoin_teltitle" id="telTitle">전화번호</div>
							</label>
							<div class="m_sellerJoin_telMsg" id="telSmg"></div>
						</div>
						<div id="active"></div>
						<div class="m_sellerJoin_content">항상 사용할 수 있는 전화번호를 입력하십시오.
							새 기기나 웹 브라우저에 로그인할 때 해당 전화번호를 사용하여 신원을 확인합니다. 메시지 또는 데이터 요금이 적용될
							수 있습니다.</div>
						<div class="m_sellerJoin_checkregion">
							<label> <input type="checkbox" name="terms" id="terms"
								value="y"> <span class="m_sellerJoin_rula"> <a
									href="#" class="m_sellerJoin_atag">Root의 개인정보 처리방침</a>에 따라 개인
									정보를 수집, 사용, 타사에 대한 제공 및 처리하는 데 동의합니다.</label> </span>
						</div>
						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="nextPageBtn">
								<label>
									<div class="m_sellerJoin_next1">
										다음 <input type="button" class="m_sellerJoin_btn" id="nextPage"
											disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
						<div></div>
					</div>
					<!-- #endregion -->

					<!--  #region 페이지2 -->
					<div id="joinPage2" class="m_sellerJoin_page2">
						<div class="m_sellerJoin_nameRegion">
							<div class="m_sellerJoin_regionFirstName" id="firstNameRegion">
								<label> <input type="text" name="firstName"
									class="m_sellerJoin_firstNameInput" id="firstNameInput">
									<div class="m_sellerJoin_firstNametitle" id="firstNametitle">성</div>
								</label>
								<div class="m_sellerJoin_nameMsg" id="firstNameMsg"></div>
							</div>
							<div class="m_sellerJoin_updatename_region_hr" id="active"></div>
							<div class="m_sellerJoin_regionFirstName" id="lastNameRegion">
								<label> <input type="text" name="lastName"
									class="m_sellerJoin_firstNameInput" id="lastNameInput">
									<div class="m_sellerJoin_firstNametitle" id="lastNametitle">이름
									</div>
								</label>
								<div class="m_sellerJoin_nameMsg" id="lastNameMsg"></div>
							</div>
						</div>
						<div class="m_sellerJoin_updatename_region_taxid">
							<div class="m_sellerJoin_taxidRegion" id="taxidRegion">
								<label> <input type="text" name="taxid"
									class="m_sellerJoin_taxidInput" id="taxidInput" maxlength="12">
									<div class="m_sellerJoin_taxidTitle" id="taxidTitle">사업자
										번호</div>
								</label>
								<div class="m_sellerJoin_taxidMsg" id="taxidMsg"></div>
							</div>
						</div>
						<div class="m_sellerJoin_updatename_region_inbday">
							<div class="m_sellerJoin_birthdayRegion" id="yyyyregion">
								<label> <input type="text" name="birthday"
									class="m_sellerJoin_birthdayInput" id="yyyyinput" maxlength="8">
									<div class="m_sellerJoin_birthdayText" id="yyyytext">생년월일</div>
									<div id="result" class="m_sellerJoin_birthdayResult">yyyy년
										mm월 dd일</div>
								</label>
								<div class="m_sellerJoin_birthdayMsg" id="resultmsg"></div>
							</div>
						</div>
						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="lastPageBtn">
								<label>
									<div class="m_sellerJoin_next1">
										다음 <input type="button" class="m_sellerJoin_btn" id="lastPage"
											disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->

					<!-- #region 페이지3 -->
					<div id="joinPage3" class="m_sellerJoin_page3">
						<div class="m_sellerJoin_emailRegion" id="emailRegion">
							<label> <input type="email" name="email"
								class="m_sellerJoin_emailInput" id="emailInput">
								<div class="m_sellerJoin_emailTitle" id="emailTitle">name@example.com</div>
							</label>
							<div class="m_sellerJoin_emailMsg" id="emailMsg"></div>
							<div id="active"></div>
						</div>
						<div class="m_sellerJoin_passwordRegion" id="newPwRegion">
							<label> <input type="password" name="pw"
								class="m_sellerJoin_passwordInput" id="newPwInput">
								<div class="m_sellerJoin_passwordTitle" id="passwordTitle">암호</div>
							</label>
							<div class="m_sellerJoin_passwordMsg" id="newPwMsg"></div>
						</div>
						<div class="m_sellerJoin_checkPasswordRegion" id="ckeckPwRegion">
							<label> <input type="password"
								class="m_sellerJoin_checkPasswordInput" id="ckeckPwInput">
								<div class="m_sellerJoin_checkPasswordTitle"
									id="checkPasswordTitle">암호 확인</div>
							</label>
							<div class="m_sellerJoin_checkPasswordMsg" id="ckeckPwMsg"></div>
						</div>
						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="joinSubmitBtn">
								<label>
									<div class="m_sellerJoin_next1">
										가입하기 <input type="submit" class="m_sellerJoin_btn"
											id="joinSubmit" disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->
				</form>
		</section>
	</div>

	<footer>
		<%@ include file="../../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>