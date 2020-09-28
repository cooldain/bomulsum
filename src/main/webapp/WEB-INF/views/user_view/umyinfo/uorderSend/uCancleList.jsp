<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 환불 내역</title>
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
	font-size: 14px;
    width: 98%;
    height: 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1%;
}

.dndud_semicontent_top .price{
	font-weight: bold;
	display: flex;
	align-items: center;
	text-decoration: none;
	color:black;
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
</style>
<!-- 모달 스타일 -->
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
    width: 600px;
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
    justify-content: space-between;
    align-items: flex-start;
}
.report-modal__subject {
    font-size: 18px;
}
.report-modal__close {
    background-color: transparent;
    border: 0;
    color: red;
    font-size:20px;
    cursor:pointer;
}

.modal_main{
	max-height:500px;
	margin-top: 3%;
	border-top: 2px solid gray;
	overflow-y: auto 
}
.modal_main::-webkit-scrollbar {
  width: 6px;
}
.modal_main::-webkit-scrollbar-track {
  background-color: transparent;
}
.modal_main::-webkit-scrollbar-thumb {
  border-radius: 3px;
  background-color: gray;
}
.modal_main::-webkit-scrollbar-button {
  width: 0;
  height: 0;
}

.modal_main_withImg{
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	margin-top: 3%;
    margin-bottom: 3%;
}

.modal_main_Info{
	display: flex;
    flex-direction: row;
    width: 100%;
    justify-content: space-between;
    font-size: 15px;
    flex: 1 1 0%;
    margin-bottom: 3%;
}

.modal_main_Info_img{
	width:75px;
	height:75px;
}

.modal_main_Info_text{
	width:100%;
	display:flex;
	flex-direction: column;
	padding-left:2%;
	justify-content: center;
}

.modal_main_Info_text span{
    display: flex;
    justify-content: space-between;
    margin-bottom: 1%;
}

.modal_main_Info_text span a{
	font-size: 13px;
    color: #acacac;
}

.modal_main_Info_text span:nth-child(1){
	font-weight:bold;
}

.modal_main_count{
	width:10%;
	display:flex;
	align-items:center;
	justify-content: center;
}

.refund_reason{
	font-size:13px;
	height:80px;
	display:flex;
	flex-direction:column;
	border:1px solid gray;
}

.refund_reason_text{
	height:40px;
	display:flex;
	align-items:center;
	padding-left: 2%;
}

.refund_reason_text:nth-child(1){
	border-bottom:1px solid gray;
	background-color:#f5f5f5;
}

.imsiDiv{
	display:flex;
	flex-direction: row;
	margin-bottom: 2%;
}

.purchaseReview_done{
	background-color: #f1f1f1 !important;
	color:black;
	cursor: default !important;
}

.img{
	cursor: pointer;
    display: flex;
    justify-content: center;
    padding: 15px;
}

</style>
<script>
//콤마찍기
function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}
</script>
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
					<a class="dndud_txt_f1">환불 내역</a>
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
					<p style="margin-bottom:4%; font-size: 16px; color: #666">환불 내역이 없네요. (이럴수가!)</p>
					<a>작품 구경하러 가기</a>
				</div>
			</c:if>
			 
			 <c:if test="${not empty data }">
				
				<!-- 작품 있을경우 -->
				<div class="dndud_allContents">
					
					<c:forEach items="${data }" var="i" varStatus="base">
						<c:set var="order" value="${i.orderTable }"/>
						<c:set var="writerList" value="${i.buyWriter }" />
						<c:set var="artList" value="${i.buyArt }" />
						<c:set var="optionList" value="${i.buyOption }" />
						<c:forEach items="${writerList }" var="writer">
							<c:if test="${order.orderCodeSeq eq writer.orderCodeSeq }">
								<!-- 작품 -->
								<div class="dndud_semicontent">
									<div class="dndud_semicontent_top">
										<c:if test="${empty writer.buyWriterOrderRefundDate }">
											<a class="date">주문일자 ${order.orderDate }</a>
										</c:if>
										<c:if test="${not empty writer.buyWriterOrderRefundDate }">
											<a class="date">취소완료 ${writer.buyWriterOrderRefundDate} | 주문일자 ${order.orderDate }</a>
										</c:if>
										<c:set var="titlePrice" value="0"/>
										<a class="price"><span class="${writer.buyWriterCodeSeq }">0</span> 원 </a>
									</div>
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
																<c:if test="${art.buyArtCodeSeq eq option.buyArtCodeSeq }">
																	<div class="aboutItem">
																		<p>${option.artOptionName }</p>
																		<span>${option.artOptionAmount }개</span>
																		<c:set var="titlePrice" value="${titlePrice + (option.artOptionAmount * option.artPrice) }"/>
																	</div>
																</c:if>
																
															</c:forEach>
														</div>
													</div>
												</c:if>
											</c:forEach>
											<script>
											var val;
												$(function(){
													val = '${titlePrice}';
													val = comma(val);
													$('.${writer.buyWriterCodeSeq}').html(val);
												});
											</script>
										</div>
										<div class="aboutW">
											<c:if test="${empty writer.writerBrandName }">
												<a>${writer.writerName }</a>
											</c:if>
											<c:if test="${not empty writer.writerBrandName }">
												<a>${writer.writerBrandName }</a>
											</c:if>
											<input class="go_to_writer_message" id="${writer.writerCodeSeq }" type="button" value="메시지로 문의">
										</div>
										<div class="decision">
											<c:if test="${not empty writer.buyWriterOrderRefundDate }">
												<input id="${writer.buyWriterCodeSeq }" class="openInfoRefund" type="button" value="환불 정보">
											</c:if>
											<c:if test="${empty writer.buyWriterOrderRefundDate }">
												<input class="purchaseReview_done" type="button" value="환불 대기중">
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</c:forEach>
					
				</div>
			</c:if>
		</div>
		
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>

