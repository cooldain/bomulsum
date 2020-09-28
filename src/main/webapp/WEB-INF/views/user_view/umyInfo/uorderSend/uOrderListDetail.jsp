<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 주문 상세보기</title>
<style>
.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px;
	padding-bottom: 64px;
	display:flex;
}

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

.dndud_content{
	width:80%;
	margin-left: 2%;
}

.dndud_txt_f1{
	font-size: 24px;
	font-weight: bold;
	color: #333;
}

.dndud_txt_f2{
	font-size: 17px;
	font-weight: bold;
	color: #333;
}

.dndud_content_top{
	width:100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 4%;
}

.dndud_content_top_title{
	display: flex;
	justify-content:left;
}

.dndud_content_table{
	width: 100%;
	display: flex;
	justify-content:center;
	border: 1px solid #d9d9d9;
	flex-direction: column;
	margin-bottom: 4%;
}

.dndud_content_table_top{
	background-color: #f5f5f5;
	display: flex;
	flex-direction: row;
	font-size: 13px;
}

.dndud_content_table_top span:nth-child(1){
	display: flex;
	justify-content: center;
	border-right: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	height: 40px;
	width: 70%;
	align-items: center;
}

.dndud_content_table_top span:nth-child(2){
	display: flex;
	justify-content: center;
	border-right: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	height: 40px;
	width: 15%;
	align-items: center;
}

.dndud_content_table_top span:nth-child(3){
	display: flex;
	justify-content: center;
	border-bottom: 1px solid #d9d9d9;
	height: 40px;
	width: 15%;
	align-items: center;
}

.dndud_content_table .dndud_semicontent_main:nth-last-child(1){
	border:0;
}

