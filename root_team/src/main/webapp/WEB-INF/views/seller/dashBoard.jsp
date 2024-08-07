<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.SellerVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/seller/service/mainSection.js"></script>

	<script>
		function getItem() {
			var s_idx = ${seller.s_idx};
			
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/seller/getItemProcess.do',
				data: {
					s_idx: s_idx
				},
				success: function (data) {
					let sellingItems = 0;
					let waitingItems = 0;
					let soldOutItems = 0;
					
					for(let i = 0; i<data.length; i++){
						if(data[i].i_state == 1) {
							sellingItems++;
						} else if(data[i].i_state == 2){
							waitingItems++;
						} else if(data[i].i_state == 3){
							soldOutItems++;
						}
					}
					$("#selling").text(sellingItems);
					$("#waiting").text(waitingItems);
					$("#soldOut").text(soldOutItems);
				},
				error: function () {
					console.log("실패");
				}
			});
		}
		
		function getOrder() {
			var s_idx = ${seller.s_idx};
			
			$.ajax({
				type: 'post',
				url: '${pageContext.request.contextPath}/seller/getOrderProcess.do',
				data: {
					s_idx: s_idx
				},
				success: function (data) {
					let order1 = 0;
					let order2 = 0;
					let order3 = 0;
					let order4 = 0;
					let order6 = 0;
					let order7 = 0;
					let order8 = 0;
					
					 for(let i = 0; i<data.length; i++) {
			                if (data[i].bos_state == 1) {
			                    order1++;
			                } else if (data[i].bos_state == 2) {
			                    order2++;
			                } else if (data[i].bos_state == 3) {
			                    order3++;
			                } else if (data[i].bos_state == 4) {
			                    order4++;
			                } else if (data[i].bos_state == 6) {
			                    order6++;
			                } else if (data[i].bos_state == 7) {
			                    order7++;
			                } else if (data[i].bos_state == 8) {
			                    order8++;
			                }
			            }
					
					$("#order1").text(order1);
					$("#order2").text(order2);
					$("#order3").text(order3);
					$("#order4").text(order4);
					$("#order6").text(order6);
					$("#order7").text(order7);
					$("#order8").text(order8);
				},
				
				error: function () {
					console.log("실패");
				}
			});
		}
	
		$(function () {
			getItem();
			getOrder();
		});
	</script>
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
                                <span><a href="" id="order1"></a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                            </div>
                            <div class="seller_main_contents_top_box_items">
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>배송준비</span>
                                <span><a href="" id="order2"></a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>배송중</span>
                                <span><a href="" id="order3"></a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>배송완료</span>
                                <span><a href="" id="order4"></a> 건</span>
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>환불요청</span>
                                <span><a href="" id="order6"></a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>반품요청</span>
                                <span><a href="" id="order7"></a> 건</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>교환요청</span>
                                <span><a href="" id="order8"></a> 건</span>
                            </div>
                        </div>
                        <div class="seller_main_contents_top_box">
                            <div class="seller_main_contents_top_box_items">
                                <span>오늘정산</span>
                                <span><a href="">1,589,000</a> 원</span>
                            </div>
                            <div class="seller_main_contents_top_box_items">
                                <span>정산예정</span>
                                <span><a href="">615,000</a> 원</span>
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
                                    <span>₩ 1,567,000</span>
                                </div>
                                <a href=""><span class="arrow_small"></span></a>
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
                                    <td>2024-03-15</td>
                                    <td><a href="">7</a> 건</td>
                                    <td><a href="">2</a> 건</td>
                                    <td><a href="">3</a> 건</td>
                                    <td><a href="">260,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-14</td>
                                    <td><a href="">7</a> 건</td>
                                    <td><a href="">2</a> 건</td>
                                    <td><a href="">3</a> 건</td>
                                    <td><a href="">260,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-13</td>
                                    <td><a href="">3</a> 건</td>
                                    <td><a href="">0</a> 건</td>
                                    <td><a href="">1</a> 건</td>
                                    <td><a href="">58,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-12</td>
                                    <td><a href="">12</a> 건</td>
                                    <td><a href="">5</a> 건</td>
                                    <td><a href="">0</a> 건</td>
                                    <td><a href="">1,290,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-11</td>
                                    <td><a href="">0</a> 건</td>
                                    <td><a href="">0</a> 건</td>
                                    <td><a href="">1</a> 건</td>
                                    <td><a href="">30,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-10</td>
                                    <td><a href="">6</a> 건</td>
                                    <td><a href="">3</a> 건</td>
                                    <td><a href="">7</a> 건</td>
                                    <td><a href="">2,930,000</a> 원</td>
                                </tr>
                                <tr>
                                    <td>2024-03-09</td>
                                    <td><a href="">15</a> 건</td>
                                    <td><a href="">1</a> 건</td>
                                    <td><a href="">0</a> 건</td>
                                    <td><a href="">3,547,000</a> 원</td>
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
                                        <div><span>판매중</span><span><a href="" id="selling"></a> 건</span></div>
                                        <div><span>판매 대기</span><span><a href="" id="waiting"></a> 건</span></div>
                                        <div><span>품절</span><span><a href="" id="soldOut"></a> 건</span></div>
                                    </div>
                                </div>
                                <div class="seller_main_contents_bottom_summary_box_items top">
                                    <div><span>패널티</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>수정 요청</span><span><a href="">3</a> 건</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="seller_main_contents_bottom_summary_box">
                                <div class="seller_main_contents_bottom_summary_box_items">
                                    <div><span>구매확정</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>구매확정</span><span><a href="">9</a> 건</span></div>
                                        <div><span>확정대기</span><span><a href="">3</a> 건</span></div>

                                    </div>
                                </div>
                                <div class="seller_main_contents_bottom_summary_box_items top">
                                    <div><span>찜</span></div>
                                    <div class="seller_main_contents_bottom_summary_box_item">
                                        <div><span>스토어찜(어제 누적)</span><span><a href="">15</a> 건</span></div>
                                        <div><span>상품찜(어제 누적)</span><span><a href="">29</a> 건</span></div>
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
                                            <span class="seller_main_contents_bottom_inquiry_item">TAOMI 삼성 갤럭시 핏2 스트랩 스포츠 루프 밴드, 블랙</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">LG Y110 폴더폰 공기계 공신폰, B급</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">베루스 맥세이프 크리스탈믹스 마그네틱 휴대폰 케이스</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">삼성전자 갤럭시 A25 자급제 SM-A256N, 라이트 블루, 128GB</span>
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
                                            <span class="seller_main_contents_bottom_inquiry_item">NFC유심-KT skylife모바일 유심비지원 사은품 알뜰폰 자급제 LTE/5G 갤럭시/Z플립/아</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">삼성전자 갤럭시탭 S6 LITE 10.4, Wi-Fi, 64GB, 옥스포드</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">[맛통령] 베니하루카 꿀고구마 호박고구마, 꿀고구마 (중)</span>
                                            <span class="arrow_small"></span>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="">
                                            <img src="">
                                            <span class="seller_main_contents_bottom_inquiry_item">삼성 갤럭시탭A 10.5 WIFI 32G 블루 SM-T590 태블릿PC</span>
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