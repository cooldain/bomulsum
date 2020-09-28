<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- JQuery -->

<title>보물섬 | 회원 정보 관리</title>
<script type="text/javascript">
$(document).ready(function () {
	//이메일 변경하기 버튼 클릭시
	$('#emailChangeBtn').click(function(){
	    $('#emailChange').css("display", "block");
		/*$("#emailChangeBtn").html("변경취소");*/
	    $("#emailChangeBtn").css("display","none");
	    $("#emailChangeCancelBtn").css("display","inline");
	  });
	
	//이메일 변경 취소
	$('#emailChangeCancelBtn').click(function(){
		$('#emailChange').css("display", "none");
	    $("#emailChangeBtn").css("display","inline");
	    $("#emailChangeCancelBtn").css("display","none");
	  });
	
	//전화 변경하기 버튼 클릭시
	$('#phoneChangeBtn').click(function(){
		$('#phoneChange').css("display", "block");
	    $("#phoneChangeBtn").css("display","none");
	    $("#phoneChangeCancelBtn").css("display","inline");
	});
	
 	//전화 변경 취소
	$('#phoneChangeCancelBtn').click(function(){
		$('#phoneChange').css("display", "none");
	    $("#phoneChangeBtn").css("display","inline");
	    $("#phoneChangeCancelBtn").css("display","none");
	  }); 
	
	//회원탈퇴 클릭시
	$(withdrawBtn).click(function(){
	var withdrawCheck = confirm("정말로 탈퇴하시겠습니까?");
	console.log(withdrawCheck);	//회원탈퇴여부 true/false
	
	if(withdrawCheck == true){
	      $.ajax({
				url : "/bomulsum/user/deleteuser.do",
				data : {
				},
				type:'get',
				success : function(){
				console.log("회원탈퇴!"); 
				 location.href="/bomulsum/home.do";
				}
   		    });
		}
	});
	
});

$(function(){
	var sms_agree = '${userinfo.member_sms_agree}';
	var email_agree = '${userinfo.member_email_agree}';
	console.log("SMS:"+sms_agree);
	console.log("email:"+email_agree);
	
	//console.log($("#sms").prop("checked"));
	
/* 	 if($("#sms").prop("checked")){
		 $("#sms").val('Y');
		 //console.log("Y");
	 }else{
		 $("#sms").val('N');
		// console.log("N");
	 }
	 
	 if($("#email").prop("checked")){
		// $("#email").val('Y');
	 }else{
		// $("#email").val('N');
	 } */
	 
 	if(sms_agree == 'Y'){
		$("input:checkbox[id='sms']").attr("checked", true);
	}else{
		$("input:checkbox[id='sms']").attr("checked", false);
	}
	if(email_agree == 'Y'){
		$("input:checkbox[id='email']").attr("checked", true);
	}else{
		$("input:checkbox[id='email']").attr("checked", false);
	}	 
	
	
});

</script>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display: flex;
}

body a:link, a:visited, a:hover, a:active, :active{
	text-decoration: none;
	border: none;
}



.dainSection {
	margin-left: 2%;
	width: 80%;
}

.dainUimTitle{
	margin-bottom: 24px;
}

.dainth{
	background: #eee;
    font-weight: normal;
	font-size: 12px;
    width: 120px;
    text-align: left;
    color: #666;
    padding: 12px 10px;
    border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
}
.daintd{
	padding: 12px 10px;
	border-top: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
}
.dainTable{
	border-collapse: collapse;
	width: 100%;
	font-size: 12px;
}



.dainInput{
	background: #fff;
    font-size: 12px;
    line-height: 13px;
    border: 1px solid #acacac;
    height: 26px;
    max-width: 40%;
    border-radius: 3px;
    padding: 2px 8px;
}

.dainInput:focus {
	outline:1px solid #65ddd1;
}

.dainBtn{
	background-color: white;
	border: 1px solid #d9d9d9;
	border-radius: 3px;
	padding: 4px 8px;
	margin-left: 5px;
	outline: none;
	font-size: 12px;
}
.dainBtn:hover{
	cursor: pointer;
}
.dainBtn2{
 background-color: #1f76bb; 
	 color: #fff;
	 padding: 8px 18px;
	 border: none;
}
.dainBtn2:hover{
	background-color: #1c6baa;
}

#emailChange {
	display: none;
}
#phoneChange{
	display: none;
}
.dainInput:invalid:focus {
    border: 1px solid red;
    border-radius: 3px;
    outline: none;
}
.dainInput,
.dainInput:valid {
	border: 1px solid #ccc;
    border-radius: 3px;
    outline:none;
}
</style>


