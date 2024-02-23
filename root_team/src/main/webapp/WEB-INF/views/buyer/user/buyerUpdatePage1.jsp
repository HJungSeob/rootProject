<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.BuyerVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Root account</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage1.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/birthdayRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/birthdayIO.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdatePage1.js"></script>
</head>

<body>
    <div class="wrap">
        <header>
<%@ include file="../common/global_header.jsp" %>
    </header>
    <section>
        <!-- #region 상단 -->
        <div class="m_userinfo_header1">
            <div class="m_userinfo_header">
                <div class="m_userinfo_header_acc"><a href="${pageContext.request.contextPath}/buyer/buyerServiceInfo.do?b_idx=${buyer.b_idx}">계정</a> | Root ID 관리</div>
                <div class="m_userinfo_loar"><a href="${pageContext.request.contextPath}/buyer/buyerLogout.do" class="m_userinfo_logout">로그아웃<div
                            class="arrow_small a12"></div>
                    </a>
                </div>
            </div>
        </div>
        <!-- #endregion -->
        <div class="m_userinfo_mainregion">
            <!--  #region 사이드 메뉴 -->
            <div class="m_userinfo_sideregion">
                <div class="m_userinfo_proflie">
                </div>
                <div class="m_userinfo_username">
                    ${buyer.b_nickname}
                </div>
                <div class="m_userinfo_useremail">
                    ${buyer.b_email}
                </div>
                <div class="m_userinfo_side_region"></div>
                <div class="m_userinfo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do" class="m_userinfo_sidemanu_select">개인 정보</a>
                </div>
                <div class="m_userinfo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage2.do" class="m_userinfo_sidemanu">로그인 및 보안</a>
                </div>
                <div class="m_userinfo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage3.do" class="m_userinfo_sidemanu">결제 관리</a>
                </div>
            </div>
            <!-- #endregion -->

            <!-- #region 메인 컨텐츠 메뉴 -->
            <div class="m_userinfo_mainPage">
                <div class="m_userinfo_main_title">
                    개인정보
                </div>
                <div class="m_userinfo_main_content">
                    연락 가능한 전화번호 및 이메일 주소를 포함하여 개인 정보를 관리하십시오.
                </div>
                <div class="m_userinfo_main_content_region">
                    <div class="m_userinfo_content" id="m_userinfo_contentname">
                        <div class="m_userinfo_content_nametitle">
                            이름
                        </div>
                        <div class="m_userinfo_content_namesub">
                            ${buyer.b_firstname}&nbsp;${buyer.b_lastname}
                        </div>
                    </div>
                    <div class="m_userinfo_content" id="m_userinfo_contentday">
                        <div class="m_userinfo_content_nametitle">
                            생년월일
                        </div>
                        <div class="m_userinfo_content_namesub">
                        	<fmt:parseDate var="date" value="${buyer.b_birth}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            <fmt:formatDate value="${date}" pattern="yyyy.MM.dd"/>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #endregion -->

        </div>

    <!-- #region 이름 생일 수정 박스 -->
    <div class="m_userinfo_updatename_region_buer" id="main_region_buer"></div>
    <div class="m_userinfo_updatename_region" id="main_region_name">
        <div class="m_userinfo_updatename_region_name">
            이름
        </div>
        <form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
        	<input type="hidden" name="b_idx" value="${buyer.b_idx}">
            <div class="m_userinfo_updatename_region_fname" id="firstNameRegion">
                <label>
                    <input type="text" name="b_firstname" class="m_userinfo_updatename_region_infname"
                        id="firstNameInput">
                    <div class="m_userinfo_updatename_region_plfname" id="firstNametitle">성</div>
                </label>
                <div class="m_userinfo_updatename_region_reuslt" id="firstNameMsg"></div>
            </div>
            <div class="m_userinfo_updatename_region_hr" id="active"></div>
            <div class="m_userinfo_updatename_region_fname" id="lastNameRegion">
                <label>
                    <input type="text" name="b_lastname" class="m_userinfo_updatename_region_infname"
                        id="lastNameInput">
                    <div class="m_userinfo_updatename_region_plfname" id="lastNametitle">이름
                    </div>
                </label>
                <div class="m_userinfo_updatename_region_reuslt" id="lastNameMsg"></div>
            </div>
            <div class="m_userinfo_updatename_region_submit m_userinfo_updatename_region_hr2" id="edsubmit2">
                <label>
                    <div class="m_userinfo_updatename_region_submited">수정</div>
                    <input type="submit" disabled="disabled" class="m_userinfo_updatename_region_submit1"
                            id="namesubmit1">
                </label>
            </div>
        </form>
    </div>
    <div class="m_userinfo_updatename_region" id="m_userinfo_updatename_region_bday">
        <div class="m_userinfo_updatename_region_bdaytitle">
            생년월일
        </div>
        <div class="m_userinfo_updatename_region_bdaysub">
            생년월일은 연령대에 적합한 서비스를 결정하는 데 사용됩니다.
        </div>
        <form name="buyerUpdate" method="post" action="buyerUpdateProcess.do">
        	<input type="hidden" name="b_idx" value="${buyer.b_idx}">
            <div class="m_userinfo_updatename_region_inbday">
                <div class="m_userinfo_updatename_region_inyyyy" id="yyyyregion">
                    <label>
                        <input type="text" name="b_birth" class="m_userinfo_updatename_region_inputyyyy" id="yyyyinput"
                            maxlength="8">
                        <div class="m_userinfo_updatename_region_subyyyy" id="yyyytext">생년월일</div>
                        <div id="result" class="m_userinfo_updatename_region_resultyyyy">yyyy년
                            mm월 dd일</div>
                    </label>
                    <div class="m_userinfo_updatename_region_reuslt" id="resultmsg"></div>
                </div>
                <div class="m_userinfo_updatename_region_submit m_userinfo_updatename_region_hr2" id="edsubmit">
                    <label>
                        <div class="m_userinfo_updatename_region_submited">수정</div>
                        <input type="submit" disabled="disabled" class="m_userinfo_updatename_region_submit1"
                            id="submit">
                    </label>
                </div>
            </div>
        </form>
    </div>
    </section>               
    </div>
    <footer>
	<%@ include file="../common/global_footer.jsp" %>
    </footer>
    <!-- #endregion -->
</body>
</html>