<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/common/main_header.css">
<script src="${pageContext.request.contextPath}/resources/js/buyer/mainNavigation.js"></script>
</head>

            <nav>
                <div class="global_nav_bar">

                    <a href="${pageContext.request.contextPath}/index.do" class="global_nav_mainBtn logo">
                        <span></span>
                    </a>

                    <div class="global_nav_btns">
                        <div>
                            <button>
                                <span>디지털/가전</span>
                            </button>
                            <button>
                                <span>인테리어</span>
                            </button>
                            <button>
                                <span>식품</span>
                            </button>
                            <button>
                                <span>의류</span>
                            </button>
                            <button>
                                <span>생활</span>
                            </button>
                        </div>

                        <div class="global_nav_keywords"></div>

                        <div>
                            <button class="global_nav_serviceBtn search">
                                <span></span>
                            </button>
                            <button class="global_nav_serviceBtn cart">
                                <span></span>
                            </button>
                        </div>
                    </div>
                    
					<c:choose>
				      	<c:when test="${not empty buyer}">
				      	   	<a href="${pageContext.request.contextPath}/buyer/buyerServiceInfo.do?b_idx=${buyer.b_idx}" class="global_nav_infoBtn info">
                        		<span></span>
                   			</a>
				      	</c:when>
				      	<c:otherwise>				  	
				      	   	<a href="${pageContext.request.contextPath}/buyer/buyerLogin.do" class="global_nav_infoBtn info">
                        		<span></span>
                   			</a>			      	
				      	</c:otherwise>
				    </c:choose>
                    

                </div>
                <div class="global_nav_lists">
                    <div class="global_nav_listBox">
                         <div class="global_nav_list">
                            <div class="global_nav_categories">
                                <span>디지털/가전 살펴보기</span>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">휴대폰</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">영상가전</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">PC/게임</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">음향가전</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">생활가전</a></li>
                                </ul>
                            </div>
                            <div class="global_nav_categorieImg">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_01.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_02.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_03.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_04.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_05.jpg" alt="">
                            </div>
                        </div>
                        <div class="global_nav_list">
                            <div class="global_nav_categories">
                                <span>인테리어 살펴보기</span>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">수납</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">홈</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">거실</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">침구</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">침실가구</a></li>
                                </ul>
                            </div>
                            <div class="global_nav_categorieImg">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_06.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_07.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_08.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_09.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_10.jpg" alt="">
                            </div>
                        </div>
                        <div class="global_nav_list">
                            <div class="global_nav_categories">
                                <span>식품 살펴보기</span>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">농수산물</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">가공식품</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">제과제빵</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">음료</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">건강식품</a></li>
                                </ul>
                            </div>
                            <div class="global_nav_categorieImg">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_11.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_12.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_13.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_14.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_15.jpg" alt="">
                            </div>
                        </div>
                        <div class="global_nav_list">
                            <div class="global_nav_categories">
                                <span>의류 살펴보기</span>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">상의</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">하의</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">아우터</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">신발</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">이너웨어</a></li>
                                </ul>
                            </div>
                            <div class="global_nav_categorieImg">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_16.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_17.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_18.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_19.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_20.jpg" alt="">
                            </div>
                        </div>
                        <div class="global_nav_list">
                            <div class="global_nav_categories">
                                <span>생활 살펴보기</span>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">취미</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">잡화</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">주방</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">사무</a></li>
                                    <li><a href="${pageContext.request.contextPath}/item/list.do">공구</a></li>
                                </ul>
                            </div>
                            <div class="global_nav_categorieImg">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_21.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_22.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_23.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_24.jpg" alt="">
                                <img src="${pageContext.request.contextPath}/resources/css/img/nav/nav_cate_25.jpg" alt="">
                            </div>
                        </div>
                        <div class="global_nav_list">
                            <div class="global_nav_searchField">
                                <form action="">
                                    <label class="search">
                                        <input type="submit">
                                    </label>
                                    <input type="text" class="global_nav_searchBox" placeholder="root.com 검색하기">
                                </form>
                                <span>실시간 쇼핑 키워드</span>
                                <div class="global_nav_list_keywords">
                                    <ul>
                                        <li class="active"><span class="arrow_small"></span><a href="">키워드 입니다</a></li>
                                        <li><span class="arrow_small"></span><a href="">대충 컴퓨터 부품 중 존나 긴 일므 가진애</a></li>
                                        <li><span class="arrow_small"></span><a href="">주방용품중에 준내 긴이름 가진놈</a></li>
                                        <li><span class="arrow_small"></span><a href="">티비에 나오던 음식 재료</a></li>
                                        <li><span class="arrow_small"></span><a href="">몸에좋은 영양 간식</a></li>
                                        <li><span class="arrow_small"></span><a href="">키워드 입니다</a></li>
                                        <li><span class="arrow_small"></span><a href="">개비싼 강아지 사료</a></li>
                                        <li><span class="arrow_small"></span><a href="">마우스마우스마우스마우스마우스</a></li>
                                        <li><span class="arrow_small"></span><a href="">키보드키보드</a></li>
                                        <li><span class="arrow_small"></span><a href="">스피커커피스</a></li>
                                        <li><span class="arrow_small"></span><a href="">준내게 긴 키워드 입니다아아아아아아</a></li>
                                        <li><span class="arrow_small"></span><a href="">아아아아아아아아아아아아</a></li>
                                        <li><span class="arrow_small"></span><a href="">플레이스테이션5</a></li>
                                        <li><span class="arrow_small"></span><a href="">대충 기다란 문구</a></li>
                                        <li><span class="arrow_small"></span><a href="">키워드 적을게 없다</a></li>
                                        <li><span class="arrow_small"></span><a href="">키워드 입니다</a></li>
                                        <li><span class="arrow_small"></span><a href="">엄</a></li>
                                        <li><span class="arrow_small"></span><a href="">준</a></li>
                                        <li><span class="arrow_small"></span><a href="">식</a></li>
                                        <li><span class="arrow_small"></span><a href="">엄준식은 살아있다</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="global_nav_list global_nav_cartBox">
                            <div class="global_nav_cart">
                                <div class="global_nav_cartList">
                                    <h1>장바구니</h1>
                                    <div class="global_nav_cartItem">
                                        <a href="">
                                            <img src="" alt="">
                                            <span>i5 4670 GTX1060 3G 본체 27인치 모니터포함 게임용 블랙 조립컴퓨터 풀세트 PC</span>
                                        </a>
                                    </div>
                                    <div class="global_nav_cartItem">
                                        <a href="">
                                            <img src="" alt="">
                                            <span>미니컴퓨터 AMD Ryzen 데스크탑 게임용 컴퓨터 7 5800H 5700U 5500U 윈도우 11 미니 PC DDR4
                                                16GB 512GB SS</span>
                                        </a>
                                    </div>
                                    <div class="global_nav_cartItem">
                                        <a href="">
                                            <img src="" alt="">
                                            <span>i5-10400F 16GB RTX 3060 Ti 게이밍컴퓨터 조립PC</span>
                                        </a>
                                    </div>
                                </div>
                                <div class="global_nav_cartView">
                                    <a href=""><span>장바구니 확인</span></a>
                                    <span class="global_nav_itemCount">123개의 상품이 더 있습니다</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>