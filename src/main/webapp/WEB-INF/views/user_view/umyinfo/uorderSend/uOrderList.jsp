<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 주문 내역</title>
<style>

.content {
	width: 70%;
	margin-left: auto;
	margin-right: auto;
	padding-top: 36px; 
	padding-bottom: 64px;
	display: flex;
	flex-direction: row;
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
    height: 860px;
    display: flex;
    overflow-x: hidden;
    flex-direction: column;
    margin-top: 3%;
    overflow-y: auto;
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
	color:black;
	display: flex;
	align-items: center;
	text-decoration: none;
}

.dndud_semicontent_main{
	font-size: 15px;
	width: 100%;
	display: flex;
	flex-direction: row;
	background-color:white;
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
	margin-bottom:2%;
	
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
	align-items: flex-start;
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
	font-weight:bold;
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

#iconMemo{
	font-size:12px;
	text-align:center;
	width:200px;
	height:36px;
	display:none;
    align-items: center;
	position: absolute;
	z-index:1;
	border: 1px solid gray;
	background-color: white;
	justify-content: center;
}

.imsiDiv{
	display:flex;
	flex-direction: row;
}

.img{
	cursor:pointer;
    display: flex;
    justify-content: center;
    padding: 15px;
}

.dndud_allContents::-webkit-scrollbar {
  width: 6px;
}
.dndud_allContents::-webkit-scrollbar-track {
  background-color: transparent;
}
.dndud_allContents::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: gray;
}
.dndud_allContents::-webkit-scrollbar-button {
  width: 0;
  height: 0;
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
    border: 1px solid #d9d9d9;
    padding: 5%;
    margin-top: 5%;
    cursor: pointer;
    color:black;
    text-decoration: none;
}
</style>
</head>
<body>
<div>
<div id="iconMemo">최근 1개월 내에 주문건수</div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
		<%@ include file="../../include/uside.jsp" %>
		<!-- 내용 여기다 넣으시오 -->
		<div class="dndud_content">
		
			<div class="dndud_content_top">
				<div class="dndud_content_top_title">
					<a class="dndud_txt_f1">주문 내역</a>
				</div>
				<div class="dndud_content_top_date">
					<select><option>2020 년</option></select>
				</div>
			</div>
			<div class="dndud_content_tab_group">
				<span class="onTab">작품<i id="dndud_questionIcon" class="far fa-question-circle"></i></span>
				<a>온라인 클래스</a>
				<a>오프라인 클래스</a>
			</div>
			
			<c:if test="${empty data }">
				<div class="dndud_noContent">
					<span class="no_order_icon"><img style="width:120px; height:120px" src="<c:url value='/resources/img/noFile.png'/>" ></span>
					<p style="margin-bottom:4%; font-size: 16px; color: #666">주문하신 적이 없네요. (이럴수가!)</p>
					<a style="text-decoration: none" href="<c:url value='/home.do'/> ">작품 구경하러 가기</a>
				</div>
			</c:if>
			<c:if test="${not empty data }"> 
				<!-- 작품 있을경우 -->
				<div class="dndud_allContents">
					
					<%-- 기본 포문 시작 --%>
					<c:forEach items="${data }" var="i" varStatus="base">
						<c:set var="order" value="${i.orderTable }"/>
						<c:set var="writerList" value="${i.buyWriter }" />
						<c:set var="artList" value="${i.buyArt }" />
						<c:set var="optionList" value="${i.buyOption }" />
						<div class="dndud_semicontent">
							<div class="dndud_semicontent_top">
								<a class="date">${order.orderDate }</a>
								<a class="price" href="<c:url value='/user/myInfo/orderList/detail.do?orderCode=${order.orderCodeSeq }' />"><fmt:formatNumber value="${order.orderPayPrice }" pattern="#,###"/>원 ></a>
							</div>
							<%-- 작가별 포문 --%>
							<c:forEach items="${writerList }" var="writer">
								<c:if test="${writer.orderCodeSeq eq order.orderCodeSeq }">
									<div class="dndud_semicontent_main">
										<div class="item">
											<%-- 작품별 포문 --%>
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
															<%-- 옵션별 포문 --%>
															<c:forEach items="${optionList }" var="option">
																<c:if test="${option.buyArtCodeSeq eq art.buyArtCodeSeq}">
																	<div class="aboutItem" id="${option.artOptionSeqList }">
																		<p>${option.artOptionName }</p>
																		<span>${option.artOptionAmount }개</span>
																	</div>
																</c:if>
															</c:forEach>
															<%-- 옵션별 포문 끝 --%>
														</div>
													</div>												
												</c:if>
											</c:forEach>
											<%-- 작품별 포문 끝 --%>
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
								</c:if>
							</c:forEach>
							<%-- 작가별 포문 끝 --%>
						</div>
					</c:forEach>
					<%-- 기본 포문 끝 --%>
				</div>
			</c:if> 
					<%-- <div class="dndud_semicontent">
						<div class="dndud_semicontent_top">
							<a class="date">2020-07-21</a>
							<a class="price" href="#">1,500원 ></a>
						</div>
						<div class="dndud_semicontent_main">
							<div class="item">
								<div class="imsiDiv">
									<div class="img">
										<img src="<c:url value='/resources/img/test.png'/>" style="width:75px; height:75px">
									</div>
									<div class="writeAboutItem">
										<div class="itemTitle">
											<p>(카페) 주문제작 감성 일러스트 엽서</p>
											<p class="orderStat">결제 완료</p>
										</div>
										<div class="aboutItem">
											<p>배송비 : 우편(+ 500원) / 문구 및 디자인추가 : X도안 그대로</p>
											<span>1개</span>
										</div>
									</div>
								</div>
							</div>
							<div class="aboutW">
								<a>#작가#</a>
								<input type="button" value="메시지로 문의">
							</div>
							<div class="decision">
								<input type="button" value="환불요청">
							</div>
						</div>
						<div class="dndud_semicontent_main" style="border-top: 1px solid #d9d9d9;">
							<div class="item">
								<div class="imsiDiv">
									<div class="img">
										<img src="<c:url value='/resources/img/test.png'/>" style="width:75px; height:75px">
									</div>
									<div class="writeAboutItem">
										<div class="itemTitle">
											<p>(카페) 주문제작 감성 일러스트 엽서</p>
											<p class="orderStat">결제 완료</p>
										</div>
										<div class="aboutItem">
											<p>배송비 : 우편(+ 500원) / 문구 및 디자인추가 : X도안 그대로</p>
											<span>1개</span>
										</div>
									</div>
								</div>
							</div>
							<div class="aboutW">
								<a>#작가#</a>
								<input type="button" value="메시지로 문의">
							</div>
							<div class="decision">
								<input type="button" value="환불요청">
							</div>
						</div>
					</div>
					
					<div class="dndud_semicontent">
						<div class="dndud_semicontent_top">
							<a class="date">2020-04-20</a>
							<a class="price"  href="#">13,300원 ></a> <!-- 제품 상세페이지로. -->
						</div>
						<div class="dndud_semicontent_main">
							<div class="item">
								<div class="imsiDiv">
									<div class="img">
										<img src="<c:url value='/resources/img/test.png'/>" style="width:75px; height:75px">
									</div>
									<div class="writeAboutItem">
										<div class="itemTitle">
											<p>40% 어버이날 예약할인 / 한송이세송이 카네이션 꽃다발</p>
											<a class="orderStat">작가 발송 완료</a>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 베리핑크 / 포장지 : 아이보리(연베이지색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 딥레드 / 포장지 : 핑크(분홍색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 딥레드 / 포장지 : 핑크(분홍색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
									</div>
								</div>
								<div class="imsiDiv">
									<div class="img">
										<img src="<c:url value='/resources/img/test.png'/>" style="width:75px; height:75px">
									</div>
									<div class="writeAboutItem">
										<div class="itemTitle">
											<p>40% 어버이날 예약할인 / 한송이세송이 카네이션 꽃다발</p>
											<a class="orderStat">작가 발송 완료</a>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 베리핑크 / 포장지 : 아이보리(연베이지색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 딥레드 / 포장지 : 핑크(분홍색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
										<div class="aboutItem">
											<p>송이/색상 : 1송이 딥레드 / 포장지 : 핑크(분홍색) / 프리저브드 용돈봉투 : 안할게요 / 예약출고 : 5월 4일</p>
											<span>1개</span>
										</div>
									</div>
								</div>
							</div>
							<div class="aboutW">
								<a>#작가#</a>
								<input type="button" value="메시지로 문의">
							</div>
							<div class="decision">
								<div class="decision_Div">
									<input class="purchaseReview_before" type="button" value="구매후기 수정">
									<input type="button" value="발송 정보 조회">
								</div>
								<div class="decision_Div">
									<input class="purchaseReview_done" type="button" value="구매후기 수정">
									<input type="button" value="발송 정보 조회">
								</div>
							</div>
						</div>
					</div>--%>
					
				 
			
			
			
			<div class="dndud_content_bottom">
				
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

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}
	$(function(){
		$("#dndud_questionIcon").mouseover(function(event){
			
			var x = 0; // 마우스 포인터의 좌측 위치 
			var y = 0; // 마우스 포인터의 위쪽 위치 
			x = $("#dndud_questionIcon").offset().left + 25;
			y = $("#dndud_questionIcon").offset().top - 13;
			 
			$("#iconMemo").css("display","flex");
			$("#iconMemo").css("left", x);
			$("#iconMemo").css("top", y)
		});
		
		$("#dndud_questionIcon").mouseleave(function(){
			$("#iconMemo").css("display", "none");
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