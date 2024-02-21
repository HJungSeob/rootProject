<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP 회원가입</title>
    <script type="text/javascript" src="../resources/js/join.js"></script>
    <link rel="stylesheet" href="../resources/css/join.css">
</head>
<body>

    <div id="wrap">
    	
        
    <div id="container">
        <div id="logo"></div>
        <!-- 회원가입정보를 서블릿에서 처리하도록 한 것을 jsp에서 처리하도록 변경함
             현재 폴더에 있는 join_process.jsp에서 회원정보를 처리하도록 함
         -->
	    <form name="frm_join" method="post" action="joinProcess.do">
	        <table>	        	
	            <tr>
	                <td><input type="text" name="b_name" id="member_name" placeholder="이름"></td>
	            </tr>
	            <tr>
	                <td><input type="text" name="b_tel" id="handphone" placeholder="핸드폰"></td>
	            </tr>
	            <tr>
	                <td><input type="text" name="b_birth" id="handphone" placeholder="생년월일"></td>
	            </tr>
	            <tr>
	                <td><input type="email" name="b_email" id="email" placeholder="이메일"></td>
	            </tr>
	            <tr>
	                <td><input type="password" name="b_pw" id="member_pw" placeholder="비밀번호"></td>
	            </tr>         
	            <tr>
	                <td><input type="submit" id="join_btn" value="가입하기"></td>
	            </tr>
	        </table>       
	    </form>
	</div>
	
	
	
	</div>
</body>
</html>