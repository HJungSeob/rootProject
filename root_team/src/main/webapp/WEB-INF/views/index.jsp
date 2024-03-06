<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>main</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/main_section.css">
    <script src="${pageContext.request.contextPath}/resources/js/buyer/main.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/mainSection.js"></script>
</head>

<body>
    <div class="wrap">
        <header>
            <div class="main_header_root_logo">
                <h1>ROOT STORE</h1>
            </div>
            <%@ include file="buyer/common/main_header.jsp" %>
        </header>
        <section>

            <div class="main_banner">
                <div class="main_banner_img_counting">
                    <span class="main_banner_img_count"></span>
                </div>
                <ul class="main_banner_imgs">
                    <li class="main_banner_img view">
                        <div>
                            <p>신백 선물하기<br>설 선물의 발견<br>프리미엄 그대로 명절 선물하고<br>스타벅스 아메리카노 응모하기</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_01.avif" alt="">
                    </li>
                    <li class="main_banner_img next">
                        <div>
                            <p>24년 설 명절<br>기프트 특선 기획<br>산지직송의 건강한 상품으로<br>따뜻한 마음을 선물하세요.</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_02.avif" alt="">
                    </li>
                    <li class="main_banner_img next_next">
                        <div>
                            <p>KIDS<br>명절&신학기선물<br>인기 키즈 코디,<br>신학기 책가방 까지!</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_03.avif" alt="">
                    </li>
                    <li class="main_banner_img next_next_next">
                        <div>
                            <p>슈슈앤크라<br>2024<br>spring collection</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_04.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>JJ지코트<br>24년 온라인전용 봄 신상<br>& 겨울 클리어런스 ~80%</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_05.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>캐주얼<br>클리어런스<br>FW 최종 클리어런스 할인전</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_06.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>럭셔리 뷰티<br>설 기프트 제안<br>갈색병 정품증정 세트 외<br>S머니 추가 및 신세계상품권 증정</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_07.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>로레알 뷰티<br>럭셔리 기프트<br>~15% + S머니 추가 할인<br>사은품 최대 증정 혜택</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_08.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>루이까또즈<br>브랜드위크<br>신년 신학기 특가~50%<br>BEST 핸드백/지갑/벨트</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_09.avif" alt="">
                    </li>
                    <li class="main_banner_img">
                        <div>
                            <p>금강제화<br>리갈, 클락스 外<br>~30% OFF+추가 쿠폰 혜택</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_10.avif" alt="">
                    </li>
                    <li class="main_banner_img prev_prev_perv">
                        <div>
                            <p>ROOT<br>HUGO런칭<br>HUGO피규어<br>& 카드 트레이 증정</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_11.avif" alt="">
                    </li>
                    <li class="main_banner_img prev_prev">
                        <div>
                            <p>나이키<br>UP TO 50%</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_12.avif" alt="">
                    </li>
                    <li class="main_banner_img prev">
                        <div>
                            <p>디올 NEW<br>아이코닉 립 글로우<br>#061 포피코랄</p>
                        </div>
                        <img src="${pageContext.request.contextPath}/resources/css/img/banner1/banner_13.avif" alt="">
                    </li>
                </ul>

                <div class="main_banner_btns">
                    <button class="main_banner_prev"><span></span></button>
                    <button class="main_banner_next"><span></span></button>
                    <button class="main_banner_next_next"><span></span></button>
                </div>
            </div>
            <h1 class="gallerys">Root Store. <span>원하는 제품을 <br>구입하는 가장 좋은 방법.</span></h1>
            <h1 class="gallery_name">Root의 소식. <span>따끈따끈한 새 이벤트들.</span></h1>
            <div class="gallery_box">
                <ul class="gallery active">
                <c:forEach var="index" begin="0" end="7">
                    <li class="gallery_li">
                        <a>
                            <img src="${pageContext.request.contextPath}/resources/css/img/banner2/banner2_01.jpg" alt="">
                        </a>
                    </li>
                </c:forEach>                   
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>
            <h1 class="gallery_name">디지털/가전</h1>
            <div class="gallery_box">
                <ul class="gallery active">
                	<c:forEach var="index" begin="0" end="7">
                       <li class="gallery_li">
	                       <a href="${pageContext.request.contextPath}/item/view.do?i_idx=${listA[index].i_idx}">	                        
                            <h2>${listA[index].i_name}</h2>
                            <img src="${pageContext.request.contextPath}/resources/uploads/${listA[index].i_saveimg0}" alt="">
                            <span>${listA[index].i_price}</span>
	                       </a>
                    	</li>
                    </c:forEach>                
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>

            <h1 class="gallery_name">인테리어</h1>
            <div class="gallery_box">
                <ul class="gallery active">
                    <c:forEach var="index" begin="0" end="7">
                       <li class="gallery_li">
	                        <a href="${pageContext.request.contextPath}/item/view.do?i_idx=${listB[index].i_idx}">
	                            <h2>${listB[index].i_name}</h2>
	                            <img src="${pageContext.request.contextPath}/resources/uploads/${listB[index].i_saveimg0}" alt="">
	                            <span>${listB[index].i_price}</span>
	                        </a>
                    	</li>
                    </c:forEach>
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>

            <h1 class="gallery_name">식품</h1>
            <div class="gallery_box">
                <ul class="gallery active">
                    <c:forEach var="index" begin="0" end="7">
                       <li class="gallery_li">
	                        <a href="${pageContext.request.contextPath}/item/view.do?i_idx=${listC[index].i_idx}">
	                            <h2>${listC[index].i_name}</h2>
	                            <img src="${pageContext.request.contextPath}/resources/uploads/${listC[index].i_saveimg0}" alt="">
	                            <span>${listC[index].i_price}</span>
	                        </a>
                    	</li>
                    </c:forEach>
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>

            <h1 class="gallery_name">의류</h1>
            <div class="gallery_box">
                <ul class="gallery active">
                    <c:forEach var="index" begin="0" end="7">
                       <li class="gallery_li">
	                        <a href="${pageContext.request.contextPath}/item/view.do?i_idx=${listD[index].i_idx}">
	                            <h2>${listD[index].i_name}</h2>
	                            <img src="${pageContext.request.contextPath}/resources/uploads/${listD[index].i_saveimg0}" alt="">
	                            <span>${listD[index].i_price}</span>
	                        </a>
                    	</li>
                    </c:forEach>
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>

            <h1 class="gallery_name">생활</h1>
            <div class="gallery_box">
                <ul class="gallery active">
                    <c:forEach var="index" begin="0" end="7">
                       <li class="gallery_li">
	                        <a href="${pageContext.request.contextPath}/item/view.do?i_idx=${listE[index].i_idx}">
	                            <h2>${listE[index].i_name}</h2>
	                            <img src="${pageContext.request.contextPath}/resources/uploads/${listE[index].i_saveimg0}" alt="">
	                            <span>${listE[index].i_price}</span>
	                        </a>
                    	</li>
                    </c:forEach>
                </ul>
                <div class="gallery_btns">
                    <button class="prev arrow_big active"></button>
                    <button class="next arrow_big active"></button>
                </div>
            </div>
        </section>
    </div>
    <footer>
            <%@ include file="buyer/common/global_footer.jsp" %>
        </footer>
</body>

</html>