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

        


        /* ---------------------------------------------- */
    </style>
</head>

<body>
    <div class="wrap">
        <header>
            <%@ include file="../common/global_header.jsp"%>
        </header>
        <section>
        <c:choose>
        	<c:when test="${item.c_idx le 5}">
        		<a href=""><span>디지털/가전</span></a>
        	</c:when>
        	<c:when test="${item.c_idx le 10}">
        		<a href=""><span>인테리어</span></a>
        	</c:when>
        	<c:when test="${item.c_idx le 15}">
        		<a href=""><span>식품</span></a>
        	</c:when>
        	<c:when test="${item.c_idx le 20}">
        		<a href=""><span>의류</span></a>
        	</c:when>
        	<c:otherwise>
        		<a href=""><span>생활</span></a>
        	</c:otherwise>
        </c:choose>          
            <span class="arrow_small"></span>
            <a href=""><span>${item.c_name}</span></a>
            <span class="arrow_small"></span>
            
            
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