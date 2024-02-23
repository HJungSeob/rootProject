<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------------------- () <= 데이터로 값을 넘겨받을 자리 -------------------------------------->
<!------------------------------------- [] <= 스크립트로 값을 넘겨받을 자리 ------------------------------------->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>상품문의 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/inquiry_section.css">

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>

</head>

<body>
    <div class="wrap">
       
	  <%@include file="../common/header.jsp" %>

        <section>
        
            <div class="seller_global_section">
            
            	<%@include file="../common/navigation.jsp" %>

                <div class="seller_inquiry_contents">
                    <div class="seller_inquiry_contents_title">
                        <span>메인 > 문의/리뷰관리 > 상품 문의</span>
                    </div>

                    <div class="seller_inquiry_contents_search">
                        <form id="svec_search_form" method="" action="">
                            <div class="seller_inquiry_contents_search_box">
                                <div class="seller_inquiry_contents_search_items">
                                    <span class="seller_inquiry_contents_search_title">검색어</span>
                                    <div class="seller_inquiry_contents_search_item1">
                                        <span>상품번호<input type="text" name="productNum" autocomplete='off'
                                                placeholder="상품번호를 입력하세요."></span>
                                        <span>회원번호<input type="text" name="memberNum" autocomplete='off'
                                                placeholder="회원번호를 입력하세요."></span>
                                    </div>
                                </div>
                                <div class="seller_inquiry_contents_search_items">
                                    <span class="seller_inquiry_contents_search_title">판매상태</span>
                                    <div class="seller_inquiry_contents_search_item2">
                                        <input type="checkbox" id="all" name="status" value="1">
                                        <label for="all"><span>전체</span></label>
                                        <input type="checkbox" id="new" class="restCheckBox" name="status" value="2">
                                        <label for="new"><span>미처리 문의</span></label>
                                        <input type="checkbox" id="done" class="restCheckBox" name="status" value="3">
                                        <label for="done"><span>처리 문의</span></label>
                                    </div>
                                </div>
                                <div class="seller_inquiry_contents_search_items">
                                    <span class="seller_inquiry_contents_search_title">등록기간</span>
                                    <div class="seller_inquiry_contents_search_item4">
                                        <input type="date" id="startDate" name="startDate">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="endDate">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_inquiry_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_inquiry_contents_list">
                        <div><span>문의목록 (총 00개)</span></div>
                        <table class="seller_inquiry_contents_table">
                            <tr class="seller_inquiry_contents_table_title">
                                <th>구분</th>
                                <th>수정</th>
                                <th>작성일</th>
                                <th>문의명</th>
                                <th>상품번호</th>
                                <th>회원번호</th>
                            </tr>
                            <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고) -->
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td class="seller_inquiry_contents_table_edit_btn"><a href=""><span>수정</span></a></td>
                                <td><span>(0000.00.00)</span></td>
                                <td class="seller_inquiry_contents_table_product_name"><span>(문의명 자리입니다. 문의 제목 들어갑니다. 문의문의문의문의문의 이건 문의입니다.)</span></td>
                                <td><span>(P00000001)</span></td>
                                <td><span>(M00000001)</span></td>
                            </tr>

                        </table>
                    </div>

                     <!-- 페이징 기능 -->
                     <div class="seller_inquiry_contents_table_pasing"><a href="">1</a><a href="">2</a><a
                        href="">3</a><a href="">4</a></div>
                </div>
            </div>

        </section>

    </div>

</body>

</html>