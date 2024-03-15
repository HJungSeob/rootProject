<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>상품 조회/수정 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/viewEdit_section.css">

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

                <div class="seller_view_edit_contents">
                    <div class="seller_view_edit_contents_title">
                        <span>메인 > 상품관리 > 상품 조회/수정</span>
                    </div>

                    <div class="seller_view_edit_contents_search">
                        <form>
                        	<input type="hidden" name="s_idx" value="${seller.s_idx}">
                        	<input type="hidden" id="smallCategorys" value="${sVO.smallCategory}">
                            <div class="seller_view_edit_contents_search_box">
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">검색어</span>
                                    <div class="seller_view_edit_contents_search_item1">
                                        <span>
                                        	상품번호
                                        	<input type="text" name="itemNum" autocomplete='off' placeholder="상품번호를 입력하세요." value="${sVO.itemNum}">
                                        </span>
                                        <span>
                                        	상품명
                                        	<input type="text" name="itemName" autocomplete='off' placeholder="상품명을 입력하세요." value="${sVO.itemName}">
                                        </span>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">판매상태</span>
                                    <div class="seller_view_edit_contents_search_item2">
                                        <input type="radio" id="all" name="itemState" value="0" ${sVO.itemState eq 0 and sVO.itemState eq '' ? 'checked' : '' }>
                                        <label for="all"><span>전체</span></label>
                                        <input type="radio" id="sale" class="restCheckBox" name="itemState" value="1" ${sVO.itemState eq 1 ? 'checked' : '' }>
                                        <label for="sale"><span>판매중</span></label>
                                        <input type="radio" id="waitSale" class="restCheckBox" name="itemState" value="2" ${sVO.itemState eq 2 ? 'checked' : '' }>
                                        <label for="waitSale"><span>판매대기</span></label>
                                        <input type="radio" id="stock" class="restCheckBox" name="itemState" value="3" ${sVO.itemState eq 3 ? 'checked' : '' }>
                                        <label for="stock"><span>품절</span></label>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">카테고리</span>
                                    <div class="seller_view_edit_contents_search_item3">
                                        <select id="largeCategory" name="largeCategory">
                                            <option value="0" ${sVO.largeCategory eq 0 ? 'selected' : '' }>전체</option>
                                            <option value="1" ${sVO.largeCategory eq 1 ? 'selected' : '' }>디지털/가전</option>
                                            <option value="2" ${sVO.largeCategory eq 2 ? 'selected' : '' }>인테리어</option>
                                            <option value="3" ${sVO.largeCategory eq 3 ? 'selected' : '' }>식품</option>
                                            <option value="4" ${sVO.largeCategory eq 4 ? 'selected' : '' }>의류</option>
                                            <option value="5" ${sVO.largeCategory eq 5 ? 'selected' : '' }>생활</option>
                                        </select>
                                        <select id="smallCategory" name="smallCategory">
                                            <option value="0" selected>전체</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">등록기간</span>
                                    <div class="seller_view_edit_contents_search_item4">
                                        <input type="date" id="startDate" name="sDate" value="${param.sDate}">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="eDate" value="${param.eDate}">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_view_edit_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_view_edit_contents_list">
                    	<c:choose>
							<c:when test="${empty itemList}">
								<div><span>상품목록 (총 0개)</span></div>
							</c:when>
							<c:otherwise>
								 <div><span>상품목록 (총 ${pageNav.totalRows}개)</span></div>
							</c:otherwise>
						</c:choose>
                       
                        <table class="seller_view_edit_contents_table">
                            <tr class="seller_view_edit_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>상품명</th>
                                <th>상품번호</th>
                                <th>판매상태</th>
                                <th>재고상태</th>
                                <th>판매가</th>
                                <th></th>
                            </tr>
								
							<c:choose>
								<c:when test="${empty itemList}">
									<tr><td colspan="7">등록된 상품이 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs" >
										<c:if test="${not empty itemList[vs.count-1]}"><!-- boardList에 저장된 데이터가 있는 경우 출력-->
											
											<tr>
				                                <td><span>${i}</span></td>
				                                <td class="seller_view_edit_contents_table_edit_btn">
				                                	<button type="button" class="editButton"><span>수정</span></button>
				                                	<input type="hidden" class="i_idx" value="${itemList[vs.count-1].i_idx}">
				                                </td>
				                                <td class="seller_view_edit_contents_table_product_name">
				                                	<a href="${pageContext.request.contextPath}/item/view.do?i_idx=${itemList[vs.count-1].i_idx}"><span>${itemList[vs.count-1].i_name}</span></a>
				                                </td>
				                                <c:set var="itemNumber" value="${itemList[vs.count-1].i_idx}" />
				                                <td><span>P<fmt:formatNumber type="custom" pattern="00000000" value="${itemNumber}" /></span></td>
				                                <c:set var="itemState" value="${itemList[vs.count-1].i_state}" />
												<td><span>
												    <c:choose>
												        <c:when test="${itemState eq 1}">판매중</c:when>
												        <c:when test="${itemState eq 2}">판매대기</c:when>
												        <c:when test="${itemState eq 3}">품절</c:when>
												    </c:choose>
												</span></td>
				                                <td><span>${itemList[vs.count-1].i_count}개</span></td>
				                                <td><span><fmt:formatNumber type="number" pattern="#,###" value="${itemList[vs.count-1].i_price}" />원</span></td>
				    							<td><button class="itemDelete" data-i_idx="${itemList[vs.count-1].i_idx}"><span>X</span></button><td>
				                            </tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
                        </table>
                    </div>
                    
					<c:if test="${not empty itemList}">
                        <div class="seller_contents_table_pasing" id="td_paging">
                        	<span><%@ include file="../../common/paging.jsp" %></span>
                        </div>
                    </c:if>
                    
                </div>
            </div>
            
        	<div class="stateList">
           		<div class="changeState" data-state="1"><span>판매중</span></div>
           		<div class="changeState" data-state="2"><span>판매대기</span></div>
           		<div class="changeState" data-state="3"><span>품절</span></div>
            </div>

        </section>

    </div>

	<script>
	
		$(document).ready(function() {		
			let i_idx = 0;
			
			$(".editButton").click(function() {
				var buttonPosition = $(this).offset();
				var topPosition = buttonPosition.top + $(this).outerHeight();
				i_idx = parseInt($(this).siblings(".i_idx").val(), 10);		
	
				$(".stateList").css({
					"position" : "absolute",
					"top" : topPosition + "px",
					"left" : buttonPosition.left + "px"
				}).toggle();
			});
	
			$(".changeState").click(function() {
				var i_state = $(this).data('state');
				var itemState = {"i_idx": i_idx, "i_state": i_state};												
				
				$.ajax({
					type: 'post',
					url: '${pageContext.request.contextPath}/seller/updateItemStateProcess.do',
					data: JSON.stringify(itemState),
					contentType: "application/json;charset=utf-8;",
					dataType: 'json',
					success: function (data) {
						if(data == 1){
							window.location.reload();
						}
					},
					error: function () {
						console.log("실패");
					}
				}); 
			});
			
		    $(".itemDelete").click(function() {
		        var i_idx = $(this).data('i_idx');
		        
		         $.ajax({
		            url: '${pageContext.request.contextPath}/item/deleteItemProcess.do',
		            type: 'POST',
		            data: { i_idx: i_idx },
		            success: function(data) {
		            	if(data == 1){
							window.location.reload();
		            	}
		            },
		            
		            error: function() {
		            	console.log("실패");
		            }
		        });
		    });

		});
	</script>

	<footer>
		<%@include file="../../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>