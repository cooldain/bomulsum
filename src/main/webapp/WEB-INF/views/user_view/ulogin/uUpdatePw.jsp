<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 아이디 비밀번호 찾기</title>
</head>
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

#otherMethod {
	border: 1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor: pointer;
	width: 30%;
	max-height: 20px;
	font-size: 8pt;
	background-color: white
}

#otherMethod:hover {
	background-color: #f5f5f5;
}

input[type=button] {
	border: 1px solid gray;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor: pointer;
}

#iconArea {
	width: 30%;
	position: relative;
	border-top: 1px solid #aaa;
	padding: 0;
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
	text-align: center;
	font-size: 14px;
	border-radius: 20px;
	text-align: -webkit-match-parent;
}

.is_active {
	background: #fff;
	color: #999;
	border: 1px solid #999;
	right: 25%;
}

.right_active {
	color: #fff;
	border-color: #1f76bb;
	background: #1f76bb;
	left: 30%;
}

.btn-disabled {
    background: #eee !important;
    color: #aaa !important;
    border: 1px solid #ddd !important;
    cursor: default !important;
    outline: none;
}

.btn-abled{
	cursor: pointer !important;
	outline: none;
}

.btn-abled:hover{
	background-color: #1f76bb;
	color: white;
	border: 0;
}

#createAccountButton{
	border:1px solid #1f76bb;
	background-color:#1f76bb;
	color:white;
}

#createAccountButton:hover{
	border:1px solid #d9d9d9;
	background-color: white;
	color: #1f76bb;
}

#createAccountButton:focus { outline:none; }

input:focus{ outline:none; }

#member_IMG_box{
	display: flex;
    width: 100%;
    height: 150px;
    justify-content: center;
    align-items: center;
}

#member_IMG{
	width:150px;
	height:150px;
	display:flex;
	justify-content: center;
    align-items: center;
}

#member_IMG img{
	width:100px;
	height:100px;
	border-radius:50%;
}

#member_info{
	display:flex;
	justify-content:center;
	align-items: center;
	flex-direction: column;
	margin-bottom: 30px;
	text-align: justify;
    text-align-last: center;
}

#member_info a{
	font-weight: bold;
}

#pw_alert_div{
	display:flex;
	justify-content:center;
	align-items: center;
	flex-direction: column;
	margin-bottom: 30px;
	padding: 20px 0;
    background-color: #efefef;
}

#pw_alert_div span:nth-child(1){
	font-weight:bold;
    margin-bottom: 5px;
}

.buttonDIV{
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.buttonDIV span{
	cursor:pointer;
	width: 30%;
    padding: 15px 0px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 1%;
    border-radius: 8px;
}

#to_home{
	background-color: white;
	border:1px solid #1f76bb;
	color:#1f76bb;
}

#to_home:hover{
	
}

#to_newAccount{
	background-color:#1f76bb;
	color:white;
}

</style>
<body>
	<div id="wrapper">
		<div id="content">
			<img id="toHome"
				src="<c:url value='/resources/img/MainLogo.png'/>"
				style="width: 150px; height: 150px; cursor: pointer;">
			<section id="login_SNS">
			<c:if test="${not empty data }">
				<h2 style="padding: 0px 15px; background-color: white; margin: 0; top: -10px; position: relative; font-weight:normal; color:#666">
					계정 확인 완료</h2>

				<div style="display: flex; flex: 1 1 0%; flex-flow: column wrap; width: 100%; margin-bottom: 1%; margin-top: 5%">

					<div style="display: flex; flex-direction: column; justify-content: center; font-size:15px">
						<input type="hidden" value="${data.memberName }" id="name" />
						<input type="hidden" value="${data.memberEmail }" id="email" />
						<input type="hidden" value="${data.phone }" id="phone" />
						<div id="member_IMG_box">
							<div id="member_IMG">
								<img src="/bomulsum/resources/img/dog.jpg">
							</div>
						</div>
						
						<div id="member_info">
							<span style="margin-bottom: 5px;"><a>${data.memberName }</a> 님 안녕하세요.</span>
							<span>이전에 사용한 <a>${data.memberEmail }</a> 계정 확인이 완료되었습니다.</span>
						</div>
						
						<div id="pw_alert_div">
							<span>[안전한 비밀번호 설정하기]</span>
							<span>영문(대문자)+숫자+특수문자 8자 이상</span>
						</div>
						
						<!-- 비밀번호 입력 창 -->
						<div style="margin-bottom: 2%;height:20px">
							<a style="font-weight:bold; font-size:14px;">비밀번호</a>
						</div>
						<input class="pwFail" type="password" style="padding-left:2%; min-height:40px; max-height:40px; margin-bottom:2%; ime-mode:disabled;" placeholder="비밀번호 (영문(대문자)+숫자+특수문자 8자 이상)">
						<a id="pwFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:3%;">필수 항목입니다.</a>
						<input class="pwCheckFail" type="password" style="padding-left:2%; min-height:40px; max-height:40px; margin-bottom:5%; ime-mode:disabled;" placeholder="비밀번호 확인">
						<a id="pwCheckFail" style="display:none; color:#d8524a; font-size:12px;  margin-bottom:5%;">필수 항목입니다.</a>
						
						
						<!-- 회원가입 버튼 -->
						<input id="createAccountButton" type="button" style="padding-left:2%; min-height:40px; max-height:40px; margin-bottom:5%; margin-top: 4%;" value="비밀번호 변경 후 로그인">
						
						
						
					</div>


				</div>
			</c:if>
			<c:if test="${empty data }">
				<h2 style="padding: 0px 15px; background-color: white; margin: 0; top: -10px; position: relative; font-weight:normal; color:#666">
					계정 확인 실패</h2>
				<span style="font-size: 14px;font-weight: bold;">회원가입을 한 적이 없어요.</span>
				<div style="width: 100%;display: flex;margin-bottom: 15px;margin-top: 15px;flex-direction: column;justify-content: center;align-items: center;color: #666;font-weight: initial;font-size:14px;">
					<span>${phone}는 회원 가입한 적이 없습니다.</span>
					<span>지금 바로 회원 가입하시겠습니까?</span>
				</div>
				<div class="buttonDIV">
					<span id="to_home">홈으로</span>
					<span id="to_newAccount">회원 가입하기</span>
				</div>
			</c:if>



			</section>
		</div>
	</div>
