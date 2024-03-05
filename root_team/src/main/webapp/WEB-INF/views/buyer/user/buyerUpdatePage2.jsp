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
	href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage2.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/publicRegex/passwordRegex.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/checkemailtel.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdatePage2.js"></script>
	
<script>
$(function(){
	$("#telInput").focusout(function() {
		console.log("우와");
		var telInput = $('#telInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/buyer/telCheckProcess.do?b_tel=' + telInput,
			data: {tel: telInput}, // 데이터 전송 방식 수정
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$("#telSmg").text("사용중인 전화번호입니다.");
					$("#nextPage").attr("disabled", true);
				} else {
					// 중복이 아닌 경우 초기화 작업 수행
					$("#telSmg").text(""); // 메시지 초기화
					$("#nextPage").attr("disabled", false); // 버튼 활성화
				}
			},
			error: function() {
				console.log("실패");
			}
		});
	});
});

$(function(){
    $("#existingPwInput").change(function() {
    	 console.log("우와");
    	var b_idx = $('#hiddenB_idx').val();
        var existingPwInput = $('#existingPwInput').val();

        $.ajax({
            type: 'post',
            url: '${pageContext.request.contextPath}/buyer/passwordCheckProcess.do',
            data: {
            	b_pw: existingPwInput,
            	b_idx: b_idx},
                success: function(data) {    
                    if (data == 1) {
                        $("#existingPwMsg").text("기존 비밀번호가 일치합니다.");
                        $('#newPwInput').prop('disabled', false);
                        $('#ckeckPwInput').prop('disabled', false);
                        $('#pwSubmit').prop('disabled', false);
                    } else {
                        $("#existingPwMsg").text("기존 비밀번호가 일치하지 않습니다.");
                        $('#newPwInput').prop('disabled', true);
                        $('#ckeckPwInput').prop('disabled', true);
                        $('#pwSubmit').prop('disabled', true);
                    }
                },
                error: function() {
                    console.log("실패");
                } 
        });
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
			<%@ include file="buyerUpdateSideMenu.jsp"%>
			<!-- #region 메인 컨텐츠 메뉴 -->
			<div class="m_userinfosclo_mainPage">
				<div class="m_userinfosclo_main_title">로그인 및 보안</div>
				<div class="m_userinfosclo_main_content">계정 로그인, 계정 보안 및 로그인하는
					데 문제가 있을 경우 데이터를 복구하는 방법과 관련된 설정을 관리합니다.</div>
				<div class="m_userinfosclo_main_content_region">
					<div class="m_userinfosclo_content" id="m_userinfosclo_contentname">
						<div class="m_userinfosclo_content_nametitle">전화번호</div>
						<div class="m_userinfosclo_content_namesub">${buyer.b_tel}</div>
					</div>
					<div class="m_userinfosclo_content" id="m_userinfosclo_contentday">
						<div class="m_userinfosclo_content_nametitle">암호</div>
						<div class="m_userinfosclo_content_namesub">
							<fmt:formatDate var="pwmodifydate"
								value="${buyer.b_pwmodifydate}" pattern="yyyy.MM.dd HH:mm:ss" />
							최근 업데이트: ${pwmodifydate}
						</div>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 이메일 암호 수정 박스 -->
			<div class="m_userinfosclo_updatename_region_buer" id="m_userinfosclo_updatename_region_buer"></div>
			<div class="m_userinfosclo_updatename_region" id="m_userinfosclo_updatename_region_name">
				<div class="m_userinfosclo_updatename_region_name">전화번호</div>
				<form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
					<input type="hidden" name="b_idx" value="${buyer.b_idx}">
					<div class="m_userinfosclo_updatename_region_fname" id="telRegion">
						<label>
							<input type="tel" class="m_userinfosclo_updatename_region_infname" name="b_tel" id="telInput" maxlength="13">
							<div class="m_userinfosclo_updatename_region_plfname" id="telTitle">전화번호</div>
						</label>
						<div class="m_userinfo_updatename_region_reuslt" id="telSmg"></div>
					</div>
					<div
						class="m_userinfosclo_updatename_region_submit m_userinfosclo_updatename_region_hr2"
						id="edsubmit1">
						<label>
							<div class="m_userinfosclo_updatename_region_submited">수정</div>
							<input type="submit" disabled="disabled" class="m_userinfosclo_updatename_region_submit1" id="emailsubmit1">
						</label>
					</div>
				</form>
			</div>
			<div class="m_userinfosclo_updatename_region" id="m_userinfosclo_updatename_region_bday">
				<div class="m_userinfosclo_updatename_region_bdaytitle">암호 변경</div>
				<div class="m_userinfosclo_content_namesub1">최근 업데이트: ${pwmodifydate}</div>
			
				<div class="m_userinfosclo_updatename_region_inbday">
				
					<div class="m_userinfosclo_updatename_region_inyyyy" id="exPwRegion">
						<input type="hidden" id="hiddenB_idx" name="b_idx" value="${buyer.b_idx}">
						<label>
							<input type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="existingPwInput">
							<div class="m_userinfosclo_updatename_region_subyyyy" name="b_pw" id="exPwTitle">현재 암호</div>
						</label>
						<div class="m_userinfosclo_pwMsg" id="existingPwMsg"></div>
					</div>
					
					<form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
						<input type="hidden" name="b_idx" value="${buyer.b_idx}">
						<div class="m_userinfosclo_updatename_region_inyyyy" id="newPwRegion">
							<label>
								<input type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="newPwInput" name="b_pw">
								<div class="m_userinfosclo_updatename_region_subyyyy" id="newPwTitle">새로운 암호</div>
							</label>
							<div class="m_userinfosclo_pwMsg" id="newPwMsg"></div>
						</div>
						<div class="m_userinfosclo_updatename_region_inyyyy" id="ckeckPwRegion">
							<label>
								<input type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="ckeckPwInput">
								<div class="m_userinfosclo_updatename_region_subyyyy" id="ckeckPwTitle">새 암호 확인</div>
							</label>
							<div class="m_userinfosclo_pwMsg" id="ckeckPwMsg"></div>
						</div>
						<div class="m_userinfosclo_updatename_region_submit m_userinfosclo_updatename_region_hr2" id="ckeckSubmit">
							<label>
								<div class="m_userinfosclo_updatename_region_submited">수정</div>
								<input type="submit" id="pwSubmit" disabled="disabled" class="m_userinfosclo_updatename_region_submit1">
							</label>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>
	
	<footer>
		<%@ include file="../common/global_footer.jsp"%>
	</footer>
	<!-- #endregion -->
</body>

</html>