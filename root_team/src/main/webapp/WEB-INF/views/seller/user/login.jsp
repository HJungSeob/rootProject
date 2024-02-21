<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP 로그인</title>
    <link rel="stylesheet" href="../resources/css/login.css">
</head>
<body>
	
    <div id="wrap">
        
    
        
    <div id="container">
        <div id="logo"></div>
	    <form name="frm_login" method="post" action="loginProcess.do">
	        <table>
	            <tr>
	                <td><input type="text" name="s_businessnum" id="member_id" placeholder="아이디"></td>
	            </tr>
	            <tr>
	                <td><input type="password" name="s_pw" id="member_pw" placeholder="비밀번호"></td>
	            </tr>
	            <tr>
	                <td><input type="submit" id="login_btn" value="로 그 인"></td>
	            </tr>
	            <tr>
	                <td>
		                <c:if test="${not empty msg}">
					    	<c:out value="<span> ${msg} </span>" escapeXml="false" />
					    </c:if>
	                </td>
	            </tr>
	        </table>       
	    </form>
	</div>
	
	    
    
    </div>
</body>
</html>