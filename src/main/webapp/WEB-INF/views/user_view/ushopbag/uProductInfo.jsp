<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="<c:url value='/resources/vendor/clipboard/clipboard.min.js'/>"></script>
<script type="text/javascript">
var memberCode = '<%= (String)session.getAttribute("member") %>';
var artCodeSeq = '<%= (String)session.getAttribute("artCodeSeq") %>';
var writerCodeSeq = '<%= (String)session.getAttribute("writerCodeSeq") %>';

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}

function AddComma(num){
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
}

var list;
function RemoveComma(num){
	list = num.split(',');
	var result='';
	for(var i=0; i<list.length; i++){
		result += String(list[i]);
	}
	return Number(result);
}

window.addEventListener('scroll', function(e) {
	input = document.getElementById('ShareUrl');
	wonSlides = document.getElementById('hoddenTop');
	hoddenBottom = document.getElementById('hoddenBottom');
	let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	let windowHeight = window.innerHeight; // 스크린 창
	
	let footerLocation1 = document.getElementById('product_Footer').scrollHeight;
	let footerLocation2 = document.querySelector('footer').scrollHeight;
	let fullHeight = document.body.scrollHeight;
	
	
	let calc = fullHeight-(footerLocation1+footerLocation2) + 200;
	
	let positionFixed = document.getElementById('positionFixed');
	
 	if(scrollLocation+windowHeight >= calc){
 		positionFixed.style.display = 'none';
 		hoddenTop.append(input);
 	}else{
 		positionFixed.style.display = 'block';
 		hoddenBottom.append(input);
 	}
	
	
});

	function wonDisWorkInfoDo(){//작품 정보제공 고시
		var wonDisWorkInfo = document.getElementById('wonDisWorkInfo');
		var wonInfoWorkButton = document.getElementsByClassName('wonInfoWorkButton');
		if(wonDisWorkInfo.style.display == 'none'){
			wonDisWorkInfo.style.display = 'block';
			document.getElementById('wonInfoWorkButton').className= 'fa fa-angle-up';
		}else{
			wonDisWorkInfo.style.display = 'none';
			document.getElementById('wonInfoWorkButton').className= 'fa fa-angle-down';
		}
	}
	function wonDisSellInfoDo(){//판매 작가 정보
		var wonDisWorkInfo = document.getElementById('wonDisSellInfo');
		var wonInfoWorkButton = document.getElementsByClassName('wonInfoSellInfoButton');
		if(wonDisWorkInfo.style.display == 'none'){
			wonDisWorkInfo.style.display = 'block';
			document.getElementById('wonInfoSellInfoButton').className= 'fa fa-angle-up';
		}else{
			wonDisWorkInfo.style.display = 'none';
			document.getElementById('wonInfoSellInfoButton').className= 'fa fa-angle-down';
		}
	} 
	function wonDisChangReturnDo(){//배송 교환 환불
		var wonDisWorkInfo = document.getElementById('wonDisChangReturn');
		var wonInfoWorkButton = document.getElementsByClassName('wonChangReturnButton');
		if(wonDisWorkInfo.style.display == 'none'){
			wonDisWorkInfo.style.display = 'block';
			document.getElementById('wonChangReturnButton').className= 'fa fa-angle-up';
		}else{
			wonDisWorkInfo.style.display = 'none';
			document.getElementById('wonChangReturnButton').className= 'fa fa-angle-down';
		}
	}

	/* function wonAuctionClose(){//전체옵션 선택
		var closeButton = document.getElementById('wonAuctionClose');
		var display = document.getElementById('wonActionDisplay');
		var tempPriceChange = document.getElementById('tempPrice');
		var tempPrice = parseInt(document.getElementById('tempPrice').innerHTML);
		var totalPrice = parseInt(document.getElementById('totalPrice').innerHTML.replace(',',''));
		var changePrice = totalPrice - tempPrice;
		var lastPrice = document.getElementById('totalPrice');
		var wonActionDetailDisplay = document.getElementById('wonActionDetailDisplay');
		var optionSelectDetail = document.getElementById('optionSelectDetail');
		
		tempPriceChange.innerHTML = "0";
		wonActionDetailDisplay.innerHTML = "";
		optionSelectDetail.style.display = 'none'
		
			display.style.removeProperty('position');
			display.style.display = 'none';
		
	} */
	function wonAuctionOpen(){
		var openButton = document.getElementById('wonActionButton');
		var display = document.getElementById('wonActionDisplay');
		
		display.style.setProperty('position', 'absolute');
		display.style.setProperty('display','block');
	}
		
	
	function wonDetailAuction(e) {
		var display1 = document.getElementById('wonActionDisplay');
		var option = e.querySelector('.dndud_detail_option');
		var select = e.querySelector('button');
		if(option.style.display == 'none'){		
			option.style.setProperty('display','flex');
			e.querySelector('.fa-arrow-down').className = 'fa fa-angle-up';
		}else{
			option.style.setProperty('display','none');
			e.querySelector('.fa-arrow-up').className = 'fa fa-angle-down';
		}
		
	}
	/* 
	function wonAuctionDetailClose() {
		var tempPriceChange = document.getElementById('tempPrice');
		var tempPrice = parseInt(document.getElementById('tempPrice').innerHTML);
		var totalPrice = parseInt(document.getElementById('totalPrice').innerHTML.replace(',',''));
		var changePrice = totalPrice - tempPrice;
		var lastPrice = document.getElementById('totalPrice');
		var display = document.getElementById('wonActionDetailDisplay');
		var optionSelectDetail = document.getElementById('optionSelectDetail');
		
		tempPriceChange.innerHTML = "0";
		lastPrice.innerHTML = AddComma(changePrice);
		display.innerHTML = "";
		optionSelectDetail.style.display = 'none'
		
		
	} */

	function imgChage(e){
		var img = e.querySelector('img');
		var mainPhoto = document.getElementById('mainPhoto');
		mainPhoto.src = img.src;
		
	}
	var test;
	/* function optionSelect(e){
		content = e.innerHTML;
		var price = parseInt(e.value);
		var display1 = document.getElementById('wonActionDetailDisplay');
		var tempPrice = parseInt(document.getElementById('tempPrice').innerHTML);
		var tempPricee = document.getElementById('tempPrice');
		var i = display1.innerHTML += content +" /";
		var temptotal = tempPrice += price;
		tempPricee.innerHTML = temptotal;
		
	} */
	function completeSelect(){
		var checkDisp = document.getElementById('wonActionDetailDisplay');
		var disp = document.getElementById('optionSelectDetail');
		var tempPrice = parseInt(document.getElementById('tempPrice').innerHTML);
		var totalPrice = parseInt(document.getElementById('totalPrice').innerHTML.replace(',',''));
		var changePrice = totalPrice + tempPrice;
		var lastPrice = document.getElementById('totalPrice');
		var display = document.getElementById('wonActionDisplay');
		

		if(checkDisp.innerHTML == ''){
			alert('옵션을 선택해주세요.');
		}else{
			lastPrice.innerHTML = AddComma(changePrice);
			display.style.display = 'none';
			disp.style.display = 'block';			
		}

	}
	function bookmarkCount(){
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			var bookMark = document.getElementById('won_bookMark_star');
			var tORf;
			if(bookMark.className == 'fa fa-star-o fa-1x'){
				bookMark.className = "fas fa-star";
				// 좋아하는 상품으로 추가
				tORf = true;
			}else{
				bookMark.className = 'fa fa-star-o fa-1x';
				// 해제
				tORf = false;
			}
			var option = '좋아하는작품';
			
			$.ajax({
				url:'/bomulsum/category/wish.do',
				data:{
					'member':memberCode,
					'option':option,
					'optionCode':artCodeSeq,
					'bool': tORf
				},
				type:'POST',
				success:function(data){
					
				},
				error:function(e){
					console.log(e);
				}
			});
			
			if(tORf){
				alert('좋아하는 작품에 추가되었습니다.');
				location.reload();
			}else{
				alert('즐겨찾기가 해제되었습니다.');
				location.reload();
			}
		}
	}
	function copy_trackback(){
		var obShareUrl = document.getElementById("ShareUrl");
		obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅해 줍니다.
		obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
		document.execCommand("copy"); // 클립보드에 복사합니다.
		alert("URL이 클립보드에 복사되었습니다.\n원하는 곳에 붙여넣기 해주세요"); 
	}
	function commentUpdate(){
		var comment = document.getElementById('comment');
		if(memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else if(comment.value == ""){
			alert('글을 입력해주세요.');
			return false;
		}else{
			$.ajax({
				type:'get',
				dataType:'json',
				data:{
					"comment":comment.value,
					"memberCode":memberCode,
					"artCodeSeq":artCodeSeq,
					"writerCodeSeq":writerCodeSeq
				
				},
				url:'/bomulsum/user/commentUpdate.do',
				success: function(jData){
					location.reload();
				}
			});
		}
		comment.value = "";
		alert('등록되었습니다.');
	}

</script>
<style>
#wondSumImg{
	background-color: white;
	border:none;
	width: 15%;
}
#wondSumImg:hover{
	cursor: pointer;
}

