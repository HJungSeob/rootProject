<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>정보수정 페이지</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/user/sellerUpdateService.css">

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/publicRegex/passwordRegex.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/seller/user/sellerUpdatePage.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/publicRegex/birthdayRegex.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/buyer/user/birthdayIO.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/buyer/user/daumMapAPI.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>

	<script>
		$(function () {

					function isImageFile(file) {
						var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
						if ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) {
							alert("이미지 파일만 등록할 수 있습니다.")
							return false;
						} else {
							return true;
						}
					}

					function isOverSize(file) {
						var maxSize = 3 * 1024 * 1024; // 3MB로 제한 
						if (file.size > maxSize) {
							alert("3MB 이하의 파일만 등록할 수 있습니다.")
							return false;
						} else {
							return true;
						}
					}

					$("#profileImgInput").on("change", function (event) {

						var file = event.target.files[0];
						if (isImageFile(file) && isOverSize(file)) {
							var reader = new FileReader();
							reader.onload = function (e) {
								$("#profileImg").attr("src", e.target.result);
							}
							reader.readAsDataURL(file);
						}
					});
		});
		
	</script>
</head>

<body>
	<div class="wrap">

		<%@include file="../common/header.jsp"%>

		<section>
			<div class="seller_global_section">

				<%@include file="../common/navigation.jsp"%>

				<div class="m_sellerUpdateService_mainRegion">

					<div class="seller_update_contents_title">
                        <span>메인 > 회원정보관리</span>
                    </div>

					<form name="sellerInfoUpdate" method="post" action="sellerInfoUpdateProcess.do"
						enctype="multipart/form-data">
						<input type="hidden" name="s_idx" value="${seller.s_idx}">
						<div class="m_sellerUpdateService_mainTitle">매장정보 수정</div>
						<hr>
						<div class="m_sellerUpdateService_profileRegion">
							<label>
								<img src="${pageContext.request.contextPath}/resources/uploads/${seller.s_profile}" id="profileImg" class="m_sellerUpdateService_profileInput" alt="이미지를 찾을 수 없음">
								<input type="file" id="profileImgInput" name="s_tempprofile" class="m_sellerUpdateService_input">
							</label>
							<div class="m_sellerUpdateService_profileTitle">프로필 이미지</div>
							<label>
								<div class="m_sellerUpdateService_returnSubmitTitle" id="returnBtn1">이미지 초기화</div>
								<input type="submit" class="upSubmit" id="ReturnSellerprofileSubmit">
							</label>
						</div>
						<hr>
						<div class="displayF textHr">
							<div class="allTitleText">매장 이름</div>
							<input type="text" name="s_storename" class="inputBoxCss" id="sellerTitleInput" value="${seller.s_storename}" placeholder="매장 이름을 입력해주세요.">
							<div class="Msg" id="sellerTitleMsg"></div>
						</div>
						<div class="displayF">
							<div class="allTitleText">소개글</div>
							<textarea class="inputTextBoxCss" name="s_storeintro" placeholder="소개글을 입력해주세요.">${seller.s_storeintro}</textarea>
						</div>
						<hr>
						<div class="m_sellerUpdateService_submitRegion">
							<label>
								<div class="m_sellerUpdateService_submitTitle pointer">수정</div>
								<input type="submit" class="upSubmit" id="upSellerSubmit" disabled="disabled">
							</label>
						</div>
					</form>

					<form name="sellerUpdate" method="post" action="sellerUpdateProcess.do">
						<input type="hidden" name="s_idx" value="${seller.s_idx}">
						<div class="hr"></div>
						<div class="m_sellerUpdateService_mainTitle">암호 수정</div>
						<hr>
						<div class="displayF">
							<div class="allTitleText">암호</div>
							<div class="Msg pointer" id="updatePwBtn">변경 하기</div>
							<div class="Msg disnone pointer" id="cancelPwBtn">취소 하기</div>
						</div>
						<div class="disnone" id="updatePwPage">
							<div class="displayF">
								<div class="allTitleText">기존 암호</div>
								<input type="password" class="inputBoxCss">
								<div class="Msg"></div>
							</div>
							<div class="displayF">
								<div class="allTitleText">새로운 암호</div>
								<input type="password" name="s_pw" class="inputBoxCss" id="newPwInput">
								<div class="Msg" id="newPwMsg"></div>
							</div>
							<div class="displayF">
								<div class="allTitleText">암호 확인</div>
								<input type="password" class="inputBoxCss" id="ckeckPwInput">
								<div class="Msg" id="ckeckPwMsg"></div>
							</div>
							<div class="m_sellerUpdateService_submitRegion">
								<label>
									<div class="m_sellerUpdateService_submitTitle pointer">수정</div> <input type="submit"
										class="upSubmit" id="upPwSubmit" disabled="disabled">
								</label>
							</div>
						</div>
						<hr>
					</form>

					<form name="sellerUpdate" method="post" action="sellerUpdateProcess.do">
						<input type="hidden" name="s_idx" value="${seller.s_idx}">
						<div class="hr"></div>
						<div class="m_sellerUpdateService_mainTitle">회원정보 수정</div>
						<hr>
						<div class="displayF">
							<div class="allTitleText">성</div>
							<input type="text" class="inputBoxCss" id="firstNameInput" name="s_firstname" value="${seller.s_firstname}" placeholder="성을 입력해주세요.">
							<div class="Msg" id="firstNameMsg"></div>
						</div>
						<div class="displayF">
							<div class="allTitleText">이름</div>
							<input type="text" class="inputBoxCss" id="lastNameInput" name="s_lastname" value="${seller.s_lastname}" placeholder="이름을 입력해주세요.">
							<div class="Msg" id="lastNameMsg"></div>
						</div>
						<div class="displayF">
							<div class="allTitleText">핸드폰</div>
							<input type="tel" class="inputBoxCss" maxlength="13" id="telInput" name="s_tel" value="${seller.s_tel}" placeholder="전화번호를 입력해주세요.">
							<div class="Msg" id="telSmg"></div>
						</div>
						<div class="displayF">
							<div class="allTitleText" id="yyyytext">생년월일</div>
							<label>
								<c:set var="originalDate" value="${seller.s_birth}" />
								<fmt:parseDate value="${originalDate}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss" />
								<fmt:formatDate value="${parsedDate}" var="formattedDate" pattern="yyyyMMdd" />
								<input type="text" class="inputBoxCss" id="yyyyinput" maxlength="8" name="s_birth" value="${formattedDate}">
							</label>
							<div class="Msg" id="resultmsg"></div>
						</div>
						<div class="displayF">
							<div class="allTitleText">주소</div>
							<div class="Msg pointer" id="updateAddBtn">주소 찾기</div>
							<div class="Msg disnone pointer" id="cancelAddBtn">취소 하기</div>
						</div>
						<div class="disnone" id="updateAddPage">
							<div class="displayF">
								<div class="allTitleText">우편번호</div>
								<input type="text" name="s_zipcode" class="inputBoxCss" id="zonecodeInput" value="${seller.s_zipcode}" placeholder="우편번호를 입력해주세요.">
							</div>
							<div class="displayF">
								<div class="allTitleText">주소</div>
								<input type="text" name="s_address" class="inputBoxCss" id="addressInput" value="${seller.s_address}" placeholder="주소를 입력해주세요.">
							</div>
							<div class="displayF">
								<div class="allTitleText">상세 주소</div>
								<input type="text" name="s_restaddress" class="inputBoxCss" value="${seller.s_restaddress}" placeholder="상세 주소를 입력해주세요.">
							</div>
						</div>
						<hr>
						<div class="m_sellerUpdateService_submitRegion">
							<label>
								<div class="m_sellerUpdateService_submitTitle pointer">수정</div> <input type="submit" class="upSubmit" id="upSubmit">
							</label>
						</div>
					</form>

					<form name="sellerCancel" method="get" action="sellerCancelProcess.do">
						<div class="m_sellerUpdateService_cancelOrNotRegion" id="cancelOrNotRegion">
							<div class="m_sellerUpdateService_cancelTitle" id="cancelOpenPage">계정 삭제</div>
							<div class="m_sellerUpdateService_cancelPwRegin upSubmit" id="cancelPwPage">
								<div class="m_sellerUpdateService_cancelPwTitle">계정을 삭제
									하시려면 암호를 입력해 주세요</div>
								<input type="password" placeholder="암호를 입력해 주세요"
									class="m_sellerUpdateService_cancelInput">
								<div class="m_sellerUpdateService_cancelBtnRegion" id="firstBtnRegion">
									<div class="m_sellerUpdateService_cancelReturnBtn" id="firstReturnBtn">취소</div>
									<div class="m_sellerUpdateService_cancelNextBtn" id="firstNextBtn">다음</div>
								</div>
							</div>
							<div class="m_sellerUpdateService_cancelSelectRegion upSubmit" id="cancelSubmitPage">
								<div class="m_sellerUpdateService_cancelSubTitle">계정을 삭제하면
									등록된 모든 상품이 모두 삭제 됩니다.</div>
								<div class="m_sellerUpdateService_cancelSubTitle">계속 할까요?</div>
								<div class="m_sellerUpdateService_cancelBtnRegion">
									<div class="m_sellerUpdateService_cancelReturnBtn" id="lastReturnBtn">취소</div>
									<label>
										<div class="m_sellerUpdateService_cancelNextBtn">계정 삭제</div> <input
											type="submit" class="upSubmit">
									</label>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</section>
	</div>

	<footer>
		<%@include file="../../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>