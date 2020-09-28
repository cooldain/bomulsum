<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 주문 결제하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
var memberName = '${userName}';
var myReserve = ${memReserve}; //적립금관련
var myDiscountSum = 0;
var regExp = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-[0-9]{3,4}-[0-9]{4}$/; //유효성:전화번호
var checkChar = /^[가-힣a-zA-Z]+$/; //유효성:한글+영어만 가능(ㅁㄴㅇ이런문자 안됨)

var shipName = ''; //배송지관련
var shipPhone = '';
var shipZip = '';
var shipFirst = '';
var shipSecond = '';

var dain_fin_artprice = 0;
var dain_fin_ship = 0;
var dain_fin_discount = 0;
var dain_fin_jeju = 0;

var dain_fin_sum = 0;
var finUsePoint = 0; //사용한 적립금

var choiceCoupon = '';

var dain_fin_jeju_sum = 0; //제주산간 작가별 비용합계

var artPointSum = 0; //적립예정 적립금


var orderArt = []; //주문작품 정보 담을 변수
var orderArtOption = []; //주문옵션 정보 담을 변수

var artShipJeju = 0; //작가별 배송비 (제주)
var artShip = 0; //작가별 배송비

var artDaName = '';

//아임포트 결제api 관련
var IMP = window.IMP; // 생략가능
IMP.init('imp54276316'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용



//적립금 넣을때 작품대표이름
artDaName = '${shopbagInfo[0].art_name}';

function shipInfoSet(){
 	//선택된 배송지 ----- 1
	if($('#shipTab1').css('background-color') == 'rgb(31, 118, 187)'){
		shipName = $('input[name=addrName1]').val();
		shipPhone = $('input[name=addrTel1]').val();
		shipZip = $('input[name=addrAddr11]').val();
		shipFirst = $('input[name=addrAddr12]').val();
		shipSecond = $('input[name=addrAddr13]').val();
	}
	
	//선택된 배송지 ----- 2
	if($('#shipTab2').css('background-color') == 'rgb(31, 118, 187)'){
		shipName = $('input[name=addrName2]').val();
		shipPhone = $('input[name=addrTel2]').val();
		shipZip = $('input[name=addrAddr21]').val();
		shipFirst = $('input[name=addrAddr22]').val();
		shipSecond = $('input[name=addrAddr23]').val();
	}
	
	//선택된 배송지 ----- 3
	if($('#shipTab3').css('background-color') == 'rgb(31, 118, 187)'){
		shipName = $('input[name=addrName3]').val();
		shipPhone = $('input[name=addrTel3]').val();
		shipZip = $('input[name=addrAddr31]').val();
		shipFirst = $('input[name=addrAddr32]').val();
		shipSecond = $('input[name=addrAddr33]').val();
	}
	
}

var test = '${shopbagInfo}';

//결제하기 버튼 눌렀을때. 
function goPayment(){
	
	shipInfoSet();

	 
	//배송지 유효성검사
	if(!checkChar.test(shipName)){ 
		alert('받는분 이름을 올바르게 입력해주세요!');
		return; 
	}
	if(!regExp.test(shipPhone)){ 
		alert('전화번호를 올바르게 입력해주세요!');
		return; 
	}
	if(!shipZip){ 
		alert('우편번호를 입력해주세요!');
		return; 
	}
	if(!shipSecond){ 
		alert('상세주소를 입력해주세요!');
		return; 
	}
	
	console.log(shipName+","+shipPhone+","+shipZip+","+shipFirst+","+shipSecond);
	console.log("사용쿠폰"+choiceCoupon);
	
	
	if($('#dain_privacy_check').is(":checked") == false){
		alert('개인정보 제공 고지에 동의해주세요.');
		return;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	

	
 	//결제창 실행
 	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '보물섬 : 주문결제',
	    amount : dain_fin_sum, //판매 가격
	    buyer_email : 'abc@bomulsum.com',
	    buyer_name : memberName,
	    
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';

	        //DB처리 들어올공간
	        
	        

	        //---------------------------------결제DB처리 시작

	    	/*     
	    	작품별 내용
	    	장바구니 코드 , 작가코드 , 작품코드 , 작품이름 , 요청사항 , 작품배송비 , 제주산간배송비 , 
	    	 */
	    		var i=0;
	    		
	    		<c:forEach items='${shopbagInfo}' var="info" varStatus="status">
	    			var orderArtOne = '';
	    			var orderRequest = '${info.order_request}';
	    			//배송비처리(배송비무료조건, 제주산간 배송비처리)
	    			<c:if test="${info.totalPrice ge info.writer_sendfree_case}">
	    				artShip  = 0;
	    				if(shipFirst.substring(0,2) =="제주"){
	    					artShipJeju = ${info.writer_plus_price};
	    				}
	    				//console.log("작가별제주배송비:"+artShipJeju);
	    			</c:if>	
	    			<c:if test="${info.totalPrice lt info.writer_sendfree_case}">
	    				artShip = ${info.writer_send_price};
	    				if(shipFirst.substring(0,2) =="제주"){
	    					artShipJeju = ${info.writer_plus_price};;
	    				}
	    				//console.log("작가별제주배송비:"+artShipJeju);
	    			</c:if>
	    		
	    			//console.log("작가별배송비:"+artShip);
	    			
	    			//요청사항 없을때 처리
	    			if(orderRequest==''){
	    				orderRequest = "없음";
	    			}
	    			
	    			
	    			
	    			orderArtOne = '${info.cart_seq}'  + '@#@' + '${info.writer_code_seq}' + '@#@' + '${info.art_code_seq}' + '@#@'
	    			+ '${info.art_name}'  + '@#@' + orderRequest + '@#@' + artShip + '@#@'+ artShipJeju + '@#@' ;
	    			
	    			
	    			orderArt[i] = orderArtOne;
	    			console.log("orderArtOne--->"+orderArtOne);
	    			console.log("orderArt--->"+orderArt[i]);
	    			i++;
	    		</c:forEach>
	    		
	    		console.log(orderArt); 
	    		
	    		
	    /* 		
	    	옵션별 내용
	    	옵션내용 # 옵션코드 # 수량 # 카트코드 # 작품코드 # 작품가격 
	     */
	    		var z = 0;
	    		<c:forEach items='${shopbagInfo}' var="info" varStatus="status">
	    			<c:forEach var="totalOption" items="${info.totalOption}" >
	    				var orderArtOptionOne = ''; 
	    				var orderArtOptionCode='';
	    				var orderArtOptionCount = '';
	    				
	    				orderArtOptionCode += '#';
	    					<c:forEach var="j" items="${totalOption.optionArray}">
	    					
	    						orderArtOptionCode += '${j.art_option_seq}' + '|';
	    						
	    						orderArtOptionOne += '${j.art_option_category}'+": "+'${j.art_option_name}' + '(+' 
	    							+ '${j.art_option_price}'+'원) / ';
	    	
	    					</c:forEach>
	    				orderArtOptionOne += orderArtOptionCode  +'#'+'${totalOption.artCount}'+'#'+'${info.cart_seq}' +'#'+ '${info.art_code_seq}' +'#'+ '${totalOption.totalSum}';
	    				orderArtOption[z] = orderArtOptionOne;
	    				console.log("아트옵션"+z+"번째->"+orderArtOption[z]);
	    				z++;
	    			</c:forEach>
	    		</c:forEach>
	    		
	    	

	    	$.ajax({
	    		url:'/bomulsum/user/goPayment.do',
	    		data:{
	    			'memberCode' : memberCode,
	    			'shipName':shipName,
	    			'shipPhone' : shipPhone,
	    			'shipZip' : shipZip,
	    			'shipFirst' : shipFirst,
	    			'shipSecond' : shipSecond,
	    			'orderSum' : dain_fin_sum,
	    			'choiceCoupon' : choiceCoupon,
	    			'artPointSum' : artPointSum, //예상 적립금
	    			'finUsePoint' : finUsePoint, //사용한적립금
	    			'orderArt' : orderArt,
	    			'orderArtOption' : orderArtOption,
	    			'artDaName' : artDaName
	    			
	    			
	    		},
	    		type:'POST',
	    		success:function(data){
	    			//location.href='/bomulsum/user/successPayment.do';
	    	
	    			$('#successShipName').val(shipName);
	    			$('#successShipPhone').val(shipPhone);
	    			$('#successShipZip').val(shipZip);
	    			$('#successShipAddr1').val(shipFirst);
	    			$('#successShipAddr2').val(shipSecond);
	    			$('#successArtPrice').val(dain_fin_artprice);
	    			$('#successPriceSum').val(dain_fin_sum);
	    			$('#successShipPrice').val(dain_fin_ship);
	    			$('#successShipJeju').val(dain_fin_jeju);
	    			$('#successDiscount').val(dain_fin_discount);
	    			
	    			document.getElementById('orderSuccessForm').submit();


	    		},
	    		error:function(e){
	    			console.log(e);
	    		}
	    	}); 
	        //---------------------------------결제DB처리 끝
	        
	        
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        //msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});  
}

/* 세자리 마다 콤마찍기 */
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

/* 콤마풀기 */
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}


/* 사용가능적립금 체크 */
function reserveCheck(val){
	var usePoint= $("#dainUserPoint").val();
	if(usePoint > myReserve){ /* myReserve : 지금테스트중.. 3000부분에 넣기. */
	document.getElementById('dainUserPoint').value = '';
	}
}


//최종 합산 구하는 함수(할인금액빼고)
function cal_fin_plus(){
  
   dain_fin_artprice = parseInt($('#dain_fin_artprice').text());
	 dain_fin_ship = parseInt($('#dain_fin_ship').text());
	 dain_fin_jeju = 0;
	 
	 var dain_sum = dain_fin_artprice + dain_fin_ship +dain_fin_jeju ;
	 return dain_sum;
}
//최종 합산 구하는 함수(할인금액빼고) - 제주산간도서 ver
function cal_fin_plus_jeju(){
  
   	 dain_fin_artprice = parseInt($('#dain_fin_artprice').text());
	 dain_fin_ship = parseInt($('#dain_fin_ship').text());
	 dain_fin_jeju = dain_fin_jeju_sum;
	 
	 
	 var dain_sum = dain_fin_artprice + dain_fin_ship +dain_fin_jeju ;
	 return dain_sum;
}
//최종결제할 금액(할인포함)
function cal_fin_sum(){
	var plus_sum = 0;
	var t = parseInt($('#dain_fin_jeju').text());
	
	//제주산간 처리
	if( t == 0 ){
		plus_sum = cal_fin_plus();
	}else{
		plus_sum = cal_fin_plus_jeju();
	}
	
	dain_fin_discount = parseInt($('#dain_coupon_input').val()) + parseInt($('#dainUserPoint').val());
	
	dain_fin_sum = plus_sum - dain_fin_discount ;
	
	console.log(dain_fin_artprice+','+ dain_fin_ship +','+ dain_fin_discount +','+dain_fin_jeju);
	    
	document.getElementById('dain_fin_sumprice').innerHTML = numberWithCommas(dain_fin_sum);
	document.getElementById('dain_fin_sumprice2').innerHTML = numberWithCommas(dain_fin_sum);
}



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
					
					
					//제주 도서산간 추가비용 계산
					jejucheck = $('input[name=addrAddr12]').val();
				    if(jejucheck.substring(0,2) == '제주'){
				    	console.log("제주산간비용추가")
				    	$('#dain_fin_jeju').text(dain_fin_jeju_sum);
				    	cal_fin_sum();
				    }else{
				    	$('#dain_fin_jeju').text(0);
				    	cal_fin_sum();
				    }
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
					
					//제주 도서산간 추가비용 계산
					jejucheck = $('input[name=addrAddr12]').val();
				    if(jejucheck.substring(0,2) == '제주'){
				    	console.log("제주산간비용추가")
				    	$('#dain_fin_jeju').text(dain_fin_jeju_sum);
				    	cal_fin_sum();
				    }else{
				    	$('#dain_fin_jeju').text(0);
				    	cal_fin_sum();
				    }
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
					
					//제주 도서산간 추가비용 계산
					jejucheck = $('input[name=addrAddr12]').val();
				    if(jejucheck.substring(0,2) == '제주'){
				    	console.log("제주산간비용추가")
				    	$('#dain_fin_jeju').text(dain_fin_jeju_sum);
				    	cal_fin_sum();
				    }else{
				    	$('#dain_fin_jeju').text(0);
				    	cal_fin_sum();
				    }
				}
			}).open();
}