.wonAHover{
	font-size: 16px;
	color:#666;
}
.wonAHover:hover{
	cursor: pointer;
}

.wonAHover:link { color: #666; text-decoration: none;}
.wonAHover:visited { color: #666; text-decoration: none;}
.wonAHover:hover { color: #22a7af; text-decoration: none;}

#wonInfoButton:hover{
	cursor: pointer;
}
#wonInfoWorkButton:hover{
	cursor: pointer;
}
#wonInfoSellInfoButton:hover{
	cursor: pointer;
}
#wonChangReturnButton:hover{
	cursor: pointer;
}
#wonButtonReview{
	cursor: pointer;
}
#wonUproductPagingButtonPrev:hover{
	cursor: pointer;
}
#wonUproductPagingButtonNext:hover{
	cursor: pointer;
}
.dndud_detail_option_one:hover{
	cursor: pointer;
	background-color:#d9d9d9 !important;
}
#wonUProductReview{
	cursor: pointer;
}
#wonShareButton{
	cursor: pointer;
}
#wonActionButton{
	cursor: pointer;
}
#wonDetailAuction{
    display: flex;
    cursor: pointer;
    justify-content: space-between;
    flex-direction: column;
}
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 40%;
  width: auto;
  padding: 16px;
  margin-top: -50px;
  color: black;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}
.next{
	
}
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
}

#dndud_commentDiv::-webkit-scrollbar {
  width: 6px;
}
#dndud_commentDiv::-webkit-scrollbar-thumb {
  background-color: gray;
  border-radius: 3px;
}
#dndud_commentDiv::-webkit-scrollbar-track {
  background-color: transparent;
}

#dndud_commentDiv::-webkit-scrollbar-button{
	width:0;
	height:0;
}

#dndud_wonhui_review_div::-webkit-scrollbar {
  width: 6px;
}
#dndud_wonhui_review_div::-webkit-scrollbar-thumb {
  background-color: gray;
  border-radius: 3px;
}
#dndud_wonhui_review_div::-webkit-scrollbar-track {
  background-color: transparent;
}

#dndud_wonhui_review_div::-webkit-scrollbar-button{
	width:0;
	height:0;
}
#optionSelectDetail::-webkit-scrollbar {
  width: 6px;
}
#optionSelectDetail::-webkit-scrollbar-thumb {
  background-color: gray;
  border-radius: 3px;
}
#optionSelectDetail::-webkit-scrollbar-track {
  background-color: transparent;
}

#optionSelectDetail::-webkit-scrollbar-button{
	width:0;
	height:0;
}

#wonDisChangReturn table td span{
	color:#333;
}
.minwoo_starRev{
	
	display: flex;
    align-items: center;
}

.minwoo_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -28px 0;
    background-size: auto 100%;
    width: 8px;
    height: 16px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 8px;
    height: 16px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR1.on{background-position:0 0;}
.minwoo_starR2.on{background-position:-8px 0;}

#won_bookMark_star{
	cursor:pointer;
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
	cursor:pointer;
}

.input_number button:focus{
	outline:none;
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

#wish_writer_append:focus{
	outline:none;
}

.message_to_writer:hover{
	background: #f5f5f5;
}

#wonActionButton{
	padding: 5px 14px;
	border-radius: 3px;
	background-color: #fff;
	outline: none;
	border: 1px solid #666;
	font-size: 12px;
}
#wonActionButton:hover {
	background-color: #F6F6F6;
}
</style>

