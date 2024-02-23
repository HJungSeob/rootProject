<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------------------- () <= 데이터로 값을 넘겨받을 자리 -------------------------------------->
<!------------------------------------- [] <= 스크립트로 값을 넘겨받을 자리 ------------------------------------->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>배송관리 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/delivery_section.css">

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>

</head>

<body>
    <div class="wrap">
    
      <%@include file="../common/header.jsp" %>

        <section>
        
            <div class="seller_global_section">
            
            	<%@include file="../common/navigation.jsp" %>
            	
                <div class="seller_delivery_contents">
                    <div class="seller_delivery_contents_title">
                        <span>메인 > 배송관리</span>
                    </div>

                    <div class="seller_delivery_contents_search">
                        <form id="svec_search_form" method="" action="">
                            <div class="seller_delivery_contents_search_box">
                                <div class="seller_delivery_contents_search_items">
                                    <span class="seller_delivery_contents_search_title">검색어</span>
                                    <div class="seller_delivery_contents_search_item1">
                                        <span>주문번호<input type="text" name="productNum" autocomplete='off'
                                                placeholder="주문번호를 입력하세요."></span>
                                        <span>송장번호<input type="text" name="productName" autocomplete='off'
                                                placeholder="송장번호를 입력하세요."></span>
                                    </div>
                                </div>
                                <div class="seller_delivery_contents_search_items">
                                    <span class="seller_delivery_contents_search_title">배송상태</span>
                                    <div class="seller_delivery_contents_search_item2">
                                        <input type="radio" id="all" name="status" value="1">
                                        <label for="all"><span>전체</span></label>
                                        <input type="radio" id="sale" name="status" value="2">
                                        <label for="sale"><span>배송준비</span></label>
                                        <input type="radio" id="waitSale" name="status"
                                            value="3">
                                        <label for="waitSale"><span>배송중</span></label>
                                        <input type="radio" id="stock" name="status" value="4">
                                        <label for="stock"><span>배송완료</span></label>
                                    </div>
                                </div>
                                <div class="seller_delivery_contents_search_items">
                                    <span class="seller_delivery_contents_search_title">배송기간</span>
                                    <div class="seller_delivery_contents_search_item3">
                                        <input type="date" id="startDate" name="startDate">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="endDate">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_delivery_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_delivery_contents_list">
                        <div><span>배송목록 (총 00개)</span></div>
                        <table class="seller_delivery_contents_table">
                            <tr class="seller_delivery_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>회원번호</th>
                                <th>상품번호</th>
                                <th>주문번호</th>
                                <th>송장번호</th>
                                <th>배송상태</th>
                            </tr>
                            <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고) -->
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_delivery_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(20240207-00000001)</span></td>
                                <td><span>(000-000-0000-0000)</span></td>
                                <td><span>(배송준비)</span></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 페이징 기능 -->
                    <div class="seller_delivery_contents_table_pasing"><a href="">1</a><a href="">2</a><a
                            href="">3</a><a href="">4</a></div>
                </div>
            </div>

        </section>

    </div>

</body>

</html>