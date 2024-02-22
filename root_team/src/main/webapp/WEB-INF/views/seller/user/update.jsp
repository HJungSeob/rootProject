<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서블릿 테스트:회원정보 변경</title>
    <script type="text/javascript" src="../resources/js/update.js"></script>
    <link rel="stylesheet" href="../resources/css/join.css">
    <style>
        #td-msg{
            padding-left: 7px;
        }
        #span-msg{
            font: 13px Arial, sans-serif;
            color: orange;
        }
        #div-below{
            width: 600px;
            height: 30px;
            position: absolute;
            bottom: 120px;
            left: 280px;
            font: 14px Arial, sans-serif;
            margin: 0 auto;
        }
     </style>

     <script>
         function cancelMember(){
            const confirmAns = confirm("정말 회원 탈퇴하시겠습니까?");

            if(confirmAns){
                location.href = "cancelProcess.do";
            }else{
                history.back();
            }
         }
    </script>
</head>
<body>
	
    <div id="wrap">
        
       

    <div id="container">
        <div id="logo"></div>
	    <form name="frm_update" method="post" action="updateProcess.do">
	       <input type="hidden" name="m_idx" value="${seller.m_idx}">
	        <table>
	            <tr>
	                <td><input type="text" name="member_pw" id="member_pw" value="${seller.s_pw}"></td>
	            </tr>
	            <tr>
	                <td><input type="text" name="member_name" id="member_name" value="${seller.s_name}"></td>
	            </tr>
	            <tr>
	                <td><input type="text" name="handphone" id="handphone" value="${seller.s_birth}"></td>
	            </tr>
	            <tr>
	                <td><input type="email" name="email" id="email" value="${seller.s_email}"></td>
	            </tr>
	            <tr>
	                <td><input type="submit" id="update_btn" value="변경하기"></td>
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
	    
		<div id="div-below">AgodaVIP&nbsp;&nbsp; | &nbsp;&nbsp;AgodaCash&nbsp;&nbsp; | &nbsp;&nbsp;캐쉬백 리워드&nbsp;&nbsp; 
        | &nbsp;&nbsp;포인트맥스&nbsp;&nbsp; | &nbsp;&nbsp;이용후기&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:cancelMember();">계정삭제</a></div>
	
	   
    
    </div>
</body>
</html>