<meta charset="UTF-8">
<title>상품소개!</title>
</head>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
		<div style="width:70%; margin-left: 15%; margin-top: 1%; margin-right: 50%; display: flex; flex-direction: row; z-index: 1" id="productScroll">
			<div style="width:50%;">
		<!-- 전체틀 --><div id="hoddenTop"></div>
				<!-- 사진영역 -->
				<div style="display:none">
					<form id="dndud_go_direct_pay" action="/bomulsum/user/buy.do" method="post"></form>
					<form id="dndud_go_gift" action="/bomulsum/user/gift.do" method="post"></form>
					<form id="dndud_go_shop_bag" action="/bomulsum/user/product/shopbag.do" method="post"></form>
				</div>
				
				<input type="hidden" value="${artList.artDiscount}" id="dndud_article_origin_price"/>
				<div style="margin-top: 2%; display: flex; justify-content:center;" class="wonSlides">
					<img id="mainPhoto" style="width:500px; height:500px;" src="<c:url value='/upload/${firstPhoto}'/>">
				</div>
				
				<div style="display: flex; justify-content:center; margin-bottom: 2%;">
					<!-- 썸네일 -->
			<c:forEach items="${artPhotoSplit }" varStatus="vs">
					<button class="wonSumSlides" id="wondSumImg" onclick="imgChage(this);"><img style="width:100%;" src="<c:url value='/upload/${artPhotoSplit[vs.index]}'/>"></button>
					
			</c:forEach>
				</div>
				<!-- 화면전환버튼 -->
				
				<!-- 화면전환버튼end -->
				
				
				<div style="margin: 1%; display: flex; justify-content: space-between; flex-direction: row; color: #666;border-top:1px solid #d9d9d9;
				border-bottom:1px solid #d9d9d9;">
					<div style="margin: 18px 0px; text-align:center; width:25%;  font-size: 16px;"><a href="#dainArtInfo" class="wonAHover">작품정보</a></div>
					<div style="margin: 18px 0px; text-align:center; width:25%; font-size: 16px; "><a href="#dainShipInfo" class="wonAHover">배송/교환/환불</a></div>
					<div style="margin: 18px 0px; text-align:center; width:25%; font-size: 16px; "><a href="#dainReview" class="wonAHover" >구매후기(${reviewCount})</a></div>
					<div style="margin: 18px 0px; text-align:center; width:25%; font-size: 16px; "><a href="#dainComment" class="wonAHover" >댓글</a></div>
				</div>
				<div>
					<!-- 내용 작품 소개 -->
					<div id="dainArtInfo" style="border-bottom:1px solid #d9d9d9; padding:48px 0px; text-align: center;">
						${artList.artDescription }				
					</div>
				</div>
				<div style="display: flex; justify-content: center; padding-top:24px;" >
					<span style="color: #ccc; font-size: 10px;">Category&nbsp;&&nbsp;Keyword</span>
				</div>
				<div style="display: flex; flex-wrap: wrap; justify-content: center;">
					<strong>카테고리</strong>
				</div>
				<ul style="margin: 5%;display: flex; list-style: none;padding-left: 0px; justify-content: center; flex-wrap: wrap;">
				<c:forEach items="${keywordSplit }" varStatus="vs">
					<li style="padding: 6px 8px;margin: 8px 0px 0px 8px; border:1px #ccc solid; font-size: 80%; color: #666666;">#${keywordSplit[vs.index] }</li>
				</c:forEach>
				</ul>
				<c:forEach var="artInfo" items="${artInfo }">
				<div style="display: flex; justify-content: space-between; flex-direction: row; font-size:14px; border-top:1px solid #d9d9d9; padding:18px 16px;">
					<span>작품 정보제공 고시</span>
					<span id="wonInfoWorkButton"  onclick="wonDisWorkInfoDo()" class="fa fa-angle-down"></span>
				</div>
				<div id="wonDisWorkInfo" style="display:none; width:100%; font-size: 12px;">
					<table style="width:100%; border-collapse: collapse;" >
						<tr>
							<th style="border-top:1px #ccc solid;padding:3%; margin:3%; border:1px solid  width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">작품명</th>
							<td style="border-top:1px #ccc solid;padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${artList.artName }</td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid;padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;"><span>법에 의한 인증,허가 등을 받았음을 확인할 수 있는 경우 그에 대한 사항</span></th>
							<td style="border-top:1px #ccc solid;padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${artInfo.artInfoDetailCategory}</td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">제조자 / 제조국</th>
							<td style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${artInfo.artInfoDetailFrom}</td>
						</tr>
					</table>
				</div>
					<div style="display: flex; justify-content: space-between; flex-direction: row; padding:18px 16px; font-size:14px; border-top:1px solid #d9d9d9;">
						<span>판매 작가 정보</span>
						<span id="wonInfoSellInfoButton" onclick="wonDisSellInfoDo()" class="fa fa-angle-down"></span>
					</div>
				<div id="wonDisSellInfo" style="width:100%; display: none;">
					<table style="width:100%; border-collapse: collapse; font-size: 12px;">
						<tr>
							<th style="border-top:1px #ccc solid; padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">대표자명</th>
							<td style="border-top:1px #ccc solid; padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${writer.writerName}</td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid; padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">이메일</th>
							<td style="border-top:1px #ccc solid; padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${writer.writerEmail }</td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">전화번호</th>
							<td style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">${writer.writerPhone}</td>
						</tr>
					</table>
				</div>
					<div id="dainShipInfo" style="display: flex; justify-content: space-between; flex-direction: row; font-size:14px; border-top:1px solid #d9d9d9; padding:18px 16px;">
						<span>배송 교환 환불</span>
					<span id="wonChangReturnButton" onclick="wonDisChangReturnDo()" class="fa fa-angle-up"></span>
					</div>
				<div id="wonDisChangReturn" style="width:100%; display: block;">
					<table style="width:100%; font-size: 12px; border-collapse: collapse;">
						<tr>
							<th style="border-top:1px #ccc solid;padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">배송비</th>
							<td style="border-top:1px #ccc solid;padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">
								<span>기본료 : </span><span style="color: #22a7af;"><fmt:formatNumber value="${writer.writerSendPrice }" pattern="#,###"/> 원</span>  <br>
								<span>배송비 무료 조건 :</span> <span style="color: #22a7af;"><fmt:formatNumber value="${writer.writerSendfreeCase }"/> 원</span><br>
								<span>제주, 도서산간일 경우 기본료만 무료가 됩니다.</span><br>
								<span>제주 / 도서산간 추가비용 : </span><span style="color: #22a7af;"><fmt:formatNumber value="${writer.writerSendPrice }"/>원</span></td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid;padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;"><span>제작 / 배송</span></th>
							<td style="border-top:1px #ccc solid;padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;"></td>
						</tr>
						<tr>
							<th style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:30%; font-size: 90%; background-color: #EEEEEE; color: #666666;">교환 / 환불</th>
							<td style="border-top:1px #ccc solid; border-bottom:1px #ccc solid; padding:3%; margin:3%; width:70%; font-size: 90%; color: #666666;">
							<c:if test="${writer.writerRefund eq 'y'}">
								<span>
									<a style="color: #22a7af;font-weight: bold;">가능</a><br>
									[교환/반품기준]<br><br>
									-교환/반품은 제품 수령 후 7일 이내 개봉하지 않은 새 제품에 한하여 가능합니다.<br>
									-제품에 하자가 있을 경우 메시지 보내주세요. 대표가 책임지고 적극 교환해드립니다.<br>
									(단, 단순변심, 주문착오, 장기부재, 주소 및 연락처오류, 수취인부재, 배송기사님과의 트러블로 인한 반품/교환비용은 구매자 부담입니다.)<br>
									-천연비누의 특성상 천연분말 뭉침, 색이 고르지 않을 수 있습니다.
									제품 사용이나 품질에는 전혀 지장이 없으므로 안심하고 사용해주세요.
									-전체 교환/반품이 아닌 일부 상품의 교환/반품인 경우에는 편도 금액을 부담하시면 됩니다.<br>
									-제품 하자로 인한 교환 및 반품의 경우 두류헌에서 배송비를 부담합니다.<br>
									-대량주문건은 메시지로 문의주시기 바랍니다.<br>
									-제주도 및 도서산간지역은 별도의 추가비용이 발생할 수 있습니다.<br>
									-교환및 반품시에는 메시지 접수 후 발송 부탁드립니다.<br>
									(메시지 접수 하지 않고 반송하실 경우 처리가 지연될 수 있습니다.)<br>
								</span>
							</c:if>
							<c:if test="${writer.writerRefund eq 'n'}">
								<a style="color: #ff0000;font-weight: bold;">불가능</a><br>
								<span>주문 전 판매 작가님과 연락하여 확인해주세요.신선식품이기에 단순변심에의한 교환및 환불은불가합니다</span>
							</c:if>
							</td>
						</tr>
					</table>
				</div>
				</c:forEach><!-- 작품정보 제공공시 -->
				
				
				<div id="dainReview" style="padding: 2% 2% 2% 0%; margin-top:60px; display: flex; justify-content: space-between; color:#333; font-weight: bold;  ">
					<span>구매후기(<a id="dndud_wonhui_review_count">${reviewCount}</a>)</span>
					<button id="wonButtonReview" style="background: white; border-radius:1px; padding: 3px 6px; border:1px #ccc solid; border-radius:2px;
							font-size: 12px; color: #666666;display: flex; outline: none; cursor: pointer;">구매후기작성하기</button>
				</div>
				
				<!-- 구매후기 -->
				<div id="dndud_wonhui_review_div" style="border-top: 1px solid black; padding: 0 0 3% 0; overflow-y: scroll; max-height:20%">
				
					<c:forEach items="${reviewList}" var="review">
					
						<div style="width:100%; display: flex; flex-direction:column; padding:10px 0; border-bottom:1px solid #d9d9d9;">
							<div style="display:flex; justify-content: space-between;">
								<div style="border-radius:50%; width:80%;display: flex; flex-direction: row;"><!-- 프로필 -->
									<img style="width:10%; border-radius: 50%;" src="<c:url value='/upload/${review.memberImg }'/>">
									<div>
										<span style="font-size: 12px;">${review.memberName}</span><br>
										<span style="color:#999999; font-size: 12px;">
											<fmt:parseDate value="${review.reviewDate }" pattern="yyyy-MM-dd HH:mm" var="date"/>
											<fmt:formatDate pattern="yyyy년 MM월 dd일" type="both" value="${date }"/>
										</span>
									</div>
								</div>
								<div>
									<div class="minwoo_starRev" style="margin-top: 10px;" data-rate="${review.reviewStar }">
										<span class="minwoo_starR1">별1_왼쪽</span> <span class="minwoo_starR2">별1_오른쪽</span>
										<span class="minwoo_starR1">별2_왼쪽</span> <span class="minwoo_starR2">별2_오른쪽</span>
										<span class="minwoo_starR1">별3_왼쪽</span> <span class="minwoo_starR2">별3_오른쪽</span>
										<span class="minwoo_starR1">별4_왼쪽</span> <span class="minwoo_starR2">별4_오른쪽</span>
										<span class="minwoo_starR1">별5_왼쪽</span> <span class="minwoo_starR2">별5_오른쪽</span>
									</div>
								</div>
							</div>
							<div style="font-size:14px;">
								${review.reviewContent }
							</div>
						</div>
						
					</c:forEach>
					
					
				</div>
				<!-- 구매후기 end -->
				<!-- 
				<div style="display: flex; flex-direction: row; justify-content:center; margin: 2%;">
						<a id="wonUproductPagingButtonPrev">
							<span style="text-align: center;">&lt;이전 |</span>
						</a>
						<a id="wonUproductPagingButtonNext">
							<span style="text-align: center;">| 다음&gt;</span>
						</a>
				</div> -->
				
				<div id="dainComment" style="padding: 2% 2% 2% 0%; display: flex; margin-bottom:24px; border-bottom: 1px solid black; justify-content: space-between; margin-top: 10%; margin-top:60px;">
					<strong>댓글</strong><a style="color: #333; font-size: 16px;" id="wonUProductReview"></a>
				</div>
				<!-- 댓글 -->
				<div id="dndud_commentDiv" style="margin: 1%; display: flex; justify-content: center; overflow-y: scroll; max-height:20%">
					<div style="width:100%; display: flex; flex-direction: column; align-items: center">
						<c:if test="${commentList.size() <= 0}">					
							<span><i class="fa fa-commenting-o fa-5x" style="color: #EAEAEA;"></i></span>
							<br>
							<span style="color: #ACACAC; font-size: 14px; ">행운의 첫 댓글을 남겨보세요.</span>
						</c:if>
						<c:if test="${commentList.size() > 0}">
							<c:forEach var="b" items="${commentList}">
								<div style="display: flex; flex-direction: row; width: 100%;justify-content: space-around; margin-bottom: 15px;">
									<div style="width:10%;">
										<img style="width: 100%; border-radius: 50%;" src="<c:url value='/upload/${b.memberProfile }'/>">
									</div>
									<div style="display:flex; margin:0 3%; width:84%; flex-direction: column">
										<span style="width:10%; font-size:12px; color: #999;">${b.memberName }</span>
										<span style="font-size:14px;">${b.commentContent}</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
							
					</div>
				</div>
				<hr style="margin-top: 24px;">
				<div style="display: flex; flex-direction: row; width: 100%; align-items: center;">
					<c:if test="${not empty memberImg }">
						<img style="width: 10%; border-radius: 50%;" src="<c:url value='/upload/${memberImg}'/>">						
					</c:if>
					<c:if test="${empty memberImg }">
						<img style="width: 10%; border-radius: 50%;" src="<c:url value='/resources/img/test.png'/>">
					</c:if>
					
					<input type="text" id="comment" style="margin: 3%; padding:6px 8px; outline:none; width: 70%; margin-right: 0%;" placeholder="댓글을 남겨주세요~">
					<input type="button" value="등록" style="color:white; cursor:pointer; outline:none; border:none; border-radius:2px; margin: 1%;font-size:12px; height: 32px;width: 50px; background-color: #0086cc"  onclick="commentUpdate();">
				</div>
				<script type="text/javascript">
				
				</script>
				<!-- 댓글 end -->
			</div>
			<!-- 상품정보 선택 -->
			<div style="margin-left:1%; width:50%;">
				<div style="border:1px #ccc solid; position: fixed; width:32.7%; margin-top: 10px; margin-left: 1.8%; background-color: #fff;" id="positionFixed">
					<div style="margin:2% 1% 1% 1%; padding: 1%; display: flex; justify-content: space-between;">
						<span style="display: flex; flex-direction: row; width:50%;">
							<img style="width: 10%; height:80%;" src="<c:url value='/upload/${writer.writeProfileImg }'/>">
							<span style="font-size: 14px; color:#666666; justify-content:center;">${writer.writerBrandName }</span>
						</span>
					<div>
						<a style="text-decoration: none; display: flex; justify-content: flex-end;"href="#">
							<span class="message_to_writer" style="border-radius:1px; padding: 3px 6px; border:1px #ccc solid; border-radius:2px;
							font-size: 80%; color: #666666;display: flex;"><i class="fa fa-comment-o" aria-hidden="true" style="margin-right: 3px; margin-top:1px;"></i> 작가문의</span><!-- 메세지 페이지로 이동 -->
						</a>
					</div>
					</div>
					<div id="wonActionDisplay" style="left: 3%; top:33%; width: 95%; border: 1px solid;  border-radius: 2px; background-color: #fff; font-size: 80%; vertical-align: baseline; display: none; flex-direction: column;">
						<div style="width:100%;padding: 8px 12px; position: relative;background-color: #333; border:1px solid #333; font: inherit; font-size: 80%; vertical-align: baseline; box-sizing: border-box; ">
							<span style="font-size: 12px;color: #fff;">전체옵션 선택</span>
							<button id="wonAuctionClose" onclick="wonAuctionClose()" style="float: right; background-color: #333; border:none; color: #fff; cursor: pointer;">X</button>
						</div>
						<!-- 선택사항 -->
						<c:forEach var="b" items="${artOption }" varStatus="head">
							<div style="display: flex; flex-direction: column;"><!-- 선택사항 1 -->
								<div id="wonDetailAuction" onclick="wonDetailAuction(this);">
									<div style="display:flex; justify-content: space-between;">
										<span style="padding: 1%; margin: 1%; font-weight:bold; width:50%;"><c:out value="${head.count }"/>. ${b.key }</span>
										<div style="display: flex;flex-direction: row;align-items: center; justify-content: flex-end; width:50%; ">
											<span class="dndud_preview_option" style="margin-rigth:15px"></span>
											<i style=" padding: 1%; margin: 1%; float: right;"class="fa fa-angle-down"></i>
										</div>
									</div>
									<div id="wonDetailAuctionSelect" class="dndud_detail_option" style="display: none; flex-direction: column; border: none; width: 100%;">
										<c:forEach var="c" items="${b.value }" varStatus="i">
											<button class="dndud_detail_option_one" value="${c.artOptionPrice}" style="background-color: white;  font-size:12px; border: none; width: 100%; display:flex;align-items: center;">
												<span class="dndud_option_name" style="padding: 1%; margin: 1%;">${c.artOptionName}</span>
												<input class="dndud_option_code" type="hidden" value="${c.artOptionSeq}" />
												<input class="dndud_option_category" type="hidden" value="${b.key}" />
												<c:if test="${c.artOptionPrice ne 0 }">
													<span style="padding: 1%; margin: 1%;">(+<span class="dndud_option_price">${c.artOptionPrice}</span>원)</span>
													<input class="dndud_option_price_input" type="hidden" value="${c.artOptionPrice }" />
												</c:if>
												<c:if test="${c.artOptionPrice eq 0 }">
													<input class="dndud_option_price_input" type="hidden" value="${c.artOptionPrice }" />
												</c:if>
											</button>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- 선택사항  end -->
						<div id="complete_select_option" style="width:100%; padding: 8px 12px; cursor: pointer; 
						position: relative;background-color: #333;  text-align: center; font: inherit; 
						font-size: 100%; vertical-align: baseline; box-sizing: border-box;">
							<span  style="font-size: 12px;color: #fff; ">선택완료</span>
						</div>
					</div>
					<div style="margin-left: 2.5%;"><!-- 할인율 가격 판매제목  -->
						<strong style="font-size: 150%; color:#333;">${artList.artName }</strong><br>
						<div style="margin:1%; display: flex; flex-direction: row; justify-content:space-between; height: 40px">
							<div style="width:70%; display: flex; ">
								<p style="color: #e6524b; margin-top: 2%; margin-right:1%; font-size: 24px; font-weight: bold;"><fmt:formatNumber value="${(artList.artPrice - artList.artDiscount) / artList.artPrice}" type="percent"/></p>
								<div style="padding: 1%; margin: 1%; font-size: 24px;margin-right:2%; color:#333; font-weight: bold;"><fmt:formatNumber value="${artList.artDiscount}" pattern="#,###"/>원</div>
								<p style="padding-top:2.5%; margin-top: 2.5%; font-size: 14px; color:#999; text-decoration: line-through;"><fmt:formatNumber value="${artList.artPrice}" pattern="#,###"/>원</p>
							</div>
							<div style="width: 17%; display:flex; justify-content: center; align-items: flex-start;">
								<div style="display: flex; flex-direction: column; margin: 1%;">
									<c:if test="${checkWishArticle ne 0 }">
										<i class="fas fa-star" aria-hidden="true" onclick="bookmarkCount();" id="won_bookMark_star"
										style="color: #dd5850; margin-top:2px; font-size:20px;"></i>
									</c:if>
									<c:if test="${checkWishArticle eq 0 }">
										<i class="fa fa-star-o fa-1x" aria-hidden="true" onclick="bookmarkCount();" id="won_bookMark_star"
										style="color: #dd5850; margin-top:2px; font-size:20px;"></i>
									</c:if>
									<span style="align-self: center; font-size:12px;color: #353535"><fmt:formatNumber value="${artList.bookMarkCount }" pattern="#,###"/></span>
								</div>
							<i class="fa fa fa-share-alt-square fa-2x" style="cursor:pointer; color:#00a5bf; margin-left:17px;" aria-hidden="true" onclick="copy_trackback();">
							</i>
							</div>
						</div>
						<div style="display:flex; justify-content: flex-end; margin-right: 3%;">
							<span style="color: #666666; font-weight: bold; font-size:14px;">${artList.artSaleCount }명</span>&nbsp;
							<span style="color: #666666; font-size:14px;">구매</span><!-- 할인율 가격 판매제목  -->
						</div>					
						<div style="display:flex; height:100px;  flex-direction: row; padding: 1%; margin: 0% 1% 0% 1%; font-size:14px;">
							<div style="display:flex; flex-direction: column; width:18%; justify-content: space-between;">
								<span style="color: #666666;">적립금</span>
								<span style="color: #666666;">구매후기</span>
								<span style="color: #666666;">배송비</span>
								<span style="color: #666666;">수량</span>
							</div>
							<div style="display:flex; flex-direction: column; justify-content: space-between; margin-left: 5%; width:30%;">
								<span ><a id="dndud_point"><fmt:formatNumber value="${artList.artPoint}" pattern="#,###"/></a> P</span>
								<span >
									<div class="minwoo_starRev" data-rate="${reviewTotalStar }">
										<span class="minwoo_starR1">별1_왼쪽</span> <span class="minwoo_starR2">별1_오른쪽</span>
										<span class="minwoo_starR1">별2_왼쪽</span> <span class="minwoo_starR2">별2_오른쪽</span>
										<span class="minwoo_starR1">별3_왼쪽</span> <span class="minwoo_starR2">별3_오른쪽</span>
										<span class="minwoo_starR1">별4_왼쪽</span> <span class="minwoo_starR2">별4_오른쪽</span>
										<span class="minwoo_starR1">별5_왼쪽</span> <span class="minwoo_starR2">별5_오른쪽</span>
										<span style="margin-left: 10px;font-size: 12px; color: #666;">(<span>${reviewCount }</span>)</span>
									</div>
								</span>
								<span><fmt:formatNumber value="${writer.writerSendPrice }" pattern="#,###"/>원</span>
								<span>${artList.artAmount }</span>
							</div>
						</div>
						
						<div style="padding: 1%; margin: 1%;">
							<c:if test="${not empty artOption }">
								<button id="wonActionButton" style="width:100%; display: flex; justify-content: space-between;"
								onclick="wonAuctionOpen()">
									<span style="margin-top:2px;">옵션</span>
									<span id="wonActionArrow" style="margin: 1%; font-size: 15px; "class="fa fa-angle-down"></span>
								</button>
							
								<div id="optionSelectDetail" style="display: block; flex-direction:column; width:100%; background-color: #F5F5F5;
								height: 90px;overflow-y: auto;" >
								
								</div>
							</c:if>
							<c:if test="${empty artOption }">
								<div id="optionSelectDetail" style="display: block; flex-direction:column; width:100%; background-color: #F5F5F5; align-items: center" >
								
									
									<div class="before_pay_option">
										<div style="display: flex; justify-content: space-between;margin: 1%;padding: 4% 1%;">
											<div style="display: flex; flex-direction: row;">
												<div class="input_number">
													<button class="downButton" type="button">-</button>
													<div class="input_area">
														<input class="prd-count" type="number" value="1" min="1" max="999" readonly >
													</div>
													<button class="upButton" type="button">+</button>
												</div>
											</div>
											<div style="width: 30%;display: flex;justify-content: flex-end;align-items: center;">
												<span class="tempPrice" style="font-size: 16px; color: #666666;">
													<fmt:formatNumber value="${artList.artDiscount}" pattern="#,###"/>
												</span>
												<input type="hidden" class="orgPrice" value="${artList.artDiscount}"/>
												<span>원</span>
											</div>
										</div>
									</div>
									
								</div>
							</c:if>
						</div>
						<div style="display: flex;  padding: 1%; margin: 1%; justify-content: space-between; align-items: center;">
							<span style="width:68%; color:#666; font-size: 14px;">총작품금액</span>
							<span  style="font-size: 20px; color: #333333; font-weight: bold;"><span id="totalPrice">0</span>원</span>
						</div>
						<div style="display: flex; flex-direction: row; justify-content:center; padding: 1%; margin: 1% 1% 2% 1%;">
							<button id="go_shop_bag" style="width:40%; background-color:white; outline: none; 
							height:50px; margin: 1%; border: 1px solid #d9d9d9; cursor:pointer; border-radius: 3px;">
								<span style="color: #333333; font-size: 14px;">장바구니</span>
							</button>
							<button id="go_direct_pay" style="cursor:pointer; width:40%; height:50px; border-radius: 3px; outline: none;
							margin: 1%;border: none; background: #0086cc; font-size: 14px; color: white;">바로구매</button>
						
						</div>
					</div>
				</div>
			</div><!-- 상품정보 end -->
			
		</div>
	<div style="width:70%; margin-left: 15%; margin-top: 1%; margin-right: 50%; background-color: #F5F5F5; position: relative; z-index: 9999" id="product_Footer">
		<div style="width: 100%; display: flex; flex-direction: row; padding: 1%; margin-bottom: 50px;">
			<div style="width:75%; padding-right:2%; margin: 3% 0% 3% 3%; border-right: 1px solid #ccc;">
				<div style="display: flex; justify-content: space-between;">
					<span style="font-size: 14px; font-weight: bold; color:#292622;">판매중인 다른 작품들</span>
					<button id="dainMoreBtn" style="background: white; border-radius:1px; padding: 3px 6px; border:1px #ccc solid; border-radius:2px;
							font-size: 12px; color: #666666;display: flex; outline: none; cursor: pointer;">더보기</button>
				</div>
				<hr style="border:0px; height: 1px; background-color:#555;">
				<div style="display: flex; flex-direction: row; align-items: flex-start;">
				<c:forEach var="b" items="${otherArt}" end="3">
					<a style="width: 140px; display: flex; cursor: pointer; flex-direction: column; padding: 1%; " id="${b.artCodeSeq }" onclick="artCode(this);">
					<c:forTokens delims="," var="i" items="${b.artPhoto}" end="0">
						<img id="otherPhto" style="width: 140px;  height:140px;  background-color: white;" src="<c:url value='/upload/${i}'/>">
					</c:forTokens>
						<span style="background-color: white; font-size: 12px; padding: 8px 10px; width:120px;">
							<c:if test="${not empty writer.writerBrandName }">
								<span style="text-align: center;font-size: 13px;color: #999;">${writer.writerBrandName }</span>
							</c:if>
							<c:if test="${empty writer.writerBrandName }">
								<span style="text-align: center;font-size: 13px;color: #999;">${writer.writerName }</span>						
							</c:if>
						<br><span style="font-size: 14px; color: #333;">${b.artName }</span></span>
					</a>
				</c:forEach>
				</div>
			</div>
			<div style="display: flex;  width: 50%; justify-content: center;">
				<div style="width: 100%; display: flex; flex-direction:column; padding: 1%; align-self: center;align-items: center;">
					<c:if test="${not empty writer.writeProfileImg }">
						<img style="align-self: center; width: 15%; height:15%; margin-top: 5%;" src="<c:url value='/upload/${writer.writeProfileImg }'/>">
					</c:if>
					<c:if test="${empty writer.writeProfileImg }">
						<img style="align-self: center; width:15%; height:15%; margin-top: 5%;" src="<c:url value='/resources/img/test.png' /> ">
					</c:if>
					<c:if test="${not empty writer.writerBrandName }">
						<span style="text-align: center;font-size: 13px;color: #666;">${writer.writerBrandName }</span>
					</c:if>
					<c:if test="${empty writer.writerBrandName }">
						<span style="text-align: center;font-size: 13px;color: #666;">${writer.writerName }</span>						
					</c:if>
					<div class="minwoo_starRev" data-rate="${writerAllArticlesStar }">
						<span class="minwoo_starR1">별1_왼쪽</span> <span class="minwoo_starR2">별1_오른쪽</span>
						<span class="minwoo_starR1">별2_왼쪽</span> <span class="minwoo_starR2">별2_오른쪽</span>
						<span class="minwoo_starR1">별3_왼쪽</span> <span class="minwoo_starR2">별3_오른쪽</span>
						<span class="minwoo_starR1">별4_왼쪽</span> <span class="minwoo_starR2">별4_오른쪽</span>
						<span class="minwoo_starR1">별5_왼쪽</span> <span class="minwoo_starR2">별5_오른쪽</span>
					</div>
					<c:if test="${not empty writer.writerIntro }">
						<p>${writer.writerIntro }</p>
					</c:if>
					<c:if test="${empty writer.writerIntro }">
						<p style="font-size: 14px;">안녕하세요</p>
					</c:if>
					
					<c:if test="${checkWishWriter eq 0 }">
						<button id="wish_writer_append" style="cursor:pointer;background-color: white;color:#dd5850; border: 1px #ccc solid; padding: 1%; margin:1%; width:50%;align-self:center;">
							<i class="fas fa-heart" style="font-size:12px"></i> 작가로 추가
						</button>
					</c:if>
					<c:if test="${checkWishWriter eq 1 }">
						<button id="wish_writer_append" style="cursor:pointer;background-color: #e6524b;color:white; border: 1px #ccc solid; padding: 1%; margin:1%; width:50%;align-self:center;">
							<i class="fas fa-heart" style="font-size:12px"></i>하는 작가
						</button>
					</c:if>
					
					<button id="go_writer_home" style="cursor:pointer;background-color: white; border: 1px #ccc solid; padding: 1%; margin:1%; width:50%;align-self:center;">
						<input id="writer_home_url" type="hidden" value="${writer.writerUrl }"/>
						
						작가홈
					</button>
					
					<button class="message_to_writer" style=" cursor:pointer;background-color: white; border: 1px #ccc solid; padding: 1%; margin:1%; width:50%;align-self:center;">
							메세지보내기
					</button>
				</div>
			</div>
		</div>
	</div>