</head>
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
	<section class="dainSection">
	<div class="dainUimTitle">
		<h1 style="margin: 0px;">회원 정보 관리</h1>
	</div>
	<form method="post" action="<c:url value='/user/updateuserinfo.do'/>">
	<table class="dainTable">
	<tr>
		<td class="dainth">이름</td>
		<!-- 이름 받아와야함 -->
		<td class="daintd"><input type="text" class="dainInput" id="uName" value="${userinfo.member_name}"
		name="member_name" maxlength="20" placeholder="이름" autocomplete="off" required="required"
		pattern="[가-힣a-zA-Z]{1,20}" title="한글, 영문 20자이내로 입력해주세요."/></td>
	</tr>
	<tr>
		<td class="dainth">이메일</td>
		<td class="daintd">${userinfo.member_email}
		<!-- 
		<button class="dainBtn" 
		id="emailChangeBtn" type="button">변경하기</button><button class="dainBtn" 
		id="emailChangeCancelBtn" style="display:none;" type="button">취소하기</button>
		<div id="emailChange">
			<p style="margin: 10px 0px 3px 0px">변경할 이메일 주소를 입력해주세요. (예.abcd@bomulsum.me)</p>
			<input type="email" class="dainInput" id="uEmail" 
		name="member_email" maxlength="20" autocomplete="off"/>
		<button class="dainBtn" type="button">인증메일 발송</button>
		</div>
		 -->
		</td>
	</tr>
	<tr>
		<td class="dainth">전화</td>
		<td class="daintd">${userinfo.member_phone}<button class="dainBtn" 
		id="phoneChangeBtn" type="button">변경하기</button><button class="dainBtn" 
		id="phoneChangeCancelBtn" style="display:none;" type="button">취소하기</button>
		<div style="color: #666666">주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</div>
		<div id="phoneChange">
			<p style="margin: 10px 0px 3px 0px" id="changeMent">변경할 전화번호를 입력해주세요.</p>
			<input type="text" name="member_phone" class="dainInput phoneFail" id="uPhone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
		name="member_phone" placeholder="010-1234-5678" maxlength="20" autocomplete="off" style="min-width: 170px; max-width: 170px"/>
		<button class="dainBtn" id="phoneBtn" type="button" style="height: 32px;">인증번호 요청</button>
		<!-- 인증번호영역 -->
		<div id="phoneCertification" style="width:100%; flex-direction: row; height:50px; margin-bottom:1%; margin-top: 2%;">
			<div class="inputCertification" style="display: flex; flex-direction: row; height:40px; width:70%; margin-right:1%;">
			<input id="inputCertificationNum" class="dainInput" maxlength="6" type="text" placeholder="인증코드를 입력해주세요." style="min-width: 170px;">
			<button id="inputCertificationButton" class="dainBtn btn-abled" type="button" style="height: 32px; width: 20%; margin-left: 10px;">확인</button>
			<div id="time_limit" style="width:20%; height:30px; color:#d8524a;  padding-top: 1%; margin-left: 2%;"></div>
			</div>
		</div>
		<a id="phoneFail" style="display:none; color:#d8524a; font-size:12px; margin-bottom:5%;">필수 항목입니다.</a>
		<!-- 인증번호끝 -->
		</div>
		</td>
	</tr>
	<tr>
		<td class="dainth">성별</td>
		<td class="daintd">
		
		<c:if test="${userinfo.member_gender eq 'M'}">
			<input class="dainRadio" type="radio" id="female" name="member_gender" value="F" >
		  	<label for="female">여성</label>
			<input  class="dainRadio" type="radio" id="male" name="member_gender" value="M" checked="checked">
		 	<label for="male">남성</label>
		</c:if>
		<c:if test="${userinfo.member_gender eq 'F'}">
			<input class="dainRadio" type="radio" id="female" name="member_gender" value="F" checked="checked">
		  	<label for="female">여성</label>
			<input  class="dainRadio" type="radio" id="male" name="member_gender" value="M" >
		 	<label for="male">남성</label>
		</c:if>
							
		  
		  
		</td>
	</tr>
	<tr>
		<td class="dainth">생일</td>
		<td class="daintd">
