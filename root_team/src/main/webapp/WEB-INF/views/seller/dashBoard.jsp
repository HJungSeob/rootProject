<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.SellerVO" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>판매자 페이지</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/service/main_section.css">

    <script src="${pageContext.request.contextPath}/resources/js/seller/service/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/mainSection.js"></script>

</head>

<body>
    <div class="wrap">

	<%@include file="common/header.jsp" %>

        <section>
        
            <div class="seller_global_section">
            
            	<%@include file="common/navigation.jsp" %>

                <div class="seller_main_contents">
                    <div class="seller_main_contents_time">
                        <span></span>
                    </div>

                    <div class="seller_main_contents_top">
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>신규주문</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                            </div>
                            <div class="seller_main_contents_top_box_items">
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>배송준비</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>배송중</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>배송완료</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>환불요청</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>반품요청</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>교환요청</span>
                                <span><a href="">(0)</a> 건</span>
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>오늘정산</span>
                                <span><a href="">(123,456,789)</a> 원</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>정산예정</span>
                                <span><a href="">(123,456)</a> 원</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                            </div>
                        </div>
                    </div>

                    <div class="seller_main_contents_middle">
                        <div class="seller_main_contents_graph">
                            <div class="seller_main_contents_graph_title">
                                <span>매출액</span>
                                <div>
                                    <span>오늘 매출액</span>
                                    <span>₩ (12,345,678)</span>
                                </div>
                                <a href=""><span class="arrow_small"></span></a> <!-- 아이콘 눌렀을 때 ? ? ? 금록아 정해죵 -->
                            </div>

                            <div class="seller_main_contents_graph_box"></div>

                            <div class="seller_main_contents_graph_date"></div>
                        </div>

                        <div class="seller_main_contents_board">
                            <div>
                                <span>스토어 현황</span>
                            </div>
                            <table class="seller_main_contents_board_table">
                                <tr class="seller_main_contents_board_table_title">
                                    <th>일자</th>
                                    <th>주문수</th>
                                    <th>문의</th>
                                    <th>리뷰</th>
                                    <th>매출액</th>
                                </tr>
                                <!-- 나중에 데이터 받아올 때 for문으로 처리(게시판 참고) -->
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                                <tr>
                                    <td>(0000.00.00)</td>
                                    <td><a href="">(000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(0000)</a> 건</td>
                                    <td><a href="">(000,000)</a> 원</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="seller_main_contents_bottom">
                        <div class="seller_main_contents_bottom_summary">
                            <div class="seller_main_contents_bottom_summary_box">
                                <div class="seller_main_contents_bottom_summary_box_items">
                                    <div><span>상품</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>판매중</span><span><a href="">(0)</a> 건</span></div>
                                        <div><span>판매 대기</span><span><a href="">(0)</a> 건</span></div>
                                        <div><span>품절</span><span><a href="">(0)</a> 건</span></div>
                                    </div>
                                </div>
                                <div class="seller_main_contents_bottom_summary_box_items top">
                                    <div><span>패널티</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>수정 요청</span><span><a href="">(0)</a> 건</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="seller_main_contents_bottom_summary_box">
                                <div class="seller_main_contents_bottom_summary_box_items">
                                    <div><span>구매확정</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>구매확정</span><span><a href="">(0)</a> 건</span></div>
                                        <div><span>확정대기</span><span><a href="">(0)</a> 건</span></div>

                                    </div>
                                </div>
                                <div class="seller_main_contents_bottom_summary_box_items top">
                                    <div><span>찜</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>스토어찜(어제 누적)</span><span><a href="">(0)</a> 건</span></div>
                                        <div><span>상품찜(어제 누적)</span><span><a href="">(0)</a> 건</span></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- 이미지, 상품명은 데이터에서 값 받아올 예정 -->
                        <div class="seller_main_contents_bottom_inquiry">
                            <div class="seller_main_contents_bottom_inquiry_box">
                                <div class="seller_main_contents_bottom_inquiry_title">
                                    <span>상품리뷰</span>
                                    <a href=""><span class="arrow_small"></span></a>
                                </div>
                                <div class="seller_main_contents_bottom_inquiry_items">
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(이것은 상품명인데 어디까지
                                                보임?)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(상품명이 너무 길면
                                                잘려야지)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(진짜 개귀찮네 뭐 이런게 다
                                                있어)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(잘 잘려서
                                                다행이구나..............)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="seller_main_contents_bottom_inquiry_box">
                                <div class="seller_main_contents_bottom_inquiry_title">
                                    <span>상품문의</span>
                                    <a href=""><span class="arrow_small"></span></a>
                                </div>
                                <div class="seller_main_contents_bottom_inquiry_items">
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(이것은 상품명인데 어디까지
                                                보임?)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(상품명이 너무 길면
                                                잘려야지)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(진짜 개귀찮네 뭐 이런게 다
                                                있어)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">(잘 잘려서
                                                다행이구나..............)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
	</div>

	<footer>
		<%@include file="../buyer/common/global_footer.jsp"%>
	</footer>
</body>

</html>