<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>판매관리 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/sales_section.css">

	<script src="../resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>
</head>

<body>
    <div class="wrap">
       
 		<%@include file="../common/header.jsp" %>

        <section>
            <div class="seller_global_section">
            
            	<%@include file="../common/navigation.jsp" %>
                
                <div class="seller_sales_contents">
                    <div class="seller_sales_contents_title">
                        <span>메인 > 판매관리</span>
                    </div>

                    <div class="seller_sales_contents_search">
                        <form>
                        	<input type="hidden" name="s_idx" value="${seller.s_idx}">
                            <div class="seller_sales_contents_search_box">
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">검색어</span>
                                    <div class="seller_sales_contents_search_item1">
                                    	<span>
                                        	주문번호
                                        	<input type="text" name="orderNum" autocomplete='off' placeholder="상품번호를 입력하세요." value="${sVO.orderNum}">
                                        </span>
                                        <span>
                                        	닉네임
                                        	<input type="text" name="orderNickname" autocomplete='off' placeholder="닉네임을 입력하세요." value="${sVO.orderNickname}">
                                        </span>
                                    </div>
                                </div>
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">주문상태</span>
                                    <div class="seller_sales_contents_search_item2">
                                    	<input type="radio" id="all" name="orderState" value="0" ${sVO.orderState eq 0 and sVO.orderState eq '' ? 'checked' : '' }>
                                        <label for="all"><span>전체</span></label>
                                        <input type="radio" id="sale" class="restCheckBox" name="orderState" value="1" ${sVO.orderState eq 1 ? 'checked' : '' }>
                                        <label for="sale"><span>환불</span></label>
                                        <input type="radio" id="waitSale" class="restCheckBox" name="orderState" value="2" ${sVO.orderState eq 2 ? 'checked' : '' }>
                                        <label for="waitSale"><span>교환</span></label>
                                        <input type="radio" id="stock" class="restCheckBox" name="orderState" value="3" ${sVO.orderState eq 3 ? 'checked' : '' }>
                                        <label for="stock"><span>반품</span></label>
                                    </div>
                                </div>
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">등록기간</span>
                                    <div class="seller_sales_contents_search_item3">
                                         <input type="date" id="startDate" name="sDate" value="${param.sDate}">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="eDate" value="${param.eDate}">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_sales_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_sales_contents_list">
                        <c:choose>
							<c:when test="${empty orderList}">
								<div><span>상품목록 (총 0개)</span></div>
							</c:when>
							<c:otherwise>
								 <div><span>상품목록 (총 ${pageNav.totalRows}개)</span></div>
							</c:otherwise>
						</c:choose>
						
                        <table class="seller_sales_contents_table">
                            <tr class="seller_sales_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>닉네임</th>
                                <th>상품명</th>
                                <th>옵션</th>
                                <th>수량</th>
                                <th>주문번호</th>
                                <th>주문상태</th>
                                <th>결제금액</th>
                            </tr>
                            
                            <c:choose>
								<c:when test="${empty orderList}">
									<tr><td colspan="9">등록된 주문이 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs" >
										<c:if test="${not empty orderList[vs.count-1]}">
											
											<tr>
				                                <td><span>${i}</span></td>
				                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
				                                <td><span>${orderList[vs.count-1].b_nickname}</span></td>
				                                <td class="seller_view_edit_contents_table_product_name">
				                                	<a href=""><span>${orderList[vs.count-1].i_name}</span></a>
				                                </td>
				                                <td><span>${orderList[vs.count-1].bos_option}</span></td>
				                                <td><span>${orderList[vs.count-1].bos_count}</span></td>
				                                <c:set var="orderNumber" value="${orderList[vs.count-1].bo_idx}" />
				                                <td><span>R<fmt:formatNumber type="custom" pattern="00000000" value="${orderNumber}" /></span></td>
				                                <c:set var="orderState" value="${orderList[vs.count-1].bos_state}" />
												<td><span>
												    <c:choose>
												        <c:when test="${orderState eq 6}">환불</c:when>
												        <c:when test="${orderState eq 7}">교환</c:when>
												        <c:when test="${orderState eq 8}">반품</c:when>
												    </c:choose>
												</span></td>
				                                <td><span><fmt:formatNumber type="number" pattern="#,###" value="${orderList[vs.count-1].bos_price}" />원</span></td>
				                            </tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
                        </table>
                    </div>

                    <c:if test="${not empty orderList}">
                        <div class="seller_contents_table_pasing" id="td_paging">
                        	<span><%@ include file="../../common/paging.jsp" %></span>
                        </div>
                    </c:if>
                    
                </div>
            </div>
            
           <!--  <div id="select_list" class="seller_sales_option_box">
           		<div id="sl_refund" class="seller_sales_point"><span>환불</span></div>
           		<div id="sl_exchange" class="seller_sales_point"><span>교환</span></div>
           		<div id="sl_return" class="seller_sales_point"><span>반품</span></div>
            </div> -->

        </section>

    </div>

	<!-- <script>
		$(document).ready(function() {
			$("#editButton").click(function() {
				var buttonPosition = $(this).offset(); // 수정 버튼의 위치를 가져옴
				var topPosition = buttonPosition.top + $(this).outerHeight(); // 수정 버튼 아래에 위치하도록 계산

				$(".seller_sales_option_box").css({
					"position" : "absolute",
					"top" : topPosition + "px",
					"left" : buttonPosition.left + "px"
				}).toggle(); // 위치 설정 후 toggle을 사용하여 보이기/숨기기를 토글
			});
		});

		$("#sl_refund").click(function() {
			console.log("환불");
		});
		$("#sl_exchange").click(function() {
			console.log("교환");
		});
		$("#sl_return").click(function() {
			console.log("반품");
		});
	</script> -->

</body>

</html>