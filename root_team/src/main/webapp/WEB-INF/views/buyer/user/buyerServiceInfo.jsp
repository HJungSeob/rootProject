<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="root.team.com.vo.BuyerVO" %>
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
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerServiceInfo.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/daumMapAPI.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/addressRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/checkebuyerServiceInfo.js"></script>
    <script>
let telCheckValid = true;
</script>
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
						<a href="${pageContext.request.contextPath}/buyer/buyerLogout.do" class="m_info_logout">로그아웃
							<div class="arrow_small a12"></div>
						</a>
					</div>
				</div>
			</div>
			<!-- #endregion -->

			<!-- #region 프로필 영역 -->
			<div class="m_info_profile">
				<div class="m_info_sprofile">
					<div class="m_info_proname">${buyer.b_nickname}님, 안녕하세요!</div>
					<div class="m_info_pro">
						<img src="${pageContext.request.contextPath}/resources/uploads/${buyer.b_profile}" class="m_info_proimg" alt="이미지를 찾을 수 없음">
						<div class="m_info_werll">
							<div class="m_info_mr">
								등급
								<div class="m_info_mrp">${buyer.b_grade}</div>
							</div>
							<div class="m_info_point">
								포인트
								<div class="m_info_pointp">
								<fmt:formatNumber value="${buyer.b_point}" pattern="#,##0"/>
								</div>
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
							<div class="m_info_accsmain_subtitle">${address.ba_firstname}</div>
							<div class="m_info_accsmain_subtitle">${address.ba_lastname}</div>
							<div class="m_info_accsmain_subtitle">${address.ba_address}</div>
							<div class="m_info_accsmain_subtitle">${address.ba_zipcode}</div>
							<div class="m_info_accsmain_subtitle">${address.ba_restaddress}</div>
							<div class="m_info_accsmain_subtitle atag" id="deledit">편집</div>
						</div>
						<div class="m_info_accsmain_title1 sub">
							연락처 정보
							<div class="m_info_accsmain_subtitle">${address.ba_contact}</div>
							<div class="m_info_accsmain_subtitle atag" id="teledit">편집</div>
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
								<a href="#" class="a">개인정보처리방침
									<div class="arrow_small a20i"></div>
								</a>
							</div>
						</div>
					</div>
					<div class="m_info_accsmain_mtitle">
						<div class="m_info_solosi">Root ID</div>
						<div class="m_info_accsmain_title1 sub">
							개인 정보
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
		
	</div>
	<footer>
			<%@ include file="../common/global_footer.jsp"%>
		</footer>
		<div class="m_buyerServiceInfo_mainRegion" id="mainRegion"></div>
        <form method="post" action="buyerInsertAddressProcess.do">
        	<input type="hidden" name="b_idx" value="${buyer.b_idx}">
        	<input type="hidden" name="ba_contact" value="${buyer.b_tel}">
        	<input type="hidden" name="ba_check" value="Y">
            <div class="m_buyerServiceInfo_delRegion" id="delRegion">
                <div class="m_buyerServiceInfo_delTitle">배송 주소를 편집하세요.</div>
                <div class="_inputRegion" id="firstNameRegion">
                        <input placeholder=" " type="text" name="ba_firstname" class=""
                            id="firstNameInput">
                        <span class="" id="firstNametitle">성</span>
                    <div class="m_buyerServiceInfo_firstnameMsg" id="firstNameMsg"></div>
                </div>
                <div class="_inputRegion" id="LastNameRegion">
                        <input placeholder=" " type="text" name="ba_lastname" class="" id="lastNameInput">
                        <span class="" id="lastNametitle">이름</span>
                    <div class="m_buyerServiceInfo_lastnameMsg" id="lastNameMsg"></div>
                </div>

                <div class="_inputRegion" id="zonecodeRegion">
                        <input placeholder=" " type="text" name="ba_zipcode" class=""
                            id="zonecodeInput">
                        <span class="" id="zonecodetitle">우편번호</span>
                    <div class="m_buyerServiceInfo_zonecodeMsg testMsg" id="zonecodeMsg"></div>
                </div>
                <div class="_inputRegion" id="addressRegion">
                        <input placeholder=" " type="text" name="ba_address" class=""
                            id="addressInput">
                        <span class="" id="addresstitle">건물 번지, 이름 또는 거리 이름
                        </span>
                    <div class="m_buyerServiceInfo_addressMsg testMsg" id="addressMsg"></div>
                </div>
                <div class="_inputRegion" id="viewAddressRegion">
                        <input placeholder=" " type="text" name="ba_restaddress" class=""
                            id="viewAddressInput">
                        <span class="" id="viewAddresstitle">상세주소(선택)</span>
                    <div class="m_buyerServiceInfo_viewAddressMsg testMsg" id="viewAddressMsg"></div>
                </div>
                <div class="m_buyerServiceInfo_addressSubmitRegion" id="addressSubmitRegion">
                    <label>
                        <div class="m_buyerServiceInfo_addressSubmitTitle" id="addressSubmitTitle">수정</div>
                        <input type="submit" id="addressSubmit" disabled="disabled"
                            class="m_buyerServiceInfo_addressSubmit">
                    </label>
                </div>
            </div>
        </form>

        <form method="post" action="buyerInsertContactProcess.do">
        	<input type="hidden" name="b_idx" value="${buyer.b_idx}">
        	<input type="hidden" name="ba_idx" value="${address.ba_idx}">
            <div class="m_buyerServiceInfo_telMainRegion" id="telMainRegion">
                <div class="m_buyerServiceInfo_telTitleRegion">연락처 정보를 수정하세요.</div>
                <div class="m_buyerServiceInfo_telSubTitle">청구 연락처는 문자 메시지로도 배송 관련 정보를 받아보려면 아래에 휴대폰 번호를 추가하세요.</div>
                <div class="_inputRegion" id="telRegion">
                        <input placeholder=" " type="tel" name="ba_contact" class=""
                            id="telInput" maxlength="13">
                        <span class="" id="telTitle">전화번호</span>
                    <div class="m_buyerServiceInfo_telMsg" id="telSmg"></div>
                </div>
                <div class="m_buyerServiceInfo_telSubmitRegion" id="telSubmitRegion">
                    <label>
                        <div class="m_buyerServiceInfo_telSubmitTitle" id="telSubmitTitle">수정</div>
                        <input type="submit" id="telSubmit" disabled="disabled"
                            class="m_buyerServiceInfo_telSubmit">
                    </label>
                </div>
            </div>
        </form>
</body>

</html>