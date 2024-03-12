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
    <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        $(function () {

            function formatNumberToCode(number) {
                var paddedNumber = number.toString().padStart(8, '0'); // 8자리로 패딩하여 문자열로 변환
                return 'ROOTSTORE' + paddedNumber;
            }

            var IMP = window.IMP;
            IMP.init("imp02057403");

            var b_idx = $("#b_idx").val();
            var bo_idx = null;
            var bo_totalprice = 0;
            var bo_item_name = $("#itemsName").val();
            var b_name = "${buyer.b_firstname} ${buyer.b_lastname}";
            var b_tel = "${buyer.b_tel}";
            var ba_address = $("#baAddress").text();
            var ba_zipcode = "${address.ba_zipcode}";

            var i_idxArray = [];
            var optionArray = [];
            var priceArray = [];
            var countArray = JSON.parse($('#cartItemsCount').val());

            $('.cartItems').each(function () {
                i_idxArray.push(parseInt($(this).val()));
            });
            $('.cartOptions').each(function () {
                optionArray.push($(this).val());
            });
            $('.cartPrice').each(function () {
                priceArray.push(parseInt($(this).val()));
            });

            for (var i = 0; i < priceArray.length; i++) {
                bo_totalprice += priceArray[i] * countArray[i];
            }

            $('#totalPrice').text('₩' + (bo_totalprice + 3000).toLocaleString('ko-KR'));

            $('#requestPay').click(function () {

                var orderArray = [];
                for (var i = 0; i < i_idxArray.length; i++) {
                    var orderItem = {
                        i_idx: i_idxArray[i],
                        bos_option: optionArray[i],
                        bos_price: priceArray[i],
                        bos_count: countArray[i]
                    };
                    orderArray.push(orderItem);
                }

                var order = {
                    b_idx: b_idx,
                    bo_itmename: bo_item_name,
                    bo_name: b_name,
                    bo_zipcode: ba_zipcode,
                    bo_address: ba_address,
                    bo_contact: b_tel,
                    orderStateVO: orderArray
                };

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/order/insertOrder.do",
                    data: JSON.stringify(order),
                    contentType: "application/json;charset=utf-8;",
                    success: function (data) {
                        bo_idx = data

                        IMP.request_pay({
                                pg: "kcp",
                                pay_method: "card",
                                merchant_uid: bo_idx,
                                name: bo_item_name,
                                amount: bo_totalprice,
                                buyer_name: b_name,
                                buyer_tel: b_tel,
                                buyer_addr: ba_address,
                                buyer_postcode: ba_zipcode,
                            },
                            function (rsp) {
                                if (rsp.success) {

                                    $.ajax({
                                        url: "/service/payment",
                                        type: "POST",
                                        contentType: "application/json",
                                        data: JSON.stringify({
                                            merchantUid: rsp
                                                .merchant_uid,
                                            amount: rsp.paid_amount,

                                        }),
                                        success: function (response) {
                                        	$.ajax({
                                                type: "POST",
                                                url: "${pageContext.request.contextPath}/order/deleteOrder.do",
                                                data: {bo_idx: bo_idx},                                       
                                                success: function (data) {
                                                    alert("결제를 취소하였습니다.");
                                                },
                                                error: function (xhr, status, error) {}
                                            });
                                        },
                                        error: function (xhr, status, error) {
                                            alert("결제 정보 전송에 실패했습니다.");
                                        }
                                    });
                                } else { 
                                	$.ajax({
                                        type: "POST",
                                        url: "${pageContext.request.contextPath}/order/successOrder.do",
                                        data: JSON.stringify(order),
                                        contentType: "application/json;charset=utf-8;",
                                        success: function (data) {
                                        	alert("결제가 성공적으로 완료되었습니다.");
                                        	window.location.href = "${pageContext.request.contextPath}/index.do";
                                        },
                                        error: function (xhr, status, error) {}
                                    });                           
                                }
                            })
                    },
                    error: function (xhr, status, error) {}
                });

            })
        })
    </script>
