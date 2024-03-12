<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="orderNum" value="${sVO.orderNum}" />
<c:set var="orderNickname" value="${sVO.orderNickname}" />
<c:set var="orderState" value="${sVO.orderState}" />
<c:set var="itemNum" value="${sVO.itemNum}" />
<c:set var="itemName" value="${sVO.itemName}" />
<c:set var="itemState" value="${sVO.itemState}" />
<c:set var="largeCategory" value="${sVO.largeCategory}" />
<c:set var="smallCategory" value="${sVO.smallCategory}" />
<c:set var="startDate" value="${sVO.startDate}" />
<c:set var="endDate" value="${sVO.endDate}" />
<c:set var="s_idx" value="${sVO.s_idx}" />

<c:set var="searchField" value="${sVO.searchField}" />
<c:set var="searchWord" value="${sVO.searchWord}" />
<c:set var="orderByType" value="${sVO.orderByType}" />
<c:set var="p_idx" value="${sVO.p_idx}" />
<c:set var="c_idx" value="${sVO.c_idx}" />
<c:set var="viewNum" value="${sVO.viewNum}" />

<c:set var="url" value="${pageContext.request.requestURL}"/>
<c:set var="lastSlashIndex" value="${url.lastIndexOf('/')}"/>
<c:set var="jspPage" value="${url.substring(lastSlashIndex + 1)}"/>

<c:choose>
	<c:when test="${jspPage eq 'sales.jsp'}">
		<c:url value="sales.do?" var="listUrl" >
		    <c:if test="${'' ne orderNum}">
		    	<c:param name="orderNum" value="${orderNum}" />
		    </c:if>
		    <c:if test="${'' ne orderNickname}">
		    	<c:param name="orderNickname" value="${orderNickname}" />
		    </c:if>
		    <c:if test="${0 ne orderState}">
		    	<c:param name="orderState" value="${orderState}" />
		    </c:if>
		    <c:if test="${null ne startDate}">
		    	<c:param name="startDate" value="${startDate}" />
		    </c:if>
		    <c:if test="${null ne endDate}">
		    	<c:param name="endDate" value="${endDate}" />
		    </c:if>
		    <c:if test="${0 ne s_idx}">
		    	<c:param name="s_idx" value="${s_idx}" />
		    </c:if>
		</c:url>
	</c:when>
	<c:when test="${jspPage eq 'viewEdit.jsp'}">
		<c:url value="viewEdit.do?" var="listUrl" >
		    <c:if test="${'' ne itemNum}">
		    	<c:param name="itemNum" value="${itemNum}" />
		    </c:if>
		    <c:if test="${'' ne itemName}">
		    	<c:param name="itemName" value="${itemName}" />
		    </c:if>
		    <c:if test="${0 ne itemState}">
		    	<c:param name="itemState" value="${itemState}" />
		    </c:if>
		    <c:if test="${not empty largeCategory}">
		    	<c:param name="largeCategory" value="${largeCategory}" />
		    </c:if>
		    <c:if test="${not empty smallCategory}">
		    	<c:param name="smallCategory" value="${smallCategory}" />
		    </c:if>
		    <c:if test="${null ne startDate}">
		    	<c:param name="startDate" value="${startDate}" />
		    </c:if>
		    <c:if test="${null ne endDate}">
		    	<c:param name="endDate" value="${endDate}" />
		    </c:if>
		    <c:if test="${0 ne s_idx}">
		    	<c:param name="s_idx" value="${s_idx}" />
		    </c:if>
		</c:url>
	</c:when>
	<c:when test="${jspPage eq 'list.jsp'}">
		<c:url value="list.do?" var="listUrl" >
		    <c:if test="${'' ne searchWord and not empty searchWord}">
		    	<c:param name="searchWord" value="${searchWord}" />
		    	<c:param name="searchField" value="${searchField}" />
		    </c:if>
		    <c:if test="${not empty orderByType}">
		    	<c:param name="orderByType" value="${orderByType}" />
		    </c:if>
		    <c:if test="${0 ne p_idx}">
		    	<c:param name="p_idx" value="${p_idx}" />
		    </c:if>
		    <c:if test="${0 ne c_idx}">
		    	<c:param name="c_idx" value="${c_idx}" />
		    </c:if>
		    <c:if test="${not empty viewNum}">
		    	<c:param name="viewNum" value="${viewNum}" />
		    </c:if>
		</c:url>
	</c:when>
</c:choose>

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
















