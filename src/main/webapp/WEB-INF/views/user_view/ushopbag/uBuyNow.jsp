<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link href="<c:url value='/vendor/fontawesome-free/css/all.min.css'/>" rel="stylesheet"	type="text/css">
<meta charset="UTF-8">
<title>보물섬 | 바로구매</title>
</head>
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

.shopcart{
	width:100%;
	display:flex;
	flex-direction: column;
}

.shopcart table{
	border:1px solid #eaeaea;
	margin-bottom: 2%;
}

.shopcart th{
	background-color: #dcf8f6;
}

.shopcart_title{
	padding:12px 0;
	display:flex;
	flex-direction:row;
    align-items: center;
    cursor:pointer;
    width: fit-content;
}


.txt_group{
	display:flex;
	flex-direction:column;
    font-size: 14px;
    color:#333;
    align-items: flex-start;
}

.txt_group a{
	color: #999;
    font-size: 12px;
    font-weight: normal;
}

.checkbox{
	margin:16px;
    height: 18px;
    width: 18px;
}

.area_img .imgbg{
	width:64px;
	height:64px;
	border-radius:4px;
	background-image: url(../../resources/img/shopcart_test.jpg);
	background-repeat: no-repeat;
	background-size: 100%;
}

.area_img{
	display:flex;
	flex-direction: row;
	padding-top: 8px;
}

.area_img .chkbox{
	margin: 0px 16px 0px 16px;
	height: 18px;
    width: 18px;
}

.area_txt{
	padding-top: 8px;
    padding-left: 8px;
}

.content_area_first{
    display: flex;
    flex-direction: row;
    align-items: center;
}

.area_txt .txt_group{
	font-weight:bold;
}

.area_detail{
	padding-top: 8px;
	padding-right: 18px;
    padding-bottom: 8px;
    padding-left: 125px;
}

.list_option{
	margin-bottom: 8px;
	list-style: none;
	font-size:12px;
	padding:0;
	
}

.list_option li{
	padding:0;
	margin:0;
	margin-bottom:10px;
	display:flex;
	flex-direction: row;
	justify-content: space-between;
}

.option_txt{
	font-size: 12px;
    color: #666;
    width: 75%;
    min-height: 18px;
    display: flex;
    align-items: center;
  	margin-right:10px; 
}

.split{
    width: 500px;
    display:flex;
}

.split2{
	display:flex;
	width: 250px;
    align-items: center;
    justify-content: flex-end;
}

.input_number{
	margin-left: 5px;
	font-size: 12px;
    height: 24px;
    line-height: 24px;
}

.input_number label{
	margin-right: 8px;
}

.input_number>*{
	display: block;
    float: left;
    background: #fff;
    color: #333;
    height: 24px;
    font-size: inherit;
}

.input_number button{
	border: 1px solid #ccc;
}

.input_area{
    width: 36px;
    border: 1px solid #ccc;
    border-left: 0 none;
    border-right: 0 none;
    height: 100%;
    overflow: hidden;
    height:22px;
}

.prd-count{
	height: 22px;
	text-align: center;
	width: 100%;
    line-height: 24px;
    overflow: hidden;
    outline: none;
    border: 0 none;
    margin: 0 !important;
    padding: 0 !important;
}
input[type="number"]::-webkit-outer-spin-button, 
input[type="number"]::-webkit-inner-spin-button { 
	-webkit-appearance: none; 
	-moz-appearance: none; 
	appearance: none; 
}

.cost_text{
    font-size: 15px;
    color: #333;
    font-weight: bold;
}
.text_text{
    font-size: 15px;
    color: #333;
    font-weight: bold;
}

.btn_group{
	font-size:0;
	margin-left:15px;
}

.btn_group>*{
	padding:0;
	font-size:15px;
    color: #dd5850;
    border-radius: 0;
    border: 1px solid #ddd;
    padding: 0 8px;
    line-height: 26px;
    background-color: #eee;
}

button{
	cursor: pointer;
}

input[type="checkbox"]{
	cursor:pointer;
}

button:focus{
	outline:none;
}

