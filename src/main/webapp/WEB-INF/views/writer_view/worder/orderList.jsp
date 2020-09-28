<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 리스트</title>
<link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->

<link href="<c:url value='/resources/css/sb-admin-2.min.css'/>" rel="stylesheet">

<style type="text/css">

#aboutSend tr th table {
	background-color: white;
}

#aboutSend tr th#asdfasdf{
	padding:0.3%;
	text-align:center;
	border: 1px solid black;
	background-color: #dcdcdc;
}

#aboutSend tr{
	border: 1px solid black;
	height: 38px;
}

#aboutSend td{
	padding:0.3%;
	font-size:13px;
	text-align:center;
	border: 1px solid black;
	background-color: #28E7FF;
}

#thCss{
	padding: 1rem;
	border: 2px solid white;
	cursor: pointer;
}

#thCss:hover {
	background-color: #FF5050;
}

#popupDiv { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background: #dcdcdc;
	width: 500px;
	height: 250px;
	display: none;
	border: 1px solid gray;
}

#popupCustomer { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background: #dcdcdc;
	width: 500px;
	height: 250px;
	display: none;
	border: 1px solid gray;
}

#sendModal { /* 팝업창 css */
	top: 0px;
	position: absolute;
	background: white;
	width: 1400px;
	height: 500px;
	display: none;
	border: 1px solid gray;
}

#popup_mask { /* 팝업 배경 css */
	position: fixed;
	width: 100%;
	height: 1000px;
	top: 0px;
	left: 0px;
	display: none;
	background-color: #000;
	opacity: 0.8;
}
a:hover, a:active{
   text-decoration: none;
   border: none;
}
.minwoo_order_option{
	margin-bottom: 1rem;
	padding: 1rem;
	width: 100%;
	background-color: #dcdcdc;
	height: 145px;
	overflow: auto;
}
.minwoo_order_option::-webkit-scrollbar {
    width: 10px;
  }
  
