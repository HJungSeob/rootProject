<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------------------- () <= 데이터로 값을 넘겨받을 자리 -------------------------------------->
<!------------------------------------- [] <= 스크립트로 값을 넘겨받을 자리 ------------------------------------->
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
                        <form id="svec_search_form" method="" action="">
                            <div class="seller_view_edit_contents_search_box">
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">검색어</span>
                                    <div class="seller_view_edit_contents_search_item1">
                                        <span>상품번호<input type="text" name="productNum" autocomplete='off'
                                                placeholder="상품번호를 입력하세요."></span>
                                        <span>상품명<input type="text" name="productName" autocomplete='off'
                                                placeholder="상품명을 입력하세요."></span>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">판매상태</span>
                                    <div class="seller_view_edit_contents_search_item2">
                                        <input type="radio" id="all" name="status" value="1">
                                        <label for="all"><span>전체</span></label>
                                        <input type="radio" id="sale" class="restCheckBox" name="status" value="2">
                                        <label for="sale"><span>판매중</span></label>
                                        <input type="radio" id="waitSale" class="restCheckBox" name="status"
                                            value="3">
                                        <label for="waitSale"><span>판매대기</span></label>
                                        <input type="radio" id="stock" class="restCheckBox" name="status" value="4">
                                        <label for="stock"><span>품절</span></label>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">카테고리</span>
                                    <div class="seller_view_edit_contents_search_item3">
                                        <select id="largeCategory" name="largeCategory">
                                            <option selected disabled hidden>대분류
                                            </option>
                                            <option value="z">전체</option>
                                            <option value="a">디지털/가전</option>
                                            <option value="b">인테리어</option>
                                            <option value="c">식품</option>
                                            <option value="d">의류</option>
                                            <option value="e">생활</option>
                                        </select>
                                        <select id="smallCategory" name="samllCategory">
                                            <option selected disabled hidden>중분류
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="seller_view_edit_contents_search_items">
                                    <span class="seller_view_edit_contents_search_title">등록기간</span>
                                    <div class="seller_view_edit_contents_search_item4">
                                        <input type="date" id="startDate" name="startDate">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="endDate">
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
                        <div><span>상품목록 (총 00개)</span></div>
                        <table class="seller_view_edit_contents_table">
                            <tr class="seller_view_edit_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>상품명</th>
                                <th>상품번호</th>
                                <th>판매상태</th>
                                <th>재고상태</th>
                                <th>판매가</th>
                            </tr>
                            <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고)
                            	이거를 싹 다 긁어서 -->
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_view_edit_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td class="seller_view_edit_contents_table_product_name"><a href=""><span>(이것은 상품명입니다!
                                            상품명이라구용! 이것은 상품명입니다! 상품명이라구용! 이것은 상품명입니다!
                                            상품명이라구용!)</span></a></td>
                                <td><span>(E00000001)</span></td>
                                <td><span>(품절)</span></td>
                                <td><span>(0)</span></td>
                                <td><span>(123,456) 원</span></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 페이징 기능 -->
                    <div class="seller_view_edit_contents_table_pasing"><a href="">1</a><a href="">2</a><a
                            href="">3</a><a href="">4</a></div>
                </div>
            </div>

        </section>

    </div>

</body>

</html>