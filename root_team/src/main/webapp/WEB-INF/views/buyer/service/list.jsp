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
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(function () {

            $('#orderByType').change(function () {
                $("#formBox").submit();
            });
            $('#viewNum').change(function () {
                $("#formBox").submit();
            });


            $('h4, h2').click(function () {

                $('h4, h2').not(this).removeClass('active');
                // 클릭된 요소에 active 클래스 추가
                $(this).addClass('active');

                var classValue = $(this).attr('class');
                var otherClasses = classValue.replace('active', '').trim();

                if (otherClasses !== '') {
                    // 클릭된 요소가 h4인 경우
                    if ($(this).is('h4')) {
                        $('input[name="c_idx"]').val(otherClasses);
                        $('input[name="p_idx"]').val('0');
                    } else if ($(this).is('h2')) { // 클릭된 요소가 h2인 경우
                        $('input[name="p_idx"]').val(otherClasses);
                        $('input[name="c_idx"]').val('0');
                    }
                }              
                $("#formBox").submit();    
            });

            var queryString = window.location.search;
            var searchParams = new URLSearchParams(queryString);
            var c_idxValue = searchParams.get('c_idx');
            var p_idxValue = searchParams.get('p_idx');
            if (c_idxValue > 0) {
                $('h4.' + c_idxValue).addClass('active');
                $('input[name="c_idx"]').val(c_idxValue);
                $('input[name="p_idx"]').val('0');
            } else if (p_idxValue > 0) {
                $('h2.' + p_idxValue).addClass('active');
                $('input[name="c_idx"]').val('0');
                $('input[name="p_idx"]').val(p_idxValue);
            } else {
                $('h2.0').addClass('active');
                $('input[name="c_idx"]').val('0');
                $('input[name="p_idx"]').val('0');
            }
            
            $(".m_list_categoris div").each(function(){
                if ($(this).find("h4.active").length > 0) {
                    $(this).css("height", "225px");
                } else {
                    $(this).css("height", ""); // 높이 값을 초기화합니다.
                }
            });

        });
    </script>
    <style>
        /* #region ------------ start of section ---------------------- */

        section {
            background-color: white;
            transition: filter 0.5s, opacity 0.5s;           
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

        .m_list_boundary h1 {
            font-size: 45px;
            font-family: 'NEXONLv1GothicBold';
            padding-bottom: 30px;
        }

        .m_list_boundary span {
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
            min-height: 730px;
            margin: 0 auto;
            display: flex;
        }

        .m_list_categoris {
            box-sizing: border-box;
            min-width: 200px;
            border-right: 1px solid lightgray;
            padding: 20px 20px 100px;
        }

        .m_list_categoris .active {
            color: #0071E3;
        }

        .m_list_categoris h2 {
            box-sizing: border-box;
            font-size: 16px;
            padding: 10px;
            border-bottom: 1px solid lightgray;
            transition: color 0.3s;
            cursor: pointer;
        }
		.m_list_categoris>div{
		 height: 39px;
		 overflow: hidden;
		 transition: height 0.5s;
		}
		
        .m_list_categoris>div:hover {
            height: 225px;
        }

        .m_list_categori h4 {
            box-sizing: border-box;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 10px;
            transition: color 0.3s;
            cursor: pointer;
        }

        .m_list_items {
            box-sizing: border-box;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .m_list_notFoundItem{
        	display: block;
        	line-height: 300px;
        	font-size: 20px;
        	font-weight: bold;   	
        }

        .m_list_item {
            box-sizing: border-box;
            position: relative;
            border-radius: 20px;
            margin: 20px 10px 0 10px;
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

        .m_list_review_cnt {
            display: inline-block;
            vertical-align: top;
            padding-top: 5px;
            font-size: 10px;
        }

        .m_list_item_info h4 {
        	box-sizing: border-box;
            margin-bottom: 5px;
            height: 56px;
			padding: 10px 0;
			overflow: hidden;
			text-overflow: ellipsis;
        }

        .m_list_item_info h5 {
            margin-bottom: 5px;
            font-weight: lighter;
        }

        .m_list_item_info h6 {
            font-weight: lighter;
        }

        #td_paging {
        	width: 800px;
            height: 50px;
            margin-top: 50px;
            font: 12px Arial, sans-serif;
            text-align: center;
        }
        
        #td_paging .active{
			color: #0071E3;
        } 

        /* #endregion ------------ end of section ---------------------- */

        /* #region ------------ start of footer ---------------------- */
        /* #endregion ------------ end of footer ---------------------- */
    </style>
</head>

<body>
    <div class="wrap">
        <header>
            <%@ include file="../common/global_header.jsp"%>
        </header>
        <section>
            <div class="m_list_boundary">
                <h1>root.com 검색하기</h1>
                <span>ROOT에서 원하는 상품을 검색하여 최신 트렌드를 만나보세요.</span>
            </div>
            <form id="formBox">
                <input type="hidden" name="c_idx">
                <input type="hidden" name="p_idx">
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
                                <option value="i_name" ${sVO.searchField eq 'i_name' ? 'selected' : '' }>상품명</option>
                                <option value="s_storename" ${sVO.searchField eq 's_storename' ? 'selected' : '' }>스토어명
                                </option>
                            </select>
                            <select name="orderByType" id="orderByType">
                                <option value="pop" ${sVO.orderByType eq 'pop' ? 'selected' : '' }>인기상품순</option>
                                <option value="new" ${sVO.orderByType eq 'new' ? 'selected' : '' }>최신상품순</option>
                            </select>
                            <select name="viewNum" id="viewNum">
                                <option value="9" ${sVO.viewNum eq '9' ? 'selected' : '' }>9개</option>
                                <option value="18" ${sVO.viewNum eq '18' ? 'selected' : '' }>18개</option>
                                <option value="30" ${sVO.viewNum eq '30' ? 'selected' : '' }>30개</option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <div class="m_list_search_list">
                <div class="m_list_categoris">
                    <h2 class="0">전체</h2>
                    <div>
                        <h2 class="1">디지털/가전</h2>
                        <ul>
                            <li class="m_list_categori">
                                <h4 class="1">휴대폰<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="2">영상가전<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="3">PC/게임<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="4">음향가전<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="5">생활가전<span class="arrow_big_bottom"></span></h4>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="2">인테리어</h2>
                        <ul>
                            <li class="m_list_categori">
                                <h4 class="6">수납<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="7">홈<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="8">거실<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="9">침구<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="10">침실가구<span class="arrow_big_bottom"></span></h4>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="3">식품</h2>
                        <ul>
                            <li class="m_list_categori">
                                <h4 class="11">농수산물<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="12">가공식품<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="13">제과제빵<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="14">음료<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="15">건강식품<span class="arrow_big_bottom"></span></h4>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="4">의류</h2>
                        <ul>
                            <li class="m_list_categori">
                                <h4 class="16">상의<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="17">하의<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="18">아우터<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="19">신발<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="20">이너웨어<span class="arrow_big_bottom"></span></h4>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <h2 class="5">생활</h2>
                        <ul>
                            <li class="m_list_categori">
                                <h4 class="21">취미<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="22">잡화<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="23">주방<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="24">사무<span class="arrow_big_bottom"></span></h4>
                            </li>
                            <li class="m_list_categori">
                                <h4 class="25">공구<span class="arrow_big_bottom"></span></h4>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="m_list_items">
                    <c:choose>
                        <c:when test="${empty itemList}">
                                <div class="m_list_notFoundItem">등록된 게시물이 없습니다.</div>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
                                <c:if test="${not empty itemList[vs.count-1]}">
                                    <a href="view.do?i_idx=${itemList[vs.count-1].i_idx}" class="m_list_item">
                                        <div class="m_list_item_info">
                                            <img src="../resources/uploads/${itemList[vs.count-1].i_saveimg0}" alt="">
                                            <div class="m_list_star_box">
                                                <span class="m_list_star empty"></span>
                                                <span class="m_list_star full"
                                                    style='width: ${(itemList[vs.count-1].avg_star / 5) * 100}%'></span>
                                            </div>
                                            <span
                                                class="m_list_review_cnt">(${itemList[vs.count-1].comment_count})</span>
                                            <h4>${itemList[vs.count-1].i_name}</h4>
                                            <h5>
                                                <fmt:formatNumber value="${itemList[vs.count-1].i_price}"
                                                    type="currency" currencySymbol="₩" />
                                            </h5>
                                        </div>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${not empty itemList}">
                        <div id="td_paging">
                            <%@ include file="../../common/paging.jsp" %>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
    </div>
    <footer>
        <%@ include file="../common/global_footer.jsp"%>
    </footer>


</body>

</html>