<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 | Root</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/service/buyerShipping.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/addressRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/emailRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/daumMapAPI.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/service/buyerShippingPage.js"></script>
</head>

<body>
    <div class="m_buyerShipping_header1">
        <div class="m_buyerShipping_header">
            <div class="m_buyerShipping_header_acc">결제</div>
            <div class="m_buyerShipping_loar">총 주문 금액: ₩5,500,000</div>
        </div>
    </div>
    <div class="m_buyerShipping_hrTag"></div>
    <div class="m_buyerShipping_payRegion">
        <form action="">
            <div class="m_buyerShipping_Title">주문하신 제품이 어디로 배송되길 원하십니까?</div>
            <div class="m_buyerShipping_subTitle">주소 선택:</div>
            <div class="m_buyerShipping_defaultAddressRegion" id="defaultAddress">
                <div>
                    <div class="m_buyerShipping_name">이름</div>
                    <div class="m_buyerShipping_address">주소</div>
                </div>
                <div class="m_buyerShipping_addressDefault">기본값</div>
                <input type="hidden" name="firstName"  disabled="disabled" class="AInput" value="old">
                <input type="hidden" name="lastName" disabled="disabled" class="AInput" value="old">
                <input type="hidden" name="zonecode" disabled="disabled" class="AInput" value="old">
                <input type="hidden" name="address" disabled="disabled" class="AInput" value="old">
                <input type="hidden" name="addaddress" disabled="disabled" class="AInput" value="old">
            </div>
            <div class="m_buyerShipping_defaultAddressRegion" id="newAddress">
                <div class="m_buyerShipping_newAddress">새 주소 사용</div>
            </div>
            <div id="InputNewAddress" class="m_buyerShipping_InputNewAddress">
                <div class="m_buyerShipping_newAddressFirstBox" id="firstNameRegion">
                    <div class="m_buyerShipping_newAddressTitle" id="firstNameTitle">성</div>
                    <input type="text" class="m_buyerShipping_newAddressInput nAInput" name="firstName" disabled="disabled" id="firstNameInput">
                </div>
                <div class="m_buyerShipping_errorMsg" id="firstNameMsg"></div>

                <div class="m_buyerShipping_newAddressBox" id="lastNameRegion">
                    <div class="m_buyerShipping_newAddressTitle" id="lastNameTitle">이름</div>
                    <input type="text" class="m_buyerShipping_newAddressInput nAInput" name="lastName" disabled="disabled" id="lastNameInput">
                </div>
                <div class="m_buyerShipping_errorMsg" id="lastNameMsg"></div>

                <div class="m_buyerShipping_newAddressBox" id="zonecodeRegion">
                    <div class="m_buyerShipping_newAddressTitle" id="zonecodeTitle">우편번호</div>
                    <input type="text" class="m_buyerShipping_newAddressInput nAInput" name="zonecode" disabled="disabled" id="zonecodeInput">
                </div>
                <div class="m_buyerShipping_errorMsg" id="zonecodeMsg"></div>

                <div class="m_buyerShipping_newAddressBox" id="addressRegion">
                    <div class="m_buyerShipping_newAddressTitle" id="addressTitle">건물 번지, 이름 또는 거리 이름</div>
                    <input type="text" class="m_buyerShipping_newAddressInput nAInput" name="address" disabled="disabled"  id="addressInput">
                </div>
                <div class="m_buyerShipping_errorMsg" id="zonecodeMsg"></div>

                <div class="m_buyerShipping_newAddressLastBox" id="plusAddressRegion">
                    <div class="m_buyerShipping_newAddressTitle" id="plusAddressTitle">아파트 등의 건물 출입 코드(선택사항)</div>
                    <input type="text" class="m_buyerShipping_newAddressInput nAInput" name="addaddress" disabled="disabled" id="plusAddressInput">
                </div>
            </div>
            <div class="_hr"></div>
            <div class="m_buyerShipping_subTitle">연락처 정보를 알려주십시오.</div>
            <div class="m_buyerShipping_newAddressBox" id="emailRegion">
                <div class="m_buyerShipping_newAddressTitle" id="emailTitle">이메일</div>
                <input type="email" class="m_buyerShipping_newAddressInput" id="emailInput">
            </div>
            <div class="m_buyerShipping_errorMsg" id="emailMsg"></div>

            <div class="m_buyerShipping_newAddressBox" id="telRegion">
                <div class="m_buyerShipping_newAddressTitle" id="telTitle">전화번호</div>
                <input type="tel" class="m_buyerShipping_newAddressInput" id="telInput" maxlength="13">
            </div>
            <div class="m_buyerShipping_errorMsg" id="telSmg"></div>
            
            <div class="_hr"></div>
            <div class="m_buyerShipping_subTitle">어떻게 결제하시겠습니까?</div>
            <div class="m_buyerShipping_defaultAddressRegion" id="cardRegion">
                <div class="m_buyerShipping_newAddress">신용카드 또는 할부</div>
            </div>
            <div class="m_buyerShipping_submitRegion">
                <label>
                    <div class="m_buyerShipping_submitTitle">결제</div>
                    <input type="submit" class="m_buyerShipping_submitInput">
                </label>
            </div>
        </form>
    </div>
</body>

</html>