.minwoo_order_option::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
.minwoo_order_option::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<!-- Header/Nav -->
		<%@ include file="../include/side.jsp" %>
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">
				<%@ include file="../include/head.jsp" %>
				<!-- end Header/Nav -->

				<div style="margin-left: 2%; margin-right: 2%;">
					<h2 style="text-style: bold; margin-bottom: 0rem;">주문</h2>
					<hr
						style="margin-top: 0rem; border: 0; background: #ccc; height: 0.2rem;">

					<div>
						<select style="font-size: 1rem; width: 8%; height: 1.8rem">
							<option>주문일자</option>
						</select>
						<input id="beforeDate" type="date" value="2019-09-22" max="2020-07-14">
							~
						<input id="afterDate" type="date" value="2019-09-22" max="2020-07-14">
							<input id="today" type="radio" name="date" value="오늘" checked>
							<label for="오늘">오늘</label>
							<input id="lastWeek" type="radio" name="date" value="지난주">
							<label for="지난주">지난주</label>
							<input id="lastYear" type="radio" name="date" value="지난달">
							<label for="지난달">지난달</label>
					</div>

					<div>
						<select style="font-size: 1rem; width: 8%; height: 1.8rem">
							<option>주문자</option>
							<option>작품명</option>
							<option>주문번호</option>
						</select> <input name="searchFor" type="text" placeholder="검색어 입력"
							size="40rem">
						<button
							style="color: #dcdcdc; border: 0; background-color: white; outline-style: none; font-weight: bold">검색</button>

						<select
							style="font-size: 12px; width: 100px; height: 30px; align: right">
							<option>10개씩 보기</option>
							<option>20개씩 보기</option>
							<option>30개씩 보기</option>
						</select>

					</div>

					<table style="width: 100%; margin-top: 1rem;">
						<tr align="center" style="background-color: #c8c8c8; color: black;">
							<th id="thCss"><a href="<c:url value='/writer/order/orderList.wdo?buyWriterOrderStatus=결제 완료'/>">주문 완료<br>${orderCount[0]}</a></th>
							<th id="thCss"><a href="<c:url value='/writer/order/orderList.wdo?buyWriterOrderStatus=배송 완료'/>">배송 완료<br>${orderCount[1]}</a></th>
							<th id="thCss"><a href="<c:url value='/writer/order/orderList.wdo?buyWriterOrderStatus=환불 대기'/>">환불 요청<br>${orderCount[2]}</a></th>
							<th id="thCss"><a href="<c:url value='/writer/order/orderList.wdo?buyWriterOrderStatus=환불 완료'/>">환불 완료<br>${orderCount[3]}</a></th>
							<th id="thCss"><a href="<c:url value='/writer/order/orderList.wdo?buyWriterOrderStatus=환불 거부'/>">환불 거부<br>${orderCount[4]}</a></th>
						</tr>
					</table>


					<!-- 구매 내역 들어올 공간 -->
					<div class="minwoo_orderOneData" id="minwoo_orderOneData">			
					
					</div>
					
					


					<div style="margin-top: 1rem">
						<div style="border: 1px solid gray; display: inline-block; padding: 0.2rem">
							<input type="checkbox">전체 선택
						</div>
						<input type="button" value="엑셀 저장"> <input type="button" value="다중배송정보 입력">
					</div>

					
					
					
					
					
					
					<!-- 배송정보 입력 버튼 모달 창 -->
					<div id="sendModal">
						<!-- 팝업창 -->
						<div style="float:right;">
							<button id="sendCloseModal" style="background-color:white;border:0"><i class="fas fa-times"></i></button>
						</div>
						
						<div style="width:100%;background-color:#dcdcdc; padding:1%">
							<h6 style="font-weight:bold; margin-bottom:0">발송 정보</h6>
							<a style="font-size:70%">선택된 항목만 처리합니다</a>
						</div>
						
						<form action="<c:url value='/writer/order/orderDeliveryReg.wdo'/> " method="post" name="formSubmit">
						<div style="margin-top:1%; margin-left:1%; margin-right:1%; 
							height:370px; background-color:white; border:1px solid gray">
							<table id="aboutSend" style="width:100%; border:1px solid black">
								<tr style="padding:3%">
									<th id="asdfasdf"><input type="checkbox" checked="checked"/></th>
									<th id="asdfasdf" width="190px">주문번호</th>
									<th id="asdfasdf">주문상태</th>
									<th id="asdfasdf">받는사람</th>
									<th id="asdfasdf">전화번호</th>
									<th id="asdfasdf" width="310px">주소</th>
									<th width="160px" style="background-color:#dcdcdc">
										<table style="width:150px; height:30px; margin-left:2%; background-color:white">
											<tr style="width:150px; height:30px" >
												<th style="border:1px solid gray; text-align:left; padding-right:2%">
													<a style="text-align:left">&nbsp;배송일 선택</a>
												</th>
												<th style="text-align:center">
													<i class="far fa-calendar" style=" margin-left:2%"></i>
												</th>
											</tr>
										</table>
									</th>
									<th id="asdfasdf" width="160px">
										<select style="width:150px; height:30px"><option>택배사 선택</option></select>
									</th>
									<th id="asdfasdf" width="170px">
										<input type="text" value="운송장 번호" size="10" readonly/>
										<input type="button" value="확인" style="background-color:red; color:white" readonly />
									</th>
								</tr>
								<tr>
									<td><input type="checkbox" checked="checked"/></td>
									<td id="modalOrderCodeSeq"></td>
									<td id="modalOrderStatus"></td>
									<td id="modalOrderReceiver"></td>
									<td id="modalTel"></td>
									<td id="modalJuso"></td>
									<td><input name="buyDeliveryDate" id="buyDeliveryDate" type="date" style="width:150px; height:30px"></td>
									<td>
										<select name="buyDeliveryName" style="width:150px; height:30px">
											<option value="CJ대한 통운">CJ대한 통운</option>
											<option value="우체국 택배">우체국 택배</option>
											<option value="한진 택배">한진 택배</option>
											<option value="롯데 택배">롯데 택배</option>
											<option value="로젠 택배">로젠 택배</option>
										</select>
									</td>
									<td>
										<input type="hidden" name="buyWriterCodeSeq" id='modalBuyWriterCodeSeq'>
										<input type="hidden" name="memberCodeSeq" id ="modalMemberCodeSeq" >
										<input type="hidden" name="alarmContent" id ="modalAlarmContent" >
										<input name="buyDeliveryNum" id="number" type="text" size="18" onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;"/>
									</td>
								</tr>
							</table>
						</div>
						
						<div style="float:right; margin-top:0.5%; margin-right:1%">
							<button id="sendCloseModala" style="width:70px"> 취소 </button>
							<button onClick="saveDelivery(event);" style="width:70px; background-color:red"> 확인 </button>							
						</div>
						</form>
						
					</div>
					<!-- 모달 종료 -->
					
					
					
					
					
					
					

				</div>

				<!-- footer -->
				<%@ include file="../include/footer.jsp" %>
				<!-- end footer -->
			</div>
			<!-- Scroll to Top Button-->
			<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>
			
			<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
			<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

			<!-- Core plugin JavaScript-->
			<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/>"></script>

			<!-- Custom scripts for all pages-->
			<script src="<c:url value='/resources/js/sb-admin-2.min.js'/>"></script>
			
		</div>
	</div>


	



	<script>
		var result = new Array();
		var buttonClickFunc;
		var refundOrder;
		
		<c:forEach var="i" items='${totalOrderList}'>
		
			var json = new Object();
			json.orderCodeSeq = '${i.orderCodeSeq}';
			json.memberCodeSeq = '${i.memberCodeSeq}';
			json.orderDate = '${i.orderDate}';
			json.orderReceiver = '${i.orderReceiver}';
			json.orderPhoneNum = '${i.orderPhoneNum}';
			json.orderZipcode = '${i.orderZipcode}';
			json.orderAddressFirst = '${i.orderAddressFirst}';
			json.orderAddressSecond = '${i.orderAddressSecond}';
			json.orderPayPrice = '${i.orderPayPrice}';
			json.orderPointPrice = '${i.orderPointPrice}';
			json.couponCodeSeq = '${i.couponCodeSeq}';
			
			json.buyWriterCodeSeq = '${i.buyWriterCodeSeq}';
			json.writerCodeSeq = '${i.writerCodeSeq}';
			json.buyWriterSendPrice = '${i.buyWriterSendPrice}';
			json.buyWriterPlusSendPrice = '${i.buyWriterPlusSendPrice}';
			json.buyWriterOrderStatus = '${i.buyWriterOrderStatus}';
			json.buyWriterOrderRefundReason = '${i.buyWriterOrderRefundReason}';
			json.buyWriterOrderRefundDate = '${i.buyWriterOrderRefundDate}';
			json.buyRefundRequestDate = '${i.buyRefundRequestDate}';
			
			json.buyArtCodeSeq = '${i.buyArtCodeSeq}';
			json.artCodeSeq = '${i.artCodeSeq}';
			json.artName = '${i.artName}';
			json.buyArtRequest = '${i.buyArtRequest}';
			json.buyArtReviewStatus = '${i.buyArtReviewStatus}';
			json.buyArtReviewUpdate = '${i.buyArtReviewUpdate}';
			
			json.buyOptionCodeSeq = '${i.buyOptionCodeSeq}';
			json.artPrice = '${i.artPrice}';
			json.artOptionSeqList = '${i.artOptionSeqList}';
			json.artOptionName = '${i.artOptionName}';
			json.artOptionAmount = '${i.artOptionAmount}';
			json.buyDeliveryNum = '${i.buyDeliveryNum}';
			json.artAmount = '${i.artAmount}';
			json.artPhoto = '${i.artPhoto}';
	
			json.artDiscount = '${i.artDiscount}';
			json.buyArtOptionPrice = '${i.buyArtOptionPrice}';
			json.memberProfile = '${i.memberProfile}';
			json.memberName = '${i.memberName}';
			json.artSaleCount = '${i.artSaleCount}';
			
			
			result.push(json);
		</c:forEach>
	
		console.log(result);
	
		document.getElementById('beforeDate').value = new Date().toISOString().substring(0, 10);
		document.getElementById('afterDate').value = new Date().toISOString().substring(0, 10);

		$(document).ready(function(){
			renderTable();
		}); 

		//데이터 뿌려주기
		var renderTable = function(){
			//할인율 % 표시를 위한 변수
			var artOrginPrice = 0;
			var artDiscountPrice = 0;
			var discountPer = 0;

			var html = '';
			var artImg = '';
			var artOption = [];
			var artOptionAmount = [];
			var artPrice = [];
			var artPriceL = 0; // 옵션별 수량 * 옵션별 작품 가격 , 총 작품 구매 가격(배송비 제외)
			// 내역 없을 때 이걸로 넣어주기.
			var noHtml = '<div class="card border-bottom-primary shadow h-100 py-2" style="padding-top: 0rem !important; padding-bottom: 0rem !important"><div align="center" style="margin: 2rem 2rem 2rem 2rem">요청 건이 없습니다.</div></div>';
			
			//여기서 만들어진 html 을 innerhtml 해줄거임.
			for(var i=0; i<result.length; i++){
				console.log(i);
				artPriceL = 0;
				artOrginPrice = 0;
				artDiscountPrice = 0;
				discountPer = 0;
				
				
				//제일 상단
		  		html += '<div style="border: 1px solid gray; width: 100%; height: 50%; margin-top: 1rem">'
		  			+ '<div style="background-color: #dcdcdc;">'
					+ '<input type="checkbox" style="margin: 1rem" />'
					+ '<a style="font-size: 1rem; border-style: solid; border-color: #28E7FF; width: 100%; text-align: center; background-color: white; color: #28E7FF">'
					+ result[i].buyWriterOrderStatus + '</a>'
					+ '<a style="margin-left: 1rem; width: 80%"> 주문 번호 : ' + result[i].orderCodeSeq + ' </a>'
					+ '<div style="float: right; margin-top: .75rem">' + result[i].orderDate + '</div>'
					+ '</div>'
		  		
	  			var j=i;
	  			labelCancelLoops:do {// result의 다음번 orderCodeSeq가 같을 경우, 동일한 구매 내역이므로 배송정보를 동일하게 입력할 수 있도록 반복문을 돌린다.
		  			
		  			if(i >= (j-1)){
		  				i = j;
		  			}
		  			
		  			artImg = result[i].artPhoto.split(',')[0];
		  			artOption = result[i].artOptionName.split('|-%-|');
		  			artOptionAmount = result[i].artOptionAmount.split('|-%-|');
					artPrice = result[i].artPrice.split('|-%-|');
		  			
			  		html += '<div style="display: flex; width: 100%">'
			  			+ '<div style="width:50%">'
						+ '<div style="text-align: left; margin: 1rem; border: 1px solid gray; width: 85%">'
						
						
						+ '<table style="width: 100%">'
						+ '<tr>'	
						+ '<td>'	
						+ '<img style="overflow: hidden; display: flex; align-items: center; justify-content: center; width: 75px; height: 75px"'
						+ 'src="/bomulsum/upload/'+ artImg +'" />'		
						+ '</td>'
						+ '<td>'
						+ '<div style="text-align: left">'
						+ '<a href="" style="color: black; text-style: bold;">'
						+ '<input type="checkbox" checked="checked" />' + result[i].artName + '</a><br>' + result[i].artAmount + ' 개남음<br>';
					
		  			//할인 된 상품일 때 할인 률 표시해주기
		  			if(result[i].artDiscount != null || result[i].artDiscount == 0){
		  				// 할인 율 % 계산
		  				artDiscountPrice = result[i].artDiscount;
		  				artOrginPrice = result[i].artPrice;
		  				discountPer = Math.round((artOrginPrice - artDiscountPrice) / artOrginPrice * 100);
		  				
		  				html += '<label style="text-align: center; background-color: #5EC75E; width: auto; margin-bottom: 0rem; color: white; font-size:100%; border-radius:10px;">'
			  			+ '<i class="fas fa-tags"></i>' + discountPer + '%</label>';
		  			};
			  			
					html += '</div></td>'
						+ '<td>'
						+ '<div style="text-align: right">'
						+ '<br><labe style="text-decoration: line-through; margin-bottom: 0rem">'
						+ result[i].artPrice + ' 원</label>';
						
					// 할인 된 상품이면 할인 금액 표시해주기
					if(result[i].artDiscount != null || result[i].artDiscount == 0){
						html += '<br> <label style="margin-bottom: 0rem; color: #28E7FF">' + result[i].artDiscount +' 원</label>'
					};
					
					html += '</div></td>'
						+ '</tr>'
						+ '</table>'
						+ '</div>' // 작품 영역 종료
						
						
						
						// 주문 옵션 내용 시작
						+ '<div style="text-align: left; margin-left: 1rem; width: 85%">'
						+ '<h5>주문 사항</h5>'
						+ '<div class="minwoo_order_option">';
					for(var optionC=0; optionC < artOption.length; optionC++){
						html += '<div style="display: inline-block">'
							+ artOption[optionC] + '</div>'
							+ '<div style="text-align: left; align: left; float: right">'
							+ '<a>' + artOptionAmount[optionC] + ' 개</a></div><br>';
					}
					html += '</div>'
						// 주문 요청사항
						+ '<h5>주문시 요청사항</h5>'	
						+ '<div class="minwoo_order_option">'
						+ '<div style="display: inline-block">'
						+ '</div>'
						+ '<div style="text-align: left; align: left; float: right">'
						+ '</div>'
						+ '</div>'
						+ '</div>' // 좌측 하단 부분 종료
						+ '</div>' // 좌측 영역 종료
						// 오른쪽 영역 시작
						+ '<div style="float: right; width: 50%; margin: 1rem">'
						// 배송정보 영역
						+ '<h5>배송 정보</h5>'
						+ '<div style="display: inline-block">'
						+ '<img style="align-items: center; justify-content: center; width: 50px; height: 50px"'
						+ 'src="/bomulsum/upload/' + result[i].memberProfile + '" />'
						+ '&nbsp;<a style="font-weight: bold; color: black">' + result[i].memberName + '</a>'
						+ '</div>'
						+ '<div style="margin-top: 1rem">'
						+ '<a style="text-decoration:none; border: 1px solid gray; color: #28E7FF; padding: 1%; font-weight: bold" href="">'
						+ '<i class="fas fa-comments"></i>&nbsp;메세지 보내기'
						+ '</a>'
						+ '</div>'
						+ '<table style="width: 100%; margin-top: 3%">'
						+ '<tr>'
						+ '<td style="width:20%; color:black; font-weight:bold">받는 분</td>'
						+ '<td>' + result[i].orderReceiver + '</td>'
						+ '</tr>'
						+ '<tr>'
						+ '<td style="color:black; font-weight:bold">전화</td>'
						+ '<td>' + result[i].orderPhoneNum + '</td>'
						+ '</tr>'
						+ '<tr>'
						+ '<td style="color:black; font-weight:bold">주소</td>'
						+ '<td>' + result[i].orderZipcode + '&nbsp;' + result[i].orderAddressFirst + result[i].orderAddressSecond + '</td>'
						+ '</tr>'
						+ '</table>'
						//결제 정보 시작
						+ '<br>'
						+ '<h5>결제 정보</h5>'
						+ '<table style="border:0.5px solid gray;border-collapse:collapse; text-align:center;color:black; width:80%; height:8rem">'
						+ '<tr style="height:55%; background-color:#dcdcdc">'
						+ '<td style="width:33.33%;border: 1px solid gray;">'
						+ '결제 수단'
						+ '</td>'
						+ '<td style="width:33.33%;border: 1px solid gray;">'
						+ '작품'
						+ '</td>'
						+ '<td style="width:33.33%;border: 1px solid gray;">'
						+ '배송비<br>(도서 산간 포함)'
						+ '</td>'
						+ '</tr>'
						+ '<tr style="height:45%">'
						+ '<td style="border: 1px solid gray;">'
						+ '신용카드<br>'
						+ '</td>'
						+ '<td style="border: 1px solid gray;">';
						
						for(var artPriceC in artPrice){
							artPriceL += (artPrice[artPriceC] * artOptionAmount[artPriceC]);
							console.log("artPrice[artPriceC] : " + artPrice[artPriceC]);
							console.log("artOptionAmount[artPriceC] : " + artOptionAmount[artPriceC]);
							console.log("artPriceL : " + artPriceL);
						}
						
						html +=  artPriceL
						+ ' 원'
						+ '</td>'
						+ '<td style="border: 1px solid gray;">'
						+ (parseInt(result[i].buyWriterSendPrice) + parseInt(result[i].buyWriterPlusSendPrice))
						+ ' 원'
						+ '</td>'
						+ '</td>'
						+ '</tr>'
						+ '</table>'
						//배송정보 입력
						+ '<div style="margin-top:3%; display:flex;" id="' + result[i].buyWriterCodeSeq + '">'
						+ '<input class="order_code" type="hidden" value="' + result[i].orderCodeSeq + '">'
						+ '<input class="buy_writer_code" type="hidden" value="' + result[i].buyWriterCodeSeq + '">'
						+ '<input class="order_status" type="hidden" value="' + result[i].buyWriterOrderStatus + '">'
						+ '<input class="order_receiver" type="hidden" value="' + result[i].orderReceiver + '">'
						+ '<input class="order_phone" type="hidden" value="' + result[i].orderPhoneNum + '">'
						+ '<input class="order_address" type="hidden" value="('+result[i].orderZipcode +')'+ result[i].orderAddressFirst + result[i].orderAddressSecond +'">'
						+ '<input class="member_code_seq" type="hidden" value="' + result[i].memberCodeSeq + '">'
						+ '<input class="member_name" type="hidden" value="' + result[i].memberName + '">'
						+ '<input class="art_name" type="hidden" value="' + result[i].artName + '">'
						+ '<button class="aboutSendButton" style="text-decoration:none; background-color: white;border: 1px solid gray; color: #28E7FF; padding: 1%; font-weight: bold">'
						+ '배송정보 입력'
						+ '</button>';
						if(result[i].buyWriterOrderStatus == '환불 대기'){
							
							html += `<form action="<c:url value='/writer/order/orderRefundReg.wdo'/>" method="post" name="formRefundSubmit">`
							+ '<input type="hidden" name="buyWriterCodeSeq" value="'+ result[i].buyWriterCodeSeq +'">'
							+ '<input type="hidden" name="artCodeSeq" value="'+ result[i].artCodeSeq +'">'
							+ '<input type="hidden" name="artOptionAmount" value="'+ artOptionAmount +'">'
							+ '<input type="hidden" name="artAmount" value="'+ result[i].artAmount +'">'
							+ '<input type="hidden" name="artSaleCount" value="'+ Number(result[i].artSaleCount) +'">'
							+ '<input type="hidden" name="buyWriterOrderStatus" value="'+ result[i].buyWriterOrderStatus +'">'
							+ '<button class="aboutRefundButton" style="margin-left:10%; text-decoration:none; background-color: white;border: 1px solid gray; color: #28E7FF; padding: 1%; font-weight: bold; width: 120px; height: 50px;">'
							+ '환불 승인'
							+ '</button></form>'
						}
					html += '</div>'
						+ '</div>'// 오른쪽 영역 종료
						+ '</div>';
						
						
					if(j >= result.length-1){
		  				break labelCancelLoops;
		  			}
					
		  		} while (result[i].orderCodeSeq == result[++j].orderCodeSeq);
		
				html += '</div>';
					//+ '</div>';
			} //end for
			$('#minwoo_orderOneData').html(html);
			$('.aboutSendButton').click(buttonClickFunc);
			$('.aboutRefundButton').click(refundOrder);

		}; 
		
	
		var modalOrderCodeSeq = '';
		var modalBuyWriterCodeSeq = '';
		var modalOrderStatus = '';
		var modalOrderReceiver = '';
		var modalTel = '';
		var modalJuso = '';
		var modalMemberCodeSeq = '';
		var modalMemberName = '';
		var modalArtName = '';
		
		/* 모달 구동 스크립트 영역*/
		buttonClickFunc = function(){
			$("#sendModal").css({
				"top": (($(window).height()-$("#sendModal").outerHeight())/2+$(window).scrollTop())+"px",
				"left": (($(window).width()-$("#sendModal").outerWidth())/2+$(window).scrollLeft())+"px"
				//팝업창을 가운데로 띄우기 위해 현재 화면의 가운데 값과 스크롤 값을 계산하여 팝업창 CSS 설정
			});

			$("#popup_mask").css("display","block"); //팝업 뒷배경 display block
			$("#sendModal").css("display","block"); //팝업창 display block
			$("#number").focus();
			//$("body").css("overflow","hidden");//body 스크롤바 없애기
			
			$("#sendCloseModal").click(function(){
				$("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
				$("#sendModal").css("display","none"); //팝업창 display none
				$("body").css("overflow","auto");//body 스크롤바 생성
			});
			$("#sendCloseModala").click(function(){
				$("#popup_mask").css("display","none"); //팝업창 뒷배경 display none
				$("#sendModal").css("display","none"); //팝업창 display none
				$("body").css("overflow","auto");//body 스크롤바 생성
			});

			console.log($(this).closest('div').children('input').eq(0).val());
			
			modalOrderCodeSeq = $(this).closest('div').children('input').eq(0).val();
			modalBuyWriterCodeSeq = $(this).closest('div').children('input').eq(1).val();
			modalOrderStatus = $(this).closest('div').children('input').eq(2).val();
			modalOrderReceiver = $(this).closest('div').children('input').eq(3).val();
			modalTel = $(this).closest('div').children('input').eq(4).val();
			modalJuso = $(this).closest('div').children('input').eq(5).val();
			modalMemberCodeSeq = $(this).closest('div').children('input').eq(6).val();
			modalMemberName = $(this).closest('div').children('input').eq(7).val();
			modalArtName = $(this).closest('div').children('input').eq(8).val();
			
			console.log('modalOrderCodeSeq : ' + modalOrderCodeSeq + ', modalBuyWriterCodeSeq : ' + modalBuyWriterCodeSeq
					+ ', modalOrderStatus : ' + modalOrderStatus + ', modalOrderReceiver : ' + modalOrderReceiver +
					', modalTel : ' + modalTel + ', modalJuso : ' + modalJuso);

			$('#modalOrderCodeSeq').text(modalOrderCodeSeq);
			$('#modalBuyWriterCodeSeq').val(modalBuyWriterCodeSeq);
			$('#modalOrderStatus').text(modalOrderStatus);
			$('#modalOrderReceiver').text(modalOrderReceiver);
			$('#modalTel').text(modalTel);
			$('#modalJuso').text(modalJuso);
			$('#modalMemberCodeSeq').val(modalMemberCodeSeq);
			$('#modalAlarmContent').val(modalMemberName + '님께서 주문하신 ' + modalArtName + ' 작품이 배송 등록 되었습니다.');

		};
		//등록버튼 이벤트
		function saveDelivery(event){
			event.preventDefault();

			var deliveryDate = document.getElementById('buyDeliveryDate');
			console.log('폼 데이터 입력 값 = ' + '');
			
			if($('#buyDeliveryDate').val() == ''){
				alert('배송 날짜를 선택해주세요.');
				deliveryDate.focus();
				return false;
			};
			
			var deliveryNum = document.getElementById('number');
			if($('#number').val() == ''){
				alert('택배 송장 번호를 입력해주세요.');
				deliveryNum.focus();
				return false;
			};
			
			var rtn;
			
			if($('#modalOrderStatus').text() == '결제 완료'){
				rtn = confirm("배송 처리 하시겠습니까? \n (송장번호를 꼼꼼히 확인해 주세요!)");
			} else {
				rtn = confirm("배송 정보를 수정하시겠습니까?");
				$('#modalAlarmContent').val(modalMemberName + '님께서 주문하신 ' + modalArtName + ' 작품의 배송정보가 수정 되었습니다.');
			}
			
			
			if(rtn){
				formSubmit.submit();	
			} else {
				return false;
			};
		};
		
		
		//환불 버튼 클릭 이벤트
		refundOrder = function(e){
			e.preventDefault();
			
			var rtn = confirm("해당 요청건을 환불하시겠습니까? \n (환불 취소는 불가능 하므로 실행전 다시 한번 확인해주세요!)");
			
			if(rtn){
				$(this).closest('form').submit();	
			} else {
				return false;
			};
		};
		
	</script>

</body>
</html>