</head>

<body>
    <div class="m_buyerShopping_header1">
        <div class="m_buyerShopping_header">
            <c:if test="${not empty cartList}">
            	<input type="hidden" id="b_idx" value="${buyer.b_idx}">
                <input type="hidden" id="cartItemsCount" value="${i_count}">
                <c:forEach var="cart" items="${cartList}">
                    <input type="hidden" class="cartItems" value="${cart.i_idx}">
                    <input type="hidden" class="cartOptions" value="${cart.i_option}">
                    <input type="hidden" class="cartPrice" value="${cart.i_price}">
                </c:forEach>
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
            <div class="m_buyerShopping_loar">총 주문 금액:
                <span id="totalPrice"></span>
            </div>
        </div>
    </div>
    <div class="m_buyerShopping_hrTag"></div>
    <div class="m_buyerShopping_payRegion">
        <div class="m_buyerShopping_Title">주문하신 제품이 어디로 배송되길 원하십니까?</div>
        <div class="m_buyerShopping_subTitle">주소 선택:</div>
        <div class="m_buyerShopping_defaultAddressRegion" id="defaultAddress">
            <div>
                <div class="m_buyerShopping_name">${address.ba_firstname} ${address.ba_lastname}</div>
                <div class="m_buyerShopping_address" id="baAddress">${address.ba_address} ${address.ba_restaddress}
                </div>
            </div>
            <div class="m_buyerShopping_addressDefault">기본값</div>
        </div>
        <div class="m_buyerShopping_defaultAddressRegion" id="newAddress">
            <div class="m_buyerShopping_newAddress">새 주소 사용</div>
        </div>
        <div id="InputNewAddress" class="m_buyerShopping_InputNewAddress">
            <div class="m_buyerShopping_newAddressFirstBox" id="firstNameRegion">
                <div class="m_buyerShopping_newAddressTitle" id="firstNameTitle">성</div>
                <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="firstName" disabled="disabled"
                    id="firstNameInput">
            </div>
            <div class="m_buyerShopping_errorMsg" id="firstNameMsg"></div>

            <div class="m_buyerShopping_newAddressBox" id="lastNameRegion">
                <div class="m_buyerShopping_newAddressTitle" id="lastNameTitle">이름</div>
                <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="lastName" disabled="disabled"
                    id="lastNameInput">
            </div>
            <div class="m_buyerShopping_errorMsg" id="lastNameMsg"></div>

            <div class="m_buyerShopping_newAddressBox" id="zonecodeRegion">
                <div class="m_buyerShopping_newAddressTitle" id="zonecodeTitle">우편번호</div>
                <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="zonecode" disabled="disabled"
                    id="zonecodeInput">
            </div>
            <div class="m_buyerShopping_errorMsg" id="zonecodeMsg"></div>

            <div class="m_buyerShopping_newAddressBox" id="addressRegion">
                <div class="m_buyerShopping_newAddressTitle" id="addressTitle">건물 번지, 이름 또는 거리 이름</div>
                <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="address" disabled="disabled"
                    id="addressInput">
            </div>
            <div class="m_buyerShopping_errorMsg" id="zonecodeMsg"></div>

            <div class="m_buyerShopping_newAddressLastBox" id="plusAddressRegion">
                <div class="m_buyerShopping_newAddressTitle" id="plusAddressTitle">상세주소 및 아파트 등의 건물 출입 코드(선택사항)</div>
                <input type="text" class="m_buyerShopping_newAddressInput nAInput" name="addaddress" disabled="disabled"
                    id="plusAddressInput">
            </div>
        </div>
        <div class="_hr"></div>
        <div class="m_buyerShopping_subTitle">연락처 정보를 알려주십시오.</div>
        <div class="m_buyerShopping_newAddressBox" id="telRegion">
            <div class="m_buyerShopping_newAddressTitle" id="telTitle">전화번호</div>
            <input type="tel" class="m_buyerShopping_newAddressInput" id="telInput" maxlength="13"
                value="${address.ba_contact}">
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