<!-- 신고 모달-->
<div class="detail-modal">
    <div class="report-modal__area">
        <div class="report-modal__head">
            <div class="report-modal__title">
                <div class="report-modal__subject">작품 환불 정보</div>
                <button class="report-modal__close">
                    <i style="font-size: 20px; color:red;"class="fas fa-times"></i>
                </button>
            </div>
        </div>
        
        <div class="modal_main">
        
        	<div class="modal_main_withImg">
        	</div>
        	
        	<div class="refund_reason">
        		<div class="refund_reason_text">
        			<span class="refund_reason_title">다른 작품으로 재주문</span>
        		</div>
        		<div class="refund_reason_text">
        			<span class="refund_reason_detail">번호 선택을 잘 못해서 다시 주문하고 이건 취소합니다.</span>
        		</div>
       		</div>
        	
        </div>
        
        
        
    </div>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
var test;
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
			 
			$("#iconMemo").css("display","block");
			$("#iconMemo").css("left", x);
			$("#iconMemo").css("top", y)
		});
		
		$("#dndud_questionIcon").mouseleave(function(){
			$("#iconMemo").css("display", "none");
		});
		
		$(".openInfoRefund").click(function(){
			
			$.ajax({
				url:'/bomulsum/user/myInfo/refundList/detail.do',
				data:{
					code:$(this).attr('id')
				},
				success:function(result){
					var temp = result.data;
					test = temp;
					var html ='';
					for(var i=0; i<temp.buyArt.length; i++){
						html += '<div class="modal_main_Info"><div class="modal_main_Info_img">'
							+ '<img src="/bomulsum/upload/'+temp.buyArt[i].artPhoto+'" style="width:75px; height:75px;"></div>'
							+ '<div class="modal_main_Info_text"><span>'+temp.buyArt[i].artName+'</span>';
						for(var j=0; j<temp.buyOption.length; j++){
							if(temp.buyOption[j].buyArtCodeSeq == temp.buyArt[i].buyArtCodeSeq){
								html += '<span><a style="max-width:80%;">'+temp.buyOption[j].artOptionName+'</a>'
									+ '<a style="margin-right: 2%;">'+temp.buyOption[j].artOptionAmount +'개</a></span>';
							}
						}
						html += '</div></div>'
					}
					
					var reason = temp.buyWriter[0].buyWriterOrderRefundReason;
					
					$('.refund_reason_title').html(reason.split('_')[0]);
					$('.refund_reason_detail').html(reason.split('_')[1]);
					
					
					$('.modal_main_withImg').html(html);
					
				}
			});
			
			$(".detail-modal").css("display", "flex");
		});
		
		$(".report-modal__close").click(function(){
			$('.modal_main_withImg').html('');
			$(".detail-modal").css("display","none");
		});
		
		$(".go_to_writer_message").on('click', function(){
			if(memberCode == null || memberCode == ''){
				alert('세션이 만료되었습니다.');
				location.href="/bomulsum/user/login.do";
			}else{
				location.href="/bomulsum/user/message.do?writer="+$(this).attr('id');
			}
		});
	});
</script>
</html>