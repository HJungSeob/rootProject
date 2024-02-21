<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------------------- () <= 데이터로 값을 넘겨받을 자리 -------------------------------------->
<!------------------------------------- [] <= 스크립트로 값을 넘겨받을 자리 ------------------------------------->
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

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>
    
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

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
                        <form id="svec_search_form" method="" action="">
                            <div class="seller_sales_contents_search_box">
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">검색어</span>
                                    <div class="seller_sales_contents_search_item1">
                                        <span>주문번호<input type="text" name="productNum" autocomplete='off'
                                                placeholder="주문번호를 입력하세요."></span>
                                        <span>회원번호<input type="text" name="productName" autocomplete='off'
                                                placeholder="회원번호를 입력하세요."></span>
                                    </div>
                                </div>
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">주문상태</span>
                                    <div class="seller_sales_contents_search_item2">
                                        <input type="checkbox" id="all" name="status" value="1">
                                        <label for="all"><span>전체</span></label>
                                        <input type="checkbox" id="refund" class="restCheckBox" name="status" value="2">
                                        <label for="refund"><span>환불</span></label>
                                        <input type="checkbox" id="exchange" class="restCheckBox" name="status"
                                            value="3">
                                        <label for="exchange"><span>교환</span></label>
                                        <input type="checkbox" id="return" class="restCheckBox" name="status" value="4">
                                        <label for="return"><span>반품</span></label>
                                    </div>
                                </div>
                                <div class="seller_sales_contents_search_items">
                                    <span class="seller_sales_contents_search_title">등록기간</span>
                                    <div class="seller_sales_contents_search_item3">
                                        <input type="date" id="startDate" name="startDate">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="endDate">
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
                        <div><span>주문목록 (총 00개)</span></div>
                        <table class="seller_sales_contents_table">
                            <tr class="seller_sales_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>회원번호</th>
                                <th>상품명</th>
                                <th>주문번호</th>
                                <th>주문상태</th>
                                <th>판매가</th>
                            </tr>
                            <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고) -->
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_sales_contents_table_edit_btn"><a href="#" id="editButton"><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td class="seller_sales_contents_table_product_name"><span>(이것은 상품명입니다!
                                    상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                    상품명이라구용!)</span></td>
                                <td><span>(20240205-00000001)</span></td>
                                <td><span>(반품)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                        </table>
                    </div>

                     <!-- 페이징 기능 -->
                     <div class="seller_sales_contents_table_pasing">
                     	<a href="">1</a>
                     	<a href="">2</a>
                     	<a href="">3</a>
                     	<a href="">4</a>
                     </div>
                </div>
                
            </div>
            
            <div id="select_list" class="seller_sales_option_box">
           		<div id="sl_refund" class="seller_sales_point"><span>환불</span></div>
           		<div id="sl_exchange" class="seller_sales_point"><span>교환</span></div>
           		<div id="sl_return" class="seller_sales_point"><span>반품</span></div>
            </div>

        </section>

    </div>

	<script>
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
	</script>

</body>

</html>