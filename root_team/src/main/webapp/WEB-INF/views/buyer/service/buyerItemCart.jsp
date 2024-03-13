<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니 - Root</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/service/buyerItemCart.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(function () {

            updateTotalPrice()

            $('.m_buyerItemCart_itemsCount').on('input', function () {
                var itemPrice = $(this).closest('.m_buyerItemCart_items').find('.itemPrice').val();
                var itemCount = $(this).val();
                if (itemCount < 1) {
                    itemCount = 1;
                    $(this).val(itemCount);
                }
                var totalPrice = itemPrice * itemCount;
                $(this).closest('.m_buyerItemCart_items').find('.m_buyerItemCart_itemsPrice').text("₩" +
                    totalPrice.toLocaleString());

                updateTotalPrice()
            });

            function updateTotalPrice() {

                var totalCartPrice = 0;

                $('.m_buyerItemCart_items').each(function () {
                    var price = parseInt($(this).find('.m_buyerItemCart_itemsPrice').text().replace(
                        /[^\d.]/g, ""));
                    totalCartPrice += price;
                });
                $('.itemTotalPrice').text("₩" + totalCartPrice.toLocaleString());
                $('.allTotalPrice').text("₩" + (totalCartPrice + 3000).toLocaleString());
                $('.m_buyerItemCart_bagMainTotalPrice').text("장바구니 총액: " + $('.allTotalPrice').text());
            }
        });

        $(function () {

            const urlParams = new URLSearchParams(window.location.search);
            const b_idx = urlParams.get('b_idx');

            $(document).on("click", "#deleteBtn", function () {
                var i_idx = $(this).closest(".m_buyerItemCart_items").find("#i_idx").val();
                var i_option = $(this).closest(".m_buyerItemCart_items").find(
                    ".m_buyerItemCart_itemsTitle span").text();
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/cart/deleteCart.do",
                    data: {
                        i_idx: i_idx,
                        b_idx: b_idx,
                        i_option: i_option
                    },
                    success: function (response) {
                        location.reload();
                    },
                    error: function (xhr, status, error) {}
                });
            });

        });

        $(function () {
            $("#payment").click(function () {
            	if($(".m_buyerItemCart_items").length == 0){
                    alert("결제할 상품이 없습니다.");
                    return false;
                }else{
                	var itemCountArray = $(".m_buyerItemCart_itemsCount").map(function() {
                		  return parseInt($(this).val(), 10);
                	}).get();
                	$("#i_count").val(itemCountArray);
                }        
            });
        });
    </script>
</head>

<body>
    <div class="warp">
        <header>
            <%@ include file="../common/global_header.jsp"%>
        </header>
        <section>
            <div class="m_buyerItemCart_bagRegion">
                <form method="post" action="${pageContext.request.contextPath}/order/order.do">	                
	  				<input type="hidden" name="b_idx" value="${buyer.b_idx}">                       
                    <div class="m_buyerItemCart_bagMainTotalPrice"></div>
                    <div style="text-align: center; margin-top: 20px;">선택된 상품의 개수: ${cartList.size()}</div>
                    <input type="submit" class="m_buyerItemCart_bagSubmit" id="payment">
                    <label for="payment">
                        <div class="m_buyerItemCart_bagSubmitBtn">결제</div>
                    </label>
                    <input type="hidden" name="i_count" id="i_count">                 
                    <div class="m_buyerItemCart_hrTag"></div>
                </form>
                <c:choose>
                    <c:when test="${empty cartList}">
                        <tr>
                            <td colspan="6">장바구니가 비어 있습니다.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="cart" items="${cartList}">
                            <c:if test="${not empty cart}">
                                <div>
                                    <div class="m_buyerItemCart_items">
                                        <input type="hidden" id="i_idx" value="${cart.i_idx}">
                                        <input type="hidden" class="itemPrice" value="${cart.i_price}">
                                        <img src="${pageContext.request.contextPath}/resources/uploads/${cart.i_img}"
                                            alt="" class="m_buyerItemCart_itemsImg">
                                        <div>
                                            <div class="m_buyerItemCart_itemsTitle">
                                                <a
                                                    href="${pageContext.request.contextPath}/item/view.do?i_idx=${cart.i_idx}">
                                                    ${cart.i_name}
                                                </a><br>
                                                <span class="m_buyerItemCart_itemsOption">옵션: ${cart.i_option}</span>
                                            </div>                                         
                                        </div>
                                        <div class="m_buyerItemCart_itemsCountTitle">수량:</div>
                                        <input type="number" class="m_buyerItemCart_itemsCount" value="1">
                                        <div>
                                            <div class="m_buyerItemCart_itemsPrice">
                                                <fmt:formatNumber value="${cart.i_price}" type="currency"
                                                    currencySymbol="₩" />
                                            </div>
                                            <div class="m_buyerItemCart_itemsCancel"><button id="deleteBtn">삭제</button>
                                            </div>
                                            <div class="m_buyerItemCart_itemsCancel"><button id="saveBtn">나중을 위해
                                                    저장</button></div>
                                        </div>
                                    </div>
                                    <div class="m_buyerItemCart_hrTag"></div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
                <div>
                    <div class="_displayFl">
                        <div class="m_buyerItemCart_totalPrice1">소계</div>
                        <div class="m_buyerItemCart_totalPrice1 itemTotalPrice"></div>
                    </div>
                    <div class="_displayFl">
                        <div class="m_buyerItemCart_totalPrice1">배송</div>
                        <div class="m_buyerItemCart_totalPrice1">₩3,000</div>
                    </div>
                    <div class="m_buyerItemCart_hrTag"></div>
                    <div class="_displayFl">
                        <div class="m_buyerItemCart_totalPrice2">총계</div>
                        <div class="m_buyerItemCart_totalPrice2 allTotalPrice"></div>
                    </div>
                    <label for="payment">
                        <div class="m_buyerItemCart_bagSubmitBtn">결제</div>
                    </label>
                </div>
                <div class="m_buyerItemCart_hrTag"></div>

                <div class="m_buyerItemCart_InterestRegion">
                    <div class="m_buyerItemCart_InterestMainTitle">관심 제품</div>
                    <div class="m_buyerItemCart_InterestItemList">
                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                    </div>
                </div>
                <div class="m_buyerItemCart_hrTag"></div>




                <div class="m_buyerItemCart_InterestRegion">
                    <div class="m_buyerItemCart_InterestMainTitle">추천 제품</div>
                    <div class="m_buyerItemCart_InterestItemList">
                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>

                        <div class="m_buyerItemCart_InterestItemRegion">
                            <img src="../resources/css/img/2401031346360601151_377.jpg" alt="이미지 없음"
                                class="m_buyerItemCart_InterestItemImg">
                            <div class="m_buyerItemCart_InterestItemSize">
                                <div class="m_buyerItemCart_InterestItemTitle">상품 이름</div>
                                <div class="m_buyerItemCart_InterestItemPrice">₩1,100,000</div>
                            </div>
                            <div class="m_buyerItemCart_InterestItemButton">장바구니에 담기</div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
    <footer>
        <%@ include file="../common/global_footer.jsp"%>
    </footer>
</body>

</html>