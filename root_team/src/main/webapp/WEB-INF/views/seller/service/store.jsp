<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-------------------------------------- () <= 데이터로 값을 넘겨받을 자리 -------------------------------------->
<!------------------------------------- [] <= 스크립트로 값을 넘겨받을 자리 ------------------------------------->
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>스토어현황 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/store_section.css">

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/service.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/serviceSection.js"></script>

</head>

<body>
    <div class="wrap">
		<%@include file="../common/header.jsp" %>

        <section>
            <div class="seller_global_section">
            
            	<%@include file="../common/navigation.jsp" %>

                <div class="seller_store_contents">
                    <div class="seller_store_contents_title">
                        <span>메인 > 매장관리 > 스토어 현황</span>
                    </div>

                    <div class="seller_store_contents_search">
                        <form id="svec_search_form" method="" action="">
                            <div class="seller_store_contents_search_box">
                                <div class="seller_store_contents_search_items">
                                    <span class="seller_store_contents_search_title">조회기간</span>
                                    <div class="seller_store_contents_search_item1">
                                        <input type="date" id="startDate" name="startDate">
                                        <span> ~ </span>
                                        <input type="date" id="endDate" name="endDate">
                                    </div>
                                </div>
                            </div>

                            <div class="seller_store_contents_search_btns">
                                <div>
                                    <input type="submit" value="검색">
                                    <input type="reset" value="초기화">
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="seller_store_contents_list">
                        <div><span>조회목록 (총 00개)</span></div>
                        <table class="seller_store_contents_table">
                            <tr class="seller_store_contents_table_title">
                                <th>구분</th>
                                <th>일자</th>
                                <th>주문수</th>
                                <th>문의</th>
                                <th>리뷰</th>
                                <th>스토어찜</th>
                                <th>상품찜</th>
                                <th>수정 요청</th>
                                <th>매출액</th>
                            </tr>
                            <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고) -->
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                            <tr>
                                <td><span>(1)</span></td>
                                <td><span>(2024.02.07)</span></td>
                                <td><span><a href="">(152)</a> 건</span></td>
                                <td><span><a href="">(58)</a> 건</span></td>
                                <td><span><a href="">(73)</a> 건</span></td>
                                <td><span>(121) 건</span></td>
                                <td><span>(374) 건</span></td>
                                <td><span><a href="">(2)</a> 건</span></td>
                                <td><span><a href="">(1,567,000)</a> 원</span></td>
                            </tr>
                        </table>
                    </div>

                    <!-- 페이징 기능 -->
                    <div class="seller_store_contents_table_pasing"><a href="">1</a><a href="">2</a><a href="">3</a><a
                            href="">4</a></div>
                </div>
            </div>

        </section>

    </div>

</body>

</html>