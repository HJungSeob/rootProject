<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css"> 
    <script src="../resources/js/jquery-3.7.1.min.js"></script>
    <style>

        section {
            box-sizing: border-box;
            width: 1000px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgb(172, 172, 255);
        }

        .arrow_small{
            width: 18px;
            height: 18px;
            background-size: 18px;
            rotate: -90deg;
            vertical-align: top;
            filter: invert(0%) sepia(1%) saturate(2514%) hue-rotate(223deg) brightness(0%) contrast(87%);
        }

        .category_link{
        	font-weight: bold;
        }

        .item_title{
            font-size: 32px;
            font-weight: bold;
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
        	<a href="" class="category_link">
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
            <a href="" class="category_link"><span>${item.c_name}</span></a>
            <span class="arrow_small"></span><br>                     
            <span class ="item_title">${item.i_name}</span>
            
           	
            
            <c:out value="${item.i_option0}" escapeXml="false"/>
            <c:out value="${item.i_option1}" escapeXml="false"/>
            <c:out value="${item.i_explain}" escapeXml="false"/>
        </section>     
    </div>
    <footer>
        <%@ include file="../common/global_footer.jsp"%>
    </footer>
</body>

</html>