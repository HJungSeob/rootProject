<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Root Login</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerLogin.css">

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/loginNextPage.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerLogin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerLoginMinor.js"></script>

</head>

<body>
    <div class="wrap">
    
    	<header>
			<%@ include file="../common/global_header.jsp"%>
		</header>
		
		<section>
	        <!-- #region 상단 타이틀 -->
	        <div class="m_userLogin_title">
	            <div class="m_userLogin_tiregion">
	                <div class="m_userLogin_tiregionti">Root ID</div>
	                <div class="m_userLogin_tiregionre">
	                    <a href="${pageContext.request.contextPath}/buyer/buyerLogin.do" class="m_userLogin_tiregionss">로그인</a>
	                    <a href="${pageContext.request.contextPath}/buyer/buyerJoin.do" class="m_userLogin_tiregionss">Root ID 생성</a>
	                </div>
	            </div>
	        </div>
	        <!-- #endregion -->
	
	        <!-- #region 페이지1 -->
	        <div class="m_userLogin_mainlogoregion">
	            <div class="m_userLogin_main_log">
	                <!-- #region svg로고 -->
	                <svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" viewBox="0 0 300 300" fill="none" id="mainLog">
	                    <path fill-rule="evenodd" clip-rule="evenodd" d="M150 300C232.843 300 300 232.843 300 150C300 119.164 290.695 90.5015 274.741 66.6665H166.667L133.333 266.667L83.3333 183.333L14.3054 214.012C38.3235 264.837 90.0554 300 150 300ZM11.9271 208.715C4.24872 190.682 0 170.837 0 150C0 67.1573 67.1573 0 150 0C194.425 0 234.339 19.3125 261.805 49.9999H150L125 216.667L100 150L11.9271 208.715Z" fill="#111111" />
	                </svg>
	                <!-- #endregion -->
	            </div>
	        </div>
	        
	        <div id="joinPage1" class="m_userLogin_main">
	            <div class="m_userLogin_main_subtitle">Root의 모든 서비스에 사용하는 계정입니다.</div>
	            <div class="m_userLogin_main_loginbtnregion">
	                <div id="nextPage" class="m_userLogin_main_loginbtn">로그인</div>
	            </div>
	        </div>
	        <!-- #endregion -->
	
	        <!-- #region 패아자2 -->
	        <div id="joinPage2" class="m_userLogin_2page">
	            <div class="m_userLogin_2title">Root ID</div>
	            <div class="m_userLogin_2subtitle">나의 Root 계정 관리</div>
	            
	            <div class="m_userLogin_2loginre">
	                <form name="buyerLogin" method="post" action="buyerLoginProcess.do">
	                    <div class="m_userLogin_buyerEmailRegion">
	                        <div class="_inputRegion" id="emailRegion">
	                                <input placeholder=" " type="email" name="b_email" class="" id="emailInput">
	                                <span class="" id="emailTitle">이메일</span>
	                            <div class="arrow_small" id="emailArrowSmall"></div>
	                        </div>
	                    </div>
	                    
	                    <div class="_inputRegion1" id="pwRegion">
	                            <input placeholder=" " type="password" name="b_pw" class="" id="pwInput">
	                            <span class="" id="pwTitle">암호</span>
	                        <label>
	                            <div class="arrow_small" id="pwArrowSmall"></div>
	                            <input type="submit" class="m_userLogin_submit" id="loginSubmit" disabled="disabled">
	                        </label>
	                    </div>
	                    
	                    <div class="m_userLogin_buyerIDSmg" id="buyerIDSmg"></div>
	                 </form>
	            </div>
	
	            <div class="m_userLogin_2seletatag">
	                <a href="${pageContext.request.contextPath}/seller/sellerLogin.do" class="m_userLogin_2entuser">기업 회원입니다.</a>
	                <a href="${pageContext.request.contextPath}/buyer/findPw.do" class="m_userLogin_2pwblive">암호를 잊으셨나요?</a>
	            </div>
	        </div>
	        <!-- #endregion -->
        </section>
    </div>
    
    <footer>
		<%@ include file="../common/global_footer.jsp"%>
	</footer>

</body>

</html>