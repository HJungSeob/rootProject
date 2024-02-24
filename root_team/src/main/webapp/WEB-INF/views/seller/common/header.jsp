<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="root.team.com.vo.SellerVO" %>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/common/global_header.css">
</head>

<header>
    <div class="seller_global_header">
        <div class="seller_global_logo">
            <a href="${pageContext.request.contextPath}/seller/dashBoard.do"><span class="logo"></span></a>
        </div>
        <div class="seller_global_service_btns">
            <div><span>${seller.s_firstname} ${seller.s_lastname} 님</span></div>
            <div><a href=""><span>스토어로 이동</span></a></div>
            <div><a href="${pageContext.request.contextPath}/seller/sellerLogout.do"><span>로그아웃</span></a></div>
        </div>
    </div>
</header>