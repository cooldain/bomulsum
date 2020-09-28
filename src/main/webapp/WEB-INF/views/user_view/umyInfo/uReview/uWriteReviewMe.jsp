<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 내가 쓴 구매후기</title>
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
	border-left:1px solid black;
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
#minwoo_uWriteReviewMeList{
	width:100%;
	display:flex;
	flex-wrap:wrap;
}

#noReviewContent{
	margin-left:auto;
	margin-right:auto;
	margin-top:5%;
	display:flex;
	flex-direction:column;
	align-items:center;
}
.minwoo_uWriteReviewMe_ListContent{
	margin-top:20px;
	margin-left:10px;
	width:48%;
	height:200px;
	border-width:1px;
	border-style:solid;
	border-color:#BDBDBD;
}
.minwoo_uWriteReviewMe_ListContent_body{
	margin-top:10px;
	margin-left:10px;
	margin-right:10px;
}

.minwoo_uWriteReviewMe_ListContent_body_head{
	display:flex;
	flex-direction:row;
	align-items:center;
	width:100%;
}
.minwoo_uWriteReviewMe_ListContent_body_head_photo{
	width:60px;
	height:60px;
}

/*별점 표현하기*/
.minwoo_starRev{
/* 	width:100%;
	height:30px;
	margin-left: 5px;
    margin-right: 5px;
    margin-top:7px;
    margin-bottom: 7px; */
    display: inline-flex;
}

.minwoo_starR1{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat -38px 0;
    background-size: auto 100%;
    width: 11px;
    height: 22px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR2{
    background: url('<c:url value='/resources/img/KMWico_review.png'/>') no-repeat right 0;
    background-size: auto 100%;
    width: 11px;
    height: 22px;
    float:left;
    text-indent: -9999px;
}
.minwoo_starR1.on{background-position:0 0;}
.minwoo_starR2.on{background-position:-11px 0;}

.minwoo_reviewComment_div{
	margin-top:5px;
	overflow: auto;
	height: 50px;
	font-size: 14.5px;
}
.minwoo_reviewComment_div::-webkit-scrollbar {
    width: 10px;
  }
  
.minwoo_reviewComment_div::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
}

.minwoo_reviewComment_div::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
}

/* 모달 영역 */
.minwoo_modalBtn{
	cursor: pointer;
    font-size: 12px;
    width: 80px;
    /* font-weight: bold; */
    height: 30px;
    border-radius: 20px;
    background-color: #4773f1;
    color: #ffffff;
    /* border-color: white; */
    border: none;
}

.minwoo_reviewRepleDiv_modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 50px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.minwoo_modal-content {
	background-color: #fefefe;
    margin: auto;
    padding: 20px;
    padding-top: 5px;
    border: 1px solid #888;
    width: 350px;
    height: 305px;
}

#minwoo_modal_close{
	color: #1f76bb;
	cursor: pointer;
	width: 50px;
    height: 40px;
    border-radius: 10px;
    font-size: 16px;
    font-weight: bold;
}

.minwoo_modal_close:hover,
.minwoo_modal_close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.minwoo_modalWriterProfile{
	max-height: 50px;
    height: 50px;
    max-width: 50px;
    width: 50px;
    border: none;
    border-radius: 50%;
    background-repeat: no-repeat;
    object-fit:cover;
}
.modalCommentRe{
	width: 325px;
    margin-left: auto;
    margin-right: auto;
    margin-top: 15px;
    font-size: 13px;
    height: 120px;
    overflow: auto;
}

.modalCommentRe::-webkit-scrollbar {
    width: 10px;
  }
  
