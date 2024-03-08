<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(function () {
            
            	var m_l_view_option_count = $('.m_l_view_option').length;         
                var i_idx = $("#i_idx").val();
                var i_name = $("#i_name").text();
                var i_img = $("#i_img").val();
                var i_price;
                var i_option;
                var b_idx;
                
               $("#getCart").click(function () {

                i_option = $('.m_l_view_getitem .m_l_view_checkedoption').text(); 
                i_price = $("#i_price").val();
                
                if ($("#b_idx").val() != "") {
                    var b_idx = $("#b_idx").val();
                }else{
                    if(confirm("로그인이 필요한 서비스 입니다. 로그인 페이지로 이동하시겠습니까?")){
                    	window.location.href = "${pageContext.request.contextPath}/buyer/buyerLogin.do";                    	
                    }
                    return false;
                }
 
                if (m_l_view_option_count !== i_option.split(',').length) {
                    alert('모든 옵션을 선택해 주세요.');
                    return false;
                }
                
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/cart/insertCart.do",
                    data: {
                        b_idx: b_idx,
                        i_idx: i_idx,
                        i_name: i_name,
                        i_img: i_img,
                        i_option: i_option,
                        i_price: i_price
                    },
                    success: function (data) {
                    	if(data == 0){
                    		alert("장바구니에 동일한 상품이 존재합니다.");
                    	}else{
	                        if(confirm("장바구니에 상품이 추가되었습니다. 장바구니로 이동하시겠습니까?")){
	                        	window.location.href = "${pageContext.request.contextPath}/cart/cart.do?b_idx=" + b_idx;
	                        }
                    	}
                    },
                    error: function (xhr, status, error) {
                        alert("장바구니에 상품을 추가하는데 실패했습니다.");
                    }
                });
            });

            $("#getLikeItem").click(function () {

                i_option = $('.m_l_view_getitem .m_l_view_checkedoption').text(); 
                i_price = $("#i_price").val();
                
                
                if ($("#b_idx").val() != "") {
                    var b_idx = $("#b_idx").val();
                }else{
                	if(confirm("로그인이 필요한 서비스 입니다. 로그인 페이지로 이동하시겠습니까?")){
                    	window.location.href = "${pageContext.request.contextPath}/buyer/buyerLogin.do";                    	
                    }
                    return false;
                }
 
                if (m_l_view_option_count !== i_option.split(',').length) {
                    alert('모든 옵션을 선택해 주세요.');
                    return false;
                }

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/buyer2/likeItem.do",
                    data: {
                    	b_idx: b_idx,
                        i_idx: i_idx,
                        i_name: i_name,
                        i_img: i_img,
                        i_option: i_option,
                        i_price: i_price
                    },
                    success: function (data) {
                        alert("관심목록에 상품이 추가되었습니다.");
                    },
                    error: function (xhr, status, error) {
                        alert("관심목록에 상품을 추가하는데 실패했습니다.");
                    }
                });
            });
        });


        $(function () {

            $('.m_l_view_itemimg_btn button').click(function () {

                var className = $(this).attr('class');

                $('.m_l_view_itemimg_box img').hide();

                $('.m_l_view_itemimg_box .' + className).show();

                $(".m_l_view_itemimg_btn button").css({
                    'border': '2px solid #F9F9F9'
                });
                $(this).css({
                    'border': '2px solid black'
                });
            });

            $(".m_l_view_option input[type='radio']").change(function () {
                // 선택된 옵션 값을 담을 배열을 초기화합니다.
                var selectedValues = [];
                // 각 옵션마다 선택된 값을 배열에 추가합니다.
                $(".m_l_view_option input[type='radio']:checked").each(function () {
                    selectedValues.push($(this).val());
                });
                // 배열에 있는 값을 쉼표로 구분하여 버튼에 표시합니다.
                $(".m_l_view_checkedoption").text(selectedValues.join(", "));
                // 현재 선택된 m_l_view_option 박스의 다음 형제 요소를 찾습니다.
                var nextOptionBox = $(this).closest(".m_l_view_option").next(".m_l_view_option");
                // 다음 옵션 박스가 있는 경우
                if (nextOptionBox.length > 0) {
                    // 현재 스크롤 위치에서 다음 옵션 박스의 상대적 위치를 계산합니다.
                    var scrollTop = $('.m_l_view_itemoption_box').scrollTop() + nextOptionBox.position()
                        .top;
                    // 다음 옵션 박스로 이동합니다.
                    $('.m_l_view_itemoption_box').animate({
                        scrollTop: scrollTop
                    }, 500);
                }
                $(".m_l_view_firstoption").prop('disabled', false);
                $(".m_l_view_firstoption").removeClass("hide");
            });

            $(".m_l_view_firstoption").click(function () {
                $(".m_l_view_option input[type='radio']").prop('checked', false);
                $(".m_l_view_firstoption").prop('disabled', true);
                $('.m_l_view_itemoption_box').animate({
                    scrollTop: 0
                }, 500);
                $(".m_l_view_checkedoption").text("");
                $(".m_l_view_firstoption").addClass("hide");
            });

            $('.m_l_view_itemimg_btn button:first').trigger('click');

            $(".m_l_view_btn_itemexplain").click(function () {
                $('html, body').animate({
                    scrollTop: $(".m_l_view_itemexplain").offset().top - 50
                }, 300);
            });

            $(".m_l_view_btn_review").click(function () {
                $('html, body').animate({
                    scrollTop: $(".m_l_view_itemreview").offset().top - 50
                }, 300);
            });

            $(".m_l_view_btn_QandA").click(function () {
                $('html, body').animate({
                    scrollTop: $(".m_l_view_itemQandA").offset().top - 50
                }, 300);
            });

            $(".m_l_view_btn_sellerinfo").click(function () {
                $('html, body').animate({
                    scrollTop: $(".m_l_view_itemsellerinfo").offset().top - 50
                }, 300);
            });

            var boxOffsetTop = $('.m_l_view_btn_box').offset().top;
            $(window).scroll(function () {
                var scrollTop = $(window).scrollTop();
                if (scrollTop > boxOffsetTop) {
                    $('.m_l_view_btn_box').addClass('fixed');
                } else {
                    $('.m_l_view_btn_box').removeClass('fixed');
                }
            });

        });

        $(window).scroll(function () {
            var scrollDistance = $(window).scrollTop();
            $('.page-section').each(function (i) {
                if ($(this).position().top <= scrollDistance + 51) {
                    $('.m_l_view_btn_box button.active').removeClass('active');
                    $('.m_l_view_btn_box button').eq(i).addClass('active');
                }
            });
        }).scroll();
    </script>

    <style>
        section {
            box-sizing: border-box;
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        .m_l_view_stick {
            color: lightgray;
        }

        .arrow_small {
            width: 18px;
            height: 18px;
            background-size: 18px;
            rotate: -90deg;
            vertical-align: top;
            filter: invert(0%) sepia(1%) saturate(2514%) hue-rotate(223deg) brightness(0%) contrast(87%);
        }

        .m_l_view_category_link {
            font-weight: bold;
            font-size: 14px;
            color: #444444;
            transition: color 0.3s;
        }

        .m_l_view_category_link:hover {
            color: #111111;
        }

        .m_l_view_star_box {
            display: inline-block;
            margin: 10px 0 5px;
            height: 17px;
            width: 89px;
        }

        .m_l_view_star {
            position: relative;
            display: block;
            height: 17px;
            background-repeat: no-repeat;
        }

        .m_l_view_star.full {
            bottom: 17px;
            width: 50%;
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -245px;
        }

        .m_l_view_star.empty {
            width: 100%;
            background-image: url(../resources/css/img/star2.png);
            background-position: 0 -270px;
            opacity: 0.5;
        }

        label[for="m_l_view_btn_review"] {
            box-sizing: border-box;
            display: inline-block;
            font-size: 10px;
            border: 0;
            background-color: transparent;
            padding: 9px 0;
            vertical-align: bottom;
            cursor: pointer;
        }

        .m_l_view_storename {
            display: block;
            color: #444444;
        }

        .m_l_view_item_title {
            display: block;
            font-size: 32px;
            font-weight: bold;
        }

        .m_l_view_itemsimpleinfo {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }

        .m_l_view_itemimg {
            height: 700px;
        }

        .m_l_view_itemimg_box {
            width: 600px;
            height: 600px;

        }

        .m_l_view_itemimg_box img {
            width: 600px;
            height: 600px;
            border-radius: 10px;
            position: absolute;
        }

        .m_l_view_itemimg_btn {
            width: 600px;
            height: 64px;
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .m_l_view_itemimg_btn button {
            width: 64px;
            height: 64px;
            border: 2px solid #F9F9F9;
            border-radius: 10px;
            margin: 0 5px;
            cursor: pointer;
            overflow: hidden;
            transition: border 0.3s;
        }

        .m_l_view_itemimg_btn button img {
            width: 100%;
            height: 100%;
        }

        .m_l_view_itemoption {
            box-sizing: border-box;
            width: 360px;
            padding: 0 20px;
        }

        .m_l_view_itemprice_box {
            box-sizing: border-box;
            height: 45px;
            border-bottom: 1px solid gray;
        }

        .m_l_view_itemprice {
            font-size: 28px;
        }

        .m_l_view_firstoption {
            position: relative;
            width: 320px;
            height: 50px;
            z-index: 5;
            border: 1px solid lightgray;
            border-top: 0;
            background-color: white;
            transition: opacity 0.3s;
            cursor: pointer;
        }

        .m_l_view_checkedoption {
            color: black;
            font-size: 16px;
        }

        .m_l_view_firstoption .reset {
            color: gray;
            font-size: 10px;
        }

        .m_l_view_firstoption.hide {
            opacity: 0;
            cursor: default;
        }

        .m_l_view_itemoption_box {
            position: relative;
            width: 320px;
            height: 515px;
            padding: 20px 0;
            overflow: hidden;
            margin-top: -50px;
        }

        .m_l_view_option {
            height: 515px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .m_l_view_option h4 {
            font-size: 16px;
            margin-left: 10px;
            margin-top: -28px;
        }

        .m_l_view_option input[type="radio"] {
            display: none;
        }

        .m_l_view_option label {
            box-sizing: border-box;
            background-color: white;
            color: gray;
            display: block;
            width: 300px;
            padding: 20px 15px;
            border: 1px solid gray;
            outline: 1px solid transparent;
            border-radius: 10px;
            transition: border 0.3s, outline 0.3s, color 0.3s;
            font-weight: bold;
            cursor: pointer;
            margin: 5px auto;
        }

        .m_l_view_option input[type="radio"]:checked+label {
            color: black;
            border: 1px solid #0071E3;
            outline: 1px solid #0071E3;
        }

        .m_l_view_getitem_box {
            width: 100%;
            height: 315px;
            position: absolute;
            left: 0;
            background-color: #E7E7E7;
        }

        .m_l_view_getitem {
            box-sizing: border-box;
            position: absolute;
            padding: 42px 0;
            width: 960px;
            height: 315px;
        }
        
        .m_l_view_getitem .m_l_view_checkedoption{
        	font-size:12px;
        	color: gray;
        }

        .m_l_view_getitem_itemname {
            font-size: 20px;
        }

        .m_l_view_getitem_itemprice {
            display: block;
            font-size: 20px;
            font-weight: bold;
            margin: 20px 0 45px;
        }

        .m_l_view_getitem_cart {
            margin-top: -22px;
            font-size: 14px;
            display: block;
            width: 160px;
            height: 40px;
            color: white;
            border: 0;
            background-color: #0071E3;
            text-align: center;
            border-radius: 10px;
            float: right;
        }

        .m_l_view_getitem_cart span {
            line-height: 40px;
        }

        .m_l_view_getitem_save {
            border: 0;
            background-color: transparent;
            cursor: pointer;
            color: #0071E3;
            margin-bottom: 20px;
        }

        .m_l_view_getitem_span {
            display: block;
            font-size: 14px;
            margin: 0 0 10px;
        }

        .m_l_view_dummy {
            height: 365px;
        }

        .m_l_view_itemdetail {
            margin-left: -20px;
        }

        .m_l_view_btn {
            height: 50px
        }

        .m_l_view_btn_box {
            width: 1000px;
            height: 50px;
            font-size: 0;
            display: flex;
            justify-content: center;
            background-color: white;
            top: 0;
            z-index: 10;
        }

        .m_l_view_btn_box.fixed {
            position: fixed;
        }

        .m_l_view_btn_box button {
            box-sizing: border-box;
            width: 250px;
            height: 50px;
            vertical-align: top;
            background-color: #f9f9f9;
            border: 0;
            border-bottom: 1px solid lightgray;
            font-weight: bold;
            transition: background-color 0.3s, color 0.3s;
            cursor: pointer;
        }

        .m_l_view_btn_box button.active {
            background-color: white;
            border: 1px solid lightgray;
            border-bottom: 0;
        }

        .page-section {
            box-sizing: border-box;
            padding: 20px;
            background-color: white;
            width: 1000px;
        }

        .m_l_view_itemexplain {
            border-left: 1px solid lightgray;
            border-right: 1px solid lightgray;

        }

        .m_l_view_itemexplain img {
            width: 100%;
        }

        .m_l_view_itemreview {
            height: 1200px;
            border-left: 1px solid lightgray;
            border-right: 1px solid lightgray;
            background-color: white;
        }

        .m_l_view_itemreview h2 {
            padding: 20px 0 20px;
        }

        .m_l_view_simplereview {
            display: flex;
            text-align: center;
            margin: 0 0 20px;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }

        .m_l_view_simple_stars {
            box-sizing: border-box;
            width: 400px;
            height: 200px;
            margin: 20px 0;
            padding: 30px;
            border-right: 1px solid lightgray;
        }

        .m_l_view_simple_stars h3 {
            margin-bottom: 10px;
        }

        .m_l_view_simple_stars h1 {
            font-size: 35px;
            margin-bottom: 10px;
        }

        .m_l_view_simple_star_box {
            display: block;
            margin: 0 auto 10px;
            height: 30px;
            width: 166px;
        }

        .m_l_view_simple_star {
            position: relative;
            display: block;
            height: 100%;
            background-repeat: no-repeat;
        }

        .m_l_view_simple_star.full {
            bottom: 30px;
            width: 50%;
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -106px;
        }

        .m_l_view_simple_star.empty {
            width: 100%;
            background-image: url(../resources/css/img/star2.png);
            background-position: 0 -145px;
            opacity: 0.5;
        }

        .m_l_view_simple_statistics {
            box-sizing: border-box;
            flex: 1;
            margin: 20px 0;
        }

        .m_l_view_simple_statistics li {
            display: block;
            padding: 18px 0 0;
        }

        .m_l_view_simple_statistics li .num {
            color: gray;
            font-size: 14px;
        }

        .m_l_view_simple_statistics li div {
            display: inline-block;
            width: 250px;
            height: 18px;
            border-radius: 9px;
            background-color: rgba(211, 211, 211, 0.3);
            vertical-align: top;
            text-align: left;
        }

        .m_l_view_simple_statistics li div>span {
            display: inline-block;
            width: 50%;
            height: 18px;
            border-radius: 9px;
            background-color: #0071E399;
        }

        .m_l_view_simple_statistics li .percent {
            color: #0071E3;
            font-size: 14px;
        }

        .m_l_view_review_search {
            padding: 30px;
            border-top: 1px solid lightgray;
            border-bottom: 1px solid lightgray;
        }

        .m_l_view_review_search input[type="radio"] {
            display: inline-block;
            vertical-align: top;
            margin-top: 3px;
        }

        .m_l_view_review_search span {
            font-size: 14px;
        }

        .m_l_view_review_search label {
            display: inline-block;
            margin: 0 10px 10px;
            height: 17px;
            vertical-align: top;
        }

        .m_l_view_review_search input[type="submit"] {
            display: none;
        }

        label[for="search_submit"] .search {
            filter: invert(0%) sepia(100%) saturate(5%) hue-rotate(145deg) brightness(0%) contrast(100%);
        }

        .m_l_view_review_search input[type="text"] {
            margin: 0 10px 10px;
        }



        .m_l_view_starorder {
            position: relative;
            display: inline-block;
            height: 17px;
            background-repeat: no-repeat;
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -245px;
        }

        label[for="star5"] .m_l_view_starorder {
            width: 88px;
        }

        label[for="star4"] .m_l_view_starorder {
            width: 71px;
        }

        label[for="star3"] .m_l_view_starorder {
            width: 52px;
        }

        label[for="star2"] .m_l_view_starorder {
            width: 34px;
        }

        label[for="star1"] .m_l_view_starorder {
            width: 17px;
        }


        .m_l_view_itemQandA {
            height: 1200px;
            border-left: 1px solid lightgray;
            border-right: 1px solid lightgray;
            background-color: rgb(67, 142, 255);
        }

        .m_l_view_itemsellerinfo {
            height: 1200px;
            border: 1px solid lightgray;
            border-top: 0 solid lightgray;
            background-color: rgb(255, 176, 103);
        }

        /* ---------------------------------------------- */
    </style>
</head>

<body>
    <div class="wrap">
        <header>
            <%@ include file="../common/global_header.jsp"%>
        </header>
        <section>
            <input type="hidden" id="i_idx" value="${item.i_idx}">
            <input type="hidden" id="b_idx" value="${buyer.b_idx}">
            <input type="hidden" id="i_price" value="${item.i_price}">
            <input type="hidden" id="i_img" value="${item.i_saveimg0}">
            <a href="" class="m_l_view_category_link">
                <c:choose>
                    <c:when test="${item.c_idx le 5}">
                        <span>디지털/가전</span>
                    </c:when>
                    <c:when test="${item.c_idx le 10}">
                        <span>인테리어</span>
                    </c:when>
                    <c:when test="${item.c_idx le 15}">
                        <span>식품</span>
                    </c:when>
                    <c:when test="${item.c_idx le 20}">
                        <span>의류</span>
                    </c:when>
                    <c:otherwise>
                        <span>생활</span>
                    </c:otherwise>
                </c:choose>
            </a>
            <span class="arrow_small"></span>
            <a href="" class="m_l_view_category_link"><span>${item.c_name}</span></a>
            <span class="arrow_small"></span><br>
            <div class="m_l_view_star_box">
                <span class="m_l_view_star empty"></span>
                <span class="m_l_view_star full"></span>
            </div>
            <label for="m_l_view_btn_review">
                <span>(10)</span>
            </label>
            <span class="m_l_view_item_title" id="i_name">${item.i_name}</span>
            <span class="m_l_view_storename">${item.s_storename}</span>
            <div class="m_l_view_itemsimpleinfo">
                <div class="m_l_view_itemimg">
                    <c:choose>
                        <c:when
                            test="${(item.i_saveimg0 eq null) and (item.i_saveimg1 eq null) and (item.i_saveimg2 eq null) and (item.i_saveimg3 eq null) and (item.i_saveimg4 eq null)}">
                            <img src="${pageContext.request.contextPath}/resources/css/img/noimg.png" alt="">
                        </c:when>
                        <c:otherwise>
                            <div class="m_l_view_itemimg_box">
                                <c:forEach var="index" begin="0" end="4">
                                    <c:if test="${imgArr[index] ne null}">
                                        <img class="i_saveimg${index}"
                                            src="${pageContext.request.contextPath}/resources/uploads/${imgArr[index]}"
                                            alt="">
                                    </c:if>
                                </c:forEach>
                            </div>
                            <div class="m_l_view_itemimg_btn">
                                <c:forEach var="index" begin="0" end="4">
                                    <c:if test="${imgArr[index] ne null}">
                                        <button class="i_saveimg${index}">
                                            <img class="i_saveimg${index}"
                                                src="${pageContext.request.contextPath}/resources/uploads/${imgArr[index]}"
                                                alt="">
                                        </button>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="m_l_view_itemoption">
                    <div class="m_l_view_itemprice_box">
                        <span class="m_l_view_itemprice">
                            <fmt:formatNumber value="${item.i_price}" type="currency" currencySymbol="₩" />
                        </span>
                    </div>
                    <button class="m_l_view_firstoption hide">
                        <span class="m_l_view_checkedoption"></span><br>
                        <span class="reset">다시선택</span>
                    </button>
                    <div class="m_l_view_itemoption_box">
                        <c:forEach var="index" begin="0" end="4">
                            <c:if test="${optionArr[index] ne null}">
                                <div class="m_l_view_option">
                                    ${optionArr[index]}
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="m_l_view_getitem_box">
            </div>
            <div class="m_l_view_getitem">
                <span class="m_l_view_getitem_itemname">${item.i_name}</span><br>
                <span class="m_l_view_checkedoption"></span>
                <span class="m_l_view_getitem_itemprice">
                    <fmt:formatNumber value="${item.i_price}" type="currency" currencySymbol="₩" />
                </span>
                <button class="m_l_view_getitem_cart" id="getCart"><span>장바구니</span></button>
                <span class="m_l_view_getitem_span">시간이 좀 더 필요하신가요?</span>
                <span class="m_l_view_getitem_span">선택한 상품을 목록에 모두 저장해두고 언제든 살펴보세요.</span>
                <button class="m_l_view_getitem_save" id="getLikeItem"><span class="m_l_view_getitem_span">나중을 위한 저장</span></button>
                <span class="m_l_view_getitem_span">배송에 관한 자세한 정보는 '결제'단계에서 볼 수 있습니다.</span>
            </div>
            <div class="m_l_view_dummy"></div>
            <div class="m_l_view_itemdetail">
                <div class="m_l_view_btn">
                    <div class="m_l_view_btn_box">
                        <button class="m_l_view_btn_itemexplain active"><span>상품정보</span></button>
                        <button class="m_l_view_btn_review" id="m_l_view_btn_review"><span>리뷰</span></button>
                        <button class="m_l_view_btn_QandA"><span>Q&A</span></button>
                        <button class="m_l_view_btn_sellerinfo"><span>판매자정보</span></button>
                    </div>
                </div>
                <div class="m_l_view_itemexplain page-section">
                    <c:out value="${item.i_explain}" escapeXml="false" />
                </div>
                <div class="m_l_view_itemreview page-section">
                    <h2>상품리뷰</h2>
                    <div class="m_l_view_simplereview">
                        <div class="m_l_view_simple_stars">
                            <h3>구매만족도</h3>
                            <h1>2.5</h1>
                            <div class="m_l_view_simple_star_box">
                                <span class="m_l_view_simple_star empty"></span>
                                <span class="m_l_view_simple_star full"></span>
                            </div>
                            <span>10건</span>
                        </div>
                        <div class="m_l_view_simple_statistics">
                            <ul>
                                <li class="points5">
                                    <span class="num">5점</span>
                                    <div><span></span></div>
                                    <span class="percent">50%</span>
                                </li>
                                <li class="points4">
                                    <span class="num">4점</span>
                                    <div><span></span></div>
                                    <span class="percent">10%</span>
                                </li>
                                <li class="points3">
                                    <span class="num">3점</span>
                                    <div><span></span></div>
                                    <span class="percent">10%</span>
                                </li>
                                <li class="points2">
                                    <span class="num">2점</span>
                                    <div><span></span></div>
                                    <span class="percent">10%</span>
                                </li>
                                <li class="points1">
                                    <span class="num">1점</span>
                                    <div><span></span></div>
                                    <span class="percent">10%</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <h2>전체리뷰</h2>
                    <div class="m_l_view_detailreview">
                        <ul class="m_l_view_review_search">
                            <li>
                                <label for="starall">
                                    <input type="radio" name="starorder" id="starall">
                                    <span>전체</span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="star5">
                                    <input type="radio" name="starorder" id="star5">
                                    <span class="m_l_view_starorder"></span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="star4">
                                    <input type="radio" name="starorder" id="star4">
                                    <span class="m_l_view_starorder"></span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="star3">
                                    <input type="radio" name="starorder" id="star3">
                                    <span class="m_l_view_starorder"></span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="star2">
                                    <input type="radio" name="starorder" id="star2">
                                    <span class="m_l_view_starorder"></span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="star1">
                                    <input type="radio" name="starorder" id="star1">
                                    <span class="m_l_view_starorder"></span>
                                </label>
                            </li>
                            <li>
                                <label for="recommend">
                                    <input type="radio" name="vieworder" id="recommend">
                                    <span>추천순</span>
                                </label>
                                <span class="m_l_view_stick">|</span>
                                <label for="latest">
                                    <input type="radio" name="vieworder" id="latest">
                                    <span>최신순</span>
                                </label>
                            </li>
                            <li>
                                <input type="submit" id="search_submit">
                                <label for="search_submit">
                                    <span class="search"></span>
                                </label>
                                <input type="text" placeholder="옵션 검색">
                            </li>
                        </ul>
                        <ul>
                            <li>

                            </li>
                        </ul>
                    </div>
                </div>
                <div class="m_l_view_itemQandA page-section">
                    Q&A입니다
                </div>
                <div class="m_l_view_itemsellerinfo page-section">
                    판매자정보입니다
                </div>
            </div>
        </section>
    </div>
    <footer>
        <%@ include file="../common/global_footer.jsp"%>
    </footer>
</body>

</html>