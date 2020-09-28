<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | MY정보</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(document).ready(function () {
	// 도움말1
	$('#dainHelpIcon1').mouseover(function() {
	 	$('#dainHelp1').css("display", "inline");
	});
	$('#dainHelpIcon1').mouseleave(function() {
	 	$('#dainHelp1').css("display", "none");
	});
	
	// 도움말2
	$('#dainHelpIcon2').mouseover(function() {
	 	$('#dainHelp2').css("display", "inline");
	});
	$('#dainHelpIcon2').mouseleave(function() {
	 	$('#dainHelp2').css("display", "none");
	});
	
	//다른파일 불러오기
	$('#here').click(function(){
		$('.dainSubContent').load('../uorderSend/uOrderList.jsp .dndud_content');
		return false;
	});

	


});

//좋아하는 작가 - 정아 
var slideIndex = 0;
showSlides(slideIndex);

function plusSlides(n) {
  var slides1 = document.getElementById("jeonga-imageSlides1");
  slides1.style.display="none";
  showSlides(slideIndex += n);
  
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("jeonga-imageSlides");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }

  slides[slideIndex-1].style.display = "flex";
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

.dainTitle{
	padding: 22px 24px;
	background-color: #555555;
	color: #fff;
	font-size: 21px;
	text-align: left;
}

.daintd{
	padding: 24px;
	border: 1px solid #d9d9d9;
	width: 25%;
}
.dainTable{
	border-collapse: collapse;
	width: 100%;
	margin: 0px;
	padding: 0px;
}

.dainLabel{
	font-size: 16px;
	font-weight: bold;
}

.dainValue{
	font-size: 24px;
    color: #1F76BB;
    display: block;
}

.dainSubTitle{
	border-bottom: 1px solid black;
	display: flex;
	justify-content: space-between;
	padding: 40px 0px 8px;
	margin-bottom: 24px;
}

.dainMoreBtn{
	padding: 0px 24px;
	border: 1px solid #d9d9d9;
	background-color: #fff;
	color: black;
}

.dainHelp{
 	z-index: 99; 
 	position: absolute; 
 	padding: 8px 10px;
	border: 1px solid #d9d9d9;
	background-color: #fff;
	font-size: 12px;
	margin-left: 5px;
	border-radius: 5px;
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
}

:focus{
outline: none;
}

/* a:link, a:visited, a:hover, a:active{
   text-decoration: none;
   color: black;
} */

/*------------------다인CSS끝---------------------------*/

/*주문내역CSS - 우영*/


