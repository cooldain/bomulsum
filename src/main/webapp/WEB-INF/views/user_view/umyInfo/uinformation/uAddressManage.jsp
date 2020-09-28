<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 배송지 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

//유효성검사
var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/; //전화번호
//var regExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/; //전화번호
var checkChar = /^[가-힣a-zA-Z]+$/; //한글+영어만 가능
//checkChar.test(str); // 체크하는  test 함수 : 리턴값 true / false


$(document).ready(function () {
	
	// 주소지1
	$('#editBtn').click(function(){
	    $('#adrBtn').css("display", "inline-block");
	    $("#adrBtn").attr("class","dainBtn");
		$('#saveBtn').css("display", "inline-block");
		$('.dai1').css("border" ,"1px solid #acacac");
		$('.di1').css("border" ,"1px solid #acacac");
		$(".di1").removeAttr("readonly");
		//$('#editBtn').html("취소");
		$('#editBtn').css("display", "none");
		$('#editCancelBtn').css("display", "inline");
	  });
	
	//주소지1 변경 취소
	$('#editCancelBtn').click(function(){
		$('#editCancelBtn').css("display", "none");
		$('#adrBtn').css("display", "none");
	    $("#editBtn").css("display","inline");
	    $('#saveBtn').css("display", "none");
	    $("#emailChangeCancelBtn").css("display","none");
		$('.dai1').css("border" ,"none");
		$('.di1').css("border" ,"none");
		$(".di1").attr("readonly","readonly");
		location.href = location.href;
		
	  });
	
	
	// 주소지2
	$('#editBtn2').click(function(){
	    $('#adrBtn2').css("display", "inline-block");
	    $("#adrBtn2").attr("class","dainBtn");
		$('#saveBtn2').css("display", "inline-block");
		$('.dai2').css("border" ,"1px solid #acacac");
		$('.di2').css("border" ,"1px solid #acacac");
		$(".di2").removeAttr("readonly");
		$('#editBtn2').css("display", "none");
		$('#editCancelBtn2').css("display", "inline");
	  });
	
	//주소지2 변경 취소
	$('#editCancelBtn2').click(function(){
		$('#editCancelBtn2').css("display", "none");
		$('#adrBtn2').css("display", "none");
	    $("#editBtn2").css("display","inline");
	    $('#saveBtn2').css("display", "none");
	    $("#emailChangeCancelBtn2").css("display","none");
		$('.dai2').css("border" ,"none");
		$('.di2').css("border" ,"none");
		$(".di2").attr("readonly","readonly");
		location.href = location.href;
	  });
	
	// 주소지3
	$('#editBtn3').click(function(){
	    $('#adrBtn3').css("display", "inline-block");
	    $("#adrBtn3").attr("class","dainBtn");
		$('#saveBtn3').css("display", "inline-block");
		$('.dai3').css("border" ,"1px solid #acacac");
		$('.di3').css("border" ,"1px solid #acacac");
		$(".di3").removeAttr("readonly");
		$('#editBtn3').css("display", "none");
		$('#editCancelBtn3').css("display", "inline");
	  });
	
	//주소지3 변경 취소
	$('#editCancelBtn3').click(function(){
		$('#editCancelBtn3').css("display", "none");
		$('#adrBtn3').css("display", "none");
	    $("#editBtn3").css("display","inline");
	    $('#saveBtn3').css("display", "none");
	    $("#emailChangeCancelBtn3").css("display","none");
		$('.dai3').css("border" ,"none");
		$('.di3').css("border" ,"none");
		$(".di3").attr("readonly","readonly");
		location.href = location.href;
	  });
	
	
	
	//배송지1 저장버튼 클릭시 -------------------------------------------------------------
	//배송지 insert-------------------------
	var addrCheck1='<c:out value="${address1.member_address_zipcode}"/>'; //배송지1 체크
	var addrSeq1='<c:out value="${address1.member_address_seq}"/>'; //배송지1 시퀀스
	console.log(addrCheck1);
	
	var checkCount=0;
		
		$('#addr1Btn').click(function(){

			
			//if(withdrawCheck == true){
			var member_address_zipcode = $("#sample6_postcode").val();
			var member_address_first = $("#sample6_address").val();
			var member_address_second = $("#sample6_detailAddress").val();
			var member_address_name = $("#addrName1").val();
			var member_address_phone = $("#addrTel1").val();
			
			
			//input 유효성체크
			console.log(regExp.test(member_address_phone));
			console.log(checkChar.test(member_address_name));
			if(!checkChar.test(member_address_name)){ 
				alert('받는분 이름을 올바르게 입력해주세요!');
				return; 
			}
			if(!regExp.test(member_address_phone)){ 
				alert('전화번호를 올바르게 입력해주세요!');
				return; 
			}
			if(!member_address_zipcode){ 
				alert('주소를 입력해주세요!');
				return; 
			}
			
			
			//insert랑 update구분하기 위해 체크
			console.log('체크카운트 확인:' + checkCount);
			
			if (addrCheck1 == '' && checkCount == 0) {

				$.ajax({
					url : "/bomulsum/user/insertAddress.do",
					data : {
						member_address_zipcode : member_address_zipcode,
						member_address_first : member_address_first,
						member_address_second : member_address_second,
						member_address_name : member_address_name,
						member_address_phone : member_address_phone
					},
					type : 'get',
					success : function() {
						$('#editCancelBtn').css("display", "none");
						$('#adrBtn').css("display", "none");
						$("#editBtn").css("display", "inline");
						$('#saveBtn').css("display", "none");
						$("#emailChangeCancelBtn").css("display", "none");
						$('.dai1').css("border", "none");
						$('.di1').css("border", "none");
						$(".di1").attr("readonly", "readonly");
						alert('등록되었습니다.');
						checkCount = checkCount + 1;
						/* 	$("#sample6_postcode").attr("readonly","readonly");
							$("#sample6_address").attr("readonly","readonly");
							$("#sample6_detailAddress").attr("readonly","readonly");
							$("#addrName1").attr("readonly","readonly");
							$("#addrTel1").attr("readonly","readonly"); */
						//	location.href="/bomulsum/user/registeraddress.do";
					}
				});
				//배송지 update-------------------------
			} else {
				$.ajax({
					url : "/bomulsum/user/updateAddress.do",
					data : {
						member_address_seq : addrSeq1,
						member_address_zipcode : member_address_zipcode,
						member_address_first : member_address_first,
						member_address_second : member_address_second,
						member_address_name : member_address_name,
						member_address_phone : member_address_phone
					},
					type : 'get',
					success : function() {
						$('#editCancelBtn').css("display", "none");
						$('#adrBtn').css("display", "none");
						$("#editBtn").css("display", "inline");
						$('#saveBtn').css("display", "none");
						$("#emailChangeCancelBtn").css("display", "none");
						$('.dai1').css("border", "none");
						$('.di1').css("border", "none");
						$(".di1").attr("readonly", "readonly");
						alert('수정되었습니다.');
						checkCount = checkCount + 1;
					}
				});
			} //else문(수정) 끝

		}); //저장버튼 클릭이벤트 끝



	//배송지2 저장버튼 클릭시 -------------------------------------------------------------
	//배송지 insert-------------------------
	var addrCheck2='<c:out value="${address2.member_address_zipcode}"/>'; //배송지2 체크
	var addrSeq2='<c:out value="${address2.member_address_seq}"/>'; //배송지2 시퀀스
	console.log(addrCheck2);
	
	var checkCount2=0;
		
		$('#addr2Btn').click(function(){
	
			//if(withdrawCheck == true){
			var member_address_zipcode2 = $("#sample6_postcode2").val();
			var member_address_first2 = $("#sample6_address2").val();
			var member_address_second2 = $("#sample6_detailAddress2").val();
			var member_address_name2 = $("#addrName2").val();
			var member_address_phone2 = $("#addrTel2").val();
			
			//input 유효성체크
			if(!checkChar.test(member_address_name2)){ 
				alert('받는분 이름을 올바르게 입력해주세요!');
				return; 
			}
			if(!regExp.test(member_address_phone2)){ 
				alert('전화번호를 올바르게 입력해주세요!');
				return; 
			}
			if(!member_address_zipcode2){ 
				alert('주소를 입력해주세요!');
				return; 
			}
			
			console.log("인풋값확인:"+ member_address_zipcode2+member_address_first2+member_address_second2 
					+ member_address_name2 + member_address_phone2 + "시퀀스확인:"+ addrSeq2);
			//insert랑 update구분하기 위해 체크
			console.log('체크카운트 확인:' + checkCount2);
			
			if (addrCheck2 == '' && checkCount2 == 0) {
	
				$.ajax({
					url : "/bomulsum/user/insertAddress.do",
					data : {
						member_address_zipcode : member_address_zipcode2,
						member_address_first : member_address_first2,
						member_address_second : member_address_second2,
						member_address_name : member_address_name2,
						member_address_phone : member_address_phone2
					},
					type : 'get',
					success : function() {
						$('#editCancelBtn2').css("display", "none");
						$('#adrBtn2').css("display", "none");
					    $("#editBtn2").css("display","inline");
					    $('#saveBtn2').css("display", "none");
					    $("#emailChangeCancelBtn2").css("display","none");
						$('.dai2').css("border" ,"none");
						$('.di2').css("border" ,"none");
						$(".di2").attr("readonly","readonly");
						alert('등록되었습니다.');
						checkCount2 = checkCount2 + 1;
						/* 	$("#sample6_postcode").attr("readonly","readonly");
							$("#sample6_address").attr("readonly","readonly");
							$("#sample6_detailAddress").attr("readonly","readonly");
							$("#addrName1").attr("readonly","readonly");
							$("#addrTel1").attr("readonly","readonly"); */
						//	location.href="/bomulsum/user/registeraddress.do";
					}
				});
				//배송지 update-------------------------
			} else {
				$.ajax({
					url : "/bomulsum/user/updateAddress.do",
					data : {
						member_address_seq : addrSeq2,
						member_address_zipcode : member_address_zipcode2,
						member_address_first : member_address_first2,
						member_address_second : member_address_second2,
						member_address_name : member_address_name2,
						member_address_phone : member_address_phone2
					},
					type : 'get',
					success : function() {
						$('#editCancelBtn2').css("display", "none");
						$('#adrBtn2').css("display", "none");
					    $("#editBtn2").css("display","inline");
					    $('#saveBtn2').css("display", "none");
					    $("#emailChangeCancelBtn2").css("display","none");
						$('.dai2').css("border" ,"none");
						$('.di2').css("border" ,"none");
						$(".di2").attr("readonly","readonly");
						alert('수정되었습니다.');
						checkCount2 = checkCount2 + 1;
					}
				});
			} //else문(수정) 끝
	
		}); //저장버튼 클릭이벤트 끝
	
		
		//배송지3 저장버튼 클릭시 -------------------------------------------------------------
		//배송지 insert-------------------------
		var addrCheck3='<c:out value="${address3.member_address_zipcode}"/>'; //배송지3 체크
		var addrSeq3='<c:out value="${address3.member_address_seq}"/>'; //배송지3 시퀀스
		console.log(addrCheck3);
		
		var checkCount3=0;
			
			$('#addr3Btn').click(function(){
		
				//if(withdrawCheck == true){
				var member_address_zipcode3 = $("#sample6_postcode3").val();
				var member_address_first3 = $("#sample6_address3").val();
				var member_address_second3 = $("#sample6_detailAddress3").val();
				var member_address_name3 = $("#addrName3").val();
				var member_address_phone3 = $("#addrTel3").val();
				
				
				//input 유효성체크
				if(!checkChar.test(member_address_name3)){ 
					alert('받는분 이름을 올바르게 입력해주세요!');
					return; 
				}
				if(!regExp.test(member_address_phone3)){ 
					alert('전화번호를 올바르게 입력해주세요!');
					return; 
				}
				if(!member_address_zipcode3){ 
					alert('주소를 입력해주세요!');
					return; 
				}
				
				console.log("인풋값확인:"+ member_address_zipcode3+member_address_first3+member_address_second3 
						+ member_address_name3 + member_address_phone3 + "시퀀스확인:"+ addrSeq3);
				//insert랑 update구분하기 위해 체크
				console.log('체크카운트 확인:' + checkCount3);
				
				if (addrCheck3 == '' && checkCount3 == 0) {
		
					$.ajax({
						url : "/bomulsum/user/insertAddress.do",
						data : {
							member_address_zipcode : member_address_zipcode3,
							member_address_first : member_address_first3,
							member_address_second : member_address_second3,
							member_address_name : member_address_name3,
							member_address_phone : member_address_phone3
						},
						type : 'get',
						success : function() {
							$('#editCancelBtn3').css("display", "none");
							$('#adrBtn3').css("display", "none");
						    $("#editBtn3").css("display","inline");
						    $('#saveBtn3').css("display", "none");
						    $("#emailChangeCancelBtn3").css("display","none");
							$('.dai3').css("border" ,"none");
							$('.di3').css("border" ,"none");
							$(".di3").attr("readonly","readonly");
							alert('등록되었습니다.');
							checkCount3 = checkCount3 + 1;
							/* 	$("#sample6_postcode").attr("readonly","readonly");
								$("#sample6_address").attr("readonly","readonly");
								$("#sample6_detailAddress").attr("readonly","readonly");
								$("#addrName1").attr("readonly","readonly");
								$("#addrTel1").attr("readonly","readonly"); */
							//	location.href="/bomulsum/user/registeraddress.do";
						}
					});
					//배송지 update-------------------------
				} else {
					$.ajax({
						url : "/bomulsum/user/updateAddress.do",
						data : {
							member_address_seq : addrSeq3,
							member_address_zipcode : member_address_zipcode3,
							member_address_first : member_address_first3,
							member_address_second : member_address_second3,
							member_address_name : member_address_name3,
							member_address_phone : member_address_phone3
						},
						type : 'get',
						success : function() {
							$('#editCancelBtn3').css("display", "none");
							$('#adrBtn3').css("display", "none");
						    $("#editBtn3").css("display","inline");
						    $('#saveBtn3').css("display", "none");
						    $("#emailChangeCancelBtn3").css("display","none");
							$('.dai3').css("border" ,"none");
							$('.di3').css("border" ,"none");
							$(".di3").attr("readonly","readonly");
							alert('수정되었습니다.');
							checkCount3 = checkCount3 + 1;
						}
					});
				} //else문(수정) 끝
		
			}); //저장버튼 클릭이벤트 끝
	});

	//우편번호 찾기----------------------------------------------------------
	//배송지1
	function daumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
	//배송지2
	function daumPostcode2() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode2').value = data.zonecode;
						document.getElementById("sample6_address2").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress2")
								.focus();
					}
				}).open();
	}
	//배송지3
	function daumPostcode3() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode3').value = data.zonecode;
						document.getElementById("sample6_address3").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress3")
								.focus();
					}
				}).open();
	}
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

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.dainSection {
	margin-left: 2%;
	width: 80%;
}

