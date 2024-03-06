<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="searchField" value="${sVO.searchField}" />
<c:set var="searchWord" value="${sVO.searchWord}" />
<c:set var="orderByType" value="${sVO.orderByType}" />
<c:set var="p_idx" value="${sVO.p_idx}" />
<c:set var="c_idx" value="${sVO.c_idx}" />
<c:set var="viewNum" value="${sVO.viewNum}" />

<c:url value="list.do?" var="listUrl">
    <c:if test="${not empty searchWord}">
    	<c:param name="searchWord" value="${searchWord}" />
    </c:if>
    <c:if test="${not empty searchField}">
    	<c:param name="searchField" value="${searchField}" />
    </c:if>
    <c:if test="${not empty orderByType}">
    	<c:param name="orderByType" value="${orderByType}" />
    </c:if>
    <c:if test="${not empty p_idx}">
    	<c:param name="p_idx" value="${p_idx}" />
    </c:if>
    <c:if test="${not empty c_idx}">
    	<c:param name="c_idx" value="${c_idx}" />
    </c:if>
    <c:if test="${not empty viewNum}">
    	<c:param name="viewNum" value="${viewNum}" />
    </c:if>
</c:url>

<c:if test="${pageNav.pageNum > pageNav.pages_pageBlock}">
	<a href="${listUrl}pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
	<a href="${listUrl}pageNum=${(pageNav.pageBlock-2)*pageNav.pages_pageBlock+1}&pageBlock=${pageNav.pageBlock-1}">이전</a>
</c:if>

<c:forEach var="p" begin="${(pageNav.pageBlock - 1)*pageNav.pages_pageBlock +1}" end="${pageNav.pageBlock*pageNav.pages_pageBlock}">
	<c:if test="${p le pageNav.total_pageNum}">
		<a href="${listUrl}pageNum=${p}&pageBlock=${pageNav.pageBlock}">
			<c:if test="${p eq pageNav.pageNum}" var="flag">
				<span class="active">${p}&nbsp;</span>
			</c:if>
			<c:if test="${not flag}">
				<span>${p}&nbsp;</span>
			</c:if>
		</a>
	</c:if>
</c:forEach>

<c:if test="${pageNav.total_pageNum > (pageNav.pageBlock*pageNav.pages_pageBlock)}">
	<a href="${listUrl}pageNum=${(pageNav.pageBlock*pageNav.pages_pageBlock)+1}&pageBlock=${pageNav.pageBlock + 1}">다음</a>&nbsp;
	<a href="${listUrl}pageNum=${pageNav.total_pageNum}&pageBlock=${pageNav.last_pageBlock}">&gt;&gt;</a>
</c:if>
















