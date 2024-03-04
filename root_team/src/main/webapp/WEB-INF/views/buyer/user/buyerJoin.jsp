<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root ID 생성 - Root</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerJoin.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerJoin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/joinNextPage.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/birthdayIO.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/publicRegex/birthdayRegex.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/publicRegex/passwordRegex.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/checkjoin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/terms.js"></script>

<script>
let emailCheckValid = false;
let telCheckValid = false;

$(function(){
	$("#emailInput").change(function() {
		var emailInput = $('#emailInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/buyer/emailCheckProcess.do?b_email=' + emailInput,
			data: {email: emailInput}, // 데이터 전송 방식 수정
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#emailMsg").text("사용중인 이메일입니다.");
					$('#emailRegion').css("border", "1px solid #F74848");
				    emailCheckValid = false;
				} else {
					// 중복이 아닌 경우 초기화 작업 수행
					$("#emailMsg").text(""); // 메시지 초기화
					$('#emailRegion').css("border", "1px solid #858585");
					emailCheckValid = true;
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

$(function(){
	$("#telInput").change(function() {
		var telInput = $('#telInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/buyer/telCheckProcess.do?b_tel=' + telInput,
			data: {tel: telInput}, // 데이터 전송 방식 수정
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#telSmg").text("사용중인 전화번호입니다.");
					$('#telRegion').css("border", "1px solid #F74848");
					telCheckValid = false;
				} else {
					// 중복이 아닌 경우 초기화 작업 수행
					$("#telSmg").text(""); // 메시지 초기화
					$('#telRegion').css("border", "1px solid #858585");
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
						<a href="${pageContext.request.contextPath}/buyer/buyerLogin.do" class="m_userLogin_tiregionss">로그인</a> 
						<a href="${pageContext.request.contextPath}/buyer/buyerJoin.do"	class="m_userLogin_tiregionss">Root ID 생성</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<div class="m_userLogin_mainRegion">
				<form name="buyerJoin" method="post" action="buyerJoinProcess.do">
					<!-- #region 페이지1 -->
					<div class="m_userLogin_maintitle">Root ID 생성</div>
					<div class="m_userLogin_subtitle">하나의 Root ID로 모든 Root 서비스를 이용할 수 있습니다.</div>
					<div id="joinPage1" class="m_userLogin_page1">
						<div class="m_userLogin_telRegion" id="telRegion">
							<label>
								<input type="tel" name="b_tel" class="m_userLogin_telInput" id="telInput" maxlength="13">
									<div class="m_userLogin_teltitle" id="telTitle">전화번호</div>
							</label>
							<div class="m_userLogin_telMsg" id="telSmg"></div>
							<div id="active"></div>
						</div>
						
						
						
						<div class="m_userLogin_content">항상 사용할 수 있는 전화번호를 입력하십시오. 새 기기나 웹 브라우저에 로그인할 때 해당 전화번호를 사용하여 신원을 확인합니다. 메시지 또는 데이터 요금이 적용될 수 있습니다.</div>
						<div class="m_userLogin_checkregion">
							<label>
								<input type="checkbox" name="b_terms" id="terms" value="y">
								<span class="m_userLogin_rula">
									<a href="#" class="m_userLogin_atag">Root의 개인정보 처리방침</a>
									에 따라 개인 정보를 수집, 사용, 타사에 대한 제공 및 처리하는 데 동의합니다.
								</span>
							</label>
						</div>
						
						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="nextPageBtn">
								<label>
									<div class="m_userLogin_next1">다음<input type="button" class="m_userLogin_btn" id="nextPage" disabled="disabled"></input></div>
								</label>
							</div>
						</div>
						
						<div></div>
					</div>
					<!-- #endregion -->

					<!--  #region 페이지2 -->
					<div id="joinPage2" class="m_userLogin_page2">
						<div class="m_userLogin_nameRegion">
							<div class="m_userLogin_regionFirstName" id="firstNameRegion">
								<label>
									<input type="text" name="b_firstname" class="m_userLogin_firstNameInput" id="firstNameInput">
									<div class="m_userLogin_firstNametitle" id="firstNametitle">성</div>
								</label>
								<div class="m_userLogin_nameMsg" id="firstNameMsg"></div>
							</div>
							
							<div class="m_userinfo_updatename_region_hr" id="active"></div>
							
							<div class="m_userLogin_regionFirstName" id="lastNameRegion">
								<label>
									<input type="text" name="b_lastname" class="m_userLogin_firstNameInput" id="lastNameInput">
									<div class="m_userLogin_firstNametitle" id="lastNametitle">이름</div>
								</label>
								<div class="m_userLogin_nameMsg" id="lastNameMsg"></div>
							</div>
						</div>
						
						<div class="m_userinfo_updatename_region_inbday">
							<div class="m_userLogin_birthdayRegion" id="yyyyregion">
								<label>
									<input type="text" name="b_birth" class="m_userLogin_birthdayInput" id="yyyyinput" maxlength="8">
										<div class="m_userLogin_birthdayText" id="yyyytext">생년월일</div>
										<div id="result" class="m_userLogin_birthdayResult">yyyy년 mm월 dd일</div>
								</label>
								<div class="m_userLogin_birthdayMsg" id="resultmsg"></div>
							</div>
						</div>
						
						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="lastPageBtn">
								<label>
									<div class="m_userLogin_next1">다음<input type="button" class="m_userLogin_btn" id="lastPage" disabled="disabled"></input> </div>
								</label>
							</div>
						</div>
					</div>
					<!-- #endregion -->

					<!-- #region 페이지3 -->
					<div id="joinPage3" class="m_userLogin_page3">
						<div class="m_userLogin_emailRegion" id="emailRegion">
							<label>
								<input type="email" name="b_email" class="m_userLogin_emailInput" id="emailInput">
								<div class="m_userLogin_emailTitle" id="emailTitle">name@example.com</div>
							</label>
							<div class="m_userLogin_emailMsg" id="emailMsg"></div>
							<div id="active"></div>
							<div class="m_userLogin_emailSubTitle">새 Root ID로 사용될 이메일입니다.</div>
						</div>
						
						<div class="m_userLogin_passwordRegion" id="newPwRegion">
							<label>
								<input type="password" name="b_pw" class="m_userLogin_passwordInput" id="newPwInput">
								<div class="m_userLogin_passwordTitle" id="passwordTitle">암호</div>
							</label>
							<div class="m_userLogin_passwordMsg" id="newPwMsg"></div>
						</div>
						
						<div class="m_userLogin_checkPasswordRegion" id="ckeckPwRegion">
							<label>
							<input type="password" class="m_userLogin_checkPasswordInput" id="ckeckPwInput">
								<div class="m_userLogin_checkPasswordTitle" id="checkPasswordTitle">암호 확인</div>
							</label>
							<div class="m_userLogin_checkPasswordMsg" id="ckeckPwMsg"></div>
						</div>
						
						<div class="m_userLogin_pagebtn1">
							<div class="m_userLogin_btn1Region" id="joinSubmitBtn">
								<label>
									<div class="m_userLogin_next1">가입하기<input type="submit" class="m_userLogin_btn" id="joinSubmit" disabled="disabled"></input></div>
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