.dainUamTitle{
	margin-bottom: 24px;
}

.dainTable{
	border-collapse: collapse;
	width: 100%;
	font-size: 12px;
	border: 1px solid #d9d9d9;
	margin-bottom: 3%;
}

.dainth{
	 text-align: left; 
	 color: #666666; 
	 background-color: #eeeeee;
	 
}

.daintd{
	padding: 5px 10px;
	vertical-align: middle;
}

.daintd.td1{
	width: 14%;
}
.dainem{
	color: #dd5850;
	font-size: 18px;
	display: inline-block;
	margin-right: 10px;
}

.dainInput{
	background: #fff;
    font-size: 12px;
    line-height: 13px;
    border: none;
    /*수정버튼 눌렀을떄 아래꺼*/
    /*border: 1px solid #acacac;*/
    height: 26px;
    min-width: 96%;
    border-radius: 3px;
    padding: 2px 8px;
    outline: none;
    
}

.dainBtn{
	background-color: white;
	border: 1px solid #d9d9d9;
	border-radius: 3px;
	padding: 6px 8px;
	outline: none;
	font-size: 12px;
}

.dainBtn:hover{
	cursor: pointer;
}

.dainBtn2{
 	 background-color: #1f76bb; 
 	 border: 1px solid #1f76bb;
	 color: #fff;
	 padding: 6px 16px;
	 border: none;
}
.dainBtn2:hover{
	background-color: #1c6baa;
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
	<div class="dainUamTitle">
		<h1 style="margin: 0px;">주소(배송지) 관리</h1>
	</div>
	
	<!-- 배송지1 테이블 (#dt1) -->
	<table class="dainTable" id="dt1">
		<thead class="dainth">
		<tr class="daintr" style="border: 1px solid #d9d9d9;">
			<th class="daintd" colspan="2" style="padding: 12px 8px;">배송지 1</th>
		</tr>
		</thead>
		<tr class="daintr"  >
			<td class="daintd td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
			<td class="daintd td2" style="padding-top: 15px;">
				<input class="dainInput di1" name="member_address_name" id="addrName1" type="text" placeholder="받는분 이름을 입력해주세요." 
				autocomplete="off" required="required" readonly="readonly" value="${address1.member_address_name}"/>
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" ><em class="dainem">*</em>전화번호</td>
			<td class="daintd" >
				<input class="dainInput di1" name="member_address_phone" id="addrTel1" type="text" autocomplete="off" 
				required="required" readonly="readonly" placeholder="전화번호" value="${address1.member_address_phone}"/>
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" style="vertical-align: top;"><em class="dainem">*</em>주소</td>
			<td class="daintd" style="padding-bottom: 15px;">
				<!-- 주소 name에 숫자두개는 앞에숫자가 n번배송지, 뒤에숫자(1-2-3이 우편번호-주소1-주소2 -->
				<input class="dainInput dai1" name="member_address_zipcode" id="sample6_postcode" type="text" 
				placeholder="우편번호" autocomplete="off" value="${address1.member_address_zipcode}"
				required="required" readonly="readonly" style="min-width: 13%; max-width: 13%; margin-bottom: 10px;"/>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<button id="adrBtn" style="display: none;" onclick="daumPostcode()"> 주소 찾기</button><br>
				<input class="dainInput dai1" name="member_address_first" id="sample6_address" type="text" 
				placeholder="기본주소" autocomplete="off" value="${address1.member_address_first}"
				required="required" readonly="readonly" style="margin-bottom: 10px;"/><br>
				<input class="dainInput di1" name="member_address_second" id="sample6_detailAddress" type="text" 
				placeholder="나머지 주소" autocomplete="off"  value="${address1.member_address_second}"
				required="required" readonly="readonly" style="margin-bottom: 10px;"/><br>
				<button class="dainBtn" id="editBtn" style="padding: 6px 16px;">수정</button><button 
				class="dainBtn" id="editCancelBtn" style="padding: 6px 16px; display: none;">취소</button>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<span id="saveBtn" style="display: none;"><button id="addr1Btn" class="dainBtn dainBtn2">저장</button></span>
			</td>
		</tr>
	</table>
	
	<!-- 배송지2 테이블 (#dt2) -->
	<table class="dainTable" id="dt2">
		<thead class="dainth">
		<tr class="daintr" style="border: 1px solid #d9d9d9;">
			<th class="daintd" colspan="2" style="padding: 12px 8px;">배송지 2</th>
		</tr>
		</thead>
		<tr class="daintr"  >
			<td class="daintd td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
			<td class="daintd td2" style="padding-top: 15px;">
				<input class="dainInput di2" id="addrName2" name="addrName2" type="text" placeholder="받는분 이름을 입력해주세요." 
				autocomplete="off" required="required" readonly="readonly" value="${address2.member_address_name}"/>
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" ><em class="dainem">*</em>전화번호</td>
			<td class="daintd" >
				<input class="dainInput di2" id="addrTel2" name="addrTel2" type="text" value="${address2.member_address_phone}" 
				autocomplete="off" required="required" placeholder="전화번호" readonly="readonly"/>
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" style="vertical-align: top;" ><em class="dainem">*</em>주소</td>
			<td class="daintd" style="padding-bottom: 15px;">
				<input class="dainInput dai2" name="addrAddr21" type="text" placeholder="우편번호" autocomplete="off" 
				required="required" readonly="readonly" id="sample6_postcode2" value="${address2.member_address_zipcode}"
				style="min-width: 13%; max-width: 13%; margin-bottom: 10px;"/>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<button id="adrBtn2" onclick="daumPostcode2()" style="display: none;"> 주소 찾기</button><br>
				<input class="dainInput dai2" id="sample6_address2" name="addrAddr22" type="text" placeholder="기본주소" autocomplete="off" 
				required="required" readonly="readonly" value="${address2.member_address_first}" style="margin-bottom: 10px;"/><br>
				<input class="dainInput di2" name="addrAddr23" type="text" value="${address2.member_address_second}"
				placeholder="나머지 주소" autocomplete="off" 
				required="required" readonly="readonly" id="sample6_detailAddress2" style="margin-bottom: 10px;"/><br>
				<button class="dainBtn" id="editBtn2" style="padding: 6px 16px;">수정</button><button 
				class="dainBtn" id="editCancelBtn2" style="padding: 6px 16px; display: none;">취소</button>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<span id="saveBtn2" style="display: none;"><button id="addr2Btn" class="dainBtn dainBtn2">저장</button></span>
			</td>
		</tr>
	</table>
	
	
	<!-- 배송지3 테이블 (#dt3) -->
	<table class="dainTable" id="dt3">
		<thead class="dainth">
		<tr class="daintr" style="border: 1px solid #d9d9d9;">
			<th class="daintd" colspan="2" style="padding: 12px 8px;">배송지 3</th>
		</tr>
		</thead>
		<tr class="daintr"  >
			<td class="daintd td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
			<td class="daintd td2" style="padding-top: 15px;">
				<input class="dainInput di3" id="addrName3" name="addrName3" type="text" placeholder="받는분 이름을 입력해주세요." 
				autocomplete="off" required="required" readonly="readonly" value="${address3.member_address_name}"/>
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" ><em class="dainem">*</em>전화번호</td>
			<td class="daintd" >
				<input class="dainInput di3" id="addrTel3" name="addrTel3" type="text" value="${address3.member_address_phone}" autocomplete="off" 
				required="required" readonly="readonly" placeholder="전화번호" />
			</td>
		</tr>
		<tr class="daintr">
			<td class="daintd" style="vertical-align: top;" ><em class="dainem">*</em>주소</td>
			<td class="daintd" style="padding-bottom: 15px;">
				<input class="dainInput dai3" name="addrAddr31" type="text" placeholder="우편번호" autocomplete="off" 
				required="required" readonly="readonly" id="sample6_postcode3" value="${address3.member_address_zipcode}"
				style="min-width: 13%; max-width: 13%; margin-bottom: 10px;"/>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<button id="adrBtn3" style="display: none;" onclick="daumPostcode3()"> 주소 찾기</button><br>
				<input class="dainInput dai3" name="addrAddr32" type="text" placeholder="기본주소" autocomplete="off" 
				required="required" readonly="readonly" id="sample6_address3" value="${address3.member_address_first}"
				style="margin-bottom: 10px;"/><br>
				<input class="dainInput di3" name="addrAddr33" type="text" placeholder="나머지 주소" autocomplete="off" 
				required="required" readonly="readonly" id="sample6_detailAddress3" value="${address3.member_address_second}"
				style="margin-bottom: 10px;"/><br>
				<button class="dainBtn" id="editBtn3" style="padding: 6px 16px;">수정</button><button 
				class="dainBtn" id="editCancelBtn3" style="padding: 6px 16px; display: none;">취소</button>
				<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
				<span id="saveBtn3" style="display: none;"><button id="addr3Btn" class="dainBtn dainBtn2">저장</button></span>
			</td>
		</tr>
	</table>
	

	
	</section> <!-- dain section끝 -->
	</div> <!-- content 끝 -->
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
</html>