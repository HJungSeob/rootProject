<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문 내역 - Root</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/service/buyerOrderView.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/service/buyerOrderView.js"></script>
</head>

<body>
    <div class="warp">
        <header>
<%@ include file="../../buyer/common/global_header.jsp"%>
        </header>
        <section>
            <div class="m_buyerOrderView_sectionRegion">
                <div class="m_buyerOrderView_sectionTitle">주문해 주셔서 감사합니다.</div>
                <div class="m_buyerOrderView_sectionSubTitle">주문에 대한 업데이트와 함께 알려드리겠습니다.</div>
                <div class="m_buyerOrderView_orderDate">2024.01.01 주문</div>
                <div class="m_buyerOrderView_orderNumber">주문번호 435345353534</div>
                <div class="_hr"></div>
                <div class="m_buyerOrderView_itemTitle">상품이름</div>
                <div class="m_buyerOrderView_optionRegion">
                    <div class="_displayFlex">
                        <div class="m_buyerOrderView_optionTitle">상품 옵션</div>
                        <div class="m_buyerOrderView_optionName">옵션명</div>
                    </div>
                </div>
                <div class="_displayFlex">
                    <img src="" alt="" class="m_buyerOrderView_itemImg">
                    <div class="m_buyerOrderView_itemRegion">
                        <div class="m_buyerOrderView_status" id="status">배송완료</div>
                        <div class="m_buyerOrderView_statusBarRegion">
                            <div class="m_buyerOrderView_statusBarDefault"></div>
                            <div class="m_buyerOrderView_statusBar" id="statusBar"></div>
                        </div>
                        <div class="m_buyerOrderView_statuss _displayFlex">
                            <div class="m_buyerOrderView_statusle" id="statusle1">결제완료</div>
                            <div class="m_buyerOrderView_statusle" id="statusle2">배송준비</div>
                            <div class="m_buyerOrderView_statusle" id="statusle3">배송중</div>
                            <div class="m_buyerOrderView_statusle" id="statusle4">배송완료</div>
                        </div>
                        <div class="m_buyerOrderView_totalCount">3 개</div>
                        <div class="m_buyerOrderView_totalPrice">18,000 원</div>
                        <label>
                            <div class="m_buyerOrderView_reviewRegion _displayFlex" id="review">
                                <a href="" class="m_buyerOrderView_review">리뷰 작성하기</a>
                                <div class="arrow_small"></div>
                            </div>
                        </label>
                    </div>
                </div>
                <div class="_hr"></div>
                <div class="m_buyerOrderView_titleName">받는사람 정보</div>
                <div class="_hrStrong"></div>
                <div class="_displayFlex">
                    <div class="m_buyerOrderView_addressTitle">받는사람</div>
                    <div class="m_buyerOrderView_addressName">이름</div>
                </div>
                <div class="_displayFlex">
                    <div class="m_buyerOrderView_addressTitle">연락처</div>
                    <div class="m_buyerOrderView_addressName">전화번호</div>
                </div>
                <div class="_displayFlex">
                    <div class="m_buyerOrderView_addressTitle">받는주소</div>
                    <div class="m_buyerOrderView_addressName">(23445) 모든주소</div>
                </div>
                <div class="_hr"></div>
                <div class="m_buyerOrderView_titleName">결제 정보</div>
                <div class="_hrStrong"></div>
                <div class="m_buyerOrderView_addressName">결제수단</div>
                <div class="m_buyerOrderView_addressName">은행</div>
                <div class="_displayFlex">
                    <div class="m_buyerOrderView_addressTitle _bold">총 결제 금액</div>
                    <div class="m_buyerOrderView_addressName _bold">23434 원</div>
                </div>
                <div class="_hr"></div>
                <div class="m_buyerOrderView_lastBtnRegion">
                    <a href="" class="m_buyerOrdrView_returnPage">주문목록 돌아가기</a>
                    <div class="m_buyerOrdrView_cancelBtn">주문내역 삭제</div>
                </div>
            </div>
        </section>
    </div>
    <footer>
<%@ include file="../../buyer/common/global_footer.jsp"%>
    </footer>
</body>

</html>