<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>상품리뷰 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/review_section.css">

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>

</head>

<body>
    <div class="wrap">

        <%@include file="../common/header.jsp" %>

        <section>
            <div class="seller_global_section">
            
            	<%@include file="../common/navigation.jsp" %>

                <div class="seller_review_contents">
                    <div class="seller_review_contents_title">
                        <span>메인 > 문의/리뷰관리 > 상품 리뷰</span>
                    </div>

                    <div class="seller_review_contents_search">
                        <form>
                            <div class="seller_review_contents_search_box">
                            	<input type="hidden" name="s_idx" value="${seller.s_idx}">
                                <div class="seller_review_contents_search_items">
                                    <span class="seller_review_contents_search_title">검색어</span>
                                    <div class="seller_review_contents_search_item1">
                                        <span>상품번호<input type="text" name="itemNum" autocomplete='off' placeholder="상품번호를 입력하세요."  value="${sVO.itemNum}"></span>
                                        <span>닉네임<input type="text" name="buyerNickname" autocomplete='off' placeholder="닉네임을 입력하세요." value="${sVO.buyerNickname}"></span>
                                    </div>
                                </div>
                                <div class="seller_review_contents_search_items">
                                    <span class="seller_review_contents_search_title">등록기간</span>
                                    <div class="seller_review_contents_search_item3">
                                        <input type="date" id="startDate" name="sDate" value="${param.sDate}">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="eDate" value="${param.eDate}">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_review_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_review_contents_list">
                    	<c:choose>
							<c:when test="${empty reviewList}">
								<div><span>리뷰목록 (총 0개)</span></div>
							</c:when>
							<c:otherwise>
								 <div><span>리뷰목록 (총 ${pageNav.totalRows}개)</span></div>
							</c:otherwise>
						</c:choose>
						
                        <table class="seller_review_contents_table">
                            <tr class="seller_review_contents_table_title">
                                <th>구분</th>
                                <th>작성일</th>
                                <th>닉네임</th>
                                <th>리뷰</th>
                                <th>별점</th>
                                <th>상품번호</th>
                            </tr>
                            
							<c:choose>
								<c:when test="${empty reviewList}">
									<tr><td colspan="9">등록된 주문이 없습니다.</td></tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs" >
										<c:if test="${not empty reviewList[vs.count-1]}">
											
											<tr>
				                                <td><span>${i}</span></td>	
				                                <td><span>${reviewList[vs.count-1].br_postdate}</span></td>
				                                <td><span>${reviewList[vs.count-1].b_nickname}</span></td>
				                                <td class="seller_review_contents_table_product_name">
				                                	<a href=""><span>${reviewList[vs.count-1].br_content}</span></a>
				                                </td>
				                                <td><span>${reviewList[vs.count-1].br_star}점</span></td>
				                                 <c:set var="itemNumber" value="${reviewList[vs.count-1].i_idx}" />
				                                <td><span>P<fmt:formatNumber type="custom" pattern="00000000" value="${itemNumber}" /></span></td>
				                                <c:set var="reviewState" value="${reviewList[vs.count-1].br_cancel}" />
											</tr>
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
                        </table>
                    </div>

                    <c:if test="${not empty reviewList}">
                        <div class="seller_contents_table_pasing" id="td_paging">
                        	<span><%@ include file="../../common/paging.jsp" %></span>
                        </div>
                    </c:if>
                    
                </div>
            </div>

        </section>

    </div>

	<footer>
		<%@include file="../../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>