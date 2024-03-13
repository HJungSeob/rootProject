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
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/sellerjoinService.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/daumMapAPI.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/taxidRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/taxidAutoHyphen.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/seller/user/joinNextPage.js"></script>
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
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/addressRegex.js"></script>
	
<script>
let emailCheckValid = false;
let telCheckValid = false;
let taxidCheckValid = false;
$(function(){
	$("#telInput").keyup(function() {
		var telInput = $('#telInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/seller/telCheckProcess.do?s_tel=' + telInput,
			data: {tel: telInput},
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#telSmg").text("사용중인 전화번호입니다.");
					$('#telInput').css("border",
					"1px solid #F74848");
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
		} catch (Exception) {
		}
	});
});

$(function(){
	$("#taxidInput").keyup(function() {
		var taxidInput = $('#taxidInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/seller/businessnumCheckProcess.do?s_businessnum=' + taxidInput,
			data: {text: taxidInput},
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#taxidMsg").text("사용중인 사업자번호입니다.");
					$('#taxidInput').css("border",
					"1px solid #F74848");
					taxidCheckValid = false;
				} else {
					taxidCheckValid = true;
				}
			},
			error: function() {
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
	$("#emailInput").keyup(function() {
		var emailInput = $('#emailInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/seller/emailCheckProcess.do?s_email=' + emailInput,
			data: {email: emailInput},
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#emailMsg").text("사용중인 이메일입니다.");
					$('#emailInput').css("border",
					"1px solid #F74848");
					emailCheckValid = false;
				} else {
					emailCheckValid = true;
				}
			},
			error: function() {
				console.log("실패");
			}
		});
		try {
			globaldisable();
		} catch (Exception) {
		}
	});
});
</script>
	
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
						<a href="${pageContext.request.contextPath}/seller/sellerLogin.do"
							class="m_sellerJoin_tiregionss">로그인</a> <a
							href="${pageContext.request.contextPath}/seller/sellerJoin.do"
							class="m_sellerJoin_tiregionss">ENT Root ID 생성</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<div class="m_sellerJoin_mainRegion">
				<form name="sellerJoin" method="post" action="sellerJoinProcess.do">
					<!-- #region 페이지1 -->
					<div class="m_sellerJoin_maintitle">ENT Root ID 생성</div>
					<div class="m_sellerJoin_subtitle">하나의 ENT Root ID로 모든 Root
						서비스를 이용할 수 있습니다.</div>

					<div id="joinPage1" class="m_sellerJoin_page1">
						<div class="_inputRegion" id="telRegion">
								<input placeholder=" " type="tel" name="s_tel" class="" id="telInput" maxlength="13">
								<span class="" id="telTitle">전화번호</span>
							<div class="m_sellerJoin_telMsg" id="telSmg"></div>
						</div>

						<div id="active"></div>

						<div class="m_sellerJoin_content">항상 사용할 수 있는 전화번호를 입력하십시오.
							새 기기나 웹 브라우저에 로그인할 때 해당 전화번호를 사용하여 신원을 확인합니다. 메시지 또는 데이터 요금이 적용될
							수 있습니다.</div>

						<div class="m_sellerJoin_checkregion">
							<label> <input type="checkbox" name="s_terms" id="terms"
								value="Y"> <span class="m_sellerJoin_rula"> <a
									href="#" class="m_sellerJoin_atag">Root의 개인정보 처리방침</a> 에 따라 개인
									정보를 수집, 사용, 타사에 대한 제공 및 처리하는 데 동의합니다.
							</span>
							</label>
						</div>

						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="nextPageBtn">
								<label>
									<div class="m_sellerJoin_next1">
										다음
										<input type="button" class="m_sellerJoin_btn" id="nextPage" disabled="disabled">
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
							<div class="_inputRegionName" id="firstNameRegion">
								<input placeholder=" " type="text" name="s_firstname" class="" id="firstNameInput">
									<span class="" id="firstNametitle">성</span>
								<div class="m_sellerJoin_nameMsg" id="firstNameMsg"></div>
							</div>

							<div class="m_sellerJoin_updatename_region_hr" id="active"></div>

							<div class="_inputRegionName" id="lastNameRegion">
									<input placeholder=" " type="text" name="s_lastname" class="" id="lastNameInput">
									<span class="" id="lastNametitle">이름</span>
								<div class="m_sellerJoin_nameMsg" id="lastNameMsg"></div>
							</div>
						</div>

						<div class="m_sellerJoin_updatename_region_taxid">
							<div class="_inputRegion" id="taxidRegion">
									<input placeholder=" " type="text" name="s_businessnum" class="" id="taxidInput" maxlength="12">
									<span class="" id="taxidTitle">사업자번호</span>
								<div class="m_sellerJoin_taxidMsg" id="taxidMsg"></div>
							</div>
						</div>

						<div class="m_userinfo_updatename_region_inbday">
							<div class="_inputRegionBir" id="yyyyregion">
							<label>
								<input placeholder=" " type="text" name="s_birth"
									class="" id="yyyyinput" maxlength="8" autocomplete='off'>
									<span class="" id="yyyytext">생년월일</span>
									<div id="result" class="m_sellerJoin_birthdayResult">yyyy년
										mm월 dd일</div>
										</label>
								<div class="m_sellerJoin_birthdayMsg" id="resultmsg"></div>
							</div>
						</div>
						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="middlePageBtn">
								<label>
									<div class="m_sellerJoin_next1">
										다음
										<input type="button" class="m_sellerJoin_btn" id="middlePage" disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->

					<!-- #region 페이지4 -->
					<div id="joinPage4" class="m_sellerJoin_page4">
						<div class="_inputRegion" id="emailRegion">
								<input placeholder=" " type="email" name="s_email" class="" id="emailInput">
								<span class="" id="emailTitle">name@example.com</span>
							<div class="m_sellerJoin_emailMsg" id="emailMsg"></div>
							<div id="active"></div>
						</div>
						<div class="_inputRegion" id="newPwRegion">
								<input placeholder=" " type="password" name="s_pw" class="" id="newPwInput">
								<span class="" id="passwordTitle">암호</span>
							<div class="m_sellerJoin_passwordMsg" id="newPwMsg"></div>
						</div>
						<div class="_inputRegion" id="ckeckPwRegion">
								<input placeholder=" " type="password" class="" id="ckeckPwInput">
								<span class="" id="checkPasswordTitle">암호 확인</span>
							<div class="m_sellerJoin_checkPasswordMsg" id="ckeckPwMsg"></div>
						</div>
						<div class="m_sellerJoin_pagebtn1">
							<div class="m_sellerJoin_btn1Region" id="joinSubmitBtn">
								<label>
									<div class="m_sellerJoin_next1">
										가입하기
										<input type="submit" class="m_sellerJoin_btn" id="joinSubmit" disabled="disabled"></input>
									</div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->

					<!-- #region 페이지3 -->
					<div id="joinPage3" class="m_sellerJoin_page3">
						<div class="_inputRegion" id="zonecodeRegion">
							<input placeholder=" " type="text" name="s_zipcode"
								class="" id="zonecodeInput">
								<span class="" id="zonecodetitle">우편번호</span>
							<div class="m_sellerJoin_zonecodeMsg" id="zonecodeMsg"></div>
						</div>
						<div class="_inputRegion" id="addressRegion">
							<input placeholder=" " type="text" name="s_address"
								class="" id="addressInput">
								<span class="" id="addresstitle">주소</span>
							<div class="m_sellerJoin_addressMsg" id="addressMsg"></div>
						</div>
						<div class="_inputRegion" id="addAddressRegion">
							<input placeholder=" " type="text" name="s_restaddress"
								class="" id="addAddressInput">
								<span class="" id="addAddresstitle">상세
									주소</span>
							<div class="m_sellerJoin_addAddressMsg" id="addAddressMsg"></div>
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
				</form>
			</div>
		</section>
	</div>

	<footer>
		<%@ include file="../../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>