.dndud_txt_f1{
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.dndud_content_top{
	width:100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.dndud_content_top_title{
	display: flex;
	justify-content:left;
}

.dndud_content_top_date{
	display: flex;
	justify-content:right;
}

.dndud_content_tab_group{
	width:100%;
	height: 65px;
	margin-top: 7%;
	display: flex;
	flex-direction: row;
	color: #acacac;
}

.dndud_content_tab_group .onTab{
	position: relative;
	width:33.33333%;
	display: flex;
	justify-content:center;
	align-items: center;
	color: black;
	font-weight:bold;
	border: 2px solid #333;
	border-bottom:0;
}

.dndud_content_tab_group a{
	width:33.33333%;
	display: flex;
	justify-content:center;
	align-items: center;
	background-color:#f5f5f5;
	border: 1px solid #d9d9d9;
	border-bottom-width: 2px;
    border-bottom-color: #333;
}


.dndud_noContent{
	margin-top: 7%;
	margin-bottom: 2%;
	display:flex;
	justify-content: center;
	flex-direction: column;
	align-items: center;
}

.dndud_noContent .no_order_icon{
	width:100%;
	height:120px;
	display:flex;
	justify-content: center;
}

.dndud_noContent a{
    display: flex;
    justify-content: center;
    height: 48px;
    margin: 36px auto 0;
    align-items: center;
    border: 1px solid #1f76bb;
    padding: 0 24px;
    color: #1f76bb;
    cursor:pointer;
}

.dndud_noContent a:hover{
	background-color: #1f76bb;
	color:white;
}


.dndud_allContents{
	width: 100%;
	height: auto;
	display: flex;
	flex-direction: column;
	margin-top: 3%;
}

.dndud_semicontent{
	width: 100%;
	height: auto;
	display: flex;
	flex-direction: column;
	border: 1px solid #d9d9d9;
	background-color:#f5f5f5;
	margin-bottom: 3%;
}

.dndud_semicontent_top{
	font-size: 15px;
	width: 98%;
	height: 40px;
	display: flex;
	justify-content: space-between;
	padding: 1%;
}

.dndud_semicontent_top .date{
	display: flex;
	align-items: center;
}

.dndud_semicontent_top .price{
	font-weight: bold;
	display: flex;
	align-items: center;
	text-decoration: none;
}

.dndud_semicontent_top .price:hover{
	background-color:white;
}

.dndud_semicontent_main{
	font-size: 15px;
	width: 100%;
	display: flex;
	flex-direction: row;
	background-color:white;
	border: 1px solid #d9d9d9;
}

.dndud_semicontent_main .item{
    width: 70%;
    max-width: 70%;
    display: flex;
    flex-direction: column;
}

.dndud_semicontent_main .item .writeAboutItem{
	display:flex;
	width:100%;
	flex-direction: column;
	max-width: 100%;
	
}

.itemTitle{
	display:flex;
	flex-direction: row;
	word-break: break-all;
	align-items: center;
}

.itemTitle p{
	font-weight: bold; 
	margin-bottom:0;
}

.aboutItem{
	margin-bottom:2%;
	display:flex;
	flex-direction: row;
	justify-content: space-between;
}

.aboutItem p{
	font-size:13px;
	margin-bottom:0;
	word-break: break-all;
	padding-right:2%;
	width:80%;
}

.aboutItem span{
	width:6%;
	font-size:13px;
	margin-bottom:0;
	padding-right:2%;
	margin-top: 2.5%;
}

.dndud_semicontent_main .aboutW{
    width: 15%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    border-left: 1px solid #d9d9d9;
    align-items: center;
    font-size:13px;
}

.dndud_semicontent_main .decision{
	width: 15%;
    display: flex;
    justify-content: center;
    flex-direction: column;
    border-left: 1px solid #d9d9d9;
    align-items: center;
    font-size:13px;
}

#dndud_questionIcon{
	font-size:10px;
	cursor: pointer;
}


input[type="button"]{
	width:80%;
	background-color:white;
	border: 1px solid #d9d9d9;
	padding:5%;
	margin-top:5%;
	cursor: pointer;
}

input[type="button"]:focus{
	outline:none;
}

.orderStat{
	padding:0 1%;
	font-size : 10px;
	color: #2dabb3;
	border: 1px solid #2dabb3;
	border-radius: 5px / 5px;
	margin-left:2%;
	margin-top:2%;
}

#purchaseReview{
	background-color: #1f76bb;
	color: white;
}

#iconMemo{
	font-size:12px;
	text-align:center;
	width:200px;
	height:36px;
	display:none;
	position: absolute;
	z-index:1;
	border: 1px solid gray;
	background-color: white;
}



/*좋아하는 작가 CSS - 정아*/
.uLikeWriterWrap {
	width: 80%;
	margin-left: 2%;
}
/*작가 프로필*/
.jeonga-artist-list{
	padding:0px;
}


.jeonga-wprofile-image{
	width:80px;
	height:80px;
	border-radius:70%;
	overflow:hidden;
	position:relative;
}

.jeonga-wprofileImage{
	width:100%;
	height:100%;
	object-fit:cover;
}

.jeonga-wprofile{
	display:flex;
}
.jeonga-wprofile-split{
	padding:2%;
}

.jeonga-wprofile-content{
	width:200px;
}
.jeonga-wprofile-text{
	padding:2%;
	font-size:14px;
}
.jeonga-wprofile-buttons-top{
	display:flex;
}

#jeonga-wprofile-button-add{
	background-color:#DF3A01;
	border:1px solid #DF3A01;
	color:white;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:78px;
	margin:3px;
}

#jeonga-wprofile-writer-home{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:78px;
	margin:3px;
}

#jeonga-wprofile-message{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:181px;
	margin-top:3px;
	margin-left:3px;
	

}