<div id="hoddenBottom"><input type="text" id="ShareUrl" style="width:0.1%;"></div>
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
<script type="text/javascript">
var test = '${artOption}';



var optionDIV = function(){
	if($('.before_pay_option').length == 0){
		$('#optionSelectDetail').css('display', 'none');
	}else{
		$('#optionSelectDetail').css('display', 'block');
	}
}



var totalPrice = function(){
	if(test == '[]'){
		$('#totalPrice').text($('.tempPrice').text());
		return false;
	}
	var temp = 0;
	$('.tempPrice').each(function(i, e){
		temp += RemoveComma($(e).text());
	});

	$('#totalPrice').text(AddComma(temp));
}

var upButton = function(){
	var num = $(this).prev('.input_area').children().val();
	num++;
	$(this).prev().children().val(num);
	var orgPrice = $(this).parent().parent().next().children('.orgPrice').val();
	var total = Number(num) * Number(orgPrice);
	$(this).parent().parent().next().children('.tempPrice').html(AddComma(total));
	totalPrice();
};

var downButton = function(){
	var num = $(this).next('.input_area').children().val();
	if(num == 1){
		return false;
	}
	num--;
	$(this).next().children().val(num);
	var orgPrice = $(this).parent().parent().next().children('.orgPrice').val();
	var total = Number(num) * Number(orgPrice);
	$(this).parent().parent().next().children('.tempPrice').html(AddComma(total));
	totalPrice();
};

