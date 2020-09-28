<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 구매후기 쓰기</title>
<script src="<c:url value='/resources/vendor/jquery/jquery.min.js' />"></script>

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
#minwoo_reviewBorder{
	border-top:3px solid black; 
	border-right:3px solid black; 
	border-left:3px solid black;  
}
#minwoo_reviewBorderSub{
	border-top:1px solid black;
	border-right:1px solid black;
	border-bottom:3px solid black;
}
.minwoo_reviewA{
	font-size:15px;
	width:100%;
	height:100%;
	display:flex;
	justify-content:center;
	align-items:center;
	text-decoration:none;
	font-weight:bold;
}
#minwoo_uWriteReviewList{
	height:80%;
	width:100%;
	display:flex;
	flex-direction:column;
}
#noReviewContent{
	margin-left:auto;
	margin-right:auto;
	margin-top:5%;
	display:flex;
	flex-direction:column;
	align-items:center;
}
.minwoo_uWriteReview_ListContent{
	margin-top:20px;
	margin-left:auto;
	margin-right:auto;
	width:99%;
	border-width:1px;
	border-style:solid;
	border-color:#BDBDBD;
}
.minwoo_uWriteReview_ListContent_body{
	margin-top:10px;
	margin-left:10px;
	margin-right:10px;
}
.minwoo_uWriteReview_ListContent_button{
	margin-top:10px;
	margin-bottom:10px;
	height:auto;
	width:95%;
	border-width:1px;
	border-style:solid;
	border-color:#BDBDBD;
	margin-left:auto;
	margin-right:auto;
	display:flex;
	color:#1C1C1C;
	background-color:#FFFFFF;
	display:flex;
	justify-content:center;
	align-items:center;
	padding-top:10px;
	padding-bottom:10px;
	font-size:15px;
}
.minwoo_uWriteReview_ListContent_button:active{
	margin-top:10px;
	margin-bottom:10px;
	height:auto;
	width:95%;
	border-width:1px;
	border-style:solid;
	border-color:#BDBDBD;
	margin-left:auto;
	margin-right:auto;
	display:flex;
	color:#1C1C1C;
	background-color:#FFFFFF;
	display:flex;
	justify-content:center;
	align-items:center;
	padding-top:10px;
	padding-bottom:10px;
	font-size:15px;
}
.minwoo_uWriteReview_ListContent_buttonA{
	width:100%;
	height:100%;
	margin-top:10px;
	margin-bottom:10px;
	display:flex;
	justify-content:center;
	align-items:center;
	text-decoration:none;
	font-size:15px;
	color:#1C1C1C;
	border:none;
}
.minwoo_uWriteReview_ListContent_buttonA:active{
	text-decoration:none;
	border:none;
}
.minwoo_uWriteReview_ListContent_body_head{
	padding-inline-start: 20px;
	display:flex;
	flex-direction:row;
}
.minwoo_uWriteReview_ListContent_body_head_photo{
	width:60px;
	height:60px;
}

.minwoo_contentOptionUl{
    font-size: 15.5px;
    color: #6E6E6E;
    margin-top: 10px;
    line-height: 180%;
}

.minwoo_modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 30px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* 모달 내부 영역 */
.minwoo_modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  padding-top: 5px;
  border: 1px solid #888;
  width: 620px;
  max-height:660px;
}

/* 모달 닫기 버튼 */
.minwoo_close {
  color: #1f76bb;
}

.minwoo_close:hover,
.minwoo_close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.minwoo_starRev{
	height:60%;
}

.minwoo_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -104px 0;
    background-size: auto 100%;
    width: 30px;
    height: 60px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.minwoo_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 30px;
    height: 60px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.minwoo_starR1.on{background-position:0 0;}
.minwoo_starR2.on{background-position:-30px 0;}



#imgs{
   margin-right:2%;
}
.imageContainer {
   width: 580px;
   margin: 10px;
}

.imageContainer img {
   max-width: 65px;
}

.reviewComment{
	max-height:110px; min-height:80px;
	border:none;
	outline: none;
	-ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
    resize: none;
    font-size: 15px; padding: 2%;
}
/*스크롤바 안보이게 하기*/
.reviewComment::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

