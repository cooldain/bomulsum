<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 회원가입</title>
</head>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<link rel="stylesheet"
	href="<c:url value='/vendor/fontawesome-free/css/all.css' />">
<style type="text/css">
#wrapper {
	font-family: 'Nanum Barun Gothic', sans-serif;
	min-width: 100%;
	max-width: 100%;
	margin-top: 3%;
	font-size: 12px;
}

#content {
	margin-top: 2%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

#login_SNS {
	width: 450px;
	display: flex;
	flex-direction: column;
	flex: 1 1 0;
	margin-top: 2%;
	justify-content: center;
	align-items: center;
	postition: relative;
	border-top: 1px solid gray;
}

#login_Email {
	width: 450px;
	display: flex;
	flex-direction: column;
	flex: 1 1 0;
	margin-top: 2%;
	justify-content: center;
	align-items: center;
	postition: relative;
	border-top: 1px solid gray;
}

#kakao-login-btn img {
	width: 100%;
}

#otherMethod{
	border:1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor : pointer;
	width: 30%; 
	max-height:20px; 
	font-size:8pt;
	background-color:white
}

#otherMethod:hover{
	background-color:#f5f5f5;
}

input[type=button]{
	border:1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor : pointer;
}

#iconArea {
	width:30%;
	position: relative;
	border-top: 1px solid #aaa;
	padding:0;
	text-align: center;
}

#iconArea li {
	position: relative;
	display: inline-block;
	top: -20px;
	z-index: 10;
	width: 40px;
    height: 40px;
    line-height: 40px;
    text-align:center;
    font-size: 14px;
    border-radius: 20px;
    text-align: -webkit-match-parent;
   
}

.is_active{
   color: #fff;
   border-color: #1f76bb;
   background: #1f76bb;
   right: 25%;
}

.right_active{
	background: #fff;
    color: #999;
    border: 1px solid #999;
	left: 30%;
}

</style>
<body>
	<div id="wrapper">
		<div id="content">
			<img id="toHome" src="<c:url value='/resources/img/MainLogo.png'/>" style="width: 150px; height: 150px;cursor : pointer;">
			<section id="login_SNS">
				<h4 style="padding: 0px 15px; background-color: white; margin: 0; top: -10px; position: relative">
					정말 간단한 회원가입하기
				</h4>
				
				<div style="display: flex; flex: 1 1 0%; flex-flow: column wrap; width: 100%; margin-bottom:1%; margin-top:5%">
            		
            		<div style="display: flex; justify-content: center; height:30px" >
            			<ul id="iconArea">
            				<li class="is_active">1</li>
            				<li class="right_active">2</li>
            			</ul>
            		</div>
            		
            		<div style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-bottom:4%">
            			<h3>회원가입 방법 선택하기</h3>
            		</div>
            	
            		<%-- <div style="display: flex; flex-direction: row; justify-content: center; height:50px;"> 
						<img id="kakao-login-btn" src="<c:url value='/resources/img/kakao_login_large_wide.png'/>" style="width: 90%; height:100%;cursor : pointer;">
					</div>
					<a href="http://developers.kakao.com/logout"></a> --%>
            		
            		<!-- <div id="otherMethodArea" style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-top:2%"> 
            			<button id="otherMethod">다른 방법으로 가입하기</button>
            		</div> -->
            		
            		<div id="allMethod" style="display: flex; flex-direction: column; margin-bottom:3%">
            			<input style="width: 100%; padding: 3% 0; margin-bottom:2%; border:2px solid #1f76bb; 
            				background-color:white; color:#1f76bb; font-weight:bold" type="button" value="이메일로 가입하기" onclick="location.href='newAccountEmail.do'"/>
            		</div>
            		
            		<div style="display:flex; justify-content:center; height:50px;margin: 3%;">
            			<p>
            				<a>이미 가입하셨다면</a>
            				<a href="login.do" style="color: black">바로 로그인하기</a>
            			</p>
            		</div>
            		
            	</div>
				
				
				

			</section>
		</div>
	</div>
</body>


<script src="<c:url value='/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/>"></script>


<script>
    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('ce0c9f8553e32b9149185202978c0507');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
            alert(JSON.stringify(authObj));
        },
        fail: function (err) {
            alert(JSON.stringify(err));
        }
    });
    
    $(function(){
    	$("#kakao-login-btn").css({
        	"width":"100%"
        });
    });
    
    //]]>
    
    $(function(){
    	$("#toHome").click(function(event){ // 로고 이미지 클릭 시.
    		location.href="/bomulsum/home.do";
    	});
    	
    	
    	
    	$("#otherMethod").click(function(event){
    		$("#otherMethodArea").css("display", "none");
    		$("#allMethod").css("display","flex");
    	});
    	
    });
    
</script>
</html>