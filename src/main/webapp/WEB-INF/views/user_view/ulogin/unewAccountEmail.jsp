<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 회원가입</title>
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

#createAccountButton:hover{
	background-color: #1f76bb;
	color: white;
}

#createAccountButton:focus { outline:none; }

input:focus{ outline:none; }
</style>
<body>
	<div id="wrapper">
		<div id="content">
			<img id="toHome"
				src="<c:url value='/resources/img/MainLogo.png'/>"
				style="width: 150px; height: 150px; cursor: pointer;">
			<section id="login_SNS">
				<h4 style="padding: 0px 15px; background-color: white; margin: 0; top: -10px; position: relative">
					정말 간단한 회원가입하기</h4>

				<div style="display: flex; flex: 1 1 0%; flex-flow: column wrap; width: 100%; margin-bottom: 1%; margin-top: 5%">

					<div style="display: flex; justify-content: center; height: 30px">
						<ul id="iconArea">
							<li class="is_active">1</li>
							<li class="right_active">2</li>
						</ul>
					</div>

					<div style="display: flex; flex-direction: row; justify-content: center; height: 50px; margin-bottom: 4%">
						<h3>가입 정보 입력하기</h3>
					</div>

					<div style="display: flex; flex-direction: column; justify-content: center; font-size:15px">
					
						<!-- 이메일 입력 창 -->
						<div style="margin-bottom:2%; height:20px;">
							<a style="color:red; margin-right:1%;">*</a><a>이메일</a>
						</div>
						<input class="emailFail" type="text" style="padding-left:2%;height:40px; margin-bottom:5%;" placeholder="이메일을 입력해주세요.">
						<a id="emailFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:5%;">필수 항목입니다.</a>
						
						<!-- 비밀번호 입력 창 -->
						<div style="margin-bottom: 2%;height:20px">
							<a style="color:#d8524a;margin-right:1%">*</a><a>비밀번호</a>
						</div>
						<input class="pwFail" type="password" style="padding-left:2%; height:40px; margin-bottom:2%; ime-mode:disabled;" placeholder="비밀번호 (영문(대문자)+숫자+특수문자 8자 이상)">
						<a id="pwFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:3%;">필수 항목입니다.</a>
						<input class="pwCheckFail" type="password" style="padding-left:2%; height:40px; margin-bottom:5%; ime-mode:disabled;" placeholder="비밀번호 확인">
						<a id="pwCheckFail" style="display:none; color:#d8524a; font-size:12px;  margin-bottom:5%;">필수 항목입니다.</a>
						
						<!-- 이름 입력 창 -->
						<div style="margin-bottom:2%; height:20px;">
							<a style="color:#d8524a; margin-right:1%;">*</a><a>이름</a>
						</div>
						<input class="nameFail" type="text" style="padding-left:2%; height:40px; margin-bottom:5%;" placeholder="이름을 입력해주세요.">
						<a id="nameFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:5%;">필수 항목입니다.</a>
						
						
						<!-- 전화번호 입력 창 -->
						<div style="margin-bottom:2%; height:20px;">
							<a style="color:#d8524a; margin-right:1%;">*</a><a>전화번호</a>
						</div>
						<div style="width:100%;  display: flex; flex-direction: row; height:50px; margin-bottom:1%;">
							<input class="phoneFail" type="text" style="padding-left:2%; height:40px; width:70%; margin-right:1%" placeholder="010-1234-5678">
							<button id="phoneBtn" class="btn-disabled" style="width:30%; height:46px;" disabled>인증요청</button>
						</div>
						<div id="phoneCertification" style="width:100%;  display: none; flex-direction: row; height:50px; margin-bottom:1%;">
							<div class="inputCertification" style="display: flex; border:1px inset black; flex-direction: row; height:40px; width:70%; margin-right:1%;">
								<input id="inputCertificationNum"  maxlength="6" type="text" style="border:0; padding-left:2%; width:80%; height:38px;" placeholder="인증코드를 입력해주세요.">
								<div id="time_limit" style="width:20%; height:40px; color:#d8524a; text-align:right; padding-top: 3%; padding-right:2%"></div>
							</div>
							<button id="inputCertificationButton" class="btn-abled" style="width:29%; height:43px;">확인</button>
						</div>
						<a id="phoneFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:5%;">필수 항목입니다.</a>
						
						
						<!-- 추천인 코드 --> 
						<div style="margin-bottom:2%; height:20px;">
							<a>추천인코드</a>
						</div>
						<input id="friendCode" type="text" style="padding-left:2%; height:40px; margin-bottom:4%;" placeholder="선택사항">
						
						<!-- 사용자 동의 여부 -->
						<div style="border-bottom:1px solid gray;font-weight:bold; padding-bottom:2%; margin-bottom:3%; display: flex; flex-direction: row;">
							<input type="checkbox" id="agreeAll" style="margin-right:2%" checked>
							<label>모두 동의합니다.</label>
						</div>
						
						<!-- 이용약관 -->
						<div style="display: flex; flex-direction: row; font-weight:bold; margin-bottom:1%;">
							<input type="checkbox" id="usePolicy" style="margin-right:2%" checked>
							<a href="#" style="text-decoration:none; color:black">이용약관 필수 동의</a>
						</div>
						
						<!-- 개인정보 -->
						<div style="display: flex; flex-direction: row; font-weight:bold; margin-bottom:1%;">
							<input type="checkbox" id="userInfo" style="margin-right:2%" checked>
							<a href="#" style="text-decoration:none; color:black">개인정보 처리방침 필수 동의</a>
						</div>
						
						<!-- 쿠폰/이벤트 -->
						<div style="display: flex; flex-direction: row; font-weight:bold; margin-bottom:5%; border-bottom:1px solid gray; padding-bottom:3%">
							<input type="checkbox" id="couponEvent" style="margin-right:2%" checked>
							<label id="couponLabel" style="cursor:pointer">
								쿠폰 / 이벤트 알림 선택 동의
								<br>
								<span style="color:#999; font-weight: normal">
									 SMS, 이메일을 통해 쿠폰 및 이벤트 정보를 받아보실 수 있습니다.
								</span>
							</label>
						</div>
						
						<!-- 회원가입 버튼 -->
						<input id="createAccountButton" type="button" style="padding-left:2%; height:40px; margin-bottom:5%; " value="회원가입하기">
						<div style="display: flex; justify-content: center; font-size:13px; font-weight:bold">
							<a>단, 14세 미만은 회원가입할 수 없습니다.</a>
						</div>
						
						
						
					</div>


				</div>




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
var timerID;
var time = 119;
function toMinSec(t){
	var hour;
	var min;
	var sec;
	
	hour = Math.floor(t / 3600);
	min = Math.floor((t-(hour*3600)) / 60);
	sec = t  - (hour*3600) - (min * 60);
	
	if(min < 10) min = "0" + min;
	if(sec < 10) sec = "0" + sec;
	
	return(min + ":" + sec);
}

