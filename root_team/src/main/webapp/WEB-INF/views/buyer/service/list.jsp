<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>list</title>
    <link rel="stylesheet" href="../resources/css/font.css">
    <link rel="stylesheet" href="../resources/css/icon.css">
    <link rel="stylesheet" href="../resources/css/global.css">
    <script src="../resources/js/globalNavigation.js"></script>
    <script src="../resources/js/m_list.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
	    $(function() {
	        $('#orderByType').change(function() {
	            $(this).closest('form').submit();
	        });
	        $('#viewNum').change(function() {
	            $(this).closest('form').submit();
	        });
	    });
    </script>
    <style>
        /* #region ------------ start of header ---------------------- */

        header {
            width: 100%;
            height: 48px;
            z-index: 20;
            background-color: #f9f9f9;
        }

        /* #region start of nav */

        nav {
            position: relative;
            backdrop-filter: blur(10px);
            top: 0px;
            width: 100%;
            background-color: #f9f9f9;
            transition: 0.3s;
            z-index: 20;
            font: 0;
        }

        .global_nav_bar {
            margin: 0 auto;
            display: flex;
            min-width: 1000px;
            width: 100%;
            max-width: 1200px;
            font-size: 0;
            z-index: 20;
            height: 48px;
        }

        .global_nav_bar a {
            vertical-align: top;
        }

        .global_nav_bar a span {
            display: inline-block;
            padding: 15px 20px;
            height: 18px;
            width: 18px;
            background-size: 18px;
        }

        .global_nav_btns {
            flex: 1;
            display: flex;
            justify-content: space-between;
        }

        .global_nav_btns button {
            height: 48px;
            padding: 17px 0;
            margin: 0 20px;
            font-size: 12px;
            font-weight: bold;
            cursor: pointer;
            background-color: transparent;
            border: 0;
        }

        .global_nav_keywords {
            flex: 1;
        }

        .global_nav_keywords ul {
            width: 200px;
            height: 48px;
            padding: 0;
            margin: 0;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            padding: 0;
            float: right;
        }

        .global_nav_keywords li {
            box-sizing: border-box;
            width: 200px;
            font-size: 12px;
            font-weight: bold;
            position: absolute;
            padding: 17px;
            margin: 0;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_keywords .arrow {
            display: inline-block;
            width: 8px;
            height: 8px;
            vertical-align: 1px;
            margin-right: 10px;
            background-size: 8px;
        }

        .global_nav_keywords li.active {
            opacity: 1;
        }

        .global_nav_serviceBtn {
            height: 48px;
            padding: 15px 20px;
            cursor: pointer;
            background-color: transparent;
            border: 0;
        }

        .global_nav_serviceBtn span {
            display: inline-block;
            height: 16px;
            width: 16px;
        }

        .global_nav_lists {
            position: absolute;
            width: 100%;
            height: 0;
            overflow: hidden;
            z-index: 11;
            background-color: white;
            transition: 0.5s;
            opacity: 0;
        }

        .global_nav_listBox {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .global_nav_list {
            box-sizing: border-box;
            position: absolute;
            width: 100%;
            display: flex;
            opacity: 0;
            padding: 40px 20px;
            transition: 0.3s;
        }

        .global_nav_categories {
            width: 200px;
        }

        .global_nav_categories span {
            color: #848484;
            font-size: 12px;
        }

        .global_nav_categories ul {
            margin-top: 10px;
        }

        .global_nav_categories li {
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        .global_nav_categorieImg img {
            position: absolute;
            display: block;
            opacity: 0;
            width: 960px;
            height: 280px;
            transition: opacity 0.5s;
        }

        .global_nav_categorieImg img.active {
            opacity: 1;
        }

        .global_nav_searchField {
            box-sizing: border-box;
            width: 1200px;
        }

        .global_nav_searchField input[type="submit"] {
            display: none;

        }

        .global_nav_searchField .search {
            display: inline-block;
            width: 20px;
            height: 20px;
            background-size: 20px;
        }

        .global_nav_searchField span {
            display: inline-block;
            color: #848484;
            font-size: 12px;

        }

        .global_nav_searchBox {
            box-sizing: border-box;
            border: 0;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .global_nav_list_keywords {
            width: 800px;
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .global_nav_list_keywords ul {
            margin-right: 10px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        .global_nav_list_keywords li {
            font-size: 12px;
            font-weight: bold;
            width: 250px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_list_keywords .arrow {
            display: inline-block;
            width: 8px;
            height: 8px;
            vertical-align: 1px;
            margin-right: 10px;
            background-size: 8px;
        }

        .global_nav_cart {
            flex: 1;
            font-size: 0;
            display: flex;
        }

        .global_nav_cartList {
            flex: 1;
        }

        .global_nav_cartList h1 {
            font-size: 24px;
        }

        .global_nav_cartItem {
            margin-top: 20px;
        }

        .global_nav_cartItem a {
            display: block;
            width: 590px;
        }

        .global_nav_cartItem img {
            display: inline-block;
            width: 64px;
            height: 64px;
        }

        .global_nav_cartItem span {
            width: 500px;
            display: inline-block;
            font-size: 12px;
            vertical-align: top;
            margin: 25px 0 0 20px;
            font-weight: bold;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .global_nav_cartView a {
            font-size: 16px;
            font-weight: bold;
            color: white;
            padding: 9px;
            border: 1px solid black;
            border-radius: 26px;
            background-color: black;
        }

        .global_nav_itemCount {
            display: block;
            height: 50px;
            position: absolute;
            bottom: 0px;
            right: 20px;
            font-size: 12px;
            float: right;
            color: #848484;
        }

        nav.fixed {
            position: fixed;
            background-color: #ffffff99;
        }

        nav.active {
            background-color: white;
        }

        nav.active .global_nav_lists {
            height: 360px;
            opacity: 1;
            box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.1);

        }

        .global_nav_list.active {
            opacity: 1;
            z-index: 12;
        }

        /* #endregion ------------ end of header ---------------------- */

        /* #region ------------ start of section ---------------------- */

        section {       	
        	background-color: white;
            transition: filter 0.5s, opacity 0.5s;
            margin-bottom: 100px;
        }

        section.blur {
            filter: blur(10px);
            -webkit-filter: blur(10px);
            opacity: 0.8;
        }

        .m_list_boundary {
            box-sizing: border-box;
            width: 100%;
            height: 300px;
            background-image: url(../resources/css/img/list_img.jpg);
            background-repeat: no-repeat;
            background-size: cover;        
            text-align: center;
            padding-top: 100px;
            color: white;
        }

        .m_list_boundary h1{                           
            font-size: 45px;
            font-family: 'NEXONLv1GothicBold';
            padding-bottom: 30px;
        }

        .m_list_boundary span{
            color: rgba(255, 255, 255, 0.8);
            font-family: 'NEXONLv1GothicBold';
        }

        .m_list_search {
            box-sizing: border-box;
            width: 100%;
            border-bottom: 1px solid lightgray;
        }

        .m_list_search_box {
            width: 1000px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
        }

        .m_list_search_box input[type="submit"] {
            display: none;
        }

        .m_list_search_box .search {
            width: 24px;
            height: 24px;
            background-size: 24px;
            padding-right: 10px;
            margin-left: 20px;
        }

        .m_list_search_box input[type="text"] {
            box-sizing: border-box;
            height: 79px;
            width: 500px;
            font-size: 24px;
            font-weight: bold;
            border: 0;
        }

        .m_list_search_box select {
            font-size: 14px;
            margin: 30px 0 30px 40px;
            border: 0;
            font-weight: bold;
        }

        .m_list_search_list {
            width: 1000px;
            margin: 0 auto;
            display: flex;
        }

        .m_list_categoris {
            box-sizing: border-box;
            min-width: 200px;
            border-right: 1px solid lightgray;
            padding: 20px 20px 0;
        }

        .m_list_categoris h4 .arrow_big_bottom {
            vertical-align: top;
            float: right;
            transition: rotate 0.5s;
            filter: invert(83%) sepia(0%) saturate(1%) hue-rotate(332deg) brightness(96%) contrast(90%);
        }

        .m_list_categoris h4.active .arrow_big_bottom {
            rotate: 180deg;
        }

        .m_list_categoris>h2 {
            box-sizing: border-box;
            font-size: 20px;
            padding: 10px;
            border-bottom: 1px solid lightgray;
        }

        .m_list_categoris>ul {
            transition: height 0.5s;
        }

        .m_list_categori>h4 {
            box-sizing: border-box;
            font-size: 14px;
            padding: 10px 10px;
        }

        .m_list_categori>h4 .arrow_big_bottom {
            width: 14px;
            height: 14px;
            background-size: 14px;
        }

        .m_list_categori>ul {
            height: 0px;
            overflow: hidden;
            transition: height 0.5s;
        }

        .m_list_categori>ul>li {
            box-sizing: border-box;
            font-size: 14px;
            padding: 7px 10px;
        }

        .m_list_items {
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }

        .m_list_item {
            box-sizing: border-box;
            position: relative;
            border-radius: 20px;
            margin:20px 0 0 20px;
            padding: 20px;
            width: 240px;
            height: 350px;
            transition: box-shadow 0.5s;
        }

        .m_list_item:hover {
            box-shadow: 2px 4px 12px rgba(0, 0, 0, .3);
        }

        

        .m_list_item_info img {
            display: block;
            width: 200px;
            height: 200px;
            margin-bottom: 10px;
            border-radius: 10px;
        }	
		
		.m_list_star_box {
			position: relative;
			display: inline-block;
            width: 89px;
            height: 17px;
            font-size: 0;
            margin-bottom: 5px;       
        }        

        .m_list_star {
            position: absolute;     
            display: inline-block;
            height: 17px;
            background-repeat: no-repeat;
        }

        .m_list_star.full {       
            background-image: url(../resources/css/img/star.png);
            background-position: 0 -245px;
        }

        .m_list_star.empty {
            width: 100%;
            background-image: url(../resources/css/img/star2.png);
            background-position: 0 -270px;
            opacity: 0.3;
        }
        
        .m_list_review_cnt{
        	display: inline-block;
        	vertical-align: top;
        	padding-top: 5px;      
        	font-size: 10px;
        }

        .m_list_item_info h4 {
            margin-bottom: 5px;

        }

        .m_list_item_info h5 {
            margin-bottom: 5px;
            font-weight: lighter;
        }

        .m_list_item_info h6 {
            font-weight: lighter;
        }
        
        #td_paging{
		height: 50px;
		font: 12px Arial, sans-serif;
		text-align: center;
		}

        /* #endregion ------------ end of section ---------------------- */

        /* #region ------------ start of footer ---------------------- */
        /* #endregion ------------ end of footer ---------------------- */
    </style>
</head>

<body>
	<div class="wrap">
    <header>
        
    </header>
    <section>
        <div class="m_list_boundary">
            <h1>root.com 검색하기</h1>
            <span>ROOT에서 원하는 상품을 검색하여 최신 트렌드를 만나보세요.</span>
        </div>
        <form>
            <div class="m_list_search">
                <div class="m_list_search_box">
                    <div>
                        <label class="search">
                            <input type="submit">
                        </label>
                        <input type="text" name="searchWord" placeholder="root.com 검색하기" value="${sVO.searchWord}">
                    </div>
                    <div>
                    	<select name="searchField">                     	
                            <option value="i_name" ${sVO.searchField eq 'i_name' ? 'selected' : ''}>상품명</option>
                            <option value="s_storename" ${sVO.searchField eq 's_storename' ? 'selected' : ''}>스토어명</option>                      
                        </select>	
                        <select name="orderByType" id="orderByType">                     	
                            <option value="pop" ${sVO.orderByType eq 'pop' ? 'selected' : ''}>인기상품순</option>
                            <option value="new" ${sVO.orderByType eq 'new' ? 'selected' : ''}>최신상품순</option>                      
                        </select>
                        <select name="viewNum" id="viewNum">
						    <option value="9" ${sVO.viewNum eq '9' ? 'selected' : ''}>9개</option>
						    <option value="18" ${sVO.viewNum eq '18' ? 'selected' : ''}>18개</option>
						    <option value="30" ${sVO.viewNum eq '30' ? 'selected' : ''}>30개</option>
						</select>
                    </div>
                </div>
            </div>
        </form>
        <div class="m_list_search_list">
            <div class="m_list_categoris">

                <h2>디지털/가전</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>휴대폰<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>PC<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>영상가전<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>음향가전<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>생활가전<span class="arrow_big_bottom"></span></h4>
                    </li>
                </ul>

                <h2>인테리어</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>수납<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>홈<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>거실<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>침구<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>침실가구<span class="arrow_big_bottom"></span></h4>
                    </li>
                </ul>

                <h2>식품</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>농수산물<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>가공식품<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>제과제빵<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>음료<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>건강식품<span class="arrow_big_bottom"></span></h4>
                    </li>
                </ul>

                <h2>의류</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>상의<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>하의<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>아우터<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>신발<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>이너웨어<span class="arrow_big_bottom"></span></h4>
                    </li>
                </ul>

                <h2>생활</h2>
                <ul>
                    <li class="m_list_categori">
                        <h4>취미<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>잡화<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>주방<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>사무<span class="arrow_big_bottom"></span></h4>
                    </li>
                    <li class="m_list_categori">
                        <h4>공구<span class="arrow_big_bottom"></span></h4>
                    </li>
                </ul>
            </div>
            <div class="m_list_items">
            	<c:choose>
					<c:when test="${empty itemList}">
						<tr><td colspan="6">등록된 게시물이 없습니다</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
							<c:if test="${not empty itemList[vs.count-1]}">																		
								 <a href="view.do?i_idx=${itemList[vs.count-1].i_idx}"  class="m_list_item">
				                    <div class="m_list_item_info">				                    	
				                        <img src="../resources/uploads/${itemList[vs.count-1].i_saveimg0}" alt="">
				                        <div class="m_list_star_box">
			                        		<span class="m_list_star empty"></span>		                            
			                            	<span class="m_list_star full" style="width: ${(itemList[vs.count-1].avg_star / 5) * 100}%"></span>		                                          
				                        </div>
				                        <span class="m_list_review_cnt">(${itemList[vs.count-1].comment_count})</span>
				                        <h4>${itemList[vs.count-1].i_name}</h4>
				                        <h5><fmt:formatNumber value="${itemList[vs.count-1].i_price}" type="currency" currencySymbol="₩" /></h5>			                                     
				                    </div>
				                    </a>						
							</c:if>					
						</c:forEach>					
					</c:otherwise>
				</c:choose>       
               	<c:if test="${not empty itemList}" >            		
					<div id="td_paging">
						<%@ include file="../../common/paging.jsp" %>
					</div>
				</c:if>
            </div>
        </div>
    </section>
    </div>
    <footer>
    </footer>

    
</body>

</html>