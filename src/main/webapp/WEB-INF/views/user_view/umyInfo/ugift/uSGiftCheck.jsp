<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 보낸 선물 상세보기</title>
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
.uSGiftCheckWrap{
	width:80%;
	margin-left:2%;
}

/*선물 상세 내역 테이블*/
.jeonga_ugift_sctable{
	border:1px solid #D8D8D8;
	border-collapse: collapse;
	width:100%;
}

.jeonga_ugift_schead{
	display:flex;
	background-color: #f2f2f2;
	font-size: 13px;
}
.jeonga_ugift_sctable_left_top{
	border-top:1px solid #D8D8D8;
	border-bottom:1px solid #D8D8D8;
	display:flex;
}

.jeonga_ugift_sctable_middle, .jeonga_ugift_sctable_right {
	border:1px solid #D8D8D8;
	width:15%;
}

.jeonga_ugift_schead_date{
	padding:2%;
	padding-right:0;

}
 .jeonga_ugift_schead_address{
 	padding:2%;
 	padding-left:0;
 }
.jeonga_ugift_schead_divide{
	padding:2%;
}
.jeonga_ugift_send_order{
	width:100%;
}
.jeonga_ugift_scbody_title{
	margin:2%;
	font-weight:bold;
	font-size: 14px;
}

.jeong_ugift_scbody_option{
	margin:2%;
	font-size:13px;
} 
.jeonga_ugift_scbody_seller{
	text-align:center;
	font-size: 13px;
}
.jeonga_ugift_sctable_left, .jeonga_ugift_sctable_left_bottom{
	padding:2%;
	font-size: 13px;
}
.jeonga_ugift_scbody_sellerpart{
	margin:13px;
}

#jeonga_ugift_scbody_button{
	margin-top:10%;
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
  	width:92px;
  	color:black;
 }
.jeonga_ugift_scbody_list{
 	margin-left:5px;
}
  
#jeonga_ugift_scbody_list_address{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:92px;
	margin-top:4px;
	margin-left:10px;
	margin-right:10px;
}
#jeonga_ugift_scbody_list_cancel{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:92px;
	margin-top:6px;
	margin-left:10px;
	margin-right:10px;
}
.jeonga_ugift_scbody_request{
	background-color:#f2f2f2;
	margin-top:2%;
}
/* 다른 정보들 박스*/
.jeonga_ugift_gift_receiver_info, .jeonga_ugift_gift_scdispatch, .jeonga_ugift_gift_payment_info{
	margin-top:1%;
	border:1px solid #D8D8D8;
	padding:24px;
}
.jeonga_ugift_gift_receiver_title, .jeonga_ugift_gift_scdispatch_title, .jeonga_ugift_gift_payment_title{
	font-size:16px; 
	font-weight:bold;
}
.jeonga_ugift_gift_receiver_info_left, .jeong_ugift_gift_scdispatch_detail_left, .jeonga_ugift_gift_payment_info_left{
	font-size:14px; 
	font-weight: bold;
	width:111px;
}

.jeonga_ugift_gift_receiver_info_right, .jeonga_ugift_gift_scdispatch_detail_right, .jeonga_ugift_gift_payment_info_right{
	font-size:14px; 
	padding:8px 20px;

}
.jeonga_ugift_gift_receiver_infotable, .jeonga_ugift_gift_scdispatch_detail, .jeonga_ugift_gift_payment_infotable{
	margin-top:2%;
}
.jeonga_ugift_gift_final_pay{
	margin-top:2%;
	border-top:1px solid #D8D8D8;
}

