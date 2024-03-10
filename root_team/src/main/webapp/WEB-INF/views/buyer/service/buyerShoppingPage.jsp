<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 | Root</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/service/buyerShopping.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/nameRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/addressRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/publicRegex/telRegex.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/daumMapAPI.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/service/buyerShoppingPage.js"></script>
    <script>
    
    var IMP = window.IMP;
    IMP.init("imp02057403");

    var amount = ${totalPrice};
    var b_idx = "${b_idx}";
    var bo_itmename = "${buyer.b_firstname} ${buyer.b_firstname}";
    var bo_totalprice = "${buyer.b_tel} ";
    var item_name = $(".i_name").val() + "외";
    var order_num = "${i_idx}";
    var item_count = 0;
    var address = $("#ba_address").val();
    var add_code = "${ba_zipcode}";
    
    $('#requestPay').click(function(){
    	
    	
    	
    	
    	
        IMP.request_pay({
            pg: "kcp",
            pay_method: "card",
            merchant_uid: order_num,
            name: item_name,
            amount: amount,
            buyer_name: b_name,
            buyer_tel: b_tel,
            buyer_addr: address,
            buyer_postcode: add_code,
        },
        function (rsp) {
            if (rsp.success) {
                // 결제 성공 시, 서버에 결제 정보 전송
                $.ajax({
                    url: "/service/payment", // 서버의 결제 정보 처리 URL
                    type: "POST",
                    contentType: "application/json",
                    data: JSON.stringify({
                        merchantUid: rsp.merchant_uid,
                        amount: rsp.paid_amount,
                        // 추가 결제 정보
                    }),
                    success: function (response) {
                        // 결제 정보 전송 성공 처리
                        alert("결제가 성공적으로 완료되었습니다.");
                    },
                    error: function (xhr, status, error) {
                        // 오류 처리
                        alert("결제 정보 전송에 실패했습니다.");
                    }
                });
            } else {
                // 결제 실패 시 로직
                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
            }
        });
}
</script>
</head>

<body>
    <div class="m_buyerShopping_header1">
        <div class="m_buyerShopping_header">
        	<c:if test="${not empty cartList}">
        		<c:choose>
        			<c:when test="${cartList.size() > 1}">
        				<input type="hidden" id="itemsName" value="${cartList[0].i_name}외 ${cartList.size()-1}개">     				
        			</c:when>
        			<c:otherwise>
        				<input type="hidden" id="itemsName" value="${cartList[0].i_name}">
        			</c:otherwise>
        		</c:choose>      	
        	</c:if>
            <div class="m_buyerShopping_header_acc">결제</div>
            <c:set var="totalPrice" value="0" />
			<c:forEach var="cart" items="${cartList}">  
			    <c:set var="totalPrice" value="${totalPrice + cart.i_price + 3000}" />
			</c:forEach>
            <div class="m_buyerShopping_loar">총 주문 금액: <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₩" /></div>
        </div>
    </div>
    <div class="m_buyerShopping_hrTag"></div>
    <div class="m_buyerShopping_payRegion">
            <div class="m_buyerShopping_Title">주문하신 제품이 어디로 배송되길 원하십니까?</div>
            <div class="m_buyerShopping_subTitle">주소 선택:</div>
            <div class="m_buyerShopping_defaultAddressRegion" id="defaultAddress">
                <div>
                    <div class="m_buyerShopping_name">${address.ba_firstname} ${address.ba_lastname}</div>
                    <div class="m_buyerShopping_address">${address.ba_address} ${address.ba_restaddress}</div>
                </div>
                <div class="m_buyerShopping_addressDefault">기본값</div>
            </div>
            <div class="m_buyerShopping_defaultAddressRegion" id="newAddress">
                <div class="m_buyerShopping_newAddress">새 주소 사용</div>
            </div>
            <div id="InputNewAddress" class="m_buyerShopping_InputNewAddress">
                <div class="m_buyerShopping_newAddressFirstBox" id="firstNameRegion">
                    <div class="m_buyerShopping_newAddressTitle" id="firstNameTitle">성</div>
                    <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="firstName" disabled="disabled" id="firstNameInput">
                </div>
                <div class="m_buyerShopping_errorMsg" id="firstNameMsg"></div>

                <div class="m_buyerShopping_newAddressBox" id="lastNameRegion">
                    <div class="m_buyerShopping_newAddressTitle" id="lastNameTitle">이름</div>
                    <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="lastName" disabled="disabled" id="lastNameInput">
                </div>
                <div class="m_buyerShopping_errorMsg" id="lastNameMsg"></div>

                <div class="m_buyerShopping_newAddressBox" id="zonecodeRegion">
                    <div class="m_buyerShopping_newAddressTitle" id="zonecodeTitle">우편번호</div>
                    <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="zonecode" disabled="disabled" id="zonecodeInput">
                </div>
                <div class="m_buyerShopping_errorMsg" id="zonecodeMsg"></div>

                <div class="m_buyerShopping_newAddressBox" id="addressRegion">
                    <div class="m_buyerShopping_newAddressTitle" id="addressTitle">건물 번지, 이름 또는 거리 이름</div>
                    <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="address" disabled="disabled"  id="addressInput">
                </div>
                <div class="m_buyerShopping_errorMsg" id="zonecodeMsg"></div>

                <div class="m_buyerShopping_newAddressLastBox" id="plusAddressRegion">
                    <div class="m_buyerShopping_newAddressTitle" id="plusAddressTitle">상세주소 및 아파트 등의 건물 출입 코드(선택사항)</div>
                    <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="addaddress" disabled="disabled" id="plusAddressInput">
                </div>
            </div>
            <div class="_hr"></div>
            <div class="m_buyerShopping_subTitle">연락처 정보를 알려주십시오.</div>
            <div class="m_buyerShopping_newAddressBox" id="telRegion">
                <div class="m_buyerShopping_newAddressTitle" id="telTitle">전화번호</div>
                <input type="tel" class="m_buyerShopping_newAddressInput" id="telInput" maxlength="13" value="${address.ba_contact}">
            </div>
            <div class="m_buyerShopping_errorMsg" id="telSmg"></div>
            
            <div class="_hr"></div>
            <div class="m_buyerShopping_subTitle">어떻게 결제하시겠습니까?</div>
            <div class="m_buyerShopping_defaultAddressRegion" id="cardRegion">
                <div class="m_buyerShopping_newAddress">신용카드 또는 할부</div>
            </div>
            <div class="m_buyerShopping_submitRegion">
                 <div class="m_buyerShopping_submitTitle" id="requestPay">결제</div>
            </div>
    </div>
</body>

</html>