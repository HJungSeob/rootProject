<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Root account | findPassword</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/global.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buyer/user/buyerFindPw.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/telAutoHyphen.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/buyer/user/buyerFindPw.js"></script>
	
	<script>
	    $(function(){
	        $("#findBtn").click(function(e){
	            var formData = $("form[name='buyerFindPW']").serialize();
	
	            $.ajax({
	                url: "${pageContext.request.contextPath}/buyer/findPwProcess.do",
	                type: "POST",
	                data: formData,
	                success: function(result) {
	                    alert(result);
	                },
	            });
	
	            e.preventDefault();
	        });
	    });
	</script>
</head>

<body>
    <div class="warp">
        <header>

        </header>
        <section>
            <div class="m_buyerFindPw_header1">
                <div class="m_buyerFindPw_header">
                    <div class="m_buyerFindPw_header_acc">Root ID</div>
                    <div class="m_buyerFindPw_loar">
                        <a href="${pageContext.request.contextPath}/buyer/buyerLogin.do" class="m_buyerFindPw_logout">
                        	로그인
                            <div class="arrow_small a12"></div>
                        </a>
                    </div>
                </div>
            </div>
            <div class="_hr"></div>
            <form name="buyerFindPW" method="post" action="findPwProcess.do">
                <div class="m_buyerFindPw_findPage1" id="findPage1">
                    <div class="m_buyerFindPw_findPwTitle">암호 재설정</div>
                    <div class="m_buyerFindPw_findPwSubTitle">계속하려면 계정에서 사용하는 전화번호를 입력하십시오.</div>
                    <div class="m_buyerFindPw_telRegion" id="telRegion">
                        <label>
                            <input type="tel" name="b_tel" class="m_buyerFindPw_telInput" id="telInput" maxlength="13">
                            <div class="m_buyerFindPw_teltitle" id="telTitle">전화번호</div>
                        </label>
                    </div>
                    <div class="m_buyerFindPw_nextRegion">
                        <div class="m_buyerFindPw_nextBtn" id="nextBtn">다음</div>
                    </div>
                </div>

                <div class="m_buyerFindPw_findPage2" id="findPage2">
                    <div class="m_buyerFindPw_findPwTitle">이메일를 입력해 주세요</div>
                    <div class="m_buyerFindPw_emailRegion" id="emailRegion">
                        <label>
                            <input type="email" name="b_email" class="m_buyerFindPw_emailInput" id="emailInput">
                            <div class="m_buyerFindPw_emailTitle" id="emailTitle">이메일 주소</div>
                        </label>
                    </div>
                    <div class="m_buyerFindPw_submitRegion">
                        <div class="m_buyerFindPw_returnBtn" id="returnBtn">취소</div>
                        <label>
                            <div class="m_buyerFindPw_submitBtn">확인</div>
                            <input type="submit" class="m_buyerFindPw_submit" id="findBtn">
                        </label>
                    </div>
                </div>
            </form>
        </section>
    </div>
    <footer>

    </footer>
</body>

</html>