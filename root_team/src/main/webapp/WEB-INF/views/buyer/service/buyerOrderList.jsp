<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 목록 - Root</title>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/service/buyerOrderList.css">
</head>

<body>
    <div class="warp">
        <header>
<%@ include file="../../buyer/common/global_header.jsp"%>
        </header>
        <section>
            <div class="m_buyerOrderList_mainRegion">
                <div class="m_buyerOrderList_mainTitle">주문하신 제품.</div>
                <!-- #region 상품 내용 -->
                <div class="m_buyerOrderList_itemOneRegion">
                    <div class="_displayFlex">
                        <div class="m_buyerOrderList_orderTitle">주문 번호:</div>
                        <div class="m_buyerOrderList_orderTitle"><a href="">24353453</a></div>
                    </div>
                    <div class="_displayFlex">
                        <div class="m_buyerOrderList_orderTitle">주문 날짜:</div>
                        <div class="m_buyerOrderList_orderTitle lastmarginbottom">2024/01/01</div>
                    </div>
                    <div class="_hr"></div>
                    <div class="m_buyerOrderList_itemRegion _displayFlex">
                        <div class="m_buyerOrderList_itemTitle">배송될 품목</div>
                        <div class="m_buyerOrderList_itemInfo">
                            <div class="m_buyerOrderList_state">배송됨</div>
                            <div>
                                <div class="m_buyerOrderList_tragetBtn"><a href="">상세 보기</a></div>
                            </div>
                            <div class="_hr1"></div>
                            <div class="_displayFlex">
                                <img src="" alt="" class="m_buyerOrderList_itemImg">
                                <div class="m_buyerOrderList_itemInfo1">
                                    <div class="m_buyerOrderList_itemMainTitle">상품 이름</div>
                                    <div class="_hr1"></div>
                                    <div class="m_buyerOrderList_itemCount">수량 1</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="_hr"></div>
                </div>
                <!-- #endregion -->

            </div>
        </section>
    </div>
    <footer>
<%@ include file="../../buyer/common/global_footer.jsp"%>
    </footer>
</body>

</html>