function decrementTime(){
	var x1 = document.getElementById("time_limit");
	x1.innerHTML = toMinSec(time);
	
	if(time > 0) time--;
	else{
		clearInterval(timerID);
		
		// 시간 만료시.
		alert("인증 시간이 만료되었습니다.");
		$("#phoneCertification").css("display", "none");
		$("#phoneBtn").removeClass('btn-disabled');
		$("#phoneBtn").addClass('btn-abled');
		$("#phoneBtn").attr("disabled", false);
		$(".phoneFail").attr('readonly', false);
		time = 119;
	}
}

function start_timer(){
	timerID = setInterval("decrementTime()", 1000);
}


	$(function(){
		
		$("#phoneBtn").click(function(){ // 핸드폰 인증 모듈.
			const randNum = String(Math.floor(Math.random() * 10))
				+ String(Math.floor(Math.random() * 10))
				+ String(Math.floor(Math.random() * 10))
				+ String(Math.floor(Math.random() * 10))
				+ String(Math.floor(Math.random() * 10))
				+ String(Math.floor(Math.random() * 10)); // 6자리 랜덤 수 발생
			console.log(randNum);
			
			var receiveNum = $(".phoneFail").val().replace(/-/gi,''); // 보낼 전화번호.
			console.log(receiveNum)
			var sendMsg = "[보물섬] 본인확인 인증번호 (" + randNum + ")입력시 정상처리 됩니다.";
			
			
			$.ajax({
				url : "/bomulsum/user/smsCheck.do",
				//?msg=" + sendMsg + "&receiver=" + receiveNum
				data : {
					msg : sendMsg,
					receiver : receiveNum
				},
				type:'get',
				success : function(){
					var msgNumCheck = 0;
					$("#phoneCertification").css("display", "flex");
					$("#phoneBtn").removeClass('btn-abled');
					$("#phoneBtn").addClass('btn-disabled');
					$("#phoneBtn").attr("disabled", true);
					$(".phoneFail").attr('readonly', true);
					start_timer();
					$("#inputCertificationButton").click(function(){
						if($("#inputCertificationNum").val() != randNum){ // 인증 실패시
							msgNumCheck++;
							if(msgNumCheck == 5){
								alert("제한 횟수 초과입니다. 다시 입력해주시기 바랍니다.");
								$("#phoneCertification").css("display", "none");
								$("#phoneFail").css("display","none");
								$(".phoneFail").val('');
								$(".phoneFail").focus();
								$(".phoneFail").attr('readonly', false);
								$("#inputCertificationNum").val('');
								clearInterval(timerID);
								time = 119;
								return;
							}else{
								$("#phoneFail").css("display", "block");
								$("#phoneFail").text(msgNumCheck + "회 오류입니다!!(제한 : 5)");
							}
						}else{ // 인증 성공시
							alert("인증에 성공했습니다.");
							clearInterval(timerID);
							$(".phoneFail").attr('readonly', true);
							$(".phoneFail").css("border", '1px solid #21a1a9');
							$(".phoneFail").css("color", '#21a1a9');
							$("#phoneBtn").attr('disabled', true);
							$(".inputCertification").css("border",'1px solid #21a1a9');
							$("#inputCertificationNum").attr("readonly", true);
							$("#inputCertificationNum").css("color",'#21a1a9');
							$("#inputCertificationButton").addClass('btn-disabled');
							$("#inputCertificationButton").removeClass('btn-abled');
							$("#inputCertificationButton").attr("disabled", true);
							$("#phoneFail").css("display", "none");
							
							
							$(".phoneFail").off();
							$("#phoneBtn").off();
							$("#inputCertificationNum").off();
							phoneCheck = true;
						}
					});
					
					/*
					if(result != randNum){
						msgNumCheck++;
						alert("인증에 실패했습니다(" + msgNumCheck + " 회).");
					}else{
						alert("인증에 성공했습니다.");
						msgNumCheck = 0;
						$(".phoneFail").attr('readonly', true);
						$("#phoneBtn").attr('disabled', true);
						$("#phoneBtn").css("background-color","#1f76bb");
						$("#phoneBtn").css("color","white");
						$("#phoneBtn").css("border","0");
						phoneCheck = true;
					}
					*/
				},
				error : function(){
					console.log("전송 실패")
				}
			});
			
			
			
			
			/*
			// 핸드폰 본인인증 모듈 
			// Coolsms SDK For JAVA 메이븐 추가.(2.2); 라이브러리 다운.
			const { config, Group } = require('coolsms-node-sdk')

			// 인증을 위해 발급받은 본인의 API Key를 사용합니다.
			const apiKey = 'NCSRZ9EUI4F5PIVX'
			const apiSecret = 'KANEQZYC68WB7STQ6PCEIYQDC3MYVP2N'
			config.init({ apiKey, apiSecret })
			async function send (params = {}) {
			  try {
			    const response = await Group.sendSimpleMessage(params)
			    console.log(response)
			  } catch (e) {
			    console.log(e)
			  }
			}

			const params = {
			  text: '[보물섬] 본인확인 인증번호 (' + randNum + ')입력시 정상처리 됩니다.', // 문자 내용
			  type: 'SMS', // 발송할 메시지 타입 (SMS, LMS, MMS, ATA, CTA)
			  to: receiveNum, // 수신번호 (받는이)
			  from: '01036292628' // 발신번호 (보내는이)
			}
			send(params);
			*/
			
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
		
		$(".phoneFail").keyup(function(key){
			$(this).val($(".phoneFail").val().replace(/-/gi,''));
			test = $(this).val();
			
			if($(".phoneFail").val().length == 10){
				$(".phoneFail").val(test.substring(0,3).concat('-') + test.substring(3,6).concat('-') + test.substring(6));
				$("#phoneBtn").removeClass('btn-disabled');
				$("#phoneBtn").addClass('btn-abled');
				$("#phoneBtn").removeAttr('disabled');
			}else if($(".phoneFail").val().length == 11){
				$(".phoneFail").val(test.substring(0,3).concat('-') + test.substring(3,7).concat('-') + test.substring(7));
				$("#phoneBtn").removeClass('btn-disabled');
				$("#phoneBtn").addClass('btn-abled');
				$("#phoneBtn").removeAttr('disabled');
			}else if($(".phoneFail").val().length > 11){
				$(".phoneFail").val(test.substring(0, 11));
				var test2 = $('.phoneFail').val();
				console.log(test2);
				$(".phoneFail").val(test2.substring(0,3).concat('-') + test2.substring(3,7).concat('-') + test2.substring(7));
			}else{
				$("#phoneBtn").removeClass('btn-abled');
				$("#phoneBtn").addClass('btn-disabled');
				$("#phoneBtn").attr("disabled", true);
			}
		});
		
	});
	
	
	
	$(function(){
		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var regPhone = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
		var email = false;
		var emailCheck = 0;
		var pw = false;
		var pwCheck = false;
		var name = false;
		var phone = false;
		
		$("#inputCertificationNum").focus(function(){
			$(".inputCertification").css("border", "1px solid #21a1a9");
		});
		
		$("#inputCertificationNum").blur(function(){
			$(".inputCertification").css("border", "1px inset black");
		});
		
		var dbEmailCheck = function(){
			$.ajax({
				type:"GET",
				url:'checkEmail.do',
				data:{
					"memberEmail" : $(".emailFail").val()
				},
				success:function(data){
					console.log(data);
					emailCheck = data;
				},
				error:function(data){
					emailCheck = data;
				}
			});
		};
		
		
		$(".emailFail").focus(function(){ // 이메일 입력창
			$(".emailFail").css("border", "1px solid #21a1a9");
		});
		var emailF = function(){
			if($(".emailFail").val().length == 0){ // 값 비어잇음
				$(".emailFail").css("border", "1px solid #d8524a");
				$("#emailFail").css("display", "block");
				$("#emailFail").text("필수 항목입니다.");
				$(".emailFail").css("margin-bottom","2%");
				email = false;
			}else{
				if(!regEmail.test($(".emailFail").val())){ // 이메일 유효성 검사
					$(".emailFail").css("border", "1px solid #d8524a");
					$("#emailFail").css("display", "block");
					$("#emailFail").text("유효하지 않은 E-Mail주소입니다.");
					$(".emailFail").css("margin-bottom","2%");
					email = false;
				}else if(emailCheck == 1){
					$(".emailFail").css("border", "1px solid #d8524a");
					$("#emailFail").css("display", "block");
					$("#emailFail").text("이미 존재하는 이메일입니다.");
					$(".emailFail").css("margin-bottom","2%");
					email = false;
				}else{
					$(".emailFail").css("border", "1px solid gray");
					$("#emailFail").css("display", "none");
					$(".emailFail").css("margin-bottom","5%");
					email = true;
				}
			}
		}
		$(".emailFail").blur(function(){
			dbEmailCheck();
		});
		$(".emailFail").keyup(function(){
			dbEmailCheck();
			if(emailCheck == 1){
				$(".emailFail").css("border", "1px solid #d8524a");
				$("#emailFail").css("display", "block");
				$("#emailFail").text("이미 존재하는 이메일입니다.");
				$(".emailFail").css("margin-bottom","2%");
				email = false;
			}
		});
		$(".emailFail").blur(emailF);
		
		
		
		
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
		
		
		$(".nameFail").focus(function(){ // 이름 입력창
			$(".nameFail").css("border", "1px solid #21a1a9");
		});
		var nameF = function(){
			if($(".nameFail").val().length == 0){ // 값 비어있을경우
				$(".nameFail").css("border", "1px solid #d8524a");
				$("#nameFail").css("display", "block");
				$(".nameFail").css("margin-bottom","2%");
			}else{
				$(".nameFail").css("border", "1px solid gray");
				$("#nameFail").css("display", "none");
				$(".nameFail").css("margin-bottom","5%");
				name = true;
			}
		}
		$(".nameFail").blur(nameF);
		
		
		$(".phoneFail").focus(function(){ // 전화번호 입력창
			$(".phoneFail").css("border", "1px solid #21a1a9");
		});
		var phoneF = function(){
			var trans_num = $(".phoneFail").val().replace(/-/gi,'');
			
			if(trans_num == 0){ // 값 비어있을경우
				$(".phoneFail").css("border", "1px solid #d8524a");
				$("#phoneFail").css("display", "block");
				$("#phoneFail").text("필수 항목입니다.");
				$(".phoneFail").css("margin-bottom","2%");
				$("#phoneBtn").removeClass('btn-abled');
				$("#phoneBtn").addClass('btn-disabled');
				$("#phoneBtn").attr("disabled", true);
			}else{
				if(!regPhone.test(trans_num)){ // 유효성 검사
					$(".phoneFail").css("border", "1px solid #d8524a");
					$("#phoneFail").css("display", "block");
					$("#phoneFail").text("휴대폰 번호만 입력할 수 있습니다.");
					$(".phoneFail").css("margin-bottom","2%");
					$("#phoneBtn").removeClass('btn-abled');
					$("#phoneBtn").addClass('btn-disabled');
					$("#phoneBtn").attr("disabled", true);
				}else{ // 전부 통과
					$(".phoneFail").css("border", "1px solid gray");
					$("#phoneFail").css("display", "none");
					$(".phoneFail").css("margin-bottom","5%");
					$("#phoneBtn").removeClass('btn-disabled');
					$("#phoneBtn").addClass('btn-abled');
					$("#phoneBtn").removeAttr('disabled');
					phone = true;
				}
			}
		}
		$(".phoneFail").blur(phoneF);
		
		
		// 동의 체크박스 로직
		//couponEvent usePolicy userInfo agreeAll
		
		$("#agreeAll").click(function(){
			var chk = $(this).is(":checked");
			if(chk) {
				$("#userInfo").prop("checked", true);
				$("#usePolicy").prop("checked", true);
				$("#couponEvent").prop("checked", true);
			}else{
				$("#userInfo").prop("checked", false);
				$("#usePolicy").prop("checked", false);
				$("#couponEvent").prop("checked", false);
			}
		});
		
		$("#userInfo").click(function(){
			if(!$(this).is(":checked")){
				$("#agreeAll").prop("checked", false);
				return;
			}
			if($("#usePolicy").is(":checked") && $("#couponEvent").is(":checked")){
				$("#agreeAll").prop("checked", true);
			}
		});
		
		$("#usePolicy").click(function(){
			if(!$(this).is(":checked")){
				$("#agreeAll").prop("checked", false);
				return;
			}
			if($("#userInfo").is(":checked") && $("#couponEvent").is(":checked")){
				$("#agreeAll").prop("checked", true);
			}
		});
		
		$("#couponEvent").click(function(){
			if(!$(this).is(":checked")){
				$("#agreeAll").prop("checked", false);
				return;
			}
			if($("#usePolicy").is(":checked") && $("#userInfo").is(":checked")){
				$("#agreeAll").prop("checked", true);
			}
		});
		
		$("#couponLabel").click(function(){
			if($("#couponEvent").is(":checked")){
				$("#couponEvent").prop("checked", false);
				if($("#agreeAll").is(":checked")){
					$("#agreeAll").prop("checked", false);
				}
			}else{
				$("#couponEvent").prop("checked", true);
				if($("#usePolicy").is(":checked") && $("#userInfo").is(":checked")){
					$("#agreeAll").prop("checked", true);
				}
			}
		});
		
		
		
		$("#createAccountButton").click(function(){ // 회원가입 클릭시
			emailF();
			pwF();
			pwCheckF();
			nameF();
			if(!phoneCheck){
				phoneF();
			}
			
			if(!email){
				$(".emailFail").focus();
				return;
			}else if(!pw){
				$(".pwFail").focus();
				return;
			}else if(!pwCheck){
				$(".pwCheckFail").focus();
				return;
			}else if(!name){
				$(".nameFail").focus();
				return;
			}else if(!phone){
				$(".phoneFail").focus();
				return;
			}else if(!phoneCheck){
				alert("본인 인증을 진행해 주세요.");
				return;
			}else if(!$("#userInfo").is(":checked")){
				alert("개인정보 처리방침에 동의 해주세요.");
				return;
			}else if(!$("#usePolicy").is(":checked")){
				alert("이용약관에 동의 해주세요.");				
				return;
			}else{
				alert("회원가입 성공!");
				// 회원가입 후 로직
				$.ajax({
					type:"POST",
					async: false,
					url:'insertUserData.do',
					data:{
						"memberEmail" : $(".emailFail").val(),
						"memberPassword" : $(".pwFail").val(),
						"memberPhone" : $(".phoneFail").val(),
						"memberName" : $(".nameFail").val(),
						"memberRecCode" : $("#friendCode").val(),
						"memberSmsAgree" : $("#couponEvent").is(":checked") ? 'Y' : 'N',
						"memberEmailAgree" : $("#couponEvent").is(":checked") ? 'Y' : 'N'
					},
					success:function(){
						console.log("데이터 전송 성공");
						var name = $('.nameFail').val();
						location.href="successNewAccount.do?memberName=" + name;
					},
					error:function(){
						console.log("데이터 전송 실패");
					}
				});
			}
		});
		
		$("#toHome").click(function(event){ // 로고 이미지 클릭 시.
    		location.href="/bomulsum/home.do";
    	});
		
		
	});
	
	
</script>

</html>