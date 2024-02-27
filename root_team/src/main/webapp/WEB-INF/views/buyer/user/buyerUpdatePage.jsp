<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root account</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdatePage.js"></script>
</head>

<body>
	<div class="warp">
		<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>
		<section>
			<%@ include file="buyerUpdateSideMenu.jsp"%>
			<div class="m_buyerUpdatePage4_mainPage">
				<div class="m_buyerUpdatePage4_main_title">공개 프로필</div>
				<div class="m_buyerUpdatePage4_main_content">모든 사람들이 볼수 있는
					프로필에 대한 내용을 수정합니다.</div>
				<div class="m_buyerUpdatePage4_main_content_region">
					<div class="m_buyerUpdatePage4_Regionprofile" id="Regionprofile">
						<div class="m_buyerUpdatePage4_content_profiletitle">프로필 이미지
						</div>
						<div class="m_buyerUpdatePage4_profile">
							<img src=""
								alt="이미지" class="m_buyerUpdatePage4_profileRegion">
						</div>
					</div>
					<div class="m_buyerUpdatePage4_content" id="nickNamebox">
						<div class="m_buyerUpdatePage4_content_nametitle">닉네임</div>
						<div class="m_buyerUpdatePage4_content_namesub">${buyer.b_nickname}</div>
					</div>
				</div>
			</div>
			<div class="m_buyerUpdatePage4_backBlur" id="backBlur"></div>
			<form action="">
				<div class="m_buyerUpdatePage4_profileUpRegion" id="profileUpRegion">
					<div class="m_buyerUpdatePage4_profileUpTitle">프로필 이미지</div>
					<div class="m_buyerUpdatePage4_imgRegion">
						<label> <input type="file"
							class="m_buyerUpdatePage4_profileInput" name=""
							accept=".JPEG,.JPG,.GIF,.PNG" id="profileInput" />
							<div class="m_buyerUpdatePage4_imageContainer1"></div>
							<div id="image_container"
								class="m_buyerUpdatePage4_imageContainer">
								<img src="" alt="이미지 호출" id="profile1"
									class="m_buyerUpdatePage4_profile1">
							</div>
						</label>
					</div>
					<div class="m_buyerUpdatePage4_flax">
						<div class="m_buyerUpdatePage4_sub">대응 포맷</div>
						<div>JPEG / PNG / GIF</div>
					</div>
					<div class="m_buyerUpdatePage4_flax">
						<div class="m_buyerUpdatePage4_sub">최대 파일 크기</div>
						<div>5 MB</div>
					</div>
					<div class="m_buyerUpdatePage4_flax">업로드된 이미지는 프로필에서 원형으로
						크롭되어 표시됩니다.</div>
					<div class="m_buyerUpdatePage4_flax1">
						<div class="m_buyerUpdatePage4_submitBtnRegion">
							<label>
								<div class="m_buyerUpdatePage4_submitBtn">확정</div> <input
								type="submit" class="m_buyerUpdatePage4_profileInput">
							</label>
						</div>
						<div class="m_buyerUpdatePage4_cancelBtnRegion">
							<div class="m_buyerUpdatePage4_cancelBtn" id="cancelBtn">취소</div>
						</div>
					</div>
				</div>
			</form>
			<form name="buyerUpdate" method="post" action="buyerInfoUpdateProcess.do">
			<input type="hidden" name="b_idx" value="${buyer.b_idx}">
				<div class="m_buyerUpdatePage4_nickNameRegion" id="nickNameRegion">
					<div class="m_buyerUpdatePage4_nickNameUpTitle">닉네임</div>
					<div class="m_buyerUpdatePage4_nickNameInputRegion"
						id="nickNameInputRegion">
						<label> <input type="text" name="b_nickname" class="m_buyerUpdatePage4_nickNameInput" id="nickNameInput">
							<div class="m_buyerUpdatePage4_nickNameTitle" id="nickNameTitle">닉네임</div>
							<div class="m_buyerUpdatePage4_nickNameMsg" id="nickNameMsg"></div>
						</label>
					</div>
					<div class="m_buyerUpdatePage4_flax1">
						<div class="m_buyerUpdatePage4_submitBtnRegion">
							<label>
								<div class="m_buyerUpdatePage4_submitBtn">확정</div> <input
								type="submit" id="nickNamesubmitBtn"
								class="m_buyerUpdatePage4_profileInput" disabled="disabled">
							</label>
						</div>
						<div class="m_buyerUpdatePage4_cancelBtnRegion">
							<div class="m_buyerUpdatePage4_cancelBtn" id="nickNamecancelBtn">취소</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</div>
</body>

</html>