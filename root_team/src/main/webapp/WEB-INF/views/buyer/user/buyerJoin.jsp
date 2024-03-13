<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root ID 생성 - Root</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerJoin.css">

<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerJoin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
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
	src="${pageContext.request.contextPath}/resources/js/buyer/user/checkjoin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/terms.js"></script>

<script>
	let emailCheckValid = false;
	let telCheckValid = false;

	$(function() {
		$("#emailInput")
				.keyup(
						function() {
							var emailInput = $('#emailInput').val();

							$
									.ajax({
										type : 'post',
										url : '${pageContext.request.contextPath}/buyer/emailCheckProcess.do?b_email='
												+ emailInput,
										data : {
											email : emailInput
										}, // 데이터 전송 방식 수정
										dataType : "text",
										success : function(data) {
											if (data == 1) {
												$("#emailMsg").text(
														"사용중인 이메일입니다.");
												$('#emailInput').css("border",
														"1px solid #F74848");
												emailCheckValid = false;
											} else {
												emailCheckValid = true;
											}
										},
										error : function() {
											console.log("실패");
										}
									});

							try {
								globaldisable();
							} catch (Exception) {
							}
						});
	});
	
	$(function(){
		$("#telInput").keyup(function() {
			var telInput = $('#telInput').val();
			
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/buyer/telCheckProcess.do?b_tel=' + telInput,
				data: {tel: telInput}, // 데이터 전송 방식 수정
				dataType: "text",
				success: function(data) {	
					if (data == 1) {
						$("#telSmg").text("사용중인 전화번호입니다.");
						$('#telInput').css("border", "1px solid #F74848");
						telCheckValid = false;
					} else {
						telCheckValid = true;
					}
				},
				error: function() {
					console.log("실패");
				}
			});
			
			try {
	            globaldisable();
	        } catch (Exception) {}
		});
	});

</script>
</head>

<body>
	<div class="wrap">
		<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>

		<section>
			<!-- #region 상단 타이틀 -->
			<div class="m_userLogin_title">
				<div class="m_userLogin_tiregion">
					<div class="m_userLogin_tiregionti">Root ID</div>
					<div class="m_userLogin_tiregionre">
						<a href="${pageContext.request.contextPath}/buyer/buyerLogin.do"
							class="m_userLogin_tiregionss">로그인</a> <a
							href="${pageContext.request.contextPath}/buyer/buyerJoin.do"
							class="m_userLogin_tiregionss">Root ID 생성</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<div class="m_userLogin_mainRegion">
				<form name="buyerJoin" method="post" action="buyerJoinProcess.do">
					<!-- #region 페이지1 -->
					<div class="m_userLogin_maintitle">Root ID 생성</div>
					<div class="m_userLogin_subtitle">하나의 Root ID로 모든 Root 서비스를
						이용할 수 있습니다.</div>
					<div id="joinPage1" class="m_userLogin_page1">
						<div class="_inputRegion" id="telRegion">
							<input placeholder=" " type="tel" name="b_tel" class=""
								id="telInput" maxlength="13"> <span class=""
								id="telTitle">전화번호</span>
							<div class="m_userLogin_telMsg" id="telSmg"></div>
						</div>



						<div class="m_userLogin_content">항상 사용할 수 있는 전화번호를 입력하십시오. 새
							기기나 웹 브라우저에 로그인할 때 해당 전화번호를 사용하여 신원을 확인합니다. 메시지 또는 데이터 요금이 적용될 수
							있습니다.</div>
						<div class="m_userLogin_checkregion">
							<label> <input type="checkbox" name="b_terms" id="terms"
								value="y"> <span class="m_userLogin_rula"> <a
									href="#" class="m_userLogin_atag">Root의 개인정보 처리방침</a> 에 따라 개인
									정보를 수집, 사용, 타사에 대한 제공 및 처리하는 데 동의합니다.
							</span>
							</label>
						</div>

						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="nextPageBtn">
								<label>
									<div class="m_userLogin_next1">
										다음<input type="button" class="m_userLogin_btn" id="nextPage"
											disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>

						<div></div>
					</div>
					<!-- #endregion -->

					<!--  #region 페이지2 -->
					<div id="joinPage2" class="m_userLogin_page2">
						<div class="m_userLogin_nameRegion">
							<div class="_inputRegionName" id="firstNameRegion">
								<input placeholder=" " type="text" name="b_firstname"
									class="" id="firstNameInput">
									<span class="" id="firstNametitle">성</span>
								<div class="m_userLogin_nameMsg" id="firstNameMsg"></div>
							</div>

							<div class="m_userinfo_updatename_region_hr" id="active"></div>

							<div class="_inputRegionName" id="lastNameRegion">
								<input placeholder=" " type="text" name="b_lastname"
									class="" id="lastNameInput">
									<span class="" id="lastNametitle">이름</span>
								<div class="m_userLogin_nameMsg" id="lastNameMsg"></div>
							</div>
						</div>
						<div class="m_userinfo_updatename_region_inbday">
							<div class="_inputRegionBir" id="yyyyregion">
							<label>
								<input placeholder=" " type="text" name="b_birth"
									class="" id="yyyyinput" maxlength="8" autocomplete='off'>
									<span class="" id="yyyytext">생년월일</span>
									<div id="result" class="m_userLogin_birthdayResult">yyyy년
										mm월 dd일</div>
										</label>
								<div class="m_userLogin_birthdayMsg" id="resultmsg"></div>
							</div>
						</div>

						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="lastPageBtn">
								<label>
									<div class="m_userLogin_next1">
										다음<input type="button" class="m_userLogin_btn" id="lastPage"
											disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->

					<!-- #region 페이지3 -->
					<div id="joinPage3" class="m_userLogin_page3">
						<div class="_inputRegion" id="emailRegion">
							<input placeholder=" " type="email" name="b_email"
								class="" id="emailInput">
								<span class="" id="emailTitle">name@example.com</span>
							<div class="m_userLogin_emailMsg" id="emailMsg"></div>
							<div id="active"></div>
							<div class="m_userLogin_emailSubTitle">새 Root ID로 사용될
								이메일입니다.</div>
						</div>

						<div class="_inputRegion" id="newPwRegion">
							<input placeholder=" " type="password" name="b_pw"
								class="" id="newPwInput">
								<span class="" id="passwordTitle">암호</span>
							<div class="m_userLogin_passwordMsg" id="newPwMsg"></div>
						</div>

						<div class="_inputRegion" id="ckeckPwRegion">
							<input placeholder=" " type="password"
								class="" id="ckeckPwInput">
								<span class=""
									id="checkPasswordTitle">암호 확인</span>
							<div class="m_userLogin_checkPasswordMsg" id="ckeckPwMsg"></div>
						</div>

						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="joinSubmitBtn">
								<label>
									<div class="m_userLogin_next1">
										가입하기<input type="submit" class="m_userLogin_btn"
											id="joinSubmit" disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->
				</form>
			</div>
		</section>
	</div>

	<footer>
		<%@ include file="../common/global_footer.jsp"%>
	</footer>
</body>

</html>