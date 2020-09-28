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
				<h2 style="padding: 0px 15px; background-color: white; margin: 0; top: -10px; position: relative; font-weight:normal; color:#666">
					아이디 / 비밀번호 찾기</h2>

				<div style="display: flex; flex: 1 1 0%; flex-flow: column wrap; width: 100%; margin-bottom: 1%; margin-top: 5%">

					<div style="display: flex; flex-direction: column; justify-content: center; font-size:15px">
					
						
						
						
							<!-- 전화번호 입력 창 -->
							<div style="margin-bottom:8%; height:20px;display:flex; justify-content: center">
								<a style="font-weight:bold">회원 가입시 사용한 전화번호를 입력해주세요.</a>
							</div>
							<div style="width:100%;  display: flex; flex-direction: row; height:50px; margin-bottom:1%;">
								<input class="phoneFail" type="text" style="padding-left:2%; height:40px; width:70%; margin-right:1%" placeholder="010-1234-5678">
								<button id="phoneBtn" type="button" class="btn-disabled" style="width:30%; height:46px;" disabled>인증요청</button>
							</div>
							<div id="phoneCertification" style="width:100%;  display: none; flex-direction: row; height:50px; margin-bottom:1%;">
								<div class="inputCertification" style="display: flex; border:1px inset black; flex-direction: row; height:40px; width:70%; margin-right:1%;">
									<input id="inputCertificationNum"  maxlength="6" type="text" style="border:0; padding-left:2%; width:80%; height:38px;" placeholder="인증코드를 입력해주세요.">
									<div id="time_limit" style="width:20%; height:40px; color:#d8524a; text-align:right; padding-top: 3%; padding-right:2%"></div>
								</div>
								<button id="inputCertificationButton" type="button" class="btn-abled" style="width:29%; height:43px;">확인</button>
							</div>
							<a id="phoneFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:5%;">필수 항목입니다.</a>
						
						
					</div>


				</div>


				<form id="send_phone_num">
					<input id="form_id" type="hidden" name="phone" value=""/>
				</form>


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
							
							$("#form_id").val($(".phoneFail").val());
							$("#send_phone_num").attr({action:'/bomulsum/user/phoneCheck.do', method:'post'}).submit();
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
		
		
		
		
		$("#toHome").click(function(event){ // 로고 이미지 클릭 시.
    		location.href="/bomulsum/home.do";
    	});
		
		
	});
	
	
</script>

</html>