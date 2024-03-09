<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Root account | verifyEmail</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/verifyEmail.css">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

	<script>
		function sendEmailVerification() {
			var b_email = $('#b_email').val();
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/buyer/joinEmailProcess.do',
				data: {
					b_email: b_email
				},
				dataType: "text",
				success: function (data) {
					$('#auth_num_input').attr("disabled", false);
					code = data;
					alert("인증번호가 전송되었습니다");
				},
				error: function () {
					console.log("실패");
				}
			});
		}

		$(function () {
			// 페이지 로드 시 자동으로 실행
			sendEmailVerification();

			// 버튼 클릭 시에도 실행
			$("#re_email_btn").click(function () {
				sendEmailVerification();
			});
		});

		$(function () {
			$("#confirm_email_btn").on("click", function () {
				
				var b_email = $('#b_email').val();
				const inputCode = $('#auth_num_input').val();
				const resultEmailAuth = $("#result_confirm");
				
				if (inputCode == code) {

					$.ajax({
						type: 'post',
						url: '${pageContext.request.contextPath}/buyer/buyerVerifyEmailProcess.do',
						data: {
							b_email: b_email
						},
						success: function (data) {
							if (data == 1) {
								alert("인증되었습니다. 다시 로그인해주세요.");
								window.location.href = "${pageContext.request.contextPath}/buyer/buyerLogin.do";
							}
						},
						error: function () {
							console.log("실패");
						}

					});
					
				} else{
					alert("인증번호가 일치하지 않습니다. 다시 확인해주세요.");
				}
			});
		});
	</script>

</head>

<body>
	<div class="warp">
	<header>
			<%@ include file="../../buyer/common/global_header.jsp"%>
        </header>
        <section>
            <div class="mainRegion">
                <div class="mainRegionTitle">이메일을 확인해 주세요.</div>
                <div class="mainRegionSubTitle">${buyer.b_email}</div>
		<form name="buyerVerifyEmail" method="post" action="buyerVerifyEmailProcess.do">
			<input type="hidden" id="b_email" value="${b_email}">
			<div>
			<input type="text" id="auth_num_input" placeholder="인증번호 6자리를 입력해주세요." maxlength="6" class="emailNemberInput">
			 </div>
			<input type="button" id="confirm_email_btn" value="인증확인" class="emailCheckBtn">
			<input type="button" id="re_email_btn" value="재전송" class="reEmailBtn">
		</form>
		</div>
	</section>
    </div>
    <footer>
		<%@ include file="../../buyer/common/global_footer.jsp"%>
    </footer>
</body>

</html>