.btn_group button:nth-child(1){
	border-right: 0 none;
    -webkit-border-top-left-radius: 50%;
    -moz-border-radius-topleft: 50%;
    border-top-left-radius: 50%;
    -webkit-border-bottom-left-radius: 50%;
    -moz-border-radius-bottomleft: 50%;
    border-bottom-left-radius: 50%;
    padding-left: 10px;
}

.btn_group button:nth-child(2){
	-webkit-border-top-right-radius: 50%;
    -moz-border-radius-topright: 50%;
    border-top-right-radius: 50%;
    -webkit-border-bottom-right-radius: 50%;
    -moz-border-radius-bottomright: 50%;
    border-bottom-right-radius: 50%;
    padding-right: 10px;
}

.order_request_box{
	width:100%;
	height:82px;
	overflow: hidden;
	display:flex;
	
}

.order_request_textarea{
    left: 0;
    right: 0;
    width:100%;
    height: 82px;
    transition: width,.3s,ease;
    margin-bottom:2%;
    position:relative;
    display:flex;
}

.order_request_textarea textarea{
    width: 100%;
    height: 72px;
    border: 1px solid #b4b4b4;
    border-radius: 2px;
    line-height: 1.5;
    padding:4px 30px 4px 12px;
    resize: none;
	text-indent: 0;
    font-size: 12px;
    font-weight: bold;
    color: #333;
}

.order_request_textarea textarea::placeholder{
    color: #dd5850;
}

.order_request_textarea textarea:focus{
    outline: none;
    border-color: #22a7af;
}

.ui_field_chars{
	position:absolute;
	right:20px;
	bottom:10px;
	font-size:12px;
	color:#999;
	font-style:normal;
}

.ui_filed_button{
    color: #22a7af;
    line-height: 78px;
    width: 10%;
    height: 82px;
    right: 0;
    display:none;
    justify-content: center;
    background-color: white;
    border: 1px solid #b4b4b4;
}

.ui_filed_button:hover{
	background-color:#f5f5f5;
}

.delivery_cost td{
	font-size: 13px;
    font-weight: bold;
    color:#666;
	padding:18px 0;
	border-top: 1px solid #eaeaea;
}

.delivery_cost td:first-child{
	padding-left:18px;
}

.delivery_cost td:last-child{
	padding-right:18px;
	text-align: right;
	font-size: 15px;
    color: #333;
    font-weight: bold;
}

.art_cost td{
	font-size: 13px;
    font-weight: bold;
    color:#666;
	padding:18px 0;
	border-top: 1px solid #eaeaea;
}

.art_cost td:first-child{
	padding-left:18px;
}

.art_cost td:last-child{
	padding-right:18px;
	text-align: right;
	font-size: 15px;
    color: #333;
    font-weight: bold;
	
}


.checkAll{
	display:flex;
	flex-direction:row;
	align-items: center;
	margin-bottom:18px;
}

.checkAll label{
	display:flex;
	flex-direction:row;
	align-items: center;
	cursor:pointer;
}

.checkAll input[type="checkbox"]{
	margin:0 10px 0 0;
}

.checkAll span{
	font-size:12px;
	color:#333;
	margin-right: 15px;
}

.checkAll a{
	font-weight:bold;
}

.deleteChoice{
	padding:2px 8px;
	border: 1px solid #d9d9d9;
	background-color: #fff;
	border-radius: 2px;
	cursor:pointer;
}

.deleteChoice:hover{
	outline: none;
	background: #f5f5f5;
	border-color: #d9d9d9;
}

.totalBox{
	width:100%;
	border-top:2px solid #333;
	border-radius:2px;
}

.totalBox .total_box_top{
	border-left:2px solid #333;
	border-right:2px solid #333;
	border-bottom:1px solid #ccc;
	display:flex;
	flex-direction:row;
	align-items: center;
	justify-content: space-around;
	padding: 18px 0;
	color: #666;
    font-size: 13px;
}

.totalBox .total_box_price{
	border-left:2px solid #333;
	border-right:2px solid #333;
	border-bottom: 2px solid #333;
	display:flex;
	flex-direction:row;
	align-items: center;
	justify-content: space-around;
	padding: 30px 0;
	margin-bottom: 25px;
    font-size: 30px;
    font-weight: bold;
}

