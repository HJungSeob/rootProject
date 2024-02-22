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
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerUpdatePage2.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/passwordRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/checkemailtel.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerUpdatePage2.js"></script>
</head>

<body>
    <div class="wrap">
            <header>
<%@ include file="../common/global_header.jsp" %>
    </header>
        <!-- #region 상단 -->
        <div class="m_userinfosclo_header1">
            <div class="m_userinfosclo_header">
                <div class="m_userinfosclo_header_acc">Root ID</div>
                <div class="m_userinfosclo_loar">
                <a href="${pageContext.request.contextPath}/buyer/buyerLogout.do" class="m_userinfosclo_logout">
                로그아웃<div class="arrow_small a12"></div>
                    </a>
                </div>
            </div>
        </div>
        <!-- #endregion -->
        <div class="m_userinfosclo_mainregion">
            <!--  #region 사이드 메뉴 -->
            <div class="m_userinfosclo_sideregion">
                <div class="m_userinfosclo_proflie">
                </div>
                <div class="m_userinfosclo_username">
                    ${buyer.b_nickname}
                </div>
                <div class="m_userinfosclo_useremail">
                    ${buyer.b_email}
                </div>
                <div class="m_userinfosclo_side_region"></div>
                <div class="m_userinfosclo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage1.do" class="m_userinfosclo_sidemanu">개인 정보</a>
                </div>
                <div class="m_userinfosclo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage2.do" class="m_userinfosclo_sidemanu_select">로그인 및 보안</a>
                </div>
                <div class="m_userinfosclo_side">
                    <a href="${pageContext.request.contextPath}/buyer/buyerUpdatePage3.do" class="m_userinfosclo_sidemanu">결제 관리</a>
                </div>
            </div>
            <!-- #endregion -->

            <!-- #region 메인 컨텐츠 메뉴 -->
            <div class="m_userinfosclo_mainPage">
                <div class="m_userinfosclo_main_title">
                    로그인 및 보안
                </div>
                <div class="m_userinfosclo_main_content">
                    계정 로그인, 계정 보안 및 로그인하는 데 문제가 있을 경우 데이터를 복구하는 방법과 관련된 설정을 관리합니다.
                </div>
                <div class="m_userinfosclo_main_content_region">
                    <div class="m_userinfosclo_content" id="m_userinfosclo_contentname">
                        <div class="m_userinfosclo_content_nametitle">
                            이메일 및 전화번호
                        </div>
                        <div class="m_userinfosclo_content_namesub">
                             ${buyer.b_email}
                        </div>
                        <div class="m_userinfosclo_content_namesub">
                             ${buyer.b_tel}
                        </div>
                    </div>
                    <div class="m_userinfosclo_content" id="m_userinfosclo_contentday">
                        <div class="m_userinfosclo_content_nametitle">
                            암호
                        </div>
                        <div class="m_userinfosclo_content_namesub">
                        <fmt:formatDate var="pwmodifydate" value="${buyer.b_pwmodifydate}" pattern="yyyy.MM.dd HH:mm:ss"/>                                	              
                            최근 업데이트: ${pwmodifydate}  
                        </div>
                    </div>
                </div>
            </div>
            <!-- #endregion -->

        </div>

    <!-- #region 이메일 암호 수정 박스 -->
    <div class="m_userinfosclo_updatename_region_buer" id="m_userinfosclo_updatename_region_buer"></div>
    <div class="m_userinfosclo_updatename_region" id="m_userinfosclo_updatename_region_name">
        <div class="m_userinfosclo_updatename_region_name">
            이메일 및 전화번호
        </div>
        <form action="./userinfosclo.html">
            <div class="m_userinfosclo_updatename_region_fname" id="emailRegion">
                <label>
                    <input type="email" class="m_userinfosclo_updatename_region_infname" id="emailInput">
                    <div class="m_userinfosclo_updatename_region_plfname" id="emailTitle">이메일
                    </div>
                    </lable>
                    <div class="m_userinfo_updatename_region_reuslt" id="emailMsg"></div>
            </div>
            <div class="m_userinfosclo_updatename_region_hr" id="active"></div>
            <div class="m_userinfosclo_updatename_region_fname" id="telRegion">
                <label>
                    <input type="tel" class="m_userinfosclo_updatename_region_infname" id="telInput" maxlength="13">
                    <div class="m_userinfosclo_updatename_region_plfname" id="telTitle">
                        전화번호</div>
                </label>
                <div class="m_userinfo_updatename_region_reuslt" id="telSmg"></div>
            </div>
            <div class="m_userinfosclo_updatename_region_submit m_userinfosclo_updatename_region_hr2" id="edsubmit1">
                <label>
                    <div class="m_userinfosclo_updatename_region_submited">수정</div>
                    <input type="submit" disabled="disabled" class="m_userinfosclo_updatename_region_submit1"
                        id="emailsubmit1">
                </label>
            </div>
        </form>
    </div>
    <div class="m_userinfosclo_updatename_region" id="m_userinfosclo_updatename_region_bday">
        <div class="m_userinfosclo_updatename_region_bdaytitle">
            암호 변경
        </div>
        <div class="m_userinfosclo_content_namesub1">
            최근 업데이트: ${pwmodifydate}
        </div>
        <form action="./userinfosclo.html">
            <div class="m_userinfosclo_updatename_region_inbday">
                <div class="m_userinfosclo_updatename_region_inyyyy" id="exPwRegion">
                    <label>
                        <input type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="exPwInput">
                        <div class="m_userinfosclo_updatename_region_subyyyy" id="exPwTitle">현재 암호</div>
                    </label>
                    <div class="m_userinfosclo_pwMsg" id="exPwMsg"></div>
                </div>
                <div class="m_userinfosclo_updatename_region_inyyyy" id="newPwRegion">
                    <label>
                        <input type="password" class="m_userinfosclo_updatename_region_inputyyyy" id="newPwInput">
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
                <div class="m_userinfosclo_updatename_region_submit m_userinfosclo_updatename_region_hr2"
                    id="ckeckSubmit">
                    <label>
                        <div class="m_userinfosclo_updatename_region_submited">수정</div>
                        <input type="submit" id="pwSubmit" disabled="disabled"
                            class="m_userinfosclo_updatename_region_submit1">
                    </label>
                </div>
            </div>
    </div>
    </form>
                   
    </div>
     <footer>
<%@ include file="../common/global_footer.jsp" %>
    </footer>
    <!-- #endregion -->
</body>

</html>