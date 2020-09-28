<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 주문완료</title>
<script src="https://kit.fontawesome.com/fea5b9b7d0.js" crossorigin="anonymous"></script>
<style>
.dndud_content{
	width:60%;
	margin: 0 auto;
}

.dndud_content_title{
   padding-bottom: 4px;
    margin-bottom: 24px;
    position: relative;
    padding-top: 40px;
    display:flex;
    flex-direction: row;
    justify-content: space-between;
}

.dndud_txt_f1{
    font-size: 24px;
    font-weight: bold;
    color: #333;
}

.dndud_page_loc{
    font-size: 16px;
    font-weight: bold;
    color: #d9d9d9;
    margin-top: 4px;
    list-style:none;
   display: flex;
   align-items: center;
}

.dndud_page_loc li{
   display: flex;
   flex-direction:row;
   margin-left: 8px;
}

.dndud_page_loc li span{
   margin-top: 2px;
    margin-left: 5px;
}

.dndud_page_loc li.active{
   color:#333;
}

.dndud_page_loc i{
   margin-left: 8px;
    display: flex;
   align-items: center;
   font-size: 25px;
}

.dndud_page_loc .icon_num{
   display: flex;
   line-hieght:24px;
   align-items: center;
    justify-content: center;
   width:24px;
   height:24px;
   border-radius:50%;
   font-size:10px;
   font-weight:bold;
   font-style:normal;
   border: 1px solid #d9d9d9;
   -webkit-border-radius: 50%;
}


.dndud_page_loc li.active .icon_num{
   border:0 none;
   background: #1f76bb;
   color: #fff;
}

.dndud_order_alarm{
	display:flex;
	flex-direction: row;
	padding-bottom:5%;
}

.dndud_about_customer{
	width:60%;
	margin-right:2%;
	display:flex;
	flex-direction: column;
}

.dndud_about_customer div:nth-child(1){
	font-size:36px;	
	padding-bottom:30px;
	border-bottom: 1px solid #d9d9d9;
	width:96%;
}

.dndud_about_customer div:nth-child(1) a{
    color: #dd5850;
}

.dndud_about_customer div:nth-child(1) a i{
	font-size:63px;
}

.dndud_about_customer .big{
	padding-top: 30px;
	font-size: 13px;
	display:flex;
	flex-direction: row;
}

.dndud_about_customer div:nth-child(2) a{
	font-weight:bold;
	padding-right:30px;
	width: 57px;
}

.dndud_about_customer_detail{
	display:flex;
	flex-direction: column;
	
}

.dndud_about_pay{
	width:33%;
	display:flex;
	flex-direction: column;
	border: 2px solid #333;
	padding:0 2%;
}

.about_pay_title{
	padding:5% 0;
	border-bottom: 1px solid #333;
	font-size:16px;
	font-weight:bold;
	display:flex;
	justify-content: center;
	align-items: center;

}

.about_pay_detail{
	display:flex;
	flex-direction: column;
	border-bottom: 1px solid #d9d9d9;
	padding: 20px 0px;
	
}

.about_pay_detail div{
	display:flex;
	flex-direction:row;
	align-items: center;
	justify-content: space-between;
	padding-bottom:1%;
	padding-top:1%;
}

.about_pay_detail div span:nth-child(1){
	color:#666;
	font-size:13px;
}

.about_pay_detail div span:nth-child(2){
	color:#333;
	font-size:15px;
}

.about_pay_last{
	padding: 5% 0;
	display:flex;
	justify-content: space-between;
	flex-direction: row;
	font-size:14px;
	font-weight:bold;
	align-items: center;
}

.about_pay_last a{
	font-size:30px;
	color:#dd5850;
}

.dndud_order_buttons{
	display:flex;
	justify-content: center;
	align-itmes: center;
	margin-bottom:3%;
}

.dndud_order_buttons span{
	padding:10px 25px;
	cursor:pointer;
}

.dndud_order_buttons span:focus{
	outline:none;
}

.dndud_order_buttons span:nth-child(1){
	border:1px solid #1f76dd;
	background-color: #1f76dd;
	color:white;
	margin-right:5px;
}

.dndud_order_buttons span:nth-child(1):hover{
	background-color: #1f76bb;
}

.dndud_order_buttons span:nth-child(2){
	border:1px solid #1f76dd;
	background-color:white;
	color:#1f76dd;
}

.dndud_order_buttons span:nth-child(2):hover{
	background-color:#f5f5f5;
}

</style>
</head>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	
	<div class="dndud_content">
	
		<!-- 장바구니, 123 제목 영역 -->
		<div class="dndud_content_title">
			<h2 class="dndud_txt_f1">주문완료</h2>
			<ol class="dndud_page_loc">
				<li>
					<em class="icon_num">1</em>
					<span>장바구니</span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
					<em class="icon_num">2</em>
					<span>주문결제</span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li class="active">
					<em class="icon_num">3</em>
					<span>주문완료</span>
				</li>
			</ol>
		</div>
		
		<div class="dndud_order_alarm">
			<div class="dndud_about_customer">
				<div>
					<span><a><i class="far fa-thumbs-up" style="width:64px; height:64px"></i>주문이 완료</a>되었습니다.</span>
				</div>
				<div class="big">
					<a>배송정보</a>
					<div class="dndud_about_customer_detail">
						<span>${SuccessShipName}</span>
						<span>${SuccessShipPhone}</span>
						<span>${SuccessShipZip} ${SuccessShipAddr1} ${SuccessShipAddr2}
						</span>
					</div>
				</div>
			</div>
			<div class="dndud_about_pay">
				<div class="about_pay_title">
					<span>결제 정보</span>
				</div>
				<div class="about_pay_detail">
					<div>
						<span>작품금액</span>
						<span><fmt:formatNumber value="${SuccessArtPrice}" pattern="#,###" />원</span>
						
					</div>
					<div>
						<span>배송비</span>
						<span><fmt:formatNumber value="${SuccessShipPrice}" pattern="#,###" />원</span>
					</div>
					<div>
						<span>할인 혜택</span>
						<span><fmt:formatNumber value="${SuccessDiscount}" pattern="#,###" />원</span>
					</div>
					<div>
						<span>제주 / 도서산간 추가비용</span>
						<span><fmt:formatNumber value="${SuccessShipJeju}" pattern="#,###"/>원</span>
					</div>
				</div>
				<div class="about_pay_last">
					<span>최종 결제 금액</span>
					<a><fmt:formatNumber value="${SuccessPriceSum}" pattern="#,###"/>원</a>
				</div>
			</div>
		</div>
		
		<div class="dndud_order_buttons">
			<span onclick="location.href='/bomulsum/user/myInfo/orderList.do'">주문내역 확인</span>
			<span onclick="location.href='/bomulsum/home.do'">쇼핑 계속하기</span>

		</div>
		
	</div>
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
</html>