.btn2{
    font-size: 12px;
    background-color: white;
    border: 1px solid #e7e7e7;
    height: 35px;
    width: 45px;
    outline: none;
    color: #666666;
    border-radius: 10px;
    text-align: center;
    padding: 5px;
    font-weight: bold;
}

/*.minwoo_art_dis p {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  height: 25px;
} */

</style>
</head>
<body>
	<c:if test="${empty member}">
		<script>
			alert('로그인이 필요한 서비스입니다.');
			location.href='<c:url value="/user/login.do"/>';
		</script>
	</c:if>
	<c:if test="${param.checkReg eq 1}">
		<script type="text/javascript">
			alert("글이 등록 되었습니다.");
			location.href="/bomulsum/user/myInfo/review.do";
		</script>
	</c:if>
	<c:if test="${param.checkReg eq 2}">
		<script type="text/javascript">
			alert("글이 수정 되었습니다.");
			location.href="/bomulsum/user/myInfo/review.do";
		</script>
	</c:if>
<div>

	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	<!-- 콘텐트 div 시작 사이드 -->
	<div class="content" style="display:flex;">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
	
	<!-- main div 시작 -->
	<div style="margin-left:2%; width:80%;">
		<div>
			<h2>나의 구매 후기</h2>
		</div>
		
		
		
		
		<!-- 상단 구매후기 설명 -->
		<p style="background-color:#E6E6E6; font-size:13px; width:100%;">
			<br>
			&emsp;&emsp;여러분들이 작성해주시는 솔직한 구매후기는 핸드메이드 작품 선택을 고민하는 분들에게 선택의 도움을 줄 수 있답니다.
			<br>
			&emsp;&emsp;구매하신 작품마다 1회의 구매후기 작성과 1회의 수정이 가능합니다.
			<br>
			&emsp;&emsp;단, 작성하신 구매후기를 삭제하면 다시 작성할 수 없으니 신중히 평가해 주세요.
			<br>
			<br>
			&emsp;&emsp;해당 작품과 무관한 내용이나 비방, 욕설 등 부적합한 내용의 구매후기는 서비스 이용 약관이나 관련 법률에 의해 제재를 받을 수 있습니다.
			<br><br/>
		</p>
		<!-- 상단 구매후기 설명 종료 -->
		
		
		
		
		<!-- 구매 후기 탭 메뉴 -->
		<nav style="height:50px; width:100%; display:flex; flex-direction:row;">
			<div id="minwoo_reviewBorder" style="width:50%; height:100%;">
				<a href="<c:url value='/user/myInfo/review.do'/>" class="minwoo_reviewA">구매후기 쓰기</a>
			</div>
			<div id="minwoo_reviewBorderSub" style="width:50%; height:100%;">
				<a href="<c:url value='/user/myInfo/reviewedList.do'/>" class="minwoo_reviewA" style="color:#BDBDBD;">내가 쓴 구매후기</a>
			</div>
		</nav>
		<!-- 구매 후기 탭 메뉴 종료 -->
		
		
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 / 구매한 내역이 없을 때 -->
		<!-- 구매리스트 많아지면 스크롤로 넘어가도록 오버플로우 오토 줬는데, 페이징 처리로 해야될지도.. -->
		<!-- 
		<div class="minwoo_uWriteReviewList">
			<div id="noReviewContent">
				<img src="<c:url value='/resources/img/KMWnoReview.png'/>" style="width:240px;; height:240px;">
				<p style="font-weight:bold;color:#BDBDBD;">
				작성할 수 있는 구매후기가 없습니다.
				</p>
			</div>
		</div>
		 -->
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 끝 / 구매한 내역이 없을 때 -->
		
		 
		 
		 
		 
		 
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 / 구매한 내역이 있을 때 -->
		
		<div id="minwoo_uWriteReviewList" class="minwoo_uWriteReviewList" style="margin-top:10px;">
		</div>
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 끝 / 구매한 내역이 있을 때 -->
		
		<div id="pagination">
		</div>
		
		
		
		<!-- 구매후기 쓰기 모달 시작-->
				<div id="minwoo_myModal" class="minwoo_modal">

					<!-- 모달 속 영역 -->
					<div class="minwoo_modal-content">
						<!--모달 헤더 시작-->
						<div style="display: flex; width: 100%; height: 50px; justify-content: space-between; align-items: center;">
							<h2 style="color: #585858;">구매후기 작성</h2>
							<i class="minwoo_close fa fa-times fa-3x" onClick="modalClose()"></i>
						</div>
						<hr style="border: 0; height: 4px; background: #585858;">
						<!--모달 헤더 끝-->
						<!-- 불러올 구매한 작품 영역 시작-->
						<div style="display: flex; height: 70px; margin-top: 2%;">
							<div style="width: 70px; height: 70px;">
								<img id="modalArtImg" style="width:70px; height:70px;" src="">
							</div>
							<div style="flex-direction: column; width: 90%; margin-left: 2%;">
								<div style="height: 40%; font-size: 18px; font-weight: bold;" id="artName"></div>
								<!--옵션 내용 영역 시작 - 동일한 작품의 옵션이 서로 다른 물품들을 구매한 경우 포문 돌면서 값 가져오기 -->
								<div style="display: flex; flex-direction: column; height: 60%; overflow: auto; font-size: 15px;" id="modalOptionCategory">
									<!--여기서부터 옵션 이 다른 물품 하나씩의 값-->
										
										<!-- <div style="margin-top: 1px; display: flex; flex-direction: row;">
											<div style="width: 90%;">
												선택한 옵션
											</div>
											<div style="width: 10%;">00 개수</div>
										</div>
										<div style="margin-top: 1px; display: flex; flex-direction: row;">
											<div style="width: 90%;">
												선택한 옵션
											</div>
											<div style="width: 10%;">00 개수</div>
										</div> -->
									<!--여기까지 돌리기-->
								</div>
								<!-- 옵션 내용 영역 끝-->
							</div>
						</div>
						<!-- 불러올 구매한 작품 영역 끝 -->

						<!--입력 부분 시작-->
						<form id="minwoo_modal_form" action="<c:url value='/user/myInfo/reviewRegster.do'/> " method="post" enctype="multipart/form-data" name="formSubmit">
							<input type="hidden" id="writerCodeSeq" name="writerCodeSeq" />
							<input type="hidden" id="artCodeSeq" name="artCodeSeq" />
							<input type="hidden" id="buyArtCodeSeq" name="buyArtCodeSeq" />
							<input type="hidden" id="alarmContent" name="alarmContent" />
							<input type="hidden" id="reviewCodeSeq" name="reviewCodeSeq" />
							<input type="hidden" id="bArtReviewStatus" name="bArtReviewStatus" />
							<div style="border: 1px solid #D8D8D8; margin-top: 2%;">
								<!-- 별점 시작-->
								<div style="height: 120px; background-color: #F2F2F2; display: flex; flex-direction: column;">
									<div style="height: 70%; display:flex; justify-content:center; align-items:center;">
										<div class="minwoo_starRev">
											<span class="minwoo_starR1 on">1</span> <span class="minwoo_starR2">2</span>
											<span class="minwoo_starR1">3</span> <span class="minwoo_starR2">4</span>
											<span class="minwoo_starR1">5</span> <span class="minwoo_starR2">6</span>
											<span class="minwoo_starR1">7</span> <span class="minwoo_starR2">8</span>
											<span class="minwoo_starR1">9</span> <span class="minwoo_starR2">10</span>
											<input type="hidden" id="reviewStar" name="reviewStar"/>
										</div>
									</div>
									<div style="height: 30%; text-align: center; display: flex; justify-content: center; font-size: 13px;">
										별표를 클릭하여 평가하세요.
									</div>
								</div>
								<!--별점 끝-->
								<!-- 후기 입력 시작-->
								<div style="display:flex; flex-direction:column; height: 130px; padding: 10px">
									<textarea class="reviewComment" id="reviewComment"
										name="reviewComment" maxlength="1000" placeholder="후기를 입력해주세요."></textarea>
									<span id="counter" style="font-size:12px; text-align-last: right;">###</span>
								</div>
								<!-- 후기 입력 끝-->
								<!-- 사진 등록 시작 -->
								<div style="height: 140px; padding: 10px; border-top: 1px solid #D8D8D8;">
									<div id="minwoo_review_photo_line" style="height:70px; border:1px solid; display:flex; flex-direction:row; align-items:center;">
										<div id="minwoo_review_photo" onClick="fnUpload();" class="fa fa-picture-o fa-4x" aria-hidden="true"
											style="margin-left:22px;"></div>
										<div id="minwoo_review_photoNo" style="display: none; font-size: 25px; font-weight: bold; text-align: center; width: 100%;"> 사진은 수정이 불가능 합니다.</div>
										<input type="file" id="image" name="reviewPicture" onchange="setThumbnail(event);" style="display:none;" accept="image/*" multiple />
                        				<div class="imageContainer"></div>
									</div>
									<p style="font-size:14px;">
										사진은 5개까지 등록가능하며, 여러장을 올리실 경우 한 번에 선택하여 주세요.<br>사진을 잘못 선택하신 경우 '다시선택'을 누르신 후 '취소'를 누르시면 삭제할 수 있습니다.<br>구매후기를 등록 하시면, 사진은 수정이 불가능하니 신중히 올려주세요!
									</p>
								</div>
								<!-- 사진 등록 끝 -->
							</div>
							<!-- 입력버튼 -->
							<div style="margin-top: 20px; display: flex; justify-content: center; height: 30px;">
								<input id="saveButton" type="button" value="등록" style="margin: auto; color: #1f76bb; font-size: 20px; font-weight: bold;" onclick="saveReview(event);">
							</div>
						</form>
						<!--입력 부분 끝-->
						<!--등록 버튼-->
					</div>
					<!-- 모달 속 영역 -->
				</div>
				<!-- 구매후기 쓰기 모달 끝 -->
	
	
	
	
	
	</div>
	<!-- end main div -->
	</div>
	<!-- end 콘텐트 div -->

	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>

		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
		<!--스크립트 -->
		<script>
		var memberCode = '<%= (String)session.getAttribute("member") %>';
		var userName = '${userName}';
		
		// 데이터 넣기
		var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
		var reviewedCheck = 1; //구매 작품 리스트인지, 구매후기 리스트인지 구분용
		
		$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
		     getList(page);
		     page++;
		});
		 
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		     if(Math.round($(window).scrollTop()) >= $(document).height() - $(window).height()){
		          getList(page);
		           page++;   
		     } 
		});
		
		function artCode(e){
			var art_code = e.id;
			var url = "/bomulsum/user/uProductInfo/" + art_code + ".do?memberCode="+memberCode;
			window.open(url, "_blank");
		};
		
		function writerLoction(e){
			var writer_code = e.id;
			var url = '/bomulsum/writerhome/'+writer_code+'.do';
			window.open(url, "_blank");
		};
		
		function getList(page){
			$.ajax({
				type : 'POST',
				dataType : 'json',
				data : {
					'reviewedCheck' : reviewedCheck,
					'page':page,
					'member':memberCode
				},
				url : '/bomulsum/user/myInfo/reviewInfo.do',
				success : function(returnData){
					var htmldiv = '';
					var artImg = '';
					var data = returnData.data;
					var buttonText = '';
					var brandName = '';
					var artOption = [];
					var artOptionAmount = [];
					
					console.log(returnData);
					console.log(page);
					console.log(returnData.startNum);
					console.log(returnData.totalCnt);
					console.log(data.length);
					
					if(page == 1){
						$('#minwoo_uWriteReviewList').html('');
					}
					
					if(returnData.totalCnt > 0){
						if(returnData.startNum <= returnData.totalCnt){
							if(data.length > 0){
								for(var i = 0; i < data.length; i++){
									// 작품 대표 사진 설정
									artImg = data[i].artPhoto.split(',')[0]; 
									
									// 구매한 작품 옵션 설정
									artOption = data[i].bArtOptionName.split('|-%-|');
									artOptionAmount = data[i].artOptionAmount.split('|-%-|');
										
									// 글 등록(or 수정)버튼 설정
									if(data[i].bArtReviewStatus == 'N'){
										buttonText = '구매후기 작성하기';
									} else {
										buttonText = '구매후기 수정하기(후기 수정은 1회만 가능 합니다.)';
									}
									
									// 작가 브랜드 명 설정
									if(data[i].writerBrandName == "" || data[i].writerBrandName == null
											|| data[i].writerBrandName == undefined ||
											(data[i].writerBrandName != null && typeof data[i].writerBrandName == "object" && !Object.keys(data[i].writerBrandName).length)){
										brandName = data[i].writerName;
									} else {
										brandName = data[i].writerBrandName;
									}
									
									console.log(brandName);
									
									htmldiv += '<div class=\"minwoo_uWriteReview_ListContent\">'
										+ '<input type=\"hidden\" value=\"' + data[i].buyArtCodeSeq +'\" />' // 0
										+ '<input type=\"hidden\" value=\"' + data[i].artCodeSeq +'\" />' // 1
										+ '<input type=\"hidden\" value=\"' + data[i].artName +'\" />' // 2
										+ '<input type=\"hidden\" value=\"' + data[i].writerCodeSeq +'\" />' // 3
										+ '<input type=\"hidden\" value=\"' + artImg +'\" />' // 4
										+ '<input type=\"hidden\" value=\"' + data[i].bArtOptionCount +'\" />' // 5
										+ '<input type=\"hidden\" value=\"' + data[i].bArtReviewStatus +'\" />' // 6
										+ '<input type=\"hidden\" value=\"' + data[i].reviewCodeSeq +'\" />' // 7
										+ '<input type=\"hidden\" value=\"' + data[i].reviewComment +'\" />' // 8
										+ '<input type=\"hidden\" value=\"' + data[i].reviewStar +'\" />' // 9
										+ '<input type=\"hidden\" value=\"' + data[i].bArtOptionName +'\" />' // 10
										+ '<input type=\"hidden\" value=\"' + data[i].artOptionAmount +'\" />' // 10
										+ '<div class=\"minwoo_uWriteReview_ListContent_body\">'
										+ '<div class=\"minwoo_uWriteReview_ListContent_body_head\">'
										+ '<div class=\"minwoo_uWriteReview_ListContent_body_head_photo\">'
				                        + '<img src=\"/bomulsum/upload/' + artImg + '\" style=\"width:60px; height:60px\">'
										+ '</div>'
										+ '<div style=\"margin-left:10px; margin-top:3px;\">'
										+ '<div style=\"font-weight:bold;\">'
										+ '<a href=\"\" onClick=\"artCode(this)\" style=\"text-decoration:none;\" id=\"'+ data[i].artCodeSeq +'\">' + data[i].artName + '</a>'
										+ '</div>'
										+ '<div style=\"margin-top:3px;\">'
										+ '<a href=\"\" id="' + data[i].writerUrl
										+ '" onClick="writerLoction(this)" style=\"text-decoration:none; font-weight:bold; font-size:smaller; color:#BDBDBD;\">'
										+ brandName + '</a>'
										+ '</div>'
										+ '</div>'
										+ '</div>'
										+ '<ul class=\"minwoo_contentOptionUl\">';
										
										// 선택한 옵션에 따라 표기
										console.log("랭쓰"+artOption.length);
										switch(artOption.length){
											// 선택한 작품의 서로 다른 옵션으로 구매한 수량이 한개일 때
											case 1 :
												htmldiv += '<li> 구매 옵션 별 수량 <br>' + artOption[0] + ' / 수량 : ' + artOptionAmount[0]  +' 개' + '</li>';
												break;
											// 선택한 작품의 서로 다른 옵션으로 구매한 수량이 두개일 때
											case 2 :
												htmldiv += '<li> 구매 옵션 별 수량 <br>' + artOption[0] + ' / 수량 : ' + artOptionAmount[0]  +' 개' + '<br>'
												+ artOption[1] + ' / 수량 : ' + artOptionAmount[1]  +' 개' +'</li>';
												break;
											// 선택한 작품의 서로 다른 옵션으로 구매한 수량이 그 이상일 때
											default :
												htmldiv += '<li> 구매 옵션 별 수량 <br>' + artOption[0] + ' / 수량 : ' + artOptionAmount[0]  +' 개' +  '<br>'
												+ artOption[1] + ' / 수량 : ' + artOptionAmount[1]  +' 개'
												+ '\t\t ... 그 외 ' + (artOption.length - 2) + ' 개' + '</li>';
										}
										
										htmldiv += //'<li clas="minwoo_art_dis"> 작품 설명 ' + data[i].artDescription + '</li>'
										 '<br><li> 구매 일자 : ' + moment(data[i].orderDate).format("YYYY-MM-DD") + '</li>'
										+ '</ul>'
										+ '</div>'
										+ '<button class=\"minwoo_uWriteReview_ListContent_button\" onClick=\"modalOpen()\">' + buttonText + '</button>'
										+ '</div>';
									} // end for
								}
							}//end if
							
						htmldiv = htmldiv.replace(/%20/gi, ' ');
							
						if(page == 1){
							$('#minwoo_uWriteReviewList').html(htmldiv);
						} else{
							$('#minwoo_uWriteReviewList').append(htmldiv);
						}
						
						$(".minwoo_uWriteReview_ListContent_button").on('click',modal);
					} else { // 데이터가 없을 때
						htmldiv += '<div id=\"noReviewContent\">'
						+ `<img src="<c:url value='/resources/img/KMWnoReview.png'/>"`
						+ 'style="width:240px;; height:240px;">'
						+ '<p style=\"font-weight:bold;color:#BDBDBD;\">'
						+ '작성할 수 있는 구매후기가 없습니다.'
						+ '</p>'
						+ '</div>';
						
						console.log('데이터 없을 때');
						
						$('#minwoo_uWriteReviewList').html(htmldiv);
					}
				
				}, //end for success
				error:function(e){
					if(e.status == 300){
						alert('데이터를 가져오는데 실패했습니다.');
					};
				}
			});
		};

		
		
		/* 모달 구동 스크립트 영역*/
		function modalOpen() {
			$('#minwoo_myModal').css('display', 'block');
		};
		function modalClose() {
			$('#minwoo_myModal').css('display', 'none');
		};
		
		//모달
		//모달 띄워줄때 해당 값 넣기
		var modalArtCode;
		var modalBuyArtCode;
		var modalArtPhoto;
		var modalWriterCode;
		var modalOptionCategory;
		var modalOptionName;
		var modalOptionCount;
		var modalArtName;

		var modalreviewStatus;
		var modalreviewCodeSeq;
		var modalreviewStar;
		var modalreviewComment;
		var modalreviewPhoto;
		
		var modalArtOption = [];
		var modalArtOptionAmount = [];
		var modalArtOptionDiv = '';
		
		var modal = function(){
			
			document.getElementById('reviewComment').focus();
			
			$('#modalOptionCategory').empty();

			//사진 업로드 영역 초기화
			$('#minwoo_review_photo').text("");
			$('#minwoo_review_photo').removeClass("btn2");
			$('#minwoo_review_photo').addClass("fa fa-picture-o fa-4x");
			$('#minwoo_review_photoNo').css('display','none');
			$('#minwoo_review_photo').css('display','block');
			$('.imageContainer').css('display','block');
			$(".imageContainer").empty();
			
			$('#saveButton').val("등록");
			
			
			//모달에 값 입력하기 위해 변수 값 셋팅
			modalBuyArtCode = $.trim($(this).closest('div').children('input').eq(0).val());
			modalArtCode = $.trim($(this).closest('div').children('input').eq(1).val());
			modalArtName = $.trim($(this).closest('div').children('input').eq(2).val());
			modalWriterCode = $.trim($(this).closest('div').children('input').eq(3).val());
			modalArtPhoto = $.trim($(this).closest('div').children('input').eq(4).val());
			modalOptionCategory = $.trim($(this).closest('div').children('div').children('ul').children('li').eq(0).text());
			modalOptionCount = $.trim($(this).closest('div').children('input').eq(5).val());
			
			modalreviewStatus = $.trim($(this).closest('div').children('input').eq(6).val());
			modalreviewCodeSeq = $.trim($(this).closest('div').children('input').eq(7).val());
			modalreviewComment = $.trim($(this).closest('div').children('input').eq(8).val());
			modalreviewStar = $.trim($(this).closest('div').children('input').eq(9).val());
			
			modalArtOption = $.trim($(this).closest('div').children('input').eq(10).val()).split('|-%-|');
			modalArtOptionAmount = $.trim($(this).closest('div').children('input').eq(11).val()).split('|-%-|');
			modalArtOptionDiv = '';
			
			console.log("모달에 뜨워준 구매작품 코드 : " + modalBuyArtCode);
			console.log("모달에 뜨워준 작품 코드 : " + modalArtCode);
			console.log("모달에 띄워준 작품 이름 : " + modalArtName);
			console.log("모달에 띄워준 작가 이름 : " + modalWriterCode);
			console.log("모달에 띄워준 작품 경로 : " + modalArtPhoto);
			console.log("모달에 띄워준 옵션 카테고리 : " + modalOptionCategory);
			console.log("모달에 띄워준 옵션 이름 : " + modalOptionName);
			console.log("모달에 띄워준 옵션 수량 : " + modalOptionCount);

			console.log("모달에 띄워준 후기 등록 상태  : " + modalreviewStatus);
			console.log("모달에 띄워준 후기 코드  : " + modalreviewCodeSeq);
			console.log("모달에 띄워준 후기 코멘트  : " + modalreviewComment);
			console.log("모달에 띄워준 후기 별점 : " + modalreviewStar);
			
			console.log("모달에 띄워준 작품 옵션  : " + modalArtOption);
			console.log("모달에 띄워준 작품 옵션 수량 : " + modalArtOptionAmount);
			console.log("모달에 띄워준 작품 옵션 개수 : " + modalArtOption.length);
			
			//갑 셋팅한 변수들 모달에 뿌려주기
			$('#artName').text(modalArtName);
			$('#reviewComment').val(''); // 수정으로 들어갔을때 값이 남아있지 않게 초기화 시켜주고, 다시 불러오기
			$("#modalArtImg").attr("src", "/bomulsum/upload/" + modalArtPhoto);
			
			for(var i=0; i < modalArtOption.length; i++){
				modalArtOptionDiv += '<div style="margin-top: 1px; display: flex; flex-direction: row;">'
						+ '<div style="width:70%">' + modalArtOption[i] + '</div><div style="width:10%"></div>'
						+ '<div style="width:20%"> 수량 : ' + modalArtOptionAmount[i] +' 개</div>'
						+ '</div>';
			}
			$('#modalOptionCategory').html(modalArtOptionDiv);
			//$('#modalOptionCount').text("수량 : " + modalOptionCount + "개");
			
			$('.minwoo_starRev').attr('data-rate', 1);

			
			//모달에서 폼 으로 데이터 넘길 때 물고가야 할 것들
			$('#buyArtCodeSeq').val(modalBuyArtCode);
			$('#artCodeSeq').val(modalArtCode);
			$('#writerCodeSeq').val(modalWriterCode);
			$('#alarmContent').val("[ " + modalArtName + " ] 작품에  ${userName} 님께서 새로운 구매후기를 등록 하셨습니다.");
			$('#bArtReviewStatus').val('N');
			$('#reviewStar').val('');
			
			if(modalreviewStatus == 'Y'){
				$('#reviewCodeSeq').val(modalreviewCodeSeq);
				$('#reviewComment').val(modalreviewComment);
				$('.minwoo_starRev').attr('data-rate', modalreviewStar);
				$('#alarmContent').val("[ " + modalArtName + " ] 작품에 ${userName} 님께서 구매후기를 수정 하셨습니다.");
				$('#bArtReviewStatus').val('Y');
				
				$('.imageContainer').css('display','none');
				$('#minwoo_review_photo').css('display','none');
				$('#minwoo_review_photoNo').css('display','block');
				$('#saveButton').val("수정");
				$('#reviewStar').val(modalreviewStar);
			}
			
			
			/* 별점 주기 스크립트 영역 */
			//수정일 때 별점 값 물고 표시해주기
			var starRevPoint = $('.minwoo_starRev');
			starRevPoint.each(function(){
				var targetScore = $(this).attr('data-rate');
				console.log(targetScore);
				$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
				$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
			});
			//별점 클릭 때 마다 해당 영역에 별 색칠해주고 값 저장해주기
			$('.minwoo_starRev span').click(function(){
		  		$(this).parent().children('span').removeClass('on');
		  		$(this).addClass('on').prevAll('span').addClass('on');
		  		var targetNum = $(this).index() + 1;
				console.log("이게 타겟넘?" + targetNum);
				$('#reviewStar').val(targetNum);
			  	return false;
			});
			
			//구매후기 인써트할 때 값
			// 별점 값 저장
			/* $('.minwoo_starRev span').click(function(){
			}); */
			/* 별점 주기 스크립트 영역*/
			
			//글자수 제한
			$('#reviewComment').keyup(function(e) {
				var comment = $(this).val();
				$(this).height(((comment.split('\n').length + 1) * 1.5) + 'em');
				$('#counter').html(comment.length + '/1000');
			});
			$('#reviewComment').keyup();
			
		};
		
		/*이미지 업로드(and 제거) 썸네일 생성 이벤트*/
		function fnUpload(){
			$('#image').click();
		};

		var upCheck = false;
		
		function setThumbnail(event) {  
			$(".imageContainer").empty();
			upCheck = false;
			for (var image of event.target.files) {
				var reader = new FileReader(); 
				reader.onload = function(event) { 
				
					var img = document.createElement("img");
					img.setAttribute("src", event.target.result);
					
					// 파일 유효성 검사
					const fileEx = image.name.slice(image.name.lastIndexOf(".")+1).toLowerCase();
					if(fileEx != "jpg" && fileEx != "png" && fileEx != "gif" && fileEx != "bmp" && fileEx != "jpeg") {
					alert('파일은 이미지파일(jpg, jpeg, png, gif, bmp)만 가능합니다.');
					return false;
					}
					      
					var divEle = document.createElement("a");
					divEle.appendChild(img);
					divEle.setAttribute("class","reviewPhotoA");
					$('.reviewPhotoA').css("margin-left","22px");
					document.querySelector("div.imageContainer").appendChild(divEle);
				};
				console.log(image); 
				reader.readAsDataURL(image);
				upCheck = true;
			}
			console.log(upCheck);
			if(upCheck){
				$('#minwoo_review_photo').html("다시<br>선택");
				$('#minwoo_review_photo').removeClass("fa fa-picture-o fa-4x");
				$('#minwoo_review_photo').addClass("btn2");
			} else {
				$('#minwoo_review_photo').text("");
				$('#minwoo_review_photo').removeClass("btn2");
				$('#minwoo_review_photo').addClass("fa fa-picture-o fa-4x");
			};
			
		};		
		//모달 부분 종료
		
		//등록버튼 이벤트
		function saveReview(event){
			event.preventDefault();

			let reviewComment = document.getElementById('reviewComment');
			console.log('폼 데이터 입력 값 = ' + 'buyArtCodeSeq : ' + $('#buyArtCodeSeq').val() + ' / '
						+ 'artCodeSeq : ' + $('#artCodeSeq').val()+ ' / ' + 'writerCodeSeq : ' +$('#writerCodeSeq').val() + ' / '
						+ 'alarmContent : ' + $('#alarmContent').val() + ' / ' + 'reviewPhoto : ' + $('#image').val() + ' / '
						+ 'reviewComment : ' + $('#reviewComment').val());
			
			if($('#reviewStar').val() == ''){
				alert('별점을 입력해 주세요.');
				reviewComment.focus();
				return false;
			};
			
			if(reviewComment.value == ''){
				alert('후기 내용을 입력해 주세요.');
				reviewComment.focus();
				return false;
			};
			
			var rtn;
			
			if($('#bArtReviewStatus').val() == 'N'){
				rtn = confirm("                    구매 후기를 등록하시겠습니까? \n (등록 후 수정은 1회만 가능하며, 후기 사진은 수정이 불가능 합니다.)");
			} else {
				rtn = confirm("구매 후기를 수정하시겠습니까? \n (차후 수정이 불가능 합니다.)");
			}
			
			
			if(rtn){
				formSubmit.submit();	
			} else {
				return false;
			};
		};

		</script>
		<!-- 스크립트 -->
</body>
</html>