$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

});

$(function(){
	$('.dain_payment_customer_info').click(function(){
		if ( $(".dain_payment_customer_info_detail").css("display") == "none" ){
			 $('.dain_payment_customer_info_detail').show();
			 $('.dain_payment_customer_info').css("border-bottom", "none");
		} else if( $(".dain_payment_customer_info_detail").css("display") == "block" ){
			 $('.dain_payment_customer_info_detail').hide();
			 $('.dain_payment_customer_info').css("border-bottom", "1px solid #d9d9d9");
		}
	  });

	$('.dain_ordergoods_title').click(function(){
		
		if ( $(".dain-order-goods-table").css("display") == "none" ){
			 $('.dain-order-goods-table').css("display", "block");
			 $('.dain_ordergoods_title').css("border-bottom", "none");
		} else if( $(".dain-order-goods-table").css("display") == "block" ){
			$('.dain-order-goods-table').hide();
			$('.dain_ordergoods_title').css("border-bottom", "1px solid #d9d9d9");
		}
	
	  });
	
    //전화번호 유효성체크
    $("#addrTel1").change(function(){
    	if(!regExp.test($("#addrTel1").val())){ 
    		alert('전화번호를 올바르게 입력해주세요!');
    		document.getElementById('addrTel1').value = '';
    		document.getElementById('addrTel1').focus();
    		return; 
    	}
    });
    $("#addrTel2").change(function(){
    	if(!regExp.test($("#addrTel2").val())){ 
    		alert('전화번호를 올바르게 입력해주세요!');
    		document.getElementById('addrTel2').value = '';
    		document.getElementById('addrTel2').focus();
    		return; 
    	}
    });
    $("#addrTel3").change(function(){
    	if(!regExp.test($("#addrTel3").val())){ 
    		alert('전화번호를 올바르게 입력해주세요!');
    		document.getElementById('addrTel3').value = '';
    		document.getElementById('addrTel3').focus();
    		return; 
    	}
    });
	
	/* 모달---------------- */
	$('#dain_coupon_use').click(function(){
		$('.detail-modal').css("display", "block");
	});
	
	//x버튼
	$(".report-modal__close").click(function(){
		$(".detail-modal").css("display","none");
	});
	
	//쿠폰선택 취소
	$("#cancleUpdate").click(function(){
		$(".detail-modal").css("display","none");
	})
	
	
	/* 개인정보고지 */
	$('#dain_privacy').click(function(){
		if ( $("#dainPrivacyDetail").css("display") == "none" ){
			$("#dainPrivacyDetail").css("display","block");
			$("#dain_privacy_arrow").attr('class','fa fa-angle-up');
			$(".dain_payment_info").css('height','630px');
			}
		else{
			$("#dainPrivacyDetail").css("display","none");
			$("#dain_privacy_arrow").attr('class','fa fa-angle-down');
			$(".dain_payment_info").css('height','450px');
		}
		
		
	})
	
	//적립금 처리---------------
	
	console.log("보유중적립금:"+myReserve);
	
	if(myReserve == null || myReserve<0){
		myReserve = 0;
		$("#dainMyReserve").text(myReserve+'P');
	}else{
		$("#dainMyReserve").text(numberWithCommas(myReserve)+'P');
	}
	
    document.getElementById("dain_point_all_btn").onclick = function() { // on click
    	
    document.getElementById('dainUserPoint').value = myReserve;
    
    	//결제정보 할인 합계에 반영
    	finUsePoint = $("#dainUserPoint").val();
    	finCoupon =  $("#dain_coupon_input").val();
    	sum = parseInt(finUsePoint) + parseInt(finCoupon);
    	
    	//결제금액보다 적립금액이 큰지 확인
    	availablePointCheck = cal_fin_plus();
    	if( sum > availablePointCheck){
    		alert("결제금액 이상의 적립금을 사용할 수 없습니다.");
    		document.getElementById('dainUserPoint').value = 0;
    		finUsePoint = $("#dainUserPoint").val();
    		
    		sum = parseInt(finUsePoint) + parseInt(finCoupon);
    		document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
    	}
    	
  	document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
    	
    	
    }
    
    
    
    //쿠폰사용----------------
    
    document.getElementById("confirmUpdate").onclick = function() {
    	var checkedCoupon = $('input[name=coupon]:checked').val(); //선택한 쿠폰
    	var checkedIndex = checkedCoupon.substring(6); //인덱스
    	var CouponMoney = '${couponList[checkedIndex].couponPrice}'; //해당쿠폰가격

    	var CouponMoney2 = parseInt(CouponMoney);

    	//테스트
    	choiceCoupon = $('input[name=coupon]:checked').attr('id');
    	var choiceCouponPrice = $('#'+choiceCoupon).val();
    	console.log('선택쿠폰테스트:'+choiceCoupon+',가격:'+choiceCouponPrice);
    	

    	if(checkedCoupon=='noUse'){
    		document.getElementById('dain_coupon_input').value = 0;
    	}else{
    		document.getElementById('dain_coupon_input').value = choiceCouponPrice;
    	} 
    	
    	
    	$(".detail-modal").css("display","none");
    	
    	
    	//결제정보 할인 합계에 반영
    	var finUsePoint = $("#dainUserPoint").val();
    	var finCoupon =  $("#dain_coupon_input").val();
    	var sum = parseInt(finUsePoint) + parseInt(finCoupon);
    	
    	document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
    	
    	
    	
    	//결제금액보다 쿠폰금액이 큰지 확인
    	var availablePointCheck = cal_fin_plus();
    	if( sum > availablePointCheck){
    		alert("결제금액 이상의 적립금을 사용할 수 없습니다.");
    		document.getElementById('dain_coupon_input').value = 0;
    		finUsePoint = $("#dainUserPoint").val();
    		
    		sum = parseInt(finUsePoint) + parseInt(finCoupon);
    		document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
    	}
    	
    	
    	
     	console.log("쿠폰확인"+finCoupon);
    	console.log("사용확인적립금:"+ finUsePoint);
    	console.log("합계:"+ sum); 
    	
    	
    	//최종 결제금액 계산
        cal_fin_sum();
    }
    
    
    //최종 결제정보----------------------------------
    
    //할인혜택----
    var usePoint = document.getElementById('dainUserPoint').value;
    console.log(usePoint);
    
    
    //적립금 변경되면 총 할인합계에 반영
    $("#dainUserPoint").change(function(){
    	finUsePoint = $("#dainUserPoint").val();
    	var finCoupon =  $("#dain_coupon_input").val();
    	
    	//값없을때 처리
    	if(finUsePoint ==''){
    		document.getElementById('dainUserPoint').value = 0;
    		finUsePoint = $("#dainUserPoint").val();
    	}

    	var sum = parseInt(finUsePoint) + parseInt(finCoupon);

    	//결제금액보다 적립금액이 큰지 확인
    	var availablePointCheck = cal_fin_plus();
    	if( sum > availablePointCheck){
    		alert("결제금액 이상의 적립금을 사용할 수 없습니다.");
    		document.getElementById('dainUserPoint').value = 0;
    		finUsePoint = $("#dainUserPoint").val();
    		
    		sum = parseInt(finUsePoint) + parseInt(finCoupon);
    		document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
    	}
    		
    		
   		document.getElementById('dain_fin_discount').innerHTML = numberWithCommas(sum);
   		
    	console.log("쿠폰확인"+finCoupon);
    	console.log("사용확인적립금:"+ finUsePoint);
    	console.log("합계:"+ sum); 
    	
    	
    	//최종 결제금액 계산
    	cal_fin_sum()
    	
    });
    
    
	
 	//도서산간 처리-------
	shipInfoSet();
  
 	
 	//작가 제주산간 합계
 	<c:forEach items="${shopbagInfo}" var="item">
 		dain_fin_jeju_sum += ${item.writer_plus_price};
	</c:forEach>
	console.log("제주산간 합계:"+dain_fin_jeju_sum);
	
	
 	
    $('#shipTab1,#shipTab2,#shipTab3').click(function(){
    	shipInfoSet();
        if(shipFirst.substring(0,2)=='제주'){
        	console.log("제주산간비용추가");
        	$('#dain_fin_jeju').text(dain_fin_jeju_sum);
        	cal_fin_sum();
        }else{
        	$('#dain_fin_jeju').text(0);
        	cal_fin_sum();
        }
    });

     //제주 도서산간 추가비용 계산
    if(shipFirst.substring(0,2)=='제주'){
    	console.log("제주산간비용추가");
    	$('#dain_fin_jeju').text(dain_fin_jeju_sum);
    	cal_fin_sum();
    }else{
    	$('#dain_fin_jeju').text(0);
    	cal_fin_sum();
    }
     
     
     
   //작품금액 합계-----------
    <c:forEach items='${shopbagInfo}' var="info">
  		 dain_fin_artprice += ${info.totalPrice}
	</c:forEach>
	console.log("작품금액 합계:"+dain_fin_artprice);
    $('#dain_fin_artprice').text(dain_fin_artprice);
    
  //최종 결제금액 계산------
    cal_fin_sum();
	
  //적립 예정 적립금
    <c:forEach items='${shopbagInfo}' var="info" varStatus="status2">
	    <c:forEach var="totalOption" items="${info.totalOption}" varStatus="status">
	    	artPointSum += ${info.art_point}
	    </c:forEach>
    </c:forEach>
    
    console.log("적립예정 적립금 :"+ artPointSum);
    $('#dainExPoint').text(artPointSum);

    


		
})