.dndud_semicontent_main{
	font-size: 15px;
	width: 100%;
	display: flex;
	flex-direction: row;
	background-color:white;
    border-bottom: 1px solid #d9d9d9;
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
	/* margin-bottom:2%; */
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

input[type="button"]{
	width:80%;
	background-color:white;
	border: 1px solid #d9d9d9;
	padding:5%;
	margin-top:5%;
	cursor: pointer;
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

.clientRequest{
	height:70px;
	padding-bottom: 2%;
	padding-top: 2%;
}

.clientRequestValue{
    font-size: 13px;
    width: 95%;
    height: 90%;
    resize: none;
    font-weight: bold;
}

.clientRequestValue:focus{
	outline:none;
}

.dndud_about_send{
	font-size:13px;
	width:100%;
	display:flex;
	flex-direction: column;
	margin-bottom:4%;
}

.dndud_about_send_row{
	width:100%;
	display:flex;
	flex-direction: row;
	border-bottom: 1px solid #d9d9d9;
	height: 45px;
}

.dndud_about_send_row:nth-child(1){
	border-top: 1px solid #d9d9d9;
}

.dndud_about_send_row_first{
	background-color:#f5f5f5;
	width:15%;
	color: #6E6E6E;
	font-weight: bold;
	padding-left: 2%;
	padding-top: 1.5%;
}

.dndud_about_send_row_second{
	width:85%;
	color: black;
	padding-left: 2%;
	padding-top: 1.5%;
}

.semi_title{
	margin-bottom:2% !important;
}

.dndud_about_pay{
	width:100%;
	height:450px;
	display:flex;
	flex-direction: row;
	border: 1px solid gray;
	font-size: 13px;
}

.dndud_about_pay_child{
	width:50%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

.dndud_about_pay_foot{
	width: 100%;
	height: 15%;
	border-top: 1px solid gray;
	display:flex;
	justify-content: space-between;
}

.dndud_about_pay_foot span{
	margin:3%;
	display:flex;
	align-items: center;
}

.dndud_about_pay_foot div{
	margin:3%;
	display:flex;
	align-items:center;
	color:#1f76bb;
	font-size:25px;
	font-weight: bold;
}

.dndud_about_pay_foot span:nth-child(2){
	font-weight: bold;
	font-size: 15px;
}

.dndud_about_pay_child:nth-child(1){
	border-right: 1px solid gray;
}

.dndud_about_pay_info{
    width: 100%;
    height: 85%;
    overflow-y: auto;
    border-right: 1px solid gray;
    overflow-x: hidden;
}

.dndud_about_pay_info_detail{
	width: 100%;
	height: 55%;
	background-color:#f5f5f5;
}

.dndud_info_detail{
	display:flex;
	flex-direction: column;
	margin:3%;
	margin-top:4%;
}

.detail_row{
	display:flex;
	flex-direction: row;
	justify-content: space-between;
	margin-bottom: 3%;
}

.detail_row:nth-last-child(1){
	margin-bottom:0;
}

.dndud_about_pay_saved{
	width:100%;
	height: 30%;
	border-top: 1px solid gray;
}

.pay_info_who{
	margin-left:3%;
	margin-top:4%;
}

.pay_info_content{
	margin:3%;
	padding:3%;
	display:flex;
	flex-direction:column;
	background-color:#f5f5f5;
}

.pay_info_content  .pay_row{
	display:flex;
	justify-content: space-between;
	margin-bottom:2%;
}
.pay_info_content .pay_row:nth-last-child(1){
	margin-bottom:0;
}

.money_saved{
	margin:3%;
	display:flex;
	flex-direction:column;
}

.money_saved_top{
	font-weight:bold;
	align-items: center;
	display:flex;
	justify-content: space-between;
	margin-bottom:3%;
}

.money_saved_top div:nth-last-child(1){
	font-size:20px;
	color:#2dabb3;
}

.money_saved_row{
	display:flex;
	justify-content: space-between;
	margin-bottom:1%;
}

.money_saved_row a:nth-child(1){
	color:gray;
}

.money_saved_row a:nth-child(2){
	font-weight: bold;
	
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

.dndud_about_pay_info::-webkit-scrollbar {
  width: 6px;
}
.dndud_about_pay_info::-webkit-scrollbar-track {
  background-color: transparent;
}
.dndud_about_pay_info::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: gray;
}
.dndud_about_pay_info::-webkit-scrollbar-button {
  width: 0;
  height: 0;
}

.go_to_refund:focus{
	outline:none;
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
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
		<div class="dndud_content">
		
			<div class="dndud_content_top">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f1">주문 상세보기</a>
				</div>
			</div>
			
			<c:set var="i" value="${data }" />
			<c:set var="order" value="${i.orderTable }"/>
			<c:set var="writerList" value="${i.buyWriter }" />
			<c:set var="artList" value="${i.buyArt }" />
			<c:set var="optionList" value="${i.buyOption }" />
		
			<div class="dndud_content_table">
				<div class="dndud_content_table_top">
					<span style="width:70%;">작품</span>
					<span style="width:15%;">판매작가</span>
					<span style="width:15%;"></span>
				</div>
				
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
											
											<div class="clientRequest">
												<textarea class="clientRequestValue" readonly>${art.buyArtRequest }</textarea>
											</div>
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
				
			</div>
	
			<div class="dndud_content_top semi_title">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f2">배송 정보</a>
				</div>
			</div>
			
			<div class="dndud_about_send">
				<div class="dndud_about_send_row">
					<div class="dndud_about_send_row_first">
						<span>받는분</span>
					</div>
					<div class="dndud_about_send_row_second">
						<span id="#" >${order.orderReceiver }</span>
					</div>
				</div>
				<div class="dndud_about_send_row">
					<div class="dndud_about_send_row_first">
						<span>전화</span>
					</div>
					<div class="dndud_about_send_row_second">
						<span id="#" >${order.orderPhoneNum }</span>
					</div>
				</div>
				<!-- <div class="dndud_about_send_row">
					<div class="dndud_about_send_row_first">
						<span>안심번호</span>
					</div>
					<div class="dndud_about_send_row_second">
						<span id="#" >050-4924-9885</span>
					</div>
				</div> -->
				<div class="dndud_about_send_row">
					<div class="dndud_about_send_row_first">
						<span>주소</span>
					</div>
					<div class="dndud_about_send_row_second">
						<span id="#" >${order.orderZipcode } ${order.orderAddressFirst } ${order.orderAddressSecond }</span>
					</div>
				</div>
			</div>
			
			
			<div class="dndud_content_top semi_title">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f2">결제 정보</a>
				</div>
			</div>
			
			<div class="dndud_about_pay">
				<div class="dndud_about_pay_child">
					<div class="dndud_about_pay_info">
						
						<c:forEach items="${writerList }" var="writer2">
							<div class="pay_info_who">
								<c:if test="${not empty writer2.writerBrandName }">
									<a>${writer2.writerBrandName }</a>
								</c:if>
								<c:if test="${empty writer2.writerBrandName }">
									<a>${writer2.writerName }</a>
								</c:if>
							</div>
							<div class="pay_info_content">
								<c:forEach items="${artList }" var="art3">
									<c:set value="0" var="art_price" />
									<c:forEach items="${optionList }" var="option2">
										<c:if test="${art3.buyArtCodeSeq eq option2.buyArtCodeSeq }">
											<c:set var="art_price" value="${art_price + option2.artPrice }" />
										</c:if>
									</c:forEach>
									<c:if test="${art3.buyWriterCodeSeq eq writer2.buyWriterCodeSeq }">
										<div class="pay_row">
											<a>${art3.artName }</a>
											<div>
												<a class="semi_art_price"><fmt:formatNumber value="${art_price }" pattern="#,###"/></a><a>원</a>
											</div>
										</div>
									</c:if>
								</c:forEach>
								<div class="pay_row">
									<a>배송비</a>
									<div>
										<a class="semi_send_price"><fmt:formatNumber value="${writer2.buyWriterSendPrice }" pattern="#,###"/></a><a>원</a>
									</div>
								</div>
								<div class="pay_row">
									<a>제주 / 도서산간 추가비용</a>
									<div>
										<a class="semi_send_plus_price"><fmt:formatNumber value="${writer2.buyWriterPlusSendPrice }" pattern="#,###"/></a><a>원</a>
									</div>
								</div>
							</div>
						</c:forEach>
						
					</div>
					<div class="dndud_about_pay_foot">
						<span>결제방법</span>
						<span>카드결제</span>
					</div>
				</div>
				<div class="dndud_about_pay_child">
					<div class="dndud_about_pay_info_detail">
						<div class="dndud_info_detail">
							<div class="detail_row">
								<a>작품금액</a>
								<div>
									<a id="sum_price">1,500</a><a>원</a>
								</div>
							</div>
							<div class="detail_row">
								<a>배송비</a>
								<div>
									<a id="sum_send_price">0</a><a>원</a>
								</div>
							</div>
							<div class="detail_row">
								<a>제주 / 도서산간 추가비용</a>
								<div>
									<a id="sum_send_plus_price">0</a><a>원</a>
								</div>
							</div>
							<div class="detail_row">
								<a>쿠폰 할인</a>
								<div>
									<c:if test="${empty coupon }">
										<a id="sum_coupon">0</a><a>원</a>	
									</c:if>
									<c:if test="${not empty coupon }">
										<a><fmt:formatNumber value="${coupon }" pattern="#,###"/></a><a>원</a>
									</c:if>
								</div>
							</div>
							<div class="detail_row">
								<a>사용 적립금</a>
								<div>
									<a id="sum_point"><fmt:formatNumber value="${order.orderPointPrice }" pattern="#,###"/></a><a>원</a>
								</div>
							</div>
						</div>
					</div>
					<div class="dndud_about_pay_saved">
						<div class="money_saved">
							<div class="money_saved_top">
								<a>적립금 적립</a>
								<div>
									<a id="save_point"><fmt:formatNumber value="${point }" pattern="#,###"/></a><a>P</a>
								</div>
							</div>
							<div class="money_saved_row">
								<a>적립기준</a>
								<a>결제 완료시 적립 예정 상태로 바로 적립</a>
							</div>
							<div class="money_saved_row">
								<a>가용시점</a>
								<a>작품 발송일로부터 7일 후 적립금 사용 가능</a>
							</div>
							<div class="money_saved_row">
								<a>유효기간</a>
								<a>적립일로부터 6개월</a>								
							</div>
						</div>
					</div>
					<div class="dndud_about_pay_foot">
						<span>총 결제 금액</span>
						<div><a id="total_price">1,500</a>원</div>
					</div>
				</div>
			</div>
		
		</div>
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
//입력한 문자열 전달
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}
  
//콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

//콤마풀기
function uncomma(str) {
    str = String(str);
    return Number(str.replace(/[^\d]+/g, ''));
}
function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}


$(function(){
	$(".go_to_writer_message").on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/message.do?writer="+$(this).attr('id');
		}
	});
//	sum_price/sum_send_price/sum_send_plus_price
//	semi_art_price/semi_send_price/semi_send_plus_price
	var price = 0;
	$(".semi_art_price").each(function(){
		price += uncomma($(this).text());
	});

	var send = 0;
	$('.semi_send_price').each(function(){
		send += uncomma($(this).text());
	});
	
	var send_plus = 0;
	$(".semi_send_plus_price").each(function(){
		send_plus += uncomma($(this).text());
	});
	
	$('#sum_price').text(comma(price));
	$('#sum_send_price').text(comma(send));
	$('#sum_send_plus_price').text(comma(send_plus));
	
	var coupon = uncomma($('#sum_coupon').text());
	var point = uncomma($('#sum_point').text());
	
	$('#total_price').text(comma(price + send + send_plus - coupon - point));
	
	$('.go_to_refund').on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/myInfo/refund/request.do?buyWriterCode="+$(this).attr('id');
		}
	});
	
	$('.purchaseReview_before').on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/myInfo/review.do";
		}
	});
	
	$('.purchaseReview').on('click', function(){
		if(memberCode == null || memberCode == ''){
			alert('세션이 만료되었습니다.');
			location.href="/bomulsum/user/login.do";
		}else{
			location.href="/bomulsum/user/myInfo/review.do";
		}
	});
	
});
</script>
</html>