<%-- 	<input type="text" class="dainInput" id="uBirth" name="member_birth" autocomplete="off"
		value="${userinfo.member_birth}" pattern="\d{4}-\d{2}-\d{2}" placeholder="ex) 2000-01-01" style="max-width:150px; "/>  --%>
 		<input type="date" class="dainInput" id="uBirth" name="member_birth" autocomplete="off"
		value="${userinfo.member_birth}" style="max-width:150px;"/> 
		</td>
	</tr>
	<tr>
		<td class="dainth">알림설정</td>
		<td class="daintd">
		<p style="margin:0 0 5px 0;">파격할인/이벤트/쿠폰 알림 등의 정보를 받아보시겠습니까?</p>
		<input type="checkbox" id="sms" name="member_sms_agree" value="Y">
		<label for="sms">SMS</label>
		<input type="checkbox" id="email" name="member_email_agree" value="Y" >
		<label for="email">이메일</label>
<%-- 		  <c:if test="${userinfo.member_sms_agree eq 'Y'}">
			 <input type="checkbox" id="sms" name="member_sms_agree" value="Y" checked="checked">
		 	 <label for="sms">SMS</label>
		 </c:if>
		  <c:if test="${userinfo.member_sms_agree eq 'N'}">
			 <input type="checkbox" id="sms" name="member_sms_agree" value="N">
		 	 <label for="sms">SMS</label>
		 </c:if>
		  <c:if test="${userinfo.member_email_agree eq 'Y'}">
			 <input type="checkbox" id="email" name="member_email_agree" value="Y" checked="checked">
		  	 <label for="email">이메일</label>
		 </c:if>
		  <c:if test="${userinfo.member_email_agree eq 'N'}">
			 <input type="checkbox" id="email" name="member_email_agree" value="N">
		 	 <label for="email">이메일</label>
		 </c:if> --%>
		</td>
	</tr>
	</table>
		
	<div style="display: flex; justify-content: flex-end; margin-top: 15px;">
		<button class="dainBtn" id="withdrawBtn" type="button">회원탈퇴</button>
	</div>
	<div style="display: flex; justify-content: center;">
		<button type="submit" class="dainBtn dainBtn2" onclick="alert('변경되었습니다.')">회원 정보 수정하기</button>
	</div>
	</form>
	
	</section>
	
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>


</body>
<!-- iamport.payment.js 휴대폰 인증 라이브러리 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
/* $(document).ready(function(){
	if($('input:checkbox[name=member_sms_agree]').is(':checked') == false){
		$('[name=member_sms_agree]').attr('value', 'N');
	}
	console.log($('input:checkbox[name=member_sms_agree]').is(':checked'));
 }); */
 
 



 // null 체크 함수
 function vali(val){

    // if (value === null) return true; 
     if (typeof value === 'string' && value === '') return true;
     //if (typeof value === 'undefined') return true;
     
     return false;

 }

 //핸드폰 인증
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
		//유효성검사
		var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/; //전화번호
		
	
		//유효성 - 널값체크 
		 // id 'testBtn'이라는 버튼을 클릭 시 체크박스 검사.
		 $("#phoneBtn").click(function(){
		     
			var member_address_phone = $("#uPhone").val();
			 
			 //전화번호 형식체크
			if(!regExp.test(member_address_phone)){ 
				alert('전화번호를 올바르게 입력해주세요!');
				return; 
			}
				
		     // id 'testInput'의 value의 null 체크
		     if($("#uPhone").val()== ''){
		         //alert("전화번호를 입력해주세요.");
		         $("#changeMent").text('전화번호를 입력해주세요.');
		         $("#changeMent").css("color","red");
		     } else {
		    	 $("#changeMent").text('인증번호를 입력해주세요.');
		//$("#phoneBtn").click(function(){ // 핸드폰 인증 모듈.
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
							$("#inputCertificationNum").attr("readonly", true);
							$("#inputCertificationNum").css("color",'#21a1a9');
							$("#inputCertificationButton").addClass('btn-disabled');
							$("#inputCertificationButton").removeClass('btn-abled');
							$("#inputCertificationButton").attr("disabled", true);
							$("#time_limit").css("color",'#ffffff');
						//	$("#phoneFail").css("display", "none");
						//	$("#phoneChange").css("display", "none");
						//  $("#phoneChangeBtn").css("display","inline");
						//  $("#phoneChangeCancelBtn").css("display","none");
							
							$(".phoneFail").off();
							$("#phoneBtn").off();
							$("#inputCertificationNum").off();
							phoneCheck = true;
							
							
							//컨트롤러에 넘겨서 update
							var changePhone = $("#uPhone").val();
					       //  location.href="/bomulsum/user/updateuserphone.do?member_phone="+changePhone;
					         $.ajax({
									url : "/bomulsum/user/updateuserphone.do",
									//?msg=" + sendMsg + "&receiver=" + receiveNum
									data : {
										member_phone : changePhone
									},
									type:'get',
									success : console.log("전화번호 변경!")
					         });
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
		}
		});
	})
	</script>
</html>