.modalCommentRe::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
.modalCommentRe::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
 }


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
			alert("글이 수정 되었습니다.");
			location.href="/bomulsum/user/myInfo/reviewedList.do";
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
			<div id="minwoo_reviewBorderSub" style="width:50%; height:100%;">
				<a href="<c:url value='/user/myInfo/review.do'/>" class="minwoo_reviewA">구매후기 쓰기</a>
			</div>
			<div id="minwoo_reviewBorder" style="width:50%; height:100%;">
				<a href="<c:url value='/user/myInfo/reviewedList.do'/>" class="minwoo_reviewA" style="color:#BDBDBD;">내가 쓴 구매후기</a>
			</div>
		</nav>
		<!-- 구매 후기 탭 메뉴 종료 -->
		
		
		
		
		
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 / 구매한 내역이 없을 때 -->
		<!-- 구매리스트 많아지면 스크롤로 넘어가도록 오버플로우 오토 줬는데, 페이징 처리로 해야될지도.. -->
		<!-- 
		<div id="uWriteReviewList">
			<div id="noReviewContent">
				<img src="<c:url value='/resources/img/KMWnoReviewMe.png'/>" style="width:240px;; height:240px;">
				<p style="font-weight:bold;color:#BDBDBD; text-align:center;">
				구매후기를 남겨주시면 작가님이<br>함박 웃음을 지으며 기뻐하신답니다!
				</p>
			</div>
		</div>
		 -->
		<!-- 구매후기 쓸 수 있는 작품 리스트 영역 끝 / 구매한 내역이 없을 때 -->
	
	
	
	
		<!-- DB에서 값 불러오기 -->
		<!-- 구매후기 리스트 영역 시작 -->
		
			<div id="minwoo_uWriteReviewMeList" class="minwoo_uWriteReviewMeList">
			
				<%-- <c:forEach var="i" begin="1" end="10">
				<div class="minwoo_uWriteReviewMe_ListContent">
					<div class="minwoo_uWriteReviewMe_ListContent_body">
						<div class="minwoo_uWriteReviewMe_ListContent_body_head">
							<div class="minwoo_uWriteReviewMe_ListContent_body_head_photo">
								<img src="<c:url value='/resources/img/KMWcake.jpg'/>" style="width:100%; height:100%;">
							</div>
							<div style=" margin-left:10px; margin-top:3px; width:65%; font-weight:bold;">
								<a href="#" style="text-decoration:none;">작품제목<c:out value="${i}"/></a>
							</div>
							<div style="font-size:15px; color:blue; width:20%; text-align:center; font-weight:bold;">
								★★★★★
							</div>
						</div>
						<hr>
						<div style="height:50px; display:flex; flex-direction:row; align-items:center;">
							<div style="height:30px; width:30px; border:1px solid black; border-radius:100%;">
								<img src="<c:url value='/resources/img/Logo_blue.png'/>" style="width:100%;height:100%;">
							</div>
							
							<div style="height:50px; width:80%; margin-left:10px; font-size:15px; font-weight:bold; display:flex; flex-direction:column;justify-content:center;">
								<div>귀염둥이</div>
								<div style="color:#BDBDBD;">2020년 07월 21일</div>
							</div>	
						</div>
						<!-- 남긴 댓글 부분 -->
						<div style="margin-top:5px;">
							부모님이 좋아하세요!!
						</div>
						<!-- 남긴 댓글 부분 -->
					</div>
				</div>
				</c:forEach> --%>
				
			</div>
			
			<!-- 구매후기 리스트 영역 끝 -->
	
	
			<!-- 작가 답글 모달 띄워주기 -->
			<div class="minwoo_reviewRepleDiv_modal" id="minwoo_reviewRepleDiv_modal">
				<div class="minwoo_modal-content">
				
					<!-- 모달 헤더 -->
					<div style="display: flex; width: 100%; height: 50px; justify-content: space-between; align-items: center;">
						<h2 style="color: #585858;">작가님의 답글</h2>
						<i class="minwoo_modal_close fa fa-times fa-2x"></i>
					</div>
					
					<hr style="border: 0; height: 4px; background: #585858;">
					
					<!-- 작가 정보 -->
					<div style="display: flex; margin-top:2%">
						<div style="text-align:left; width: 50%; line-height: 85%; align-self: center;">
							<div id="modalWriterName"></div>
							<br>
							<div id="modalCommentDate"></div>
						</div>
						<div style="text-align: center; width:50%">
							<img src="" id="modalWriterProfile" class="minwoo_modalWriterProfile">
						</div>
					</div>
					<div id="modalCommentRe" class="modalCommentRe"></div>
					<hr>
					<div style="width:100%; text-align: center;">
						<button id="minwoo_modal_close" class="minwoo_modal_close">확인</button>
					</div>
					
				</div>
			</div>
	
	
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
		
		/* // 데이터 넣기
		var result = new Array();
		
		<c:forEach var="i" items='${reviewedList}'>
			var json = new Object();//객체로 배열에 담기
			json.reviewCodeSeq = '${i.reviewCodeSeq}';
			json.reviewDate = '${i.reviewDate}';
			json.reviewStar = '${i.reviewStar}';
			json.reviewComment = `${i.reviewComment}`;
			json.artPhoto = `${i.artPhoto}`;
			json.artName = '${i.artName}';
			json.writerCodeSeq = '${i.writerCodeSeq}';
			json.memberName = '${i.memberName}';
			json.memberProfile = `${i.memberProfile}`;
			json.bArtReviewStatus = '${i.bArtReviewStatus}';
			json.bArtReview = '${i.bArtReview}';

			result.push(json);
		</c:forEach> */
		
		var page = 1;
		var reviewedCheck = 2; //구매 작품 리스트인지, 구매후기 리스트인지 구분용
		
		$(document).ready(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
			getList(page);
		    page++;
		    
		});
		
		$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		     if(Math.round($(window).scrollTop()) >= $(document).height() - $(window).height()){
		          getList(page);
		           page++;   
		     } 
		});
		
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
					var memberImg = '';
					var data = returnData.data;
					
					console.log(returnData);
					
					if(page == 1){
						$('#minwoo_uWriteReviewList').html('');
					}
					if(returnData.totalCnt > 0){
						if(returnData.startNum <= returnData.totalCnt){
							if(data.length > 0){
								for(var i = 0; i < data.length; i++){
									artImg = data[i].artPhoto.split(',')[0];
									
									var writerName = '';
									var writerProfile = '';
									
									if(data[i].writerBrandName == "" || data[i].writerBrandName == null
											|| data[i].writerBrandName == undefined ||
											(data[i].writerBrandName != null && typeof data[i].writerBrandName == "object" && !Object.keys(data[i].writerBrandName).length)){
										writerName = data[i].writerName;
									} else {
										writerName = data[i].writerBrandName;
									}
									
									if(data[i].writerProfileImg == "" || data[i].writerProfileImg == null
											|| data[i].writerProfileImg == undefined ||
											(data[i].writerProfileImg != null && typeof data[i].writerProfileImg == "object" && !Object.keys(data[i].writerProfileImg).length)){
										writerProfile = 'test.png';
									} else {
										writerProfile = data[i].writerProfileImg;
									}
									
									
									htmldiv += '<div class="minwoo_uWriteReviewMe_ListContent">'
									+ '<div class="minwoo_uWriteReviewMe_ListContent_body">'
									+ '<div class="minwoo_uWriteReviewMe_ListContent_body_head">'
									+ '<div class="minwoo_uWriteReviewMe_ListContent_body_head_photo">'
									+ '<img src=\"/bomulsum/upload/' + artImg + '\" style=\"width:100%; height:100%\">'
									+ '</div>'
									+ '<div style=" margin-left:10px; margin-top:3px; width:65%; font-weight:bold;">'
									+ '<a style="text-decoration:none;">' + data[i].artName + '</a>'
									+ '</div>'
									+ '<div class=\"minwoo_starRev\" data-rate=\"' + data[i].reviewStar + '\">'
									+ '<span class=\"minwoo_starR1\"></span> <span class=\"minwoo_starR2\"></span>'
									+ '<span class=\"minwoo_starR1\"></span> <span class=\"minwoo_starR2\"></span>'
									+ '<span class=\"minwoo_starR1\"></span> <span class=\"minwoo_starR2\"></span>'
									+ '<span class=\"minwoo_starR1\"></span> <span class=\"minwoo_starR2\"></span>'
									+ '<span class=\"minwoo_starR1\"></span> <span class=\"minwoo_starR2\"></span>'
									+ '</div>'
									+ '</div>'
									+ '<hr>'
									+ '<div style="height:50px; display:flex; flex-direction:row; align-items:center;">'
									+ '<div style="min-height:30px; max-height:30px; min-width:30px; max-width:30px; border:1px solid black; border-radius:100%;">'
									+ '<img src="/bomulsum/upload/' + data[i].memberProfile + '" style="width:100%;height:100%;">'
									+ '</div>'
									+ '<div style="min-height:50px; max-height:50px; width:90%; margin-left:10px; font-size:15px; font-weight:bold; display:flex; flex-direction:column;justify-content:center;">'
									+ '<div>' + data[i].memberName + '</div>'
									+ '<div style="color:#BDBDBD;">' + moment(data[i].reviewDate).format("YYYY-MM-DD") + '</div>'
									+ '</div>';
									
									if(data[i].reviewCommentReStatus == 'Y'){
										htmldiv += '<button class="minwoo_modalBtn">답글 달림</button>'
											+ '<input type="hidden" value="' + data[i].reviewCommentRe + '">'
											+ '<input type="hidden" value="' + moment(data[i].reviewCommentReDate).format("YYYY-MM-DD") + '">'
											+ '<input type="hidden" value="' + writerName + '">'
											+ '<input type="hidden" value="' + writerProfile + '">'
											+ '<input type="hidden" value="' + data[i].writerCodeSeq + '">'
									}
									
									htmldiv += '</div>'
									+ '<div class="minwoo_reviewComment_div">' + data[i].reviewComment + '</div>'
									+ '</div>'
									+ '</div>';
								} // end for
							} 
						} // end for if
						
						htmldiv = htmldiv.replace(/%20/gi, ' ');
						if(page == 1){
							$('#minwoo_uWriteReviewMeList').html(htmldiv);
						} else{
							$('#minwoo_uWriteReviewMeList').append(htmldiv);
						}
						var starRevPoint = $('.minwoo_starRev');
						starRevPoint.each(function(){
								var targetScore = $(this).attr('data-rate');
								console.log('타겟스코어' + targetScore);
								$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
								$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
						});
					} else { // 데이터가 없을 때
						htmldiv += '<div id="noReviewContent">'
							+ `<img src="<c:url value='/resources/img/KMWnoReviewMe.png'/>"`
							+ 'style="width:240px;; height:240px;">'
							+ '<p style="font-weight:bold;color:#BDBDBD; text-align:center;">'
							+ '구매후기를 남겨주시면 작가님이<br>함박 웃음을 지으며 기뻐하신답니다!'
							+ '</p>'
							+ '</div>';
							
						$('#minwoo_uWriteReviewMeList').html(htmldiv);
					}//end
					
				     $('.minwoo_modalBtn').on('click', modal);
					
				}, //end for success
				error:function(e){
					if(e.status == 300){
						alert('데이터를 가져오는데 실패했습니다.');
					};
				}
			});
		};
		
		var modalReviewCommentRe;
		var modalreviewCommentReDate;
		var modalBrandName;
		var modalWriterProfileImg;
		
		//작가 답글 모달 띄우기
	    var modal = function(){
		 	   
			$('#minwoo_reviewRepleDiv_modal').css('display', 'block');
			console.log("진입은 했나요?")

			//모달값 초기화
			$('#modalCommentRe').text('');
			$('#modalWriterProfile').attr('src', '');
			$('#modalWriterName').text('');
			$('#modalCommentDate').text('');
			
			modalReviewCommentRe = $.trim($(this).next().val());
			modalreviewCommentReDate =  $.trim($(this).next().next().val());
			modalBrandName = $.trim($(this).next().next().next().val());
			modalWriterProfileImg = $.trim($(this).next().next().next().next().val());
			
			console.log("답글 : " + modalReviewCommentRe + " 답글 날짜 : " +  modalreviewCommentReDate + " 작가 브랜드 명 :" + modalBrandName);
			
			// 모달에 값 넣어주기
			$('#modalCommentRe').text(modalReviewCommentRe);
			$('#modalWriterProfile').attr('src', '/bomulsum/upload/'+modalWriterProfileImg)
			$('#modalWriterName').text("작성자 : " + modalBrandName);
			$('#modalCommentDate').text("작성일 : " + modalreviewCommentReDate);
			
			$('.minwoo_modal_close').on('click', function(){
				$('#minwoo_reviewRepleDiv_modal').css('display', 'none');
			});
		 	    
	    };
		
		</script>
		<!-- 스크립트 -->

</body>
</html>