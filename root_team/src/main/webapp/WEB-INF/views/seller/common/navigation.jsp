<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/seller/common/global_section.css">
	<script src="${pageContext.request.contextPath}/resources/js/seller/common/globalNavigation.js"></script>
</head>

<div class="seller_global_category">

	<div class="seller_global_category_profile">
		<div><img src="${pageContext.request.contextPath}/resources/css/img/test/yumyum.jpg" alt="(이미지)"></div>
		<div><span>(매장이름)</span></div>
	</div>

	<div class="seller_global_dropdown_wrap">
		<div>
			<button class="seller_global_category_btn">
				<span class="">상품관리</span>
				<span class="arrow_small"></span>
			</button>
			<ul class="seller_global_category_drop_list">
				<li class="seller_global_category_list">
					<a href="${pageContext.request.contextPath}/seller/viewEdit.do">상품 조회/수정</a>
				</li>
				<li class="seller_global_category_list">
					<a href="">상품 등록</a>
				</li>
			</ul>
		</div>
		<div>
			<a class="seller_global_category_btn" href="${pageContext.request.contextPath}/seller/sales.do">
				<span class="">판매관리</span>
			</a>
		</div>
		<div>
			<a class="seller_global_category_btn" href="${pageContext.request.contextPath}/seller/delivery.do">
				<span class="">배송관리</span>
			</a>
		</div>
		<div>
			<button class="seller_global_category_btn">
				<span class="">매장관리</span> <span class="arrow_small"></span>
			</button>
			<ul class="seller_global_category_drop_list">
				<li class="seller_global_category_list">
					<a href="${pageContext.request.contextPath}/seller/store.do">스토어 현황</a>
				</li>
				<li class="seller_global_category_list">
					<a href="${pageContext.request.contextPath}/seller/settlement.do">정산 현황</a>
				</li>
			</ul>
		</div>
		<div>
			<button class="seller_global_category_btn">
				<span class="">문의/리뷰관리</span> <span class="arrow_small"></span>
			</button>
			<ul class="seller_global_category_drop_list">
				<li class="seller_global_category_list">
					<a href="${pageContext.request.contextPath}/seller/review.do">상품 리뷰</a>
				</li>
				<li class="seller_global_category_list">
					<a href="${pageContext.request.contextPath}/seller/inquiry.do">상품 문의</a>
				</li>
			</ul>
		</div>
		<div>
			<button class="seller_global_category_btn">
				<span class="">고객센터</span>
			</button>
		</div>
		<div>
			<button class="seller_global_category_btn">
				<span class="">회원정보수정</span>
			</button>
		</div>
	</div>
</div>