.total_box_price div:nth-child(5){
	color: #dd5850;
}

.total_box_decision div{
	display:flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	font-size:18px;
	margin-bottom:5%;
}

.order_All{
	padding: 10px 65px;
	border: 1px solid #d9d9d9;
	border-radius: 2px;
	color:#333;
	cursor:pointer;
	margin-right:9px;
}

.order_All:hover{
    outline: none;
    background: #f5f5f5;
    border-color: #d9d9d9;
}

.order_Choice{
	padding: 10px 56px;
	background-color: #1f76dd;
	color:#fff;
	border:1px solid #1f76dd;
	cursor:pointer;
	border-radius: 2px;
	margin-left:9px;
}

.order_Choice:hover{
	background-color: #1f76bb;
}
</style>
<style>
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
}

.report-modal__area {
	width: 470px;
	padding: 30px;
	background: rgb(255, 255, 255);
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
	padding-right: 140px;
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
	display: flex;
	flex-direction: row;
}

.article_img {
	width: 64px;
	height: 64px;
	border-radius: 2px;
	background-image: url(../../resources/img/shopcart_test.jpg);
	background-repeat: no-repeat;
	background-size: 100%;
	margin-right: 10px;
}

.article_text {
	display: flex;
	flex-direction: column;
	justify-content: center;
	font-size: 20px;
	font-weight: bold;
	color: #333;
}
#art_discount_percent{
	color: #dd5850;
}
#art_discount_price{
	color: #dd5850;
}

#art_price {
	font-size: 11px;
	color: #999;
	text-decoration: line-through;
}

.now_select_option {
	display: flex;
	flex-direction: column;
	padding-top: 15px;
	font-size: 11px;
	color: #666;
}

.now_select_option a {
	color: #22a7af;
	margin-bottom: 5px;
}

.now_select_option div {
	padding: 8px 16px;
	margin-bottom: 18px;
	border: 1px solid #d9d9d9;
	background: #f5f5f5;
	border-radius: 2px;
	font-size: 11px;
	color: #666;
}

.update_option {
	display: flex;
	flex-direction: column;
	font-size: 12px;
	color: #666;
}

.update_option a {
	margin-bottom: 10px;
}

.update_option select {
	margin-bottom: 5px;
	padding: 5px;
}