.jeonga_ugift_gift_standard_table{
	margin-top:15px;
	margin-left:20px;
	padding:10px;
	background-color:#f2f2f2;
	color:#6E6E6E;
	font-size:12px;
}
.jeonga_ugift_gift_standard_table_left{
	font-weight:bold;
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
	
		<div class="uSGiftCheckWrap">
			<div class="jeonga_ugift_sctitle">
				<h2 id="jeonga_ugift_sctitle_text">보낸선물 상세보기</h2>
			</div>
			<!-- 보낸 선물 상세 내역 -->
			<c:forEach var="sendGiftList" items='${sendGiftCheckList}'>
			<table class="jeonga_ugift_sctable">
				<tr>
					<td colspan="3" class="jeonga_ugift_sctable_head">
						<div class="jeonga_ugift_schead">
							<div class="jeonga_ugift_schead_date">${sendGiftList.order_date}</div>
							<div class="jeonga_ugift_schead_divide">|</div>
							<div class="jeonga_ugift_schead_address">${sendGiftList.order_address_input}</div>
					</div></td>
				</tr>
				<tr>
					<td class="jeonga_ugift_sctable_left_top">
						<div class="jeonga_ugift_send_image">
						<img src="<c:url value='/upload/${sendGiftList.art_photo}'/>" style="width: 100px; height:100px; padding:5px;">
						</div>
						<div class="jeonga_ugift_send_order">
						<div class="jeonga_ugift_scbody_title">${sendGiftList.b_art_name}</div>
						<div class="jeonga_ugift_scbody_option">${sendGiftList.order_pay_price}원 / ${sendGiftList.b_art_option_count}개</div>
					</div>
					</td>
					<td rowspan="3" class="jeonga_ugift_sctable_middle">
					<div class="jeonga_ugift_scbody_sellerpart">
						<div class="jeonga_ugift_scbody_seller">
						${sendGiftList.writer_brand_name}<br>
						<a href="/bomulsum/user/message.do?writer=${sendGiftList.b_writer_code_seq}" id="jeonga_ugift_scbody_button">메시지로 문의</a>
						</div>
					</div> </td>
					<td rowspan="3" class="jeonga_ugift_sctable_right">
						<div class="jeonga_ugift_scbody_list">
						<button id="jeonga_ugift_scbody_list_address" disabled>배송지 입력</button><br>
						<button id="jeonga_ugift_scbody_list_cancel">주문 취소</button>
					</div> </td>
				</tr>
				<tr>
					<td class="jeonga_ugift_sctable_left">배송비:우편(+500원)<br/>문구 및 디자인 추가:X 도안 그대로</td>
				</tr>
				<tr>
					<td class="jeonga_ugift_sctable_left_bottom">요청사항 <br/>
					<textarea disabled class="jeonga_ugift_scbody_request" cols="75" rows="5">${sendGiftList.order_request}</textarea><br></td>
				</tr>
			</table>
			<!-- 선물 받는분 -->
			<div class="jeonga_ugift_gift_receiver_info">
				<div class="jeonga_ugift_gift_receiver_title">
					선물 받는 분
				</div>
				<table class="jeonga_ugift_gift_receiver_infotable">
					<tr>
						<td class="jeonga_ugift_gift_receiver_info_left">받는 분</td>
						<td class="jeonga_ugift_gift_receiver_info_right">${sendGiftList.gift_recipient_name}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_receiver_info_left">전화</td>
						<td class="jeonga_ugift_gift_receiver_info_right">${sendGiftList.gift_recipient_phone}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_receiver_info_left">선물메시지</td>
						<td class="jeonga_ugift_gift_receiver_info_right">${sendGiftList.gift_message}</td>
					</tr>
				
				</table>
			</div>
			<!-- 선물 발송 관리 -->
			<div class="jeonga_ugift_gift_scdispatch">
				<div class="jeonga_ugift_gift_scdispatch_title">
					선물발송관리
				</div>
				<table class="jeonga_ugift_gift_scdispatch_detail">
					<tr>
						<td class="jeonga_ugift_gift_scdispatch_detail_left">발송 상태</td>
						<td class="jeonga_ugift_gift_scdispatch_detail_right">${sendGiftList.order_status}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_scdispatch_detail_left">유효기간</td>
						<td class="jeonga_ugift_gift_scdispatch_detail_right">${sendGiftList.limitDate}</td>
					</tr>
				</table>
			</div>
			
			<!-- 결제정보 -->
			<div class="jeonga_ugift_gift_payment_info">
				<div class="jeonga_ugift_gift_payment_title">
					결제정보
				</div>
				<table class="jeonga_ugift_gift_payment_infotable">
					<tr>
						<td class="jeonga_ugift_gift_payment_info_left">결제방식</td>
						<td class="jeonga_ugift_gift_payment_info_right">${sendGiftList.order_payment}</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_payment_info_left">금액</td>
						<td class="jeonga_ugift_gift_payment_info_right">${sendGiftList.order_pay_price}원</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_payment_info_left">배송비</td>
						<td class="jeonga_ugift_gift_payment_info_right">0원</td>
					</tr>
						<tr>
						<td class="jeonga_ugift_gift_payment_info_left">후원</td>
						<td class="jeonga_ugift_gift_payment_info_right">0원</td>
					</tr>
					<tr>
						<td class="jeonga_ugift_gift_payment_info_left">쿠폰 할인</td>
						<td class="jeonga_ugift_gift_payment_info_right">0원</td>
					</tr>
							<tr>
						<td class="jeonga_ugift_gift_payment_info_left">적립금 사용 금액</td>
						<td class="jeonga_ugift_gift_payment_info_right">0원</td>
					</tr>
				</table>
				<div class="jeonga_ugift_gift_final_pay">
					<table class="jeonga_ugift_final_pay_table">
						<tr>
							<td style="font-weight:bold; font-size:16px; width:111px;">최종 결제 금액</td>
							<td style="font-weight:bold; font-size:30px; color:#DF3A01; padding:8px 20px;">${sendGiftList.order_pay_price}원</td>
						</tr>
						<tr>
							<td style="font-weight:bold; font-size:14px; width:111px;">적립금 적립</td>
							<td style="font-weight:bold; font-size:14px; color:#29aae1; padding:8px 20px; ">${sendGiftList.art_point}p</td>
						</tr>
						<tr>
							<td></td>
							<td>
								<table class="jeonga_ugift_gift_standard_table">
									<tr>
									<td class="jeonga_ugift_gift_standard_table_left">적립 기준: </td>
									<td class="jeonga_ugift_gift_standard_table_right">결제 완료 시 적립 예정 상태로 바로 적립</td>
									</tr>
									<tr>
									<td class="jeonga_ugift_gift_standard_table_left">가용 시점: </td>
									<td class="jeonga_ugift_gift_standard_table_right">결제 완료일로부터 7일 후 적립금 사용 가능</td>
									</tr>
								</table>
						</td>
				</table>
				
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
</html>