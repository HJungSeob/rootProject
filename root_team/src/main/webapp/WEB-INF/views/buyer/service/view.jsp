<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script>
        $(document).ready(function () {

            $('.m_l_view_itemimg_btn button').click(function () {
                // 클릭된 버튼의 클래스를 가져옵니다.
                var className = $(this).attr('class');
                // 해당 버튼과 동일한 클래스를 가진 m_l_view_itemimg_box 안에 있는 img 태그를 제외한 다른 요소는 숨깁니다.
                $('.m_l_view_itemimg_box img').hide();
                // 해당 버튼과 동일한 클래스를 가진 m_l_view_itemimg_box 안에 있는 img 태그를 보여줍니다.
                $('.m_l_view_itemimg_box .' + className).show();
                
                $(".m_l_view_itemimg_btn button").css({
                    'border': '2px solid #F9F9F9'
                });
                $(this).css({
                    'border': '2px solid black'
                });
            });
            
            $('.m_l_view_itemimg_btn button:first').trigger('click');
        });
        
    </script>

    <style>
        section {
            box-sizing: border-box;
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
            /* background-color: rgb(172, 172, 255); */
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
        }

        .m_l_view_storename {
            display: block;
            font-weight: bold;
            color: #C3C3C3;
            margin-top: 10px;
        }

        .m_l_view_item_title {
            display: block;
            font-size: 32px;
            font-weight: bold;
        }

        .m_l_view_item_price {
            font-weight: bold;
        }
        
        .m_l_view_itemimg{
        	height: 700px;
        }
        
		.m_l_view_itemimg_box{
			width: 600px;
            height: 600px;
            margin-top: 10px;
		}
		
        .m_l_view_itemimg_box img {
            width: 600px;
            height: 600px;
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
            margin: 0 5px;
        }

        .m_l_view_itemimg_btn button img {
            width: 100%;
            height: 100%;
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
            <span class="m_l_view_storename">${seller.s_storename}</span>
            <span class="m_l_view_item_title">${item.i_name}</span>
            <span class="m_l_view_item_price">
                <fmt:formatNumber pattern="¤ #,##0" value="${item.i_price}" />
            </span>
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

            <%-- <c:out value="${item.i_explain}" escapeXml="false" /> --%>
        </section>
    </div>
    <footer>
        <%@ include file="../common/global_footer.jsp"%>
    </footer>
</body>

</html>