.update_option select:focus {
	outline: none;
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

.choose_option {
	margin-top: 10px;
	display: flex;
	flex-direction: column;
	height: 200px;
	overflow: auto;
}

.option {
	font-size: 13px;
	color: #333;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 16px;
	background-color: #f5f5f5;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}
#optionChoiceCon{
	font-size:12px;
}
.option_name {
	display: flex;
	align-items: center;
	width: 230px;
}

.option_count {
	display: flex;
	align-items: center;
}

.option_price {
	display: flex;
	align-items: center;
	width: 110px;
	justify-content: flex-end;
}

.option_price i {
	padding: 0 7px;
}

.none_article {
	width: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	color: #666;
}

.none_article div{
	display:flex;
	flex-direction:column;
	justify-content: center;
	align-items: center;
	margin-top:20px;
	margin-bottom:40px;
}

.go_to_articles{
	padding: 8px 38px;
	border: 1px solid #1f76bb;
	color:#1f76bb;
	cursor:pointer;
	margin-bottom:50px;
}

</style>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	
	<div class="dndud_content">
	
		<!-- 바로구매 123 제목 영역 -->
		<div class="dndud_content_title">
			<h2 class="dndud_txt_f1">바로구매</h2>
			<ol class="dndud_page_loc">
				<li class="active">
					<em class="icon_num">1</em>
					<span>바로구매</span>
					<i class="fa fa-angle-right"></i>
				</li>
				<li>
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
		<!--  상품 없을경우 -->
		<c:if test="${empty buyArt}">
		<div class="none_article">
			<img src="<c:url value='/resources/img/none_cart.PNG'/> ">
			<div>
				<span>마음은 가득찬 당신</span>
				<span>하지만 장바구니는 비었네요.</span>
			</div>
			<span class="go_to_articles">작품 구경하러 가기</span>
		</div>
		</c:if>
		
		<c:if test="${not empty buyArt}">
		<!-- 선택 상품들 담기는 곳 -->
		<form id="jeonga_order_choice" action="/bomulsum/user/direct/payment.do" method="post"></form>
		<div class="shopcart">

				<table class="articles">
					<thead>
						<tr>
							<th colspan="2">
								<div class="checkList">
								<label class="shopcart_title">
									<input class="checkbox" type="checkbox" name="selectCheck">
									<div class="txt_group">
										<span class="jeonga_writer">${buyArt.writer_brand_name} 작가님</span>
										<a>${buyArt.writer_sendfree_case}원 이상  배송비 무료</a>
									</div>
								</label>
								</div>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr class="content_area_first">
							<td class="area_img">
								<div class="checkList">
								<input class="chkbox" type="checkbox" name="selectCheck" id="selected">
								</div>
								<div class="imgbg">
									<img style="width:64px; height:64px;" src="<c:url value='/upload/${buyArt.art_photo}'/>"/>
								</div>
							</td>
							<td class="area_txt">
								<div class="txt_group">
									<span>${buyArt.art_name}</span>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="area_detail">
								<ul class="list_option">
								<c:forEach var="totalOption" items="${buyArt.totalOption}" varStatus="status">
									<li>
										<div class="split">
										
											<span class="option_txt"><c:forEach var="j" items="${totalOption.optionArray}">${j.art_option_category}:&nbsp;${j.art_option_name}(+${j.art_option_price}원) &nbsp;&nbsp;</c:forEach></span>
											<div class="input_number">
												<label>수량</label>
												<button class="downButton" type="button">-</button>
												<div class="input_area">
													<input id="jeongaCount" class="prd-count" type="number" value="${totalOption.artCount}" min="1" max="999" readonly > 
												</div>
												<button class="upButton" type="button">+</button>
											</div>
										</div>
										<div class="split2">
								 		 	<div class="cost_text">${totalOption.totalSum}</div>
												<div class="jeonga_cost" style="display:none">${totalOption.totalSum}</div> 
												<div class="index" style="display:none">${status.index}</div>
												<div class="text_text">원</div>
											<span class="btn_group" >
												<button class="option_update" style="color:#aaa; cursor: default;" type="button" disabled>
													<i class="fas fa-cog"></i>
												</button>
												<button class="option_delete" style="color:#aaa; cursor: default;" type="button" disabled>
													<i class="fas fa-times"></i>
												</button>
											</span>
										</div>
									</li>
									</c:forEach>
								</ul>
								<div class="order_request_box">
									<div class="order_request_textarea">
										<c:if test="${buyArt.order_request eq null}">
											<textarea id="orderReq" class="orderTextarea" maxlength="500" placeholder="주문 요청사항을 입력해주세요"></textarea>
											<a class="ui_field_chars">500</a>
										</c:if>
										<c:if test="${buyArt.order_request ne null}">
											<textarea id="orderReq" class="orderTextarea" maxlength="500" >${buyArt.order_request}</textarea>
											<a style="display:none" class="ui_field_chars">500</a>
										</c:if>
										
									</div>
									<button id="saveButton" type="button" class="ui_filed_button">저장</button>
								</div>
							</td>
						</tr>
						<tr class="art_cost">
							<td>작품가격</td>
							<td style="display:none" class="jeonga_sendfree">${buyArt.writer_sendfree_case}</td>
							<td style="display:none" class="jeonga_delivery_price">${buyArt.writer_send_price}</td>
							<td style="display:none" class="jeonga_artcode">${buyArt.art_code_seq}</td>
							<td style="display:none" class="jeonga_artoption_code">${buyArt.art_option_seq}</td>
							<td style="display:none" class="jeonga_art_count">${buyArt.art_count}</td>
							<td class="jeonga_total_art_price"><a>${buyArt.totalPrice}</a><a>원</a></td>
						</tr>
						<tr class="delivery_cost">
							<td>배송비</td>
						 <c:if test="${buyArt.totalPrice ge buyArt.writer_sendfree_case}"> 
								<td class="jeonga_delivery_case">
									<a>0</a><a>원</a>
								</td>
							</c:if>	
							<c:if test="${buyArt.totalPrice lt buyArt.writer_sendfree_case}">
								<td class="jeonga_delivery_case">
									<a>${buyArt.writer_send_price}</a><a>원</a>
								</td>
							</c:if>	
						</tr>
					</tbody>
				</table>
			
			<div class="checkAll">
				<label>
					<input class="chkbox" type="checkbox" id="selectAll">
					<span>전체선택(<a id="nowChecked"></a>/<a id="canCheckCount"></a>)</span>
				</label>
			</div>
			
			<div class="totalBox">
				<div class="total_box_top">
					<div>총 주문 금액</div>
					<div></div>
					<div>배송비</div>
					<div></div>
					<div>결제 예정금액</div>
				</div>
				<div class="total_box_price">
					<div id="total_art_price">0원</div>
					<div>+</div>
					<div id="total_delivery_price">0원</div>
					<div>=</div>
					<div id="total_cart_price">0원</div>
				</div>
				<div class="total_box_decision">
					<div>
						<span class="order_Choice">작품 주문하기</span>
					</div>
				</div>
			</div>
			
		</div>
		 </c:if>
	
	</div>
	
	
	<%@ include file="../include/uFooter.jsp" %>
</div>

</body>
<script>
function AddComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

$(function(){
	
	var codearr= [];
	var selectedPrice = [];
	$(document).ready(function(){
		$("#canCheckCount").html($(".articles").length);
		$("#nowChecked").html( $("input[name=selectCheck]:checked").length/2);
	});

	// textarea 입력 시. 영역 변경
	$('.orderTextarea').keyup(function(e){
		//$('.ui_field_chars').css("display","block");
		var $textArea = $(this);
		var $textBox = $(this).closest("div");
		var $remainText = $textBox.children("a");
		var $SHbutton = $textBox.next();
		var content = $textArea.val();
		// 텍스트 area 안 500 숫자 변경
		$remainText.html(500-content.length);

	});
	
	// 수량 버튼중 - 클릭시
	$(document).on('click',".downButton",function(e){
		var $button = $(this);
		//숫자영역과 숫자
		var $numDiv = $button.next();
		var $num = $numDiv.children().first();
		var $artPrice = $button.parent().parent().next().children().first().next().text();
		
		//가격 영역과 가격들
		var $priceDiv = $button.parent().parent().next().children().first();
		var $jaPriceDiv = $(this).closest("table").find('.jeonga_total_art_price').children().first();
		var $totalPrice = $(this).closest("table").find('.jeonga_total_art_price').children().first().text();
		var $deliveryPriceOver =  $(this).closest("table").find('.jeonga_sendfree').text();
		var $deliveryPriceDiv = $(this).closest("table").find('.jeonga_delivery_case').children().first();
		var $deliveryPrice = $(this).closest("table").find('.jeonga_delivery_price').text();
		var $artCountDiv =  $(this).closest("table").find('.jeonga_art_count');
		var $artCount = $(this).closest("table").find('.jeonga_art_count').text();
		
		var $cartSeq = $priceDiv.next().next().text();
		var $index =$priceDiv.next().next().text();
		
		var cartCode = $cartSeq
		var jartPrice = $artPrice;
		var totalPrice = $totalPrice;
		var index = $index;
		var delivery = $deliveryPriceOver;
		var artCount = $artCount;

		var num;
		var changePrice;
		var total;

		if($num.val() > 1){
			num = Number($num.val())-1;
			changePrice = num * Number(jartPrice);
			total = Number(totalPrice) - Number(jartPrice);
			
			$num.val(num);
			$priceDiv.text(changePrice);
			$jaPriceDiv.text(total);
			if(total > delivery){
				$deliveryPriceDiv.text(0);
			}else{
				$deliveryPriceDiv.text($deliveryPrice);
			}
			$.ajax({
				url:'/bomulsum/user/buyNowChangeCount.do',
				data:{
					'count': num,
					'index' : index,
					'artCount' : artCount,
				},
				type:'POST',
				success:function(data){
					 console.log(data);
					 $artCountDiv.text(data);
				},
				error:function(e){
					console.log(e);
				}
			});   
		}
	});
	
 	// 수량 버튼중 + 클릭시
	$(document).on('click',".upButton",function(e){
		var $button = $(this);
		//숫자영역과 숫자
		var $numDiv = $button.prev();
		var $num = $numDiv.children().first();
		var $artPrice = $button.parent().parent().next().children().first().next().text();

		//가격 영역과 가격들
		var $priceDiv = $button.parent().parent().next().children().first();
		var $jaPriceDiv = $(this).closest("table").find('.jeonga_total_art_price').children().first();
		var $totalPrice = $(this).closest("table").find('.jeonga_total_art_price').children().first().text();
		var $deliveryPriceOver =  $(this).closest("table").find('.jeonga_sendfree').text();
		var $deliveryPriceDiv = $(this).closest("table").find('.jeonga_delivery_case').children().first();
		var $deliveryPrice = $(this).closest("table").find('.jeonga_delivery_price').text();
		var $artCountDiv =  $(this).closest("table").find('.jeonga_art_count');
		var $artCount = $(this).closest("table").find('.jeonga_art_count').text();
		
		var $cartSeq = $priceDiv.next().next().text();
		var $index =$priceDiv.next().next().text();
		
		var cartCode = $cartSeq
		var jartPrice = $artPrice;
		var totalPrice = $totalPrice;
		var index = $index;
		var delivery = $deliveryPriceOver;
		var artCount = $artCount;

		var num;
		var changePrice;
		var total;
		
		if($num.val()<999){
			num = Number($num.val()) + 1;
			changePrice = num * Number(jartPrice);
			total = Number(totalPrice) + Number(jartPrice);
			$num.val(num);
			$priceDiv.text(changePrice);
			$jaPriceDiv.text(total);
			if(total > delivery){
				$deliveryPriceDiv.text(0);
			}else{
				$deliveryPriceDiv.text($deliveryPrice);
			}
			
			$.ajax({
				url:'/bomulsum/user/buyNowChangeCount.do',
				data:{
					'count': num,
					'index' : index,
					'artCount' : artCount,
				},
				type:'POST',
				success:function(data){
					 console.log(data);
					 $artCountDiv.text(data);
				},
				error:function(e){
					console.log(e);
				}
			});   
		}
	}); 

	// 작가명 체크 박스 클릭
	$(".shopcart_title").click(function(e){
		var $topChk = $(this).children().first();
		var $imgChk = $(this).closest("table").find('.area_img').children().first().children().first();
		
		if($topChk.is(":checked")){
			$imgChk.prop("checked","checked");
			$("#nowChecked").html( $("input[name=selectCheck]:checked").length/2);
			$("#selectAll").prop("checked",true);
		}else{
			$imgChk.prop("checked","");
			$("#nowChecked").html( $("input[name=selectCheck]:checked").length/2);
			$("#selectAll").prop("checked",false);
		}
	});
	
	//체크박스 가격
	$(".checkList").on("click", "input:checkbox", function () {
    	var $items = $(".checkList").find("input:checkbox:checked");
    	var $artTotal = $("#total_art_price");
    	var $delTotal = $("#total_delivery_price");
    	var $cartTotal = $("#total_cart_price");
    	var cur_total = 0;
    	var del_total = 0;
    
    	$items.each(function () {
        	var $this = $(this);
        	var $artPrice = $(this).closest("table").find('.jeonga_total_art_price').children().first().text();
        	var $deliveryPrice = $(this).closest("table").find('.delivery_cost').children().next().children().first().text();
         	var item_value = $artPrice;
         	var del_value = $deliveryPrice;
        	
         	cur_total += Number(item_value);
        	del_total += Number(del_value);
    	});
    
    	$artTotal.html(AddComma(cur_total/2)+"원"); 
    	$delTotal.html(AddComma(del_total/2)+"원"); 
    	$cartTotal.html(AddComma((cur_total+del_total)/2) +"원"); 
	});
	
	//작품 체크박스 직접 클릭
	$(".chkbox").click(function(e){
		var $topChk =$(this).closest("table").find('.checkbox');
		var $presentChk = $(this);
		
		if($presentChk.is(":checked")){
			$topChk.prop("checked","checked");
			$("#nowChecked").html( $("input[name=selectCheck]:checked").length/2);
			$("#selectAll").prop("checked",true);
		}else{
			$topChk.prop("checked","");
			$("#nowChecked").html( $("input[name=selectCheck]:checked").length/2);
			$("#selectAll").prop("checked",false);
		}
	});
	
	//전체 체크박스 클릭
    $("#selectAll").click(function(){
        if($("#selectAll").prop("checked")){
            $("input[name=selectCheck]").prop("checked",true);
    		$("#nowChecked").html( $("input[name=selectCheck]").length/2);
        }else{
            $("input[name=selectCheck]").prop("checked",false);
            $("#nowChecked").html(0);
        }
        if($("input[name=selectCheck]").is(":checked") == true) {
        	var $items = $(".checkList").find("input:checkbox:checked");
        	var $artTotal = $("#total_art_price");
        	var $delTotal = $("#total_delivery_price");
        	var $cartTotal = $("#total_cart_price");
        	var cur_total = 0;
        	var del_total = 0;
        
        	$items.each(function () {
            	var $this = $(this);
            	var $artPrice = $(this).closest("table").find('.jeonga_total_art_price').children().first().text();
            	var $deliveryPrice = $(this).closest("table").find('.delivery_cost').children().next().children().first().text();
             	var item_value = $artPrice;
             	var del_value = $deliveryPrice;
            	
            	cur_total += Number(item_value);
            	del_total += Number(del_value);
        	});
        
        	$artTotal.html(AddComma(cur_total/2)+"원"); 
        	$delTotal.html(AddComma(del_total / 2)+"원"); 
         	$cartTotal.html(AddComma((cur_total+del_total)/2) +"원");   
        }
        if($("input[name=selectCheck]").is(":checked") == false) {
        	var $artTotal = $("#total_art_price");
        	var $delTotal = $("#total_delivery_price");
        	var $cartTotal = $("#total_cart_price");
        	$artTotal.html("0원"); 
        	$delTotal.html("0원"); 
        	$cartTotal.html("0원");
        }
        	
    });

	//작품 주문하기
	$(".order_Choice").click(function(e){
		var $items = $(".checkList").find("input[id=selected]:checked");
		if($items.length == 0){
			alert('작품을 선택해주세요');
		}else{
			$items.each(function () {
        		var $this = $(this);
        		var $orderRequest = $(this).closest("table").find('.orderTextarea').val();
        		var $artCode = $(this).closest("table").find('.jeonga_artcode').text();
      			var $artOptionCode = $(this).closest("table").find('.jeonga_artoption_code').text();
      			var $artCount = $(this).closest("table").find('.jeonga_art_count').text();
      			console.log($artOptionCode);
        		console.log($orderRequest);
        		console.log($artCode);
        	
        		var orderRequest = $orderRequest;
        		var artCode = $artCode;
        		var artOptionCode = $artOptionCode;
        		var artCount = $artCount;
        	
        		var $inputArtCode = $('<input type="text" name="artCode" value="'+artCode+'">');
        		var $inputOrderRequest = $('<input type="text" name="orderRequest" value="'+orderRequest+'">');
        		var $inputArtOptionCode = $('<input type="text" name="artOptionCode" value="'+artOptionCode+'">');
        		var $inputArtCount = $('<input type="text" name="artCount" value="'+artCount+'">');
        	
        		$('#jeonga_order_choice').append($inputArtCode);
    			$('#jeonga_order_choice').append($inputOrderRequest);
    			$('#jeonga_order_choice').append($inputArtOptionCode);
    			$('#jeonga_order_choice').append($inputArtCount);
    		
    		});
		$('#jeonga_order_choice').submit();
		}
	});

});
</script>
</html>