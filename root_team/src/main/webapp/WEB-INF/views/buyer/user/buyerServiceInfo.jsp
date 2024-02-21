<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerServiceInfo.css">
</head>

<body>
	<div class="wrap">
		<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>
		<section>
			<!-- #region 상단 타이틀 -->
			<div class="m_info_header1">
				<div class="m_info_header">
					<div class="m_info_header_acc">계정</div>
					<div class="m_info_loar">
						<a href="#" class="m_info_logout">로그아웃
							<div class="arrow_small a12"></div>
						</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 프로필 영역 -->
			<div class="m_info_profile">
				<div class="m_info_sprofile">
					<div class="m_info_proname">루키_1d85bb4d2b6f님, 안녕하세요</div>
					<div class="m_info_pro">
						<div class="m_info_proimg"></div>
						<div class="m_info_werll">
							<div class="m_info_mr">
								적립금
								<div class="m_info_mrp">234,234</div>
							</div>
							<div class="m_info_point">
								포인트
								<div class="m_info_pointp">454,356,346</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 구분선 -->
			<div class="m_info_hr"></div>
			<!-- #endregion -->

			<!-- #region 서브영역 -->
			<div class="m_info_subcen">
				<div class="m_info_subcenall">
					<div class="m_info_trvle">
						<div class="m_info_trvle_list">주문 사항</div>
						<div class="m_info_trvle_list_info">배송을 조회하고, 주문을 변경 또는
							취소하거나 반품을 신청하세요.</div>
						<div class="m_info_trvle_list_info_list">
							<a href="#" class="m_info_trvle_list_info_a">주문 기록 확인
								<div class="arrow_small a20"></div>
							</a>
						</div>
					</div>
					<div class="m_info_like">
						<div class="m_info_trvle_list">관심 목록</div>
						<div class="m_info_trvle_list_info">온라인에서든 Apple Store에서든 관심
							있는 제품을 쉽게 저장해두고, 나중에 여기에서 다시 살펴볼 수 있습니다.</div>
						<div class="m_info_trvle_list_info_list">
							<a href="#" class="m_info_trvle_list_info_a">관심 목록 보기
								<div class="arrow_small a20"></div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 계정 설정 -->
			<div class="m_info_accmain">
				<div class="m_info_accsmain">
					<div class="m_info_accsmain_title">계정 설정</div>
					<div class="m_info_accsmain_mtitle">
						<div class="m_info_accsmain_title1">배송</div>
						<div class="m_info_accsmain_title1 sub">
							배송주소
							<div class="m_info_accsmain_subtitle">성</div>
							<div class="m_info_accsmain_subtitle">이름</div>
							<div class="m_info_accsmain_subtitle">주소</div>
							<div class="m_info_accsmain_subtitle">우편</div>
							<div class="m_info_accsmain_subtitle">나머지 주소</div>
							<div class="m_info_accsmain_subtitle">
								<a href="#" class="a">편집</a>
							</div>
						</div>
						<div class="m_info_accsmain_title1 sub">
							연락처 정보
							<div class="m_info_accsmain_subtitle">이메일</div>
							<div class="m_info_accsmain_subtitle">전화번호</div>
							<div class="m_info_accsmain_subtitle">
								<a href="#" class="a">편집</a>
							</div>
						</div>
					</div>
					<div class="m_info_accsmain_mtitle">
						<div class="m_info_solosi">개인 정보 보호</div>
						<div class="m_info_accsmain_title1 sub">
							개인 정보
							<div class="m_info_accsmain_subtitlev">고객님의 개인 정보는 고객님만의
								것으로 언제든 직접 데이터를 관리하고 계정을 삭제할 수도 있습니다. Root은 개인 정보 보호를 최우선으로
								여깁니다.</div>
							<div class="m_info_accsmain_subtitle">
								<a href="#" class="a">내 개인 정보 관리
									<div class="arrow_small a20i"></div>
								</a>
							</div>
						</div>
					</div>
					<div class="m_info_accsmain_mtitle">
						<div class="m_info_solosi">Root ID</div>
						<div class="m_info_accsmain_title1 sub">
							개인 정보
							<div class="m_info_accsmain_subtitlev">이메일</div>
							<div class="m_info_accsmain_subtitle">
								<a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do" class="a">Root ID 관리
									<div class="arrow_small a20i"></div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<div class="m_info_last"></div>
		</section>
		<footer>
			<%@ include file="../common/global_footer.jsp"%>
		</footer>
	</div>
</body>

</html>