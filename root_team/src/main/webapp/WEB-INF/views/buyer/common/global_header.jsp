<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/common/global_header.css">
<script src="${pageContext.request.contextPath}/resources/js/buyer/common/globalNavigation.js"></script>
	<script>
        $(function () {
        	const b_idx = $("#b_idx").val();
        	
        	 $("#cartBtn").click(function(){
             	
             	$(".global_nav_cartList").html("");
             	$(".global_nav_cartView").html("");
             	
            
            if (b_idx !== "") {
                $.ajax({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/cart/cartList.do",
                    data: {
                        b_idx: b_idx
                    },
                    success: function (data) { //서버로부터 수신 성공시 실행
                    	if(data[0]){
                    		$('.global_nav_cartList').append('<h1>장바구니</h1>');
                    	}else{
                    		$('.global_nav_cartList').append('<h1>장바구니가 비어 있습니다.</h1>');
                    	}
                        for (i = 0; i < 3; i++) {                        	
                            if (data[i]) {
                            	var price = parseInt(data[i].i_price);
                            	
                                var cartItem =
                                    $('<div class="global_nav_cartItem">' +
                                        '<a href="${pageContext.request.contextPath}/item/view.do?i_idx=' +
                                        data[i].i_idx + '">' +
                                        '<img src="${pageContext.request.contextPath}/resources/uploads/' +
                                        data[i].i_img + '" alt="상품이미지">' +
                                        '<div>' +
                                        '<span class="global_nav_itemName">' +
                                        data[i].i_name +
                                        '</span>' +
                                        '<span class="global_nav_itemOption">' +
                                        data[i].i_option +
                                        '</span>' +
                                        '<span class="global_nav_itemPrice">' +
                                        '₩ ' + price.toLocaleString() +
                                        '</span>' +
                                        '</div>' +
                                        '</a>' +
                                        '</div>');
                                
                                $('.global_nav_cartList').append(cartItem);                                                   
                            }
                        }

                        let cartNum = data.length;
                    	if(data.length>3){
                            cartNum -= 3;
                        }else{
                            cartNum = 0;
                        }
                        var cartOtherNum =
                        	$('<a href="${pageContext.request.contextPath}/cart/cart.do?b_idx=${buyer.b_idx}"><span>장바구니 확인</span></a>'+
                              '<span class="global_nav_itemCount">'+ 
                              cartNum +
                              '개의 상품이 더 있습니다.</span>');
                        $('.global_nav_cartView').append(cartOtherNum);
                    },
                    error: function (error) {}
                }); //end of ajax
            } else {
                var cartItem = $('<div class="global_nav_cartItem">'+ 
                		'<span class="global_nav_notLogin">저장해둔 항목이 있는지 확인하려면 '+
                		'<a class="global_nav_login" href="${pageContext.request.contextPath}/buyer/buyerLogin.do">로그인</a>' +
                		'하세요.</span></div>');
                $('.global_nav_cartList').append('<h1>장바구니가 비어 있습니다.</h1>');
                $('.global_nav_cartList').append(cartItem);
            }
        	 });
        });
    </script>	
</head>
<input type="hidden" id="b_idx" value="${buyer.b_idx}">
            <nav>
                <div class="global_nav_bar">

                    <a href="${pageContext.request.contextPath}/index.do" class="global_nav_mainBtn logo">
                        <span></span>
                    </a>

                    <div class="global_nav_btns">
                        <div>
                            <a href="${pageContext.request.contextPath}/item/list.do?p_idx=1" class="global_nav_btn">
                            	<span>디지털/가전</span>
                            </a>                         
                            <a href="${pageContext.request.contextPath}/item/list.do?p_idx=2" class="global_nav_btn">
                                <span>인테리어</span>
                            </a>                         
                            <a href="${pageContext.request.contextPath}/item/list.do?p_idx=3" class="global_nav_btn">
                                <span>식품</span>
                            </a>                         
                            <a href="${pageContext.request.contextPath}/item/list.do?p_idx=4" class="global_nav_btn">
                                <span>의류</span>
                            </a>                         
                            <a href="${pageContext.request.contextPath}/item/list.do?p_idx=5" class="global_nav_btn">
                                <span>생활</span>
                            </a>
                        </div>

                        <div class="global_nav_keywords"></div>

                        <div>
                            <button class="global_nav_serviceBtn search">
                                <span></span>
                            </button>
                            <button class="global_nav_serviceBtn cart" id="cartBtn">
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
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=1">휴대폰</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=2">영상가전</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=3">PC/게임</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=4">음향가전</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=5">생활가전</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=6">수납</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=7">홈</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=8">거실</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=9">침구</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=10">침실가구</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=11">농수산물</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=12">가공식품</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=13">제과제빵</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=14">음료</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=15">건강식품</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=16">상의</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=17">하의</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=18">아우터</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=19">신발</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=20">이너웨어</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=21">취미</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=22">잡화</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=23">주방</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=24">사무</a></li>
                        <li><a href="${pageContext.request.contextPath}/item/list.do?c_idx=25">공구</a></li>
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
                                <form action="${pageContext.request.contextPath}/item/list.do">
                                    <label class="search">
                                        <input type="submit">
                                    </label>
                                    <input type="text" class="global_nav_searchBox" name="searchWord" placeholder="root.com 검색하기">
                                </form>
                                <span>실시간 쇼핑 키워드</span>
                                <div class="global_nav_list_keywords">
                                    <ul>
                                        <li class="active"><span class="arrow_small"></span><a href="">의자</a></li>
			                            <li><span class="arrow_small"></span><a href="">원피스</a></li>
			                            <li><span class="arrow_small"></span><a href="">주방용품</a></li>
			                            <li><span class="arrow_small"></span><a href="">모니터</a></li>
			                            <li><span class="arrow_small"></span><a href="">키보드</a></li>
			                            <li><span class="arrow_small"></span><a href="">휴대폰케이스</a></li>
			                            <li><span class="arrow_small"></span><a href="">청소기</a></li>
			                            <li><span class="arrow_small"></span><a href="">TV</a></li>
			                            <li><span class="arrow_small"></span><a href="">노트북</a></li>
			                            <li><span class="arrow_small"></span><a href="">스피커</a></li>
			                            <li><span class="arrow_small"></span><a href="">블루투스이어폰</a></li>
			                            <li><span class="arrow_small"></span><a href="">냉장고</a></li>
			                            <li><span class="arrow_small"></span><a href="">플레이스테이션5</a></li>
			                            <li><span class="arrow_small"></span><a href="">세탁기</a></li>
			                            <li><span class="arrow_small"></span><a href="">닌텐도</a></li>
			                            <li><span class="arrow_small"></span><a href="">케이스</a></li>
			                            <li><span class="arrow_small"></span><a href="">소파</a></li>
			                            <li><span class="arrow_small"></span><a href="">식탁</a></li>
			                            <li><span class="arrow_small"></span><a href="">조명</a></li>
			                            <li><span class="arrow_small"></span><a href="">책상</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="global_nav_list global_nav_cartBox">
			                <div class="global_nav_cart">
			                    <div class="global_nav_cartList">                      
			                    </div>
			                    <div class="global_nav_cartView">                        
			                    </div>
			                </div>
			            </div>
                    </div>
                </div>
            </nav>