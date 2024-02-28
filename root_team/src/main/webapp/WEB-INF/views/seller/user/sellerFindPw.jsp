<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Root account | findPassword</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/user/sellerFindPw.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/user/taxidAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/user/sellerFindPw.js"></script>
</head>

<body>
    <div class="warp">
        <header>

        </header>
        <section>
            <div class="m_sellerFindPw_header1">
                <div class="m_sellerFindPw_header">
                    <div class="m_sellerFindPw_header_acc">
                        Root ID
                    </div>
                    <div class="m_sellerFindPw_loar">
                        <a href="${pageContext.request.contextPath}/buyer/buyerLogout.do"
                            class="m_sellerFindPw_logout">로그아웃
                            <div class="arrow_small a12"></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="_hr"></div>
            <form action="">
                <div class="m_sellerFindPw_findPage1" id="findPage1">
                    <div class="m_sellerFindPw_findPwTitle">암호 재설정</div>
                    <div class="m_sellerFindPw_findPwSubTitle">계속하려면 계정에서 사용하는 사업자 번호를 입력하십시오.</div>
                    <div class="m_sellerFindPw_updatename_region_taxid">
                        <div class="m_sellerFindPw_taxidRegion" id="taxidRegion">
                            <label>
                                <input type="text" name="taxid" class="m_sellerFindPw_taxidInput" id="taxidInput" maxlength="12">
                                <div class="m_sellerFindPw_taxidTitle" id="taxidTitle">사업자 번호</div>
                            </label>
                        </div>
                    </div>
                    <div class="m_sellerFindPw_nextRegion">
                        <div class="m_sellerFindPw_nextBtn" id="nextBtn">다음</div>
                    </div>
                </div>

                <div class="m_sellerFindPw_findPage2" id="findPage2">
                    <div class="m_sellerFindPw_findPwTitle">이메일를 입력해 주세요</div>
                    <div class="m_sellerFindPw_emailRegion" id="emailRegion">
                        <label>
                            <input type="email" name="email" class="m_sellerFindPw_emailInput" id="emailInput">
                            <div class="m_sellerFindPw_emailTitle" id="emailTitle">이메일 주소</div>
                        </label>
                    </div>
                    <div class="m_sellerFindPw_submitRegion">
                        <div class="m_sellerFindPw_returnBtn" id="returnBtn">취소</div>
                        <label>
                            <div class="m_sellerFindPw_submitBtn">확인</div>
                            <input type="submit" class="m_sellerFindPw_submit">
                        </label>
                    </div>
                </div>
            </form>
        </section>
    </div>
    <footer>

    </footer>
</body>

</html>