</body>


<script
	src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
<script
	src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
	
<!-- iamport.payment.js 휴대폰 인증 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
var test;
var phoneCheck = false;


	$(function(){
		$("#to_home").on('click', function(){
			location.href='/bomulsum/home.do';
		});
		
		$("#to_newAccount").on('click', function(){
			location.href='/bomulsum/user/newAccount.do';
		});
		
		
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		
		$(".pwFail").keyup(function(){
			if($(".pwFail").val().length != 0){
				$(".pwFail").css("letter-spacing","10px");
			}else{
				$(".pwFail").css("letter-spacing","0");
			}
		});
		
		$(".pwCheckFail").keyup(function(){
			if($(".pwCheckFail").val().length != 0){
				$(".pwCheckFail").css("letter-spacing","10px");
			}else{
				$(".pwCheckFail").css("letter-spacing","0");
			}
		});
		
		
		
	});
	
	
	
	$(function(){
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		
		
		$(".pwFail").focus(function(){ // 비밀번호 입력창
			$(".pwFail").css("border", "1px solid #21a1a9");
		});
		var pwF = function(){ 
			if($(".pwFail").val().length == 0){ // 값 비어있음
				$(".pwFail").css("border", "1px solid #d8524a");
				$("#pwFail").css("display", "block");
				$("#pwFail").text("필수 항목입니다.");
				$(".pwFail").css("margin-bottom","2%");
			}else{
				if(false === regPw.test($(".pwFail").val())){ // 비밀번호 정규식 일치하지 않음.
					$(".pwFail").css("border", "1px solid #d8524a");
					$("#pwFail").css("display", "block");
					$("#pwFail").text("영문(대문자), 숫자, 특수문자를 조합한 8자 이상의 비밀번호를 입력해주세요.");
					$(".pwFail").css("margin-bottom","2%");
				}else{ // 전부 통과
					$(".pwFail").css("border", "1px solid gray");
					$("#pwFail").css("display", "none");
					$(".pwFail").css("margin-bottom","2%");
					pw = true;
				}
				
			}
		}
		$(".pwFail").blur(pwF);
		
		
		
		$(".pwCheckFail").focus(function(){ // 비밀번호 입력창
			$(".pwCheckFail").css("border", "1px solid #21a1a9");
		});
		var pwCheckF = function(){
			if($(".pwCheckFail").val().length == 0){ // 값이 비어있을경우
				$(".pwCheckFail").css("border", "1px solid #d8524a");
				$("#pwCheckFail").css("display", "block");
				$("#pwCheckFail").text("필수 항목입니다.");
				$(".pwCheckFail").css("margin-bottom","2%");
			}else{
				if($(".pwFail").val() == $(".pwCheckFail").val()){ // 비밀번호 일치
					$(".pwCheckFail").css("border", "1px solid gray");
					$("#pwCheckFail").css("display", "none");
					$(".pwCheckFail").css("margin-bottom","2%");
					pwCheck = true;
				}else{ // 비밀번호 다를경우
					$(".pwCheckFail").css("border", "1px solid #d8524a");
					$("#pwCheckFail").css("display", "block");
					$("#pwCheckFail").text("같은 값을 다시 입력하세요.");
					$(".pwCheckFail").css("margin-bottom","2%");
				}
			}
		} 
		$(".pwCheckFail").blur(pwCheckF);
		
		
		$("#createAccountButton").on('click', function(){
			pwF();
			pwCheckF();
			if(pw && pwCheck){
				$.ajax({
					url:'/bomulsum/user/updatePW.do',
					type:'post',
					data:{
						chPw:$(".pwFail").val(),
						name:$("#name").val(),
						email:$("#email").val(),
						phone:$("#phone").val()
					},
					success:function(){
						alert('비밀번호가 성공적으로 변경되었습니다.');
						location.href="/bomulsum/user/login.do";
					},
					error:function(e){
						alert('서버오류로 실패했습니다. 다시 시도해주시기 바랍니다.');
					}
				});
			}else{
				alert('비밀번호를 확인해주세요');
			}
			
		});
		
		
		$("#toHome").click(function(event){ // 로고 이미지 클릭 시.
    		location.href="/bomulsum/home.do";
    	});
		
		
	});
	
	
</script>

</html>