var optionDetailClose = function(){
	$(this).closest('.before_pay_option').remove();
	optionDIV();
	totalPrice();
};

$(document).ready(function(){
	optionDIV();
	$("#dndud_commentDiv").scrollTop($("#dndud_commentDiv")[0].scrollHeight);
	$("#dndud_wonhui_review_div").scrollTop($("#dndud_wonhui_review_div")[0].scrollHeight);
	var starRevPoint = $('.minwoo_starRev');
	starRevPoint.each(function(){
		var targetScore = $(this).attr('data-rate');
		$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
		$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
	});
	
	
	$('.dndud_detail_option_one').on('click', function(){ // 세부 옵션 클릭 시
		var optionCategory = $(this).children('.dndud_option_category').val();
		var optionName = $(this).children('.dndud_option_name').text();
		var optionCode = $(this).children('.dndud_option_code').val();
		var optionPrice = $(this).find('.dndud_option_price_input').val();
		
		var test = '';
		if(optionPrice != 0){
			test = optionName + '(+' + AddComma(optionPrice) + '원)';
		}else{
			test = optionName;
		}

		var html = '<input class="option_category_form" type="hidden" value="'+ optionCategory +'" />'
			+ '<input class="option_name_form" type="hidden" value="'+ optionName +'" />'
			+ '<input class="option_price_form" type="hidden" value="'+ optionPrice +'" />'
			+ '<input class="option_code_form" type="hidden" value="'+ optionCode + '" />' + test;
		
		$(this).parent().prev().children('div').children('.dndud_preview_option').html(html);
		
	});
	
	$('#wonAuctionClose').on('click', function(){ // 옵션 창 종료 버튼
		$('#wonActionDisplay').css('display', 'none');
		optionDIV();
	});
	
	
	
	$("#complete_select_option").on('click', function(){ // 옵션 선택완료 버튼
		var tORf = true;
		const articlePrice = $('#dndud_article_origin_price').val();
		console.log("test : " + articlePrice);
		const optionTag = $('.dndud_preview_option');
		var htmlText='';
		var lastHtml='';
		var html = '';
		var lastPrice = 0;
		optionTag.each(function(i, ele){
			var e = $(ele);
			var category = e.children('.option_category_form').val();
			var name = e.children('.option_name_form').val();
			var price = e.children('.option_price_form').val();
			var code = e.children('.option_code_form').val();
			
			var tag = '';
			if(price == 0){				
				if(i == (optionTag.length - 1)){
					tag = category + ' : ' + name;
				}else{				
					tag = category + ' : ' + name + ' / ';
				}				
			}else{
				if(i == (optionTag.length - 1)){
					tag = category + ' : ' + name + ' (+' + AddComma(price) + '원)';
				}else{				
					tag = category + ' : ' + name + ' (+' + AddComma(price) + '원) / ';
				}				
			}
			
			
			html = '<input class="option_code_test" type="hidden" value="'+ code +'" />';
			
			lastHtml += html;
			htmlText += tag;
			lastPrice += Number(price);
		});
		lastPrice += Number(articlePrice);
		
		$(".before_pay_option").each(function(i, e){
			var formC = $(e).children('.compare_string').val();
			if(formC == htmlText){
				$(e).find('.upButton').click();
				tORf = false;
				return false;
			}else{
				tORf = true;
			}
		});
		
		
		$('#wonActionDisplay').css('display', 'none');
		if(!tORf) return false;

		var InnerHTML = '<div class="before_pay_option">'+ lastHtml +'<input type="hidden" class="compare_string" value="'+ htmlText +'" /><div style="margin: 1%; padding:1%;">'
			+ '<span style="font-size:80%; color:#666666; padding:1%;" id="wonActionDetailDisplay">'
			+ htmlText + '</span></div><div style="display:flex; justify-content:space-between; margin:0% 1% 1% 1%; padding:0% 1% 1% 1%;"><div style="display:flex; flex-direction:row;">'
			+ '<div class="input_number"><button class="downButton" type="button">-</button><div class="input_area"><input class="prd-count" type="number" value="1" min="1" max="999" readonly >'
			+ '</div><button class="upButton" type="button">+</button></div></div><div style="font-size:12px; width: 30%;display: flex;justify-content: flex-end;align-items: center;">'
			+ '<span class="tempPrice" style=" color: #666666;">' + AddComma(lastPrice) + '</span><input type="hidden" class="orgPrice" value="' + lastPrice + '"/><span  style=" color: #666666;">원</span>'
			+ '<button class="optionDetailClose" style="background-color: white;  border:1px solid #d9d9d9; margin:1%; cursor:pointer" id="wonAuctionDetailClose" onclick="wonAuctionDetailClose()">X</button>'
			+ '</div></div></div>';
		
		
		$("#optionSelectDetail").append(InnerHTML);
		$('.optionDetailClose').click(optionDetailClose);
		/* $('.upButton').click(upButton);
		$('.downButton').click(downButton); */
		totalPrice();
		optionDIV();
	});
	
	$('#optionSelectDetail').click(function(e) {
		const target = e.target;
		if(target.closest('.upButton')) {
			upButton.call(target);
		} else if(target.closest('.downButton')) {
			downButton.call(target);
		}
	});
	
	totalPrice();
	
	$('#go_shop_bag').on('click', function(){ // 장바구니
		/*
		dndud_go_shop_bag
		*/
		var tt = '${dndudArtCode}';
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			
			if($('.before_pay_option').length == 0){
				alert('옵션을 선택해주세요.');
				return false;
			}
			
			$.ajax({
				url:'/bomulsum/user/shopbag/confirm.do',
				data:{
					code:tt,
					memberCode:memberCode
				},
				success:function(data){
					if(data == 0){
						var sendData = [];
						var optionCode = '';
						var count = 0;
						$('.before_pay_option').each(function(i, er){
							var e = $(er);
							var optionTemp = '';
							
							e.children('.option_code_test').each(function(ir, err){
								optionTemp += $(err).val() + ',';
							});
							
							optionCode = optionTemp;
							
							count = e.find('.prd-count').val();
							
							var $inputArtCode = $('<input type="text" name="testList['+i+'].artCode" value="'+artCodeSeq+'">');
							var $inputMemberCode = $('<input type="text" name="testList['+i+'].memberCode" value="'+memberCode+'">');
							var $inputOptionCode = $('<input type="text" name="testList['+i+'].optionCode" value="'+optionCode+'">');
							var $inputArtCount = $('<input type="text" name="testList['+i+'].artCount" value="'+count+'">');
							
							$('#dndud_go_shop_bag').append($inputArtCode);
							$('#dndud_go_shop_bag').append($inputMemberCode);
							$('#dndud_go_shop_bag').append($inputOptionCode);
							$('#dndud_go_shop_bag').append($inputArtCount);
							
						});
						
						$('#dndud_go_shop_bag').submit();
					}else{
						alert('장바구니에 이미 존재합니다.');
						location.href="/bomulsum/user/shopbag.do";
					}
				}
			});
		}
		
	});
	
	$('#go_direct_pay').on('click', function(){ // 바로 구매
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			
			if($('.before_pay_option').length == 0){
				alert('옵션을 선택해주세요.');
				return false;
			}
			
			var sendData = [];
			var optionCode = '';
			var count = 0;
			$('.before_pay_option').each(function(i, er){
				var e = $(er);
				var optionTemp = '';
				
				e.children('.option_code_test').each(function(ir, err){
					optionTemp += $(err).val() + ',';
				});
				
				optionCode = optionTemp;
				
				count = e.find('.prd-count').val();
				
				var $inputArtCode = $('<input type="text" name="testList['+i+'].artCode" value="'+artCodeSeq+'">');
				var $inputMemberCode = $('<input type="text" name="testList['+i+'].memberCode" value="'+memberCode+'">');
				var $inputOptionCode = $('<input type="text" name="testList['+i+'].optionCode" value="'+optionCode+'">');
				var $inputArtCount = $('<input type="text" name="testList['+i+'].artCount" value="'+count+'">');
				
				$('#dndud_go_direct_pay').append($inputArtCode);
				$('#dndud_go_direct_pay').append($inputMemberCode);
				$('#dndud_go_direct_pay').append($inputOptionCode);
				$('#dndud_go_direct_pay').append($inputArtCount);
				
			});
			
			$('#dndud_go_direct_pay').submit();
			
		}
	});
	
	$('#go_present').on('click', function(){ // 선물하기
		/* 
		dndud_go_gift
		*/
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			
			if($('.before_pay_option').length == 0){
				alert('옵션을 선택해주세요.');
				return false;
			}
			
			var sendData = [];
			var optionCode = '';
			var count = 0;
			$('.before_pay_option').each(function(i, er){
				var e = $(er);
				var optionTemp = '';
				
				e.children('.option_code_test').each(function(ir, err){
					optionTemp += $(err).val() + ',';
				});
				
				optionCode = optionTemp;
				
				count = e.find('.prd-count').val();
				
				var $inputArtCode = $('<input type="text" name="testList['+i+'].artCode" value="'+artCodeSeq+'">');
				var $inputMemberCode = $('<input type="text" name="testList['+i+'].memberCode" value="'+memberCode+'">');
				var $inputOptionCode = $('<input type="text" name="testList['+i+'].optionCode" value="'+optionCode+'">');
				var $inputArtCount = $('<input type="text" name="testList['+i+'].artCount" value="'+count+'">');
				
				$('#dndud_go_gift').append($inputArtCode);
				$('#dndud_go_gift').append($inputMemberCode);
				$('#dndud_go_gift').append($inputOptionCode);
				$('#dndud_go_gift').append($inputArtCount);
				
			});
			
			$('#dndud_go_gift').submit();
			
		}
		
	});
		
	
	$('.message_to_writer').on('click', function(){
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			console.log('writer code : ' + writerCodeSeq);
			location.href="/bomulsum/user/message.do?writer="+writerCodeSeq;
		}
	});
	
	$('#wish_writer_append').on('click', function(){
		
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		}else{
			var tORf;
			var option = '좋아하는작가';
			
			if($('#wish_writer_append').css('color') == 'rgb(255, 0, 0)'){
				tORf = true;
			}else{
				tORf = false;
			}
			
			$.ajax({
				url:'/bomulsum/category/wish.do',
				data:{
					'member':memberCode,
					'option':option,
					'optionCode':writerCodeSeq,
					'bool': tORf
				},
				type:'POST',
				success:function(data){
					
				},
				error:function(e){
					console.log(e);
				}
			});
			
			if(tORf){
				alert('좋아하는 작가에 추가되었습니다.');
				location.reload();
			}else{
				alert('즐겨찾기가 해제되었습니다.');
				location.reload();
			}
		}
	});
	
	// /bomulsum/writerhome/작가url.do
	$('#go_writer_home, #dainMoreBtn').on('click', function(){
		var url = $('#writer_home_url').val();
		
		location.href='/bomulsum/writerhome/'+url+'.do';
	});
	
	// 구매후기 작성버튼 클릭시 구매후기 페이지로 이동하기
	$('#wonButtonReview').on('click', function(){
		if(memberCode == null || memberCode == '' || memberCode == 'null'){
			alert('로그인 후 사용이 가능합니다.');
			location.href='/bomulsum/user/login.do';
			return false;
		} else {
			location.href='/bomulsum/user/myInfo/review.do';
		}
	})
});


</script>
</html>