/*이미지 슬라이더 CSS*/
.jeonga-imageSlides-img{
	width:168.25px;
	height:168.25px;
	margin:0;
	padding:0;
}

.joenga-wprofile-imageslider {
	padding:2%;
 	position: relative;
 	width:505px;
 	height:168.25px;
 	
}
.jeonga-imageSlides-buttons{
	width:505px;
	height:168.25px;
	/*visibility:hidden;*/
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}
/* Hide the images by default*/ 
.jeonga-imageSlides {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:505px;
	height:168.25px;
	padding:0;
	/*display:none;*/
 
}

#jeonga-imageSlides1 {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:505px;
	height:168.25px;

 
}


/* Next & previous buttons */
.jeonga-imageSlides-prev {
  right:10;
  cursor: pointer;
  width: auto;
  padding: 70px 12px;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
  opacity: 0;
  
}
.jeonga-imageSlides-next{
	right:0;
 	cursor: pointer;
 	width: auto;
  	padding:70px 12px;
 	font-weight: bold;
  	font-size: 20px;
  	border-radius: 0 3px 3px 0;
  	user-select: none;
 	-webkit-user-select: none;
	opacity: 0;
}
/* On hover, add a black background color with a little bit see-through */
.jeonga-imageSlides-prev:hover, .jeonga-imageSlides-next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
 opacity: 100;
}


/*알람 CSS - 원희*/
#wonAlarmButton{
	border: #D8D8D8;
	background-color: white;
	cursor: pointer;
}

#wonAlarmButton:hover{

	background-color: #81BEF7;
}

/* ::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-track {
  background-color: transparent;
}
::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: gray;
}
::-webkit-scrollbar-button {
  width: 0;
  height: 0;
} */

/*메시지 CSS - 원희*/


#wonImg{
	padding: 15%;
	width: 50%;
	height: 50%;
	align-content: center;
}
#wonHeaderDiv2{
	height: 100%;
	width: 100%;
}

#wonContentImg{
	height:90%;
	width: 30%;
}

#divButton{
	cursor:pointer;
}
#wonMessagebutton{
	border: none;
	cursor: pointer;
	background-color: white;
}

#wonMessagebutton:hover{

	background-color: #81BEF7;
}

.like_art_img{
	display:flex;
    justify-content: flex-end;
	width: 100%; 
	max-height:330px;
	min-height: 196px;
	background-repeat: round;
	background-size: auto 100%;
    font-size: 20px;
}

.img_star{
	color:black;
	padding:3%;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: white;
}

.img{
	cursor:pointer;
    display: flex;
    justify-content: center;
    padding: 15px;
}


.imsiDiv{
	display:flex;
	flex-direction: row;
	width:100%;
}

.purchaseReview{
	background-color: #1f76bb;
	color: white;
}

.purchaseReview_before{
	background-color:white;
	color: #1f76bb;
}

.purchaseReview_before:hover{
	background-color:#1f76bb;
	color:white;
}