</script>
<style>
.content {
	width: 836px;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display: flex;
}

.dainSection {
	width: 100%;
}

.dainUpTitle {
	margin-bottom: 24px;
	width: 100%;
	display: flex;
	justify-content: space-between;
	display: flex;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.dndud_content_title {
	padding-bottom: 4px;
	margin-bottom: 24px;
	position: relative;
	padding-top: 40px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.dndud_txt_f1 {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin: 0px;
}

.dndud_page_loc {
	font-size: 16px;
	font-weight: bold;
	color: #d9d9d9;
	margin-top: 4px;
	list-style: none;
	display: flex;
	align-items: center;
}

.dndud_page_loc li {
	display: flex;
	flex-direction: row;
	margin-left: 8px;
}

.dndud_page_loc li span {
	margin-top: 2px;
	margin-left: 5px;
}

.dndud_page_loc li.active {
	color: #333;
}

.dndud_page_loc i {
	margin-left: 8px;
	display: flex;
	align-items: center;
	font-size: 25px;
}

.dndud_page_loc .icon_num {
	display: flex;
	line-hieght: 24px;
	align-items: center;
	justify-content: center;
	width: 24px;
	height: 24px;
	border-radius: 50%;
	font-size: 10px;
	font-weight: bold;
	font-style: normal;
	border: 1px solid #d9d9d9;
	-webkit-border-radius: 50%;
}

.dndud_page_loc li.active .icon_num {
	border: 0 none;
	background: #1f76bb;
	color: #fff;
}

.dain_payment_customer {
	background-color: white;
	width: 56%;
}

.dain_flex_title {
	background-color: white;
	border: 1px solid #d9d9d9;
	font-size: 16px;
	font-weight: bold;
	padding: 0px 12px;
	display: flex;
	justify-content: space-between;
}

.dain_payment_customer_info_detail {
	background-color: white;
	border-bottom: 1px solid #d9d9d9;
	border-left: 1px solid #d9d9d9;
	border-right: 1px solid #d9d9d9;
	padding: 0px 12px;
	font-size: 12px;
}

.dain_customer_name {
	color: #22a7af;
}

.dainChButton {
	margin-left: 5px;
	background-color: white;
	border: 1px solid #1f76bb;
	padding: 2px 12px;
	font-size: 12px;
	border-radius: 3px;
	margin-left: 14px;
	color: #1f76bb;
}

.dain_customer_table {
	padding-top: 12px;
}

.dainth {
	width: 24%;
	padding-bottom: 20px;
	color: #666666;
	font-size: 12px;
}

.daintd {
	padding-bottom: 20px;
	font-size: 12px;
}

.dainTitle {
	font-size: 16px;
	font-weight: bold;
	padding: 20px 0px;
}

.dain_payment_address {
	padding: 0px 12px;
	background-color: white;
	border: 1px solid #d9d9d9;
	margin-top: 18px;
}

.dain_tab_button {
	display: flex;
}

.dain_tab_btn {
	background-color: white;
	border: 1px solid #d9d9d9;
	border-radius: 2px;
	width: 100%;
	height: 32px;
	color: #ACACAC;
}

.dainem {
	color: #dd5850;
	font-size: 18px;
	display: inline-block;
	margin-right: 10px;
}

.dainInput {
	background: #fff;
	font-size: 12px;
	line-height: 13px;
	height: 26px;
	min-width: 96%;
	border: 1px solid #d9d9d9;
	border-radius: 3px;
	padding: 2px 8px;
	outline: none;
}

.dainBtn {
	background-color: white;
	border: 1px solid #d9d9d9;
	border-radius: 3px;
	padding: 6px 8px;
	outline: none;
	font-size: 12px;
}

.dain_order_detail_p {
	background-color: #dcf8f6;
	color: black;
	padding: 12px 18px;
	font-size: 14px;
	font-weight: bold;
	margin: 0px;
}

.dain_order_detail {
	background-color: #fff;
	border: 1px solid #d9d9d9;
}

.dain-img-bg {
	width: 64px;
	height: 64px;
	background-image: url("../../resources/img/test.png");
	background-size: 64px 64px;
}

.dain_payment_info {
	background-color: white;
	border: 2px solid black;
	border-radius: 2px;
	width: 40%;
	height: 450px;
}

.dain-area-txt {
	padding: 8px 12px;
	font-size: 14px;
}

.dain-amount-price-area {
	display: flex;
	font-size: 12px;
}

.dainRequest {
	width: 400px;
	padding: 12px;
	min-height: 50px;
	background-color: #f5f5f5;
	border: 1px solid #b4b4b4;
	color: #acacac;
	font-size: 12px;
}

.dain-amount {
	font-size: 12px;
	width: 18%;
	text-align: right;
}

.dain-order-goods-table {
	background-color: #fff;
	border: 1px solid #d9d9d9;
	border-collapse: collapse;
}

.dain-order-artist {
	font-size: 14px;
	font-weight: bold;
	background-color: #dcf8f6;
	padding: 12px 18px;
	text-align: left;
	width: 460px;
}

.dain-txt-group {
	font-size: 14px;
	font-weight: bold;
}

.dain_goods_name {
	color: #22a7af;
}

.dain-amount-td {
	padding: 8px 18px;
}

.dain-delvery-title {
	font-size: 13px;
	padding: 18px 0px;
}

.dain-delvery-price {
	font-size: 13px;
	padding: 18px 18px 18px 0px;
	font-weight: bold;
	text-align: right;
}

.dain-price {
	font-size: 12px;
	width: 20%;
	text-align: right;
}

.dain_table_header {
	font-size: 16px;
	padding: 15px 0px 14px;
	margin: 0 22.5px;
	text-align: center;
	border-bottom: 1px solid black;
}

.dain_final_cost {
	padding: 0px 20px;
}

.dain_final_cost table {
	padding-top: 20px;
	padding-bottom: 20px;
	text-align: justify;
	width: 100%;
	border-bottom: 1px solid #d9d9d9;
}

.dain_final_cost th {
	font-size: 13px;
	font-weight: normal;
	padding: 4px 0px;
	color: #666666;
	width: 70%;
}

.dain_final_cost td {
	text-align: right;
	font-size: 13px;
	font-weight: bold;
	width: 30%;
}

.dain_final_total {
	padding: 0px 20px;
}

.dain_final_total table {
	padding-top: 20px;
	text-align: justify;
	width: 100%;
}

.dain_final_total th {
	font-size: 16px;
	width: 50%;
}

.dain_final_total td {
	font-size: 28px;
	width: 50%;
	font-weight: bold;
	color: #dd5850;
	text-align: right;
}

.dain_support {
	padding: 10px 10px;
	margin: 10px 20px;
	border-radius: 3px;
	background-color: #cce5ff;
}

.dain_privacyPolicy {
	padding: 10px 10px;
	margin: 10px 20px;
}

.dain_privacyPolicy_txt {
	font-size: 12px;
	color: #666666;
	background-color: #F8F8F8;
}

.dain_final_payment {
	padding: 0px 20px;
}

.cursor {
	cursor: pointer;
}

.dain_pay_btn {
	width: 100%;
	background-color: #1f76bb;
	color: #fff;
	border: none;
	border-radius: 5px;
	padding: 10px 18px 10px 18px;
	margin-top: 10px;
}

.dain_pay_btn:hover {
	background-color: #1a639d;
}

.dain_pay_btn span {
	font-size: 18px;
}

.dain_pay_btn p {
	margin: 0px;
}

.dibtn, .hoverPointer {
	cursor: pointer;
}

.dibtn:focus {
	outline: none;
}

.dain_payment_discount_info {
	margin-top: 18px;
	border: 1px solid #d9d9d9;
	padding: 0px 12px;
}

.dain_point_input {
	display: block;
	width: 77%;
	margin-right: 2px;
	height: 28px;
	line-height: 1.5;
	text-indent: 10px;
	color: #dd5850;
	font-weight: bold;
	border: 1px solid #acacac;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	outline: none;
}

.dain_point_subtitle {
	color: #666;
	font-size: 13px;
	font-weight: bold;
	padding-bottom: 8px;
}

.dain_point_subcontent {
	color: #666;
	font-size: 12px;
}

.dain_point_subcontent_point {
	color: #dd5850;
	font-size: 12px;
}

.dain_point_btn {
	font-size: 12px;
	padding: 0 16px;
	line-height: 30px;
	background-color: white;
	border: 1px solid #acacac;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border-radius: 2px;
	outline: none;
}

.dain_point_btn:hover {
	background-color: rgb(239, 239, 239);
}

/* number 인풋 화살표없애기 */
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/* 모달 */
.detail-modal {
	width: 100%;
	height: 100%;
	position: fixed;
	top: 0px;
	left: 0px;
	z-index: 1000;
	display: none;
	-webkit-box-align: center;
	align-items: center;
	-webkit-box-pack: center;
	justify-content: center;
	background: rgba(0, 0, 0, 0.6);
	margin-left: auto;
	margin-right: auto;
	top: 0px;
	left: 0px;
}

.report-modal__area {
	width: 360px;
	height: 500px;
	padding: 30px 10px;
	background: rgb(255, 255, 255);
	/* 모달창 가운데로 */
	position: fixed;
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-moz-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
}

.reoprt-modal__head {
	display: flex;
	-webkit-box-pack: justify;
	justify-content: space-between;
	align-items: flex-start;
}

.report-modal__title {
	display: flex;
	-webkit-box-pack: justify;
	justify-content: flex-end;
}

.report-modal__subject {
	font-size: 18px;
	padding-right: 100px;
}

.report-modal__close {
	background-color: transparent;
	border: 0;
	color: red;
	font-size: 20px;
	cursor: pointer;
}

.about_article {
	margin-top: 15px;
	border-top: 2px solid #555;
	padding-top: 15px;
	display: flex;
	flex-direction: column;
}

.about_article_detail {
	flex-direction: row;
}

.article_text {
	display: flex;
	flex-direction: column;
	justify-content: center;
	font-size: 20px;
	font-weight: bold;
	color: #333;
}

.dain_coupon_section {
	display: flex;
	align-items: center;
	margin-left: 5px;
	width: 300px;
	justify-content: space-between;
}

.dain_coupon_title {
	font-size: 14px;
	width: 200px;
}

.dain_coupon_exp {
	font-size: 12px;
	width: 200px;
	color: #999;
}

.dain_coupon_price {
	font-size: 16px;
	color: #1a639d;
}

.buttons {
	margin-top: 18px;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

.buttons span {
	padding: 10px 16px;
	font-size: 12px;
	cursor: pointer;
}

.buttons span:nth-child(1) {
	margin-right: 5px;
	border: 1px solid #d9d9d9;
	border-radius: 2px;
	background-color: #fff;
}

.buttons span:nth-child(1):hover {
	outline: none;
	background-color: #f5f5f5;
	border-color: #d9d9d9;
}

.buttons span:nth-child(2) {
	border: 1px solid #1f76dd;
	background-color: #1f76dd;
	border-radius: 2px;
	color: white;
}

.buttons span:nth-child(2):hover {
	outline: none;
	background-color: #1f76bb;
}

/* 배송지 탭메뉴 */
ul.tabs {
	margin: 0px;
	padding: 0px;
	list-style: none;
}

ul.tabs li {
	display: inline-block;
	background: white;
	color: #acacac;
	cursor: pointer;
	margin: 0 0 0 0;
	float: left;
	width: 32%;
	padding: 5px 0px;
	text-align: center;
	border: 1px solid #d9d9d9;
}

ul.tabs li.current {
	background: #1f76bb;
	color: white;
	border: 1px solid #1f76bb;
}

.tab-content {
	display: none;
	background: white;
	padding: 12px;
}

.tab-content.current {
	display: inherit;
}

.option_txt {
	font-size: 12px;
	color: #666;
	width: 62%;
	min-height: 18px;
	display: flex;
	align-items: center;
}

.dain-art-img {
	width: 58px;
	height: 58px;
	margin-left: 16px;
	border: none;
	border-radius: 6px;
	-moz-border-radius: 6px;
	-khtml-border-radius: 6px;
	-webkit-border-radius: 6px;
}

.list_option {
	margin-bottom: 8px;
	list-style: none;
	font-size: 12px;
	padding: 0;
	width: 100%;
}

.list_option li {
	padding: 0;
	margin: 0;
	margin-bottom: 10px;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.option_txt {
	font-size: 12px;
	color: #666;
	width: 75%;
	min-height: 18px;
	display: flex;
	align-items: center;
	margin-right: 10px;
}
</style>
</head>
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../include/uHeader.jsp"  %>
	
	
	
	<div class="content">

	<!-- 내용 여기다 넣으시오 -->
	
	<div class="dainSection">
		<div class="dainUpTitle">
			<h2  class="dndud_txt_f1">주문 결제하기</h2>
			<ol class="dndud_page_loc">
            <li>
               <em class="icon_num">1</em>
               <span>장바구니</span>
               <i class="fa fa-angle-right"></i>
            </li>
            <li class="active">
               <em class="icon_num">2</em>
               <span>주문결제</span>
               <i class="fa fa-angle-right"></i>
            </li>
            <li>
               <em class="icon_num">3</em>
               <span>주문완료</span>
            </li>
         </ol>
		</div>
		
		<!-- 왼쪽/오른쪽으로 나눔 -->
		<div style="display: flex; justify-content: space-between;">
		<!-- 왼쪽 영역 -->
		<div class="dain_payment_customer">
		<!-- 주문고객 영역 -->
		<div class="dain_payment_customer_info dain_flex_title hoverPointer" >
		<div class="dainTitle">주문고객</div>
		<p class="dain_customer_name">${memName}(${memPhone}) &nbsp;<i class="fa fa-angle-down" 
		style="color: black; font-weight: bold;"></i></p> 
		</div>
		<!-- 위에 누르면 주문고객 정보 자세히 볼수있음 -->
		<div class="dain_payment_customer_info_detail" style="display: none;">
			<table class="dain_customer_table">
				<tr>
					<td class="dainth">주문자 정보</td>
					<td class="daintd">${memName}</td>
				</tr>
				<tr>
					<td class="dainth"><em class="dainem">*</em>전화</td>
					<td class="daintd">${memPhone}<!-- <button class="dainChButton dibtn">변경하기</button> --></td>
				</tr>
				<tr>
					<td class="dainth"></td>
					<td class="daintd">주문, 배송시 등록된 번호로 SMS를 발송해 드립니다.</td>
				</tr>
			</table>
		</div>
		
		<!-- 주소(배송지) -->
		
	
		<div class="dain_payment_address">
			<div class="dainTitle">주소 (배송지)</div>

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" id="shipTab1" >1</li>
				<li class="tab-link " data-tab="tab-2" id="shipTab2" >2</li>
				<li class="tab-link " data-tab="tab-3" id="shipTab3" >3</li>
			</ul>
			<!-- </div> -->
			<br><br>
			
			<!-- 배송지 테이블--1 -->
			<div id="tab-1" class="tab-content current">
			<div class="dain_address_info_root">
			<table class="dainTable" id="dt1">
				<tr class="daintr">
					<td class="dainth td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
					<td class="daintd td2" style="padding-top: 15px;">
						<input class="dainInput di1 selectedShipName" name="addrName1" id="addrName1" type="text" placeholder="받는분 이름을 입력해주세요." 
						autocomplete="off" required="required" data-address="delivery_name" value="${address1.member_address_name}" />
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" ><em class="dainem">*</em>전화번호</td>
					<td class="daintd" >
						<input class="dainInput di1 selectedShipPhone" name="addrTel1" id="addrTel1" type="text" autocomplete="off" 
						required="required" value="${address1.member_address_phone}" />
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" style="vertical-align: top;"><em class="dainem">*</em>주소</td>
					<td class="daintd" style="padding-bottom: 15px;">
						<!-- 주소 name에 숫자두개는 앞에숫자가 n번배송지, 뒤에숫자(1-2-3이 우편번호-주소1-주소2 -->
						<input class="dainInput dai1" name="addrAddr11" id="sample6_postcode" type="text" 
						placeholder="우편번호" autocomplete="off" readonly="readonly" 
						value="${address1.member_address_zipcode}"
						required="required" style="min-width: 30%; max-width: 30%; margin-bottom: 10px;"/>
						<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
						<button id="adrBtn1" class="dainBtn dibtn" onclick="daumPostcode()">주소 찾기</button><br>
						<input class="dainInput dai1" name="addrAddr12" id="sample6_address" type="text" 
						placeholder="기본주소" autocomplete="off" readonly="readonly"
						value="${address1.member_address_first}"
						required="required" style="margin-bottom: 10px;"/><br>
						<input class="dainInput di1" name="addrAddr13" id="sample6_detailAddress" type="text" 
						placeholder="나머지 주소" autocomplete="off" 
						value="${address1.member_address_second}"
						required="required" style="margin-bottom: 10px;"/><br>
					</td>
				</tr>
			</table>
			</div>
			</div>
			<!-- 배송지 테이블--2 -->
			<div id="tab-2" class="tab-content">
			<div class="dain_address_info_root">
			<table class="dainTable" id="dt1">
				<tr class="daintr">
					<td class="dainth td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
					<td class="daintd td2" style="padding-top: 15px;">
						<input class="dainInput di1 selectedShipName" name="addrName2" id="addrName2" type="text" placeholder="받는분 이름을 입력해주세요." 
						autocomplete="off" required="required" data-address="delivery_name" 
						value="${address2.member_address_name}"/>
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" ><em class="dainem">*</em>전화번호</td>
					<td class="daintd" >
						<input class="dainInput di1" name="addrTel2" id="addrTel2" type="text" autocomplete="off" 
						required="required" value="${address2.member_address_phone}"/>
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" style="vertical-align: top;"><em class="dainem">*</em>주소</td>
					<td class="daintd" style="padding-bottom: 15px;">
						<!-- 주소 name에 숫자두개는 앞에숫자가 n번배송지, 뒤에숫자(1-2-3이 우편번호-주소1-주소2 -->
						<input class="dainInput dai1" name="addrAddr21" id="sample6_postcode2" type="text" 
						placeholder="우편번호" autocomplete="off" readonly="readonly"
						value="${address2.member_address_zipcode}"
						required="required" style="min-width: 30%; max-width: 30%; margin-bottom: 10px;"/>
						<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
						<button id="adrBtn2" class="dainBtn dibtn" onclick="daumPostcode2()">주소 찾기</button><br>
						<input class="dainInput dai1" name="addrAddr22"  id="sample6_address2" type="text" 
						placeholder="기본주소" autocomplete="off" readonly="readonly"
						value="${address2.member_address_first}"
						required="required" style="margin-bottom: 10px;"/><br>
						<input class="dainInput di1" name="addrAddr23" id="sample6_detailAddress2" type="text" 
						placeholder="나머지 주소" autocomplete="off" 
						value="${address2.member_address_second}"
						required="required" style="margin-bottom: 10px;"/><br>
					</td>
				</tr>
			</table>
			</div>
			</div>			
			
			<!-- 배송지 테이블--3 -->
			<div id="tab-3" class="tab-content">
			<div class="dain_address_info_root">
			<table class="dainTable" id="dt1">
				<tr class="daintr">
					<td class="dainth td1" style="vertical-align: middle;"><em class="dainem">*</em>받는분</td>
					<td class="daintd td2" style="padding-top: 15px;">
						<input class="dainInput di1" name="addrName3" id="addrName3" type="text" placeholder="받는분 이름을 입력해주세요." 
						autocomplete="off" required="required" data-address="delivery_name" 
						value="${address3.member_address_name}"/>
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" ><em class="dainem">*</em>전화번호</td>
					<td class="daintd" >
						<input class="dainInput di1" name="addrTel3" id="addrTel3" type="text" autocomplete="off" 
						required="required" value="${address3.member_address_phone}"/>
					</td>
				</tr>
				<tr class="daintr">
					<td class="dainth" style="vertical-align: top;"><em class="dainem">*</em>주소</td>
					<td class="daintd" style="padding-bottom: 15px;">
						<!-- 주소 name에 숫자두개는 앞에숫자가 n번배송지, 뒤에숫자(1-2-3이 우편번호-주소1-주소2 -->
						<input class="dainInput dai1" name="addrAddr31" id="sample6_postcode3" type="text" 
						placeholder="우편번호" autocomplete="off" readonly="readonly"
						value="${address3.member_address_zipcode}"
						required="required" style="min-width: 30%; max-width: 30%; margin-bottom: 10px;"/>
						<!-- 수정버튼 눌렀을때 아래 버튼이 생김 -->
						<button id="adrBtn3" class="dainBtn dibtn" onclick="daumPostcode3()">주소 찾기</button><br>
						<input class="dainInput dai1" name="addrAddr32" id="sample6_address3" type="text" 
						placeholder="기본주소" autocomplete="off" readonly="readonly"
						value="${address3.member_address_first}"
						required="required" style="margin-bottom: 10px;"/><br>
						<input class="dainInput di1" name="addrAddr33" id="sample6_detailAddress3" type="text" 
						placeholder="나머지 주소" autocomplete="off" 
						value="${address3.member_address_second}"
						required="required" style="margin-bottom: 10px;"/><br>
					</td>
				</tr>
			</table>
			</div>
			</div>				
		</div>
		
		
		<!-- 주문작품정보 타이틀 -->
		<div class="dain_ordergoods_title dain_flex_title hoverPointer" style="margin-top: 18px;">
			<p>주문 작품 정보</p>
			<c:if test="${fn:length(shopbagInfo) le 1}">
				<p class="dain_goods_name"><span class="dain_goods_name_span">${shopbagInfo[0].art_name}</span>
				<i class="fa fa-angle-down" style="color: black; font-weight: bold;"></i></p>
			</c:if>
			<c:if test="${fn:length(shopbagInfo) gt 1}">
				<p class="dain_goods_name"><span class="dain_goods_name_span">${shopbagInfo[0].art_name} 외 ${fn:length(shopbagInfo)-1}건</span>
				<i class="fa fa-angle-down" style="color: black; font-weight: bold;"></i></p>
			</c:if>
		</div>
		
		
		
		
		<!-- 배송비 합계 구할변수 선언 -->
		<c:set var="shippingSum" value = "0" />
		
		
		<!-- 주문작품정보 상세 -->
		<c:forEach items='${shopbagInfo}' var="info" varStatus="status2">
			
		<table class="dain-order-goods-table" style="display: none;">
		<thead>
			<tr>
				<th class="dain-order-artist" colspan="2" >
				<div class="dain-textgroup">
				${info.writer_brand_name} 작가님
				</div>
				</th>
			</tr>
		</thead>
	
		<tbody>
			<tr><td colspan="2" style="height:8px;"></td></tr>
			<tr>
				<td class="dain-img-area" width="75px">
					<img class="dain-art-img" src="<c:url value='/upload/${info.art_photo}'/>"/>
				</td>
				<td class="dain-area-txt" width="350px;">
					<div class="dain-txt-group"  >
						<label class="dain-title-txt">${info.art_name}</label>
					</div>
				</td>
			</tr>
			<tr>
				<td class="dain-amount-td" colspan="2"  style="border-bottom: 1px solid #d9d9d9;">
				<div style="display: flex; justify-content: space-between; ">
				
					<!-- 주문작품 옵션 정보 -->
					<ul class="list_option">
								<c:forEach var="totalOption" items="${info.totalOption}" varStatus="status">
									<li>
											<span class="option_txt">
											<c:forEach var="j" items="${totalOption.optionArray}">
											${j.art_option_category}:&nbsp;${j.art_option_name}:&nbsp;${j.art_option_price}원 &nbsp;/
											</c:forEach>
											&nbsp;수량: ${totalOption.artCount}<%--  포인트:${info.art_point} --%>
											</span>
											<div>
									 		 	<div class="cost_text">${totalOption.totalSum}원</div>
												<div class="jeonga_cost" style="display:none">${totalOption.totalSum}</div> 
												<div class="cart_seq" style="display:none">${info.cart_seq}</div>
												<div class="index" style="display:none">${status.index}</div>
												<div style="display:none">${info.cart_seq}</div>
												
											</div>
											
									</li>
									</c:forEach>
								</ul>
				<%-- 	<div class="dain-amount">수량: ${info.art_count}개</div> --%>
					
					<!-- 작품별 총합계 -->
					<div class="dain-price" style="display: none;">${info.totalPrice}원</div>
				</div>
				<c:if test="${info.order_request ne null}">
					<textarea id="dainOrderRequest" class="dainRequest" readonly="readonly">${info.order_request}</textarea>
				</c:if>
				</td>
			</tr>
			<tr>
				<th class="dain-delvery-title">배송비</th>
				<td class="dain-delvery-price" id="artship_${info.cart_seq}">
				
				<c:if test="${info.totalPrice ge info.writer_sendfree_case}">
					0<a>원</a>
					<!-- 배송비 합계 연산 -->
					<c:set var="shippingSum" value= "${shippingSum + 0}"/>

				</c:if>	
				<c:if test="${info.totalPrice lt info.writer_sendfree_case}">
					<!-- 배송비 합계 연산 -->
					${info.writer_send_price}<a>원</a>
					
					<c:set var="shippingSum" value= "${shippingSum + info.writer_send_price}"/>
				
				</c:if>
				</td> 
			</tr>
		</tbody>
		</table>	
		</c:forEach>
		
		<%-- <c:out value="${shippingSum}"/> --%>
		
		<!-- 할인 혜택 -->
		<div class="dain_payment_discount_info" >
		<div class="dainTitle">보물섬 할인 혜택</div>
		
		<div class="dain_point_subtitle">적립금</div>
		<div class="dain_point_input_flex" style="display: flex;">
			<input type="number" name="usePoint" class="dain_point_input" id="dainUserPoint" 
			min="0" value="0" onkeyup="reserveCheck(this);">
			<button class="dain_point_btn cursor" id="dain_point_all_btn">전부사용</button>
		</div>
		<span class="dain_point_subcontent">보유중인 적립금:</span> <span class="dain_point_subcontent_point" id="dainMyReserve"></span>
		
		<div class="dain_point_subtitle" style="margin-top: 20px;">할인쿠폰</div>
		<div class="dain_point_input_flex" style="display: flex; padding-bottom: 20px;">
			<input type="number" name="usePoint" class="dain_point_input" id="dain_coupon_input" min="0" readonly="readonly" value="0">
			<button class="dain_point_btn cursor" id="dain_coupon_use">쿠폰사용</button>
		</div>
	
		</div>
		<!-- 할인끝 -->
		
		
		<!-- 끝 왼쪽영역(dain_payment_customer)-->
		</div>
		
		<!-- 오른쪽영역 시작: 결제정보 -->
		<div class="dain_payment_info">
			<h3 class="dain_table_header">결제 정보	</h3>
		
		
		<div class="dain_final_cost">
		<table>
			<tr>
				<th>작품금액</th>
				<td><span id="dain_fin_artprice">0</span>원</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><span id="dain_fin_ship">${shippingSum}</span>원</td>
			</tr>
			<tr>
				<th>할인 혜택</th>
				<td><span id="dain_fin_discount">0</span><span>원</span></td>
			</tr>
			<tr>
				<th>제주 / 도서산간 추가비용</th>
				<td><span id="dain_fin_jeju">0</span>원</td>
			</tr>
		</table>
		</div>
		
		<div class="dain_final_total">
		<table>
			<tr>
				<th>최종 결제 금액</th>
				<td><span id="dain_fin_sumprice" class="dain_fin_sumprice">0</span>원</td>
			</tr>
		</table>
		</div>
		

		
		<div class="dain_privacyPolicy">
			<label>
			<input type="checkbox" id="dain_privacy_check" name="privacy_info" autocomplete="off" required="required" class="bp">
	        <span class="cursor" style="font-size:14px;"><em class="dainem">*</em>개인정보 제3자 제공고지 </label>
	        <span id="dain_privacy" class="cursor" style="font-size:12px; color: #666; margin-left: 10px;">더보기
	        <i id="dain_privacy_arrow" class="fa fa-angle-down" aria-hidden="true"></i></span></span>
	        <div class="dain_privacyPolicy_txt" id="dainPrivacyDetail" style="display:none;">
		        ‣ 제공받는 자 : 
		        <c:forEach items='${shopbagInfo}' var="i">
		        	${i.writer_brand_name} 
		        </c:forEach>
		        <br>
			‣ 목적 : 판매자와 구매자 사이의 원활한 거래 진행, 상품의 배송을 위한 배송지 확인, 고객상담 및 불만처리 등<br>
			‣ 정보 : 별명, 이름, 전화, 주소<br>
			‣ 보유기간 : 발송완료 후 15일<br>
			<br>
			보물섬은 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 아이디어스는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.
	        </div>
		</div>
		
		<div class="dain_final_payment">
		<button id="pay_btn" class="dain_pay_btn dibtn" onclick="goPayment()">
          <span ><span id="dain_fin_sumprice2">0</span>원</span>
          <span>카드 결제</span>
          <p class="point" data-label="point" style="display: block;">예상적립금 : <em id="dainExPoint">0</em>P</p>
       </button>
       </div>
		<!-- 오른쪽 영역 끝 -->
		</div>
		</div>
		
		
		<form id="orderSuccessForm" action="<c:url value='/user/successPayment.do'/>" method="post">
		<input type="text" id="successShipName" name="SuccessShipName" value="배송지이름" style="display: none;">
		<input type="text" id="successShipPhone" name="SuccessShipPhone" value="배송지이름" style="display: none;">
		<input type="text" id="successShipZip"  name="SuccessShipZip" value="배송지우편번호" style="display: none;">
		<input type="text" id="successShipAddr1" name="SuccessShipAddr1" value="배송지기본주소" style="display: none;">
		<input type="text" id="successShipAddr2" name ="SuccessShipAddr2" value="배송지상세주소" style="display: none;">
		<input type="number" id="successArtPrice" name = "SuccessArtPrice" value="0" style="display: none;">
		<input type="number" id="successShipPrice" name ="SuccessShipPrice" value="0" style="display: none;">
		<input type="number" id="successDiscount" name ="SuccessDiscount" value="0" style="display: none;">
		<input type="number" id="successShipJeju" name ="SuccessShipJeju" value="0" style="display: none;">
		<input type="number" id="successPriceSum" name ="SuccessPriceSum" value="0" style="display: none;">
		</form>
		

		
		
	<!-- dainSection끝 -->
	</div> 
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../include/uFooter.jsp" %>
</div>

<!-- 모달 -->
<div class="detail-modal">
    <div class="report-modal__area">
        <div class="report-modal__head">
            <div class="report-modal__title">
                <div class="report-modal__subject">쿠폰선택</div>
                <button class="report-modal__close">
                    <i style="font-size: 20px; color:red;"class="fas fa-times"></i>
                </button>
            </div>
        </div>
        
        <div class="about_article">
        	<div class="about_article_detail" >
        		<div class="dain_coupon_list" style="height: 380px; overflow-y:scroll; scroll:auto; overflow-x:hidden;">
				  <input type="radio" id="noUse" name="coupon" value="noUse" checked="checked">
				  <label for="noUse" style="font-size: 14px;">사용안함</label><br>
				  <hr style="border: 0; height: 1px; width:330px; background: #ccc; margin: 20px 0px;">
				  
				  <!-- 사용자쿠폰 -->
				 <c:if test="${empty couponList}">
				 <span style="font-size: 14px; margin-left: 10px;">사용가능한 쿠폰이 없습니다.</span>
				 </c:if>
				  
				<c:forEach var="coupons" items="${couponList}" varStatus="status">
				  <div style="display: flex; " >
				  <input type="radio" id="${coupons.coupon_code_seq}" name="coupon" value="${coupons.coupon_price}">
				  <label for="${coupons.coupon_code_seq}"> 
				  <div class="dain_coupon_section" >
					  <div >
					  <div class="dain_coupon_title">${coupons.coupon_name}</div>
					  <div class="dain_coupon_exp">사용기한 : ${coupons.coupon_date}까지</div>
					  </div>
					  <div class="dain_coupon_price">-<span id="dain_discount_money${coupons.coupon_code_seq}">${coupons.coupon_price}</span>원</div>
				  </div>
				  </label>
				  </div>
				  
				  <br>
				</c:forEach>
				<!--   <div style="display: flex; " >
				  <input type="radio" id="coupon2" name="coupon" value="coupon2">
				  <label for="coupon2"> 
				  <div class="dain_coupon_section" >
					  <div >
					  <div class="dain_coupon_title">#쿠폰이름 할인쿠폰 20%</div>
					  <div class="dain_coupon_exp">사용기한 : 2020년 09월 30일까지</div>
					  </div>
					  <div class="dain_coupon_price">-5,000원</div>
				  </div>
				  </label>
				  </div>
				  
  					<br>

				  <div style="display: flex; " >
				  <input type="radio" id="coupon3" name="coupon" value="coupon3">
				  <label for="coupon3"> 
				  <div class="dain_coupon_section" >
					  <div >
					  <div class="dain_coupon_title">#쿠폰이름 할인쿠폰 20%</div>
					  <div class="dain_coupon_exp">사용기한 : 2020년 09월 30일까지</div>
					  </div>
					  <div class="dain_coupon_price">-5,000원</div>
				  </div>
				  </label>
				  </div> -->
				   <!-- 사용자쿠폰 끝-->
				  
				  </div> <!-- coupon_list -->
				  		
				<div class="buttons">
		        	<span id="cancleUpdate">취소</span>
		        	<span id="confirmUpdate">선택하기</span>
		        </div>	
		        
        	</div>
        </div>
        
       
        	
       </div>
        
</div>
</body>
</html>