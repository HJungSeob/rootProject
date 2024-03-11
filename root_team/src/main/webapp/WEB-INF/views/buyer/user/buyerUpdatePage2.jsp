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
let duplicatePhone = false;
$(function(){
	$("#telInput").focusout(function() {
		var telInput = $('#telInput').val();
		
		$.ajax({
			type: 'post',
			url: '${pageContext.request.contextPath}/buyer/telCheckProcess.do?b_tel=' + telInput,
			data: {tel: telInput}, // 데이터 전송 방식 수정
			dataType: "text",
			success: function(data) {	
				if (data == 1) {
					$('#telInput').css("border", "1px solid #F74848")
					$("#telSmg").text("사용중인 전화번호입니다.");
					duplicatePhone = false
				} else {
					// 중복이 아닌 경우 초기화 작업 
					duplicatePhone = true
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
	
    $("#existingPwInput").change(function() {
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
                        $('#newPwInput').prop('disabled', false);
                        $('#ckeckPwInput').prop('disabled', false);
                        $('#pwSubmit').prop('disabled', false);
                        $('#existingPwInput').css("border", "1px solid #848484")
                        $("#existingPwMsg").text("");
                    } else {
                        $("#existingPwMsg").text("기존 비밀번호가 일치하지 않습니다.");
                        $('#newPwInput').prop('disabled', true);
                        $('#ckeckPwInput').prop('disabled', true);
                        $('#pwSubmit').prop('disabled', true);
                        $('#existingPwInput').css("border", "1px solid #F74848")
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
					<div class="_inputRegion" id="telRegion">
							<input placeholder=" " type="tel" class="" name="b_tel" id="telInput" maxlength="13">
							<span class="" id="telTitle">전화번호</span>
						<div class="m_userinfosclo_pwMsg" id="telSmg">waefwaef</div>
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
				
					<div class="_inputRegion" id="exPwRegion">
						<input type="hidden" id="hiddenB_idx" name="b_idx" value="${buyer.b_idx}">
							<input placeholder=" " type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="existingPwInput">
							<span class="m_userinfosclo_updatename_region_subyyyy" name="b_pw" id="exPwTitle">현재 암호</span>
						<div class="m_userinfosclo_pwMsg" id="existingPwMsg"></div>
					</div>
					
					<form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
						<input type="hidden" name="b_idx" value="${buyer.b_idx}">
						<div class="_inputRegion" id="newPwRegion">
								<input placeholder=" " type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="newPwInput" name="b_pw">
								<span class="m_userinfosclo_updatename_region_subyyyy" id="newPwTitle">새로운 암호</span>
							<div class="m_userinfosclo_pwMsg" id="newPwMsg"></div>
						</div>
						<div class="_inputRegion" id="ckeckPwRegion">
								<input placeholder=" " type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="ckeckPwInput">
								<span class="m_userinfosclo_updatename_region_subyyyy" id="ckeckPwTitle">새 암호 확인</span>
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