.purchaseReview_done{
	background-color: #f1f1f1 !important;
	color:black;
	cursor: default !important;
}
.decision_Div{
    height: 50%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 100%;
}
.delivery{
    background-color: white;
    border: 1px solid #d9d9d9 !important;
    padding: 5%;
    margin-top: 5%;
    cursor: pointer;
    color:black;
    text-decoration: none !important;
}
</style>
</head>
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../include/uHeader.jsp"  %>
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
	
	<section class="dainSection">

	<!-- MY정보테이블 -->
	<table class="dainTable">
		<tr><td colspan="4" class="dainTitle">MY정보</td></tr>
		<tr>
			<td class="daintd">
				<strong class="dainLabel" >적립금</strong>
				<!-- 숫자 클릭시 해당 페이지로 이동해야함 -->
				<a class="dainValue" id="umhPoint" href="<c:url value='/user/reserves.do'/> " style="color: #1F76BB;"><fmt:formatNumber value="${usablepoint}" pattern="#,###"/>P</a>
			</td>
			<td class="daintd">
				<strong class="dainLabel">할인 쿠폰 수</strong>
				<a class="dainValue" id="umhCouponCount" href="<c:url value='/user/coupon/list.do'/> " style="color: #1F76BB;">${coupon }</a>
			</td>
			<td class="daintd">
				<strong class="dainLabel">작가 발송 완료</strong>
				<i id="dainHelpIcon1" class="fa fa-question-circle-o" style="color: #d9d9d9"></i>
				<span id="dainHelp1" class="dainHelp" style="display: none;">최근 1개월 기준</span>
				<a class="dainValue" id="umhSendComplete" href="<c:url value='/user/myInfo/orderList.do'/>" style="color: #1F76BB;">${sendComplete }</a>
			</td>
			<td class="daintd">
				<strong class="dainLabel">취소/환불 완료</strong>
				<i id="dainHelpIcon2" class="fa fa-question-circle-o" style="color: #d9d9d9"></i>
				<span id="dainHelp2" class="dainHelp" style="display: none;">최근 1개월 기준</span>
				<a class="dainValue" id="umhRefundComplete" href="<c:url value='/user/myInfo/refundList.do'/> " style="color: #1F76BB;">${refundComplete }</a>
			</td>
		</tr>
	</table>
	
	<!-- 최근 주문 내역 -->
	<div class="dainSubTitle">
		<h4 style="margin:0px;">최근 주문내역</h4>
		<a href="<c:url value='/user/myInfo/orderList.do'/> " style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
	</div>
	<div class="dainSubContent" style="background-color: white;">
	 <!-- 여기다가 주문내역 가져오기 -->
	 
	 
	<!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->	 
 		<div class="dndud_content">
			<div class="dndud_content_tab_group">
				<span class="onTab">작품<i id="dndud_questionIcon" class="far fa-question-circle"></i></span>
				<a>온라인 클래스</a>
				<a>오프라인 클래스</a>
			</div>
			
			<!-- 작품 없을경우
			
			 -->
			 
			<!-- 작품 있을경우 -->
			<div class="dndud_allContents">
				<c:set value="${orderListOne }" var="i" />
				<c:set var="order" value="${i.orderTable }"/>
				<c:set var="writerList" value="${i.buyWriter }" />
				<c:set var="artList" value="${i.buyArt }" />
				<c:set var="optionList" value="${i.buyOption }" />
				<c:if test="${empty i }">
					<div class="dndud_noContent">
						<span class="no_order_icon"><img style="width:120px; height:120px" src="<c:url value='/resources/img/noFile.png'/>" ></span>
						<p style="margin-bottom:4%; font-size: 16px; color: #666">주문하신 적이 없네요. (이럴수가!)</p>
						<a>작품 구경하러 가기</a>
					</div>
				</c:if>
				
				<c:if test="${not empty i }">
					<c:forEach items="${writerList }" var="writer">
				
						<div class="dndud_semicontent_main">
							<div class="item">
							
								<c:forEach items="${artList }" var="art">
									<c:if test="${art.buyWriterCodeSeq eq writer.buyWriterCodeSeq }">
										<div class="imsiDiv">
											<div class="img" id="${art.artCodeSeq }" onclick="artCode(this)">
												<img src="<c:url value='/upload/${art.artPhoto }'/>" style="width:75px; height:75px">
											</div>
											<div class="writeAboutItem">
												<div class="itemTitle">
													<p>${art.artName }</p>
													<p class="orderStat">${writer.buyWriterOrderStatus }</p>
												</div>
												
												<c:forEach items="${optionList }" var="option">
													<c:if test="${option.buyArtCodeSeq eq art.buyArtCodeSeq }">
														<div class="aboutItem" id="${option.artOptionSeqList }">
															<p>${option.artOptionName }</p>
															<span>${option.artOptionAmount }개</span>
														</div>
													</c:if>
												</c:forEach>
												
											</div>
										</div>
									</c:if>
								</c:forEach>
								
								
							</div>
							<div class="aboutW">
								<c:if test="${not empty writer.writerBrandName }">
									<a>${writer.writerBrandName }</a>
								</c:if>
								<c:if test="${empty writer.writerBrandName }">
									<a>${writer.writerName }</a>
								</c:if>
								<input id="${writer.writerCodeSeq }" class="go_to_writer_message" type="button" value="메시지로 문의">
							</div>
							<div class="decision">
											
								<c:choose>
									<c:when test="${writer.buyWriterOrderStatus eq '결제 완료' }">
										<input id="${writer.buyWriterCodeSeq }" class="go_to_refund" type="button" value="환불요청">
									</c:when>
									<c:when test="${writer.buyWriterOrderStatus eq '배송 완료' }">
										<c:choose>
											<c:when test="${writer.buyDeliveryName eq 'CJ대한 통운' }">
												<c:set var="delivery_name" value="kr.cjlogistics" />
											</c:when>
											<c:when test="${writer.buyDeliveryName eq '우체국 택배' }">
												<c:set var="delivery_name" value="kr.epost" />
											</c:when>
											<c:when test="${writer.buyDeliveryName eq '한진 택배' }">
												<c:set var="delivery_name" value="kr.hanjin" />
											</c:when>
											<c:when test="${writer.buyDeliveryName eq '롯데 택배' }">
												<c:set var="delivery_name" value="kr.lotte" />
											</c:when>
											<c:when test="${writer.buyDeliveryName eq '로젠 택배' }">
												<c:set var="delivery_name" value="kr.logen" />
											</c:when>
										</c:choose>
										<c:forEach items="${artList }" var="art2">
											<c:if test="${art2.buyWriterCodeSeq eq writer.buyWriterCodeSeq }">
												<c:choose>
													<c:when test="${art2.buyArtReviewStatus eq 'N' }">
														<div class="decision_Div">
															<input class="purchaseReview_before" type="button" value="구매후기 작성">
															<a class="delivery" href="https://tracker.delivery/#/${delivery_name }/${writer.buyDeliveryNum }" target="_blank">발송 정보 조회</a>
														</div>
													</c:when>
													<c:otherwise>
														<c:if test="${art2.buyArtReviewUpdate eq 'N' }">
															<div class="decision_Div">
																<input class="purchaseReview" type="button" value="구매후기 수정">
																<a class="delivery" href="https://tracker.delivery/#/${delivery_name }/${writer.buyDeliveryNum }" target="_blank">발송 정보 조회</a>
															</div>
														</c:if>
														<c:if test="${art2.buyArtReviewUpdate ne 'N' }">
															<div class="decision_Div">
																<input class="purchaseReview_done" type="button" value="후기 작성 완료">
																<a class="delivery" href="https://tracker.delivery/#/${delivery_name }/${writer.buyDeliveryNum }" target="_blank">발송 정보 조회</a>
															</div>
														</c:if>
													</c:otherwise>
												</c:choose>
											</c:if>
										</c:forEach>
									</c:when>
									<c:when test="${writer.buyWriterOrderStatus eq '환불 대기' }">
										<input class="purchaseReview_done" type="button" value="환불 요청 완료">
									</c:when>
									<c:when test="${writer.buyWriterOrderStatus eq '환불 완료' }">
										<input class="purchaseReview_done" type="button" value="환불 완료">
									</c:when>
								</c:choose>
								
							</div>
						</div>
					
					</c:forEach>
				</c:if>
				
			</div>
			
		</div>
		
			  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->	
	 
	 
	 
	 
	 
	 
	 
	</div>
	<c:if test="${not empty i }">
		<div style="margin-top:20px; display: flex; justify-content: center;">
			<a href="<c:url value='/user/myInfo/orderList.do'/> " style="padding: 12px 30px; border: 1px solid #d9d9d9;
				background-color: #fff; color: black; font-size: 13px;"><strong>최근 주문내역 더보기</strong></a>
		</div>
	</c:if>
	
	<!-- 안읽은 메시지&알림 -->
	<%-- <div style="display: flex; justify-content: space-between; ">
		<!-- 안읽은 메시지 -->
		<div style="width: 49%;">
			<div class="dainSubTitle" >
				<h4 style="margin:0px;">안 읽은 메시지</h4>
				<a href="#" style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
			</div>
			<div class="dainSubContent" style="height: 280px; background-color: white;">
			 <!-- 여기다가 안읽은메시지 가져오기 -->
	
	
			  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->	
	  <div style="display: flex; flex-direction: row; height:100%;overflow:scroll;">		 
		 		<div id="wonHeaderDiv2" >
				<div id="wonAccountView">
				<c:forEach begin="1" end="6">
					<button id="wonMessagebutton" style="margin:3%; display: flex; flex-direction: row; align-items: center; border-color: white;"> 
						<img id="wonContentImg" src="<c:url value='/resources/img/test.png'/>">
						<div style="margin: 2%; font-size: 150%;">아이디</div>
					</button>
				</c:forEach>
				</div>
				</div>
		</div>
			  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->			 
			 
			 
		 
			</div>
		</div>
		
		<!-- 알림 -->
		<div style="width: 49%; ">
			<div class="dainSubTitle">
				<h4 style="margin:0px;">알림</h4>
				<a href="#" style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
			</div>
			<div class="dainSubContent" style="height: 280px; background-color: white;">
			 <!-- 여기다가 알림 가져오기 -->
			 
			 
		  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->		 
			 
		 	<div style="display: flex; flex-direction: row; height:100%;">
		 		<img src="<c:url value='/resources/img/page_ready.png' />"/> 
				<div style="width:100%;">
				<!-- 내용물 -->
				<c:forEach begin="1" end="6">
					<button id="wonAlarmButton" style="width: 100%;">
						<div style="display: flex; flex-direction: row;">
							<div style="width: 10%;">
								<img src="<c:url value='/resources/img/test.png'/>" style="width: 100%;">
							</div>
							<div style="width:80%;">
								<div style="display: flex; flex-direction: row; width: 100%;">
									<span style="border:1px solid red; border-radius: 5px; font-size: 80%; color: red;">이벤트/공지</span>
									<span style="font-weight: bold; margin-left: 1%;">판매자 계정</span>
								</div>
								<div style="float: left; margin: 1%;">
									<span>알림 내용 입니다.</span>
								</div>
							</div>
							<div>
								<span style="font-size: 70%; color: #D8D8D8;">등록날짜</span>
							</div>
						</div>
					</button>
				</c:forEach>
				<!-- 내용물 -->
				</div>
			</div>
			 
		  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
	  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->		 
		 
			</div>			
		</div>
	</div> --%>
	
	<!-- 즐겨찾는 작품 -->
	<div class="dainSubTitle">
		<h4 style="margin:0px;">즐겨찾는(★)작품</h4>
		<a href="/bomulsum/user/wishlist/bookmarkWork.do" style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
	</div>
	<div class="dainSubContent" style="height: 300px;display:flex;flex-direction:row;height: fit-content;">
		<!-- 여기다가 즐겨찾는작품 가져오기 -->
		<c:forEach items="${likeList }" var="list" begin="0" end="3">
			<div id="${list.artCode }" onclick="artCode(this)" class="wonBookContent" style="cursor:pointer;border: 1px solid #d9d9d9;background: #f8f9fb;width: 23%; text-decoration: none; margin: 1%;border-radius: 4px;">
				<!-- 내용물 -->
				<c:set var="img" value="${fn:split(list.artImg, ',') }" />
				<c:set var="loop_flag" value="false" />
				<div class="like_art_img" style="background-image: url('/bomulsum/upload/${img[0]}');">
				
					<c:forEach items="${wishArt }" var="wish">
						<c:if test="${not loop_flag }">
							<c:if test="${wish eq list.artCode }">
								<c:set var="loop_flag" value="true" />
							</c:if>
						</c:if>
					</c:forEach>
					
					<c:if test="${loop_flag }">
						<i class="fa fa-star fs img_star" style="color:#d64640"></i>
					</c:if>
					<c:if test="${not loop_flag }">
						<i class="fa fa-star fs img_star"></i>
					</c:if>
				</div>
				
				<div style="display:flex; flex-direction: column;padding: 5%;">
					<c:if test="${empty list.writerBrandName }">
						<span style="color: #ABABAB; font-size: 80%;">${list.writerName }</span>
					</c:if>
					<c:if test="${not empty list.writerBrandName }">
						<span style="color: #ABABAB; font-size: 80%;">${list.writerBrandName }</span>
					</c:if>
					<span style="display: block; text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">${list.artName }</span>
				</div>
			</div>
		</c:forEach>
		
	</div>
	
	
	<!-- 좋아하는 작가 -->
	<div class="dainSubTitle">
		<h4 style="margin:0px;">좋아하는(♥)작가</h4>
		<a href="/bomulsum/user/wishlist/likeWriter.do" style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
	</div>
	<c:if test="${not empty writerVO }">
		<div class="dainSubContent" style="height: 272px; margin: 24px 0px; background-color: white;">
		 <!-- 여기다가 좋아하는작가 가져오기 -->
		 
		 
		 
		  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		  <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
			<!-- 좋아하는 작가 목록 -->
		
			<ul class="jeonga-artist-list">
				<li class="jeonga-artist-list-item" style="list-style: none;">
					<!-- 작가 프로필  -->
					<div class="jeonga-wprofile  ">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga-wprofile-split">
							<div class="jeonga-wprofile-image">
								<a href="#" target="#" class="jeonga-wrpofile-image-link">
									<img style="width: 100%;" id="jeonga-wprofileImage" 
										src="<c:url value='/upload/${writerVO.writerProfileImg }'/>"/>
								 </a>
							 </div>
						</div>
						<div class="jeonga-wprofile-split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga-wprofile-content">
							<c:if test="${empty writerVO.writerBrandName }">
								<a href="#" class="jeonga-wprofile-title" target="">${writerVO.writerName }</a>
							</c:if>
							<c:if test="${not empty writerVO.writerBrandName }">
								<a href="#" class="jeonga-wprofile-title" target="">${writerVO.writerBrandName }</a>
							</c:if>
							<p class="jeonga-wprofile-text">${writerVO.writerIntro }</p>
							
							<div class="jeonga-wprofile-buttons">
								<div class="jeonga-wprofile-buttons-top">
								<!-- <a href="#" class="btn btn-s btn-white toggle-heart"
									data-name="starred-toolbar" data-starred-type="artist"
									data-init="" data-starred="" target=""
									data-target-id="">--><!-- <em class="txt active">♥︎하는 작가</em> 	</a>-->
								<div id="jeonga-wprofile-button-add">♥︎하는 작가</div>
									<div id="jeonga-wprofile-writer-home">
									<a class="jeonga-wprofile-button" href="/bomulsum/writerhome/${writerVO.writerUrl }.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga-wprofile-message">
									<a href="/bomulsum/user/message.do?writer=${writerVO.writerCodeSeq }" class="jeonga-wprofile-button">메시지 보내기</a>
								</div>
							</div>
							</div>
						</div>
					
					<!-- 이미지 슬라이더 -->
					<c:if test="${not empty imgList }">
						<div class="joenga-wprofile-imageslider">
						 	<div class="jeonga-imageSlides-buttons">
	  						<a class="jeonga-imageSlides-prev" onclick="plusSlides(-1)">❮</a>
	 						<a class="jeonga-imageSlides-next" onclick="plusSlides(1)">❯</a>
							</div>
							
							<c:if test="${not empty firstImg }">
								<!-- 슬라이드 기본 세트 -->
		  						<div id="jeonga-imageSlides1">
									<c:forEach items="${firstImg }" var="mimg">
										<c:if test="${empty mimg }">
											<img class="jeonga-imageSlides-img" src="">
										</c:if>
										<c:if test="${not empty mimg }">
											<img class="jeonga-imageSlides-img" src="<c:url value='/upload/${mimg }'/>">
										</c:if>
			  						</c:forEach>
		  						</div>
								<!-- 슬라이드 한 세트 -->
							 	<div class="jeonga-imageSlides" style="display:none">
		   							<c:forEach items="${firstImg }" var="fimg">
										<c:if test="${empty fimg }">
											<img class="jeonga-imageSlides-img" src="">
										</c:if>
										<c:if test="${not empty fimg }">
											<img class="jeonga-imageSlides-img" src="<c:url value='/upload/${fimg }'/>">
										</c:if>
			  						</c:forEach>
		  						</div>	
	  						</c:if>	
	  						
	  						<c:if test="${not empty secondImg }">
		  						<!-- 슬라이드 한 세트 -->	
		  						<div class="jeonga-imageSlides" style="display:none" >
		  							<c:forEach items="${secondImg }" var="simg">
										<c:if test="${empty simg }">
											<img class="jeonga-imageSlides-img" src="">
										</c:if>
										<c:if test="${not empty simg }">
											<img class="jeonga-imageSlides-img" src="<c:url value='/upload/${simg }'/>">
										</c:if>
									</c:forEach>
		  						</div>
	  						</c:if>
	  						<c:if test="${not empty thirdImg }">
		  						<!-- 슬라이드 한 세트 -->	
		  						<div class="jeonga-imageSlides" style="display:none" >
		  							<c:forEach items="${thirdImg }" var="timg">
										<c:if test="${empty timg }">
											<img class="jeonga-imageSlides-img" src="">
										</c:if>
										<c:if test="${not empty timg }">
											<img class="jeonga-imageSlides-img" src="<c:url value='/upload/${timg }'/>">
										</c:if>
									</c:forEach>
		  						</div>
	  						</c:if>
	  					</div> 
					</c:if>						
					
				</div>
				</li>
			</ul>
		 
		 <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		 <!-- ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★ -->
		 
		</div>
	</c:if>
	
	<!-- 최근 본 작품 -->
	<div class="dainSubTitle">
		<h4 style="margin:0px;">최근 본 작품</h4>
		<a href="/bomulsum/user/wishlist/recently.do" style="font-size: 14px; color: #22a7af;">더보기 <b>></b></a>
	</div>
	<div class="dainSubContent" style="height: 300px;display:flex;flex-direction:row;height: fit-content;">
	 <!-- 여기다가 좋아하는작가 가져오기 -->
	 	<c:forEach items="${recentList }" var="list" begin="0" end="3">
			<div id="${list.artCode }" onclick="artCode(this)" class="wonBookContent" style="cursor:pointer;border: 1px solid #d9d9d9;background: #f8f9fb;width: 23%; text-decoration: none; margin: 1%;border-radius: 4px;">
				<!-- 내용물 -->
				<c:set var="img" value="${fn:split(list.artImg, ',') }" />
				<c:set var="loop_flag" value="false" />
				<div class="like_art_img" style="background-image: url('/bomulsum/upload/${img[0]}');">
				
					<c:forEach items="${wishArt }" var="wish">
						<c:if test="${not loop_flag }">
							<c:if test="${wish eq list.artCode }">
								<c:set var="loop_flag" value="true" />
							</c:if>
						</c:if>
					</c:forEach>
					
					<c:if test="${loop_flag }">
						<i class="fa fa-star fs img_star" style="color:red"></i>
					</c:if>
					<c:if test="${not loop_flag }">
						<i class="fa fa-star fs img_star"></i>
					</c:if>
				</div>
				
				<div style="display:flex; flex-direction: column;padding: 5%;">
					<c:if test="${empty list.writerBrandName }">
						<span style="color: #ABABAB; font-size: 80%;">${list.writerName }</span>
					</c:if>
					<c:if test="${not empty list.writerBrandName }">
						<span style="color: #ABABAB; font-size: 80%;">${list.writerBrandName }</span>
					</c:if>
					<span style="display: block; text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">${list.artName }</span>
				</div>
			</div>
		</c:forEach>
	 
	 
	 
	 
	 
	</div>

	
	</section>
	
	<!-- end content -->
	</div>
	<!-- 푸터  -->
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}

$(function(){
	$('.fs').on('click', function(e){
		e.stopPropagation();
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		
		var artCode = $(this).parent().parent().attr('id');
		var option = '좋아하는작품';
		
		
		var clickIcon = $(this);
		console.log(clickIcon);
		var tORf;
		
	 	if(clickIcon.css("color") == "rgb(0, 0, 0)"){
			clickIcon.css("color", "#d64640");
			tORf = true;
		}else{
			clickIcon.css("color", "black");
			tORf = false;
		}
		
		$.ajax({
			url:'/bomulsum/category/wish.do',
			data:{
				'member':memberCode,
				'option':option,
				'optionCode':artCode,
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
		}else{
			alert('해제되었습니다.');
		}
		location.reload();
	});
	
	$(".go_to_writer_message").on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/message.do?writer="+$(this).attr('id');
		}
	});
	
	$('.go_to_refund').on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/myInfo/refund/request.do?buyWriterCode="+$(this).attr('id');
		}
	});
});
</script>
</html>