<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 금손클래스</title>

<style>
body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
}

.uLikeWriterWrap {
	
}
/*이미지 슬라이드*/
.jeonga_slide_img {
	width: 100%;
	height: 480px;
	margin: 0;
	padding: 0;
}

.jeonga_uMhome_slidecontainer {
	position: relative;
	width: 100%;
	height: 480px;
}

.jeonga_uMhome_mySlides {
	position: relative;
	z-index: 80;
	width: 100%;
	height: 480px;
	padding: 0;
	display: none
}

#jeonga_uMhome_mySlides1 {
	position: relative;
	z-index: 20;
	width: 100%;
	height: 480px;
}

.jeonga_uMhome_imageSlides_buttons {
	width: 100%;
	height: 480px;
	z-index: 99;
	display: flex;
	justify-content: space-between;
	position: absolute;
}

/* Next & previous buttons */
.jeonga_uMhome_prev {
	color: white;
	cursor: pointer;
	width: auto;
	margin-top: 220px;
	margin-left: 200px;
	font-weight: bold;
	font-size: 35px;
}

.jeonga_uMhome_next {
	color: white;
	cursor: pointer;
	width: auto;
	margin-top: 220px;
	margin-right: 200px;
	font-weight: bold;
	font-size: 35px;
}

.jeonga_slide_numbertext {
	background-color: #6E6E6E;
	border-radius: 10px 10px 10px 10px;
	color: #f2f2f2;
	font-size: 11px;
	padding: 4px 13px;
	position: absolute;
	margin-top: 430px;
	margin-left: 1200px;
}

/*카테고리*/
.jeonga_uMhome_category {
	width: 1056px;
	margin: 0 auto;
	position: relative;
}

.jeonga_uMhome_nav_group {
	display: flex;
	justify-content: space-between;
	width: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.jeonga_uMhome_nav_con {
	border: 0.5px solid #D8D8D8;
	border-radius: 5px 5px 5px 5px;
	text-align: center;
	padding: 15px 30px;
	width: 150px;
	margin: 10px;
}

.jeonga_uMhome_nav_link {
	text-align: center;
	cursor: pointer;
}

.jeonga_uMhome_nav_con img {
	display: block;
	width: 48px;
	margin-left: 25px;
	margin-bottom: 7px;
}

.jeonga_uMhome_nav_link span {
	font-size: 14px;
	color: #666;
}
/*콘텐츠*/
.jeonga_uMhome_content {
	width: 1056px;
	margin: 0 auto;
	position: relative;
}

.jeonga_uMhome_content_title_txt {
	margin-bottom: 0;
}

.jeonga_uMhome_content_title {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
	margin-bottom: 20px;
}

.jeonga_uMhome_content_detail {
	width: 250px;
	border: 0.5px solid #D8D8D8;
}

.jeonga_uMhome_content_card {
	width: 250px;
	border: 0.5px solid #D8D8D8;
	border-radius: 5px 5px 5px 5px;
	margin: 6px;
}

.jeonga_uMhome_content_card_locagion {
	background-color: #6E6E6E;
	border-radius: 3px 3px 3px 3px;
	font-weight: bold;
	color: #f2f2f2;
	font-size: 12px;
	padding: 7px 10px;
	position: absolute;
	z-index: 99;
	margin: 1%;
}

.jeonga_uMhome_content_card_star {
	margin: 1%;
	padding-left: 200px;
	position: absolute;
	z-index: 80;
}

.jeonga_uMhome_content_card_star i {
	font-size: 30px;
	align-self: flex-end;
	margin: 2%;
	color: gray;
	-webkit-text-stroke-width: 2px;
	-webkit-text-stroke-color: white;
}

.jeonga_uMhome_content_card_img_link {
	position: relative;
	z-index: -1;
	margin: 0;
	padding: 0;
}

.jeonga_uMhome_content_info {
	padding: 8px 10px;
}

.jeonga_uMhome_content_info span {
	color: #dd5850;
	font-size: 12px;
}

.jeonga_uMhome_card_rating {
	padding: 8px 10px;
}
.minwoo_class_space {
	width:75%;
	display: flex;
	flex-wrap: wrap;
	margin-left: 2%;
}

.minwoo_class_space_one{
	width:250px;
	height:370px;
	margin-top:10px;
	padding-left:10px;
}

.minwoo_class_space_one a{
    color: #666666;
    text-decoration: none;
}

.minwoo_class_space_one_photo{
	height:65%;
	position: relative;
}

.minwoo_class_space_one_photo a{
    color: #666666;
    text-decoration: none;
}

.minwoo_class_space_one_photo a:hover:not(.active) {
    color: #666666;
}

.minwoo_class_space_one_text{
	height:35%;
	display:flex;
	flex-direction:column;
	padding:2%;
}

.minwoo_class_space_one_text a span{
	padding:5%;
    color: #666666;
    text-decoration: none;
    font-size:14px;
}

.minwoo_class_category_side ul li a:hover:not(.active) {
    color: #1f76bb;
}

.minwoo_class_space_one_location{
	position:absolute;
	left:0; 
	margin-top:5%;
	margin-left:5%;
	padding:2%; 
	font-size:13px;
	background-color:#6E6E6E;
	color:#FFFFFF;
	border-radius:5px;
}
.minwoo_uMhome_content_card{
	width:250px;
	height:352px;
	border:0.5px solid #D8D8D8;
	border-radius:5px 5px 5px 5px;
	margin:6px;
}
.minwoo_uMhome_content_card_locagion{
	background-color:#6E6E6E;
 	border-radius: 3px 3px 3px 3px;
 	font-weight:bold;
 	color: #f2f2f2;
  	font-size: 12px;
 	padding: 7px 10px;
	position: absolute;
	z-index: 99;
	margin:1%;
}
.minwoo_uMhome_content_card_star{
	margin:1%;
	padding-left:190px;
	position:absolute;
	z-index:80;
}

.minwoo_uMhome_content_card_star i{
	font-size:30px;
	align-self:flex-end;
	margin:2%;
	color: gray;
	-webkit-text-stroke-width: 2px;
	-webkit-text-stroke-color: white;
}
.minwoo_uMhome_content_card_img{
	cursor: pointer;
}
.minwoo_uMhome_content_card_img_link{
	position:relative;
	z-index: -1;
	margin:0;
	padding:0;
}
.minwoo_uMhome_content_info{
	padding:8px 10px;
}

.minwoo_uMhome_content_info span{
	color: #dd5850;
	font-size:12px;
}
.minwoo_uMhome_card_rating{
	padding:8px 10px;
}
</style>

<script>
var slideIndex = 0;
showSlides(slideIndex);

function plusSlides(n) {
  var slides1 = document.getElementById("jeonga_uMhome_mySlides1");
  slides1.style.display="none";
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("jeonga_uMhome_mySlides");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }

  slides[slideIndex-1].style.display = "block";

}

</script>

</head>
<body>
	<div>
		<%@ include file="../include/uHeaderClass.jsp"%>
		<div class="uMhomeWrap">

			<!-- 이미지 슬라이드 -->
			<div class="jeonga_uMhome_slidecontainer">

				<div class="jeonga_uMhome_imageSlides_buttons">
					<a class="jeonga_uMhome_prev" onclick="plusSlides(-1)">❮</a> <a
						class="jeonga_uMhome_next" onclick="plusSlides(1)">❯</a>
				</div>

				<div id="jeonga_uMhome_mySlides1">
					<div class="jeonga_slide_numbertext">1 / 3</div>
					<img class="jeonga_slide_img"
						src="<c:url value='/resources/img/mainImg.jpg'/>"
						style="width: 100%">
				</div>

				<div class="jeonga_uMhome_mySlides">
					<div class="jeonga_slide_numbertext">2 / 3</div>
					<img class="jeonga_slide_img"
						src="<c:url value='/resources/img/mainImg1.jpg'/>"
						style="width: 100%">
				</div>

				<div class="jeonga_uMhome_mySlides">
					<div class="jeonga_slide_numbertext">3 / 3</div>
					<img class="jeonga_slide_img"
						src="<c:url value='/resources/img/mainImg2.jpg'/>"
						style="width: 100%">
				</div>

			</div>

			<!-- 카테고리 -->
			<div class="jeonga_uMhome_category">
				<nav class="jeonga_uMhome_nav_group">
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=공예'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_craft.png">
							<span>공예</span>
						</a>
					</div>
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=요리'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_cook.png">
							<span>요리</span>
						</a>
					</div>
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=미술'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_art.png">
							<span>미술</span>
						</a>
					</div>
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=플라워'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_flower.png">
							<span>플라워</span>
						</a>
					</div>
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=뷰티'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_perfume.png">
							<span>뷰티</span>
						</a>
					</div>
					<div class="jeonga_uMhome_nav_con">
						<a href="<c:url value='/midas/detail.do?category=체험 및 기타'/>"
							class="jeonga_uMhome_nav_link"> <img
							src="https://image.idus.com/static/edu/cate_icon_hand.png" /> <span>체험
								및 기타</span>
						</a>
					</div>
				</nav>
			</div>

			<!-- 콘텐츠 -->

			<div class="jeonga_uMhome_content">
				<div class="jeonga_uMhome_content_title">
					<div>
						<h2 class="jeonga_uMhome_content_title_txt">
							주변 금손 클래스
							<button type="button"
								style="border: 0px; background-color: white; font-size: 16px; color: #01A9DB">
								<i class="fa fa-compass" aria-hidden="true"></i>&nbsp;서울 마포구
							</button>
						</h2>
					</div>
					<a href="<c:url value='/midas/location.do?location=서울'/>" class="jeonga_uMhome_content_more">
					<span style="color: #01A9DB; margin: 0">더보기 &gt;</span></a>
				</div>
				<div class="minwoo_class_space_location" style="display: flex; flex-wrap: wrap; width: 1056px;">
				</div>
				
				
				<div class="jeonga_uMhome_content_title">
					<div>
						<h2 class="jeonga_uMhome_content_title_txt">
							인기 금손 클래스
						</h2>
					</div>
					<a href="<c:url value='/midas/popular.do'/>" class="jeonga_uMhome_content_more">
					<span style="color: #01A9DB; margin: 0">더보기 &gt;</span></a>
				</div>
				<div class="minwoo_class_space_popular"style="display: flex; flex-wrap: wrap; width: 1056px;">
				</div>
				
				<div class="jeonga_uMhome_content_title">
					<div>
						<h2 class="jeonga_uMhome_content_title_txt">
							신규 금손 클래스
						</h2>
					</div>
					<a href="<c:url value='/midas/new.do'/>" class="jeonga_uMhome_content_more">
					<span style="color: #01A9DB; margin: 0">더보기 &gt;</span></a>
				</div>
				<div class="minwoo_class_space_new" style="display: flex; flex-wrap: wrap; width: 1056px; margin-bottom: 50px;">
				</div>
			</div>

		</div>
		
		<%@ include file="../include/uFooter.jsp"%>
	</div>

<script>
	var memberCode = '<%= (String)session.getAttribute("member") %>';
	var likeClassFunc;

	var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
	 
	$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
		console.log(page); 
		getList(page);
		getListN(page);
		getListP(page);
	}); 


	function getList(page){
		var location = '서울';
		
		$.ajax({
			type:'POST',
			dataType : 'json',
			data:{
				'location':location,
				'page':page,
				'member':memberCode
			},
			url : '/bomulsum/midas//hInfoL.do',
			success :function(returnData){
				var htmldiv = '';
				var midasAddress = '';
				var midasPhoto = '';
				var pricePer = 0;
				var data = returnData.dataL;

				console.log(returnData);

				
				if(page == 1){
					$('.minwoo_class_space_location').html('');
				}
				if(returnData.startNum <= returnData.totalCnt){
					if(data.length > 0){
						// for
						for(var i=0; i<data.length; i++){
							console.log(data[i]);
							
							midasPhoto = data[i].midasImg.split(',')[0]; // 사진 들어간 거 첫번째 사진만 가져오기
							var address1 = data[i].midasAddress1.split(' ')[0];
							var address2 = data[i].midasAddress1.split(' ')[1];
							
							midasAddress = address1 + ' ' + address2;
							
							htmldiv += '<div class=\"minwoo_uMhome_content_card\">'
								+ '<div class=\"minwoo_uMhome_content_card_img\" onClick=\"movePage();\">'
								+ '<input class=\"midasCodeSeq\" type=\"hidden\" value=\"'+ data[i].midasCodeSeq +'\"/>'
								+ '<div class=\"minwoo_uMhome_content_card_locagion\">' + midasAddress + '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_star\">';
								
								var imsi = 0;
								for(var j=0; j<returnData.wishList.length; j++){
									if(data[i].midasCodeSeq == returnData.wishList[j]){
										htmldiv += '<i class=\"fa fa-star fs\" style=\"color:#d64640\"></i>';
										console.log("같다!");
										imsi = 1;
										break;
									}
								}
								if(imsi == 0){
									htmldiv += '<i class=\"fa fa-star fs\"></i>'; 
								}
								
								htmldiv +=  '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_img_link\">'
								+ '<img src=\"/bomulsum/upload/' + midasPhoto + '\" style=\"width:250px; height:250px\">'
								+ '</div>'
								+ '</div>' //이미지 영역 종료
								+ '<div class=\"minwoo_uMhome_content_detail\">'
								+ '<div class=\"minwoo_uMhome_content_info\">'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_label\"><span>' + data[i].midasCategory + '</span></a><br/>'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_text\"><b style=\"font-size:14px\" onClick=\"movePage();\">' + data[i].midasName + '</b></a>'
								+ '</div>'
								+ '<div class=\"minwoo_uMhome_card_rating\">'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								//별점 컬럼 추가하고, 평균 내서 별점 값 뿌려주기
								//+ '<span style="font-size:14px; color:gray">'+ '참여후기 개수' +'</span>'
								+ '</div>'
								+ '</div>'
								+ '</div>'
						}// end for
					}else{
						//데이터 없을때.
					}
				}
				
				htmldiv = htmldiv.replace(/%20/gi, ' ');
				if(page == 1){
					$('.minwoo_class_space_location').html(htmldiv);				
				}else{
					$('.minwoo_class_space_location').append(htmldiv);
				}
				$(".fs").click(likeClassFunc);
				
			},
			error:function(e){
				if(e.status == 300){
					alert('데이터를 가져오는데 실패했습니다.');
				};
			}
		});
	};
	
	function getListN(page){
		
		$.ajax({
			type:'POST',
			dataType : 'json',
			data:{
				'page':page,
				'member':memberCode
			},
			url : '/bomulsum/midas/hInfoN.do',
			success :function(returnData){
				var htmldiv = '';
				var midasAddress = '';
				var midasImg = '';
				var pricePer = 0;
				var data = returnData.dataN;

				console.log(returnData);

				
				if(page == 1){
					$('.minwoo_class_space_new').html('');
				}
				if(returnData.startNum <= returnData.totalCnt){
					if(data.length > 0){
						// for
						for(var i=0; i<data.length; i++){
							console.log(data[i]);
							
							midasImg = data[i].midasImg.split(',')[0]; // 사진 들어간 거 첫번째 사진만 가져오기
							var address1 = data[i].midasAddress1.split(' ')[0];
							var address2 = data[i].midasAddress1.split(' ')[1];
							
							midasAddress = address1 + ' ' + address2;
							
							htmldiv += '<div class=\"minwoo_uMhome_content_card\">'
								+ '<div class=\"minwoo_uMhome_content_card_img\" onClick=\"movePage();\">'
								+ '<input class=\"midasCodeSeq\" type=\"hidden\" value=\"'+ data[i].midasCodeSeq +'\"/>'
								+ '<div class=\"minwoo_uMhome_content_card_locagion\">' + midasAddress + '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_star\">';
								
								var imsi = 0;
								for(var j=0; j<returnData.wishList.length; j++){
									if(data[i].midasCodeSeq == returnData.wishList[j]){
										htmldiv += '<i class=\"fa fa-star fs\" style=\"color:#d64640\"></i>';
										console.log("같다!");
										imsi = 1;
										break;
									}
								}
								if(imsi == 0){
									htmldiv += '<i class=\"fa fa-star fs\"></i>'; 
								}
							
								htmldiv += '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_img_link\">'
								+ '<img src=\"/bomulsum/upload/' + midasImg + '\" style=\"width:250px; height:250px\">'
								+ '</div>' 
								+ '</div>' //이미지 영역 종료
								+ '<div class=\"minwoo_uMhome_content_detail\">'
								+ '<div class=\"minwoo_uMhome_content_info\">'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_label\"><span>' + data[i].midasCategory + '</span></a><br/>'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_text\"><b style=\"font-size:14px\" onClick=\"movePage();\">' + data[i].midasName + '</b></a>'
								+ '</div>'
								+ '<div class=\"minwoo_uMhome_card_rating\">'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								//별점 컬럼 추가하고, 평균 내서 별점 값 뿌려주기
								//+ '<span style="font-size:14px; color:gray">'+ '참여후기 개수' +'</span>'
								+ '</div>'
								+ '</div>'
								+ '</div>'
						}// end for
					}else{
						//데이터 없을때.
					}
				}
				
				htmldiv = htmldiv.replace(/%20/gi, ' ');
				if(page == 1){
					$('.minwoo_class_space_new').html(htmldiv);				
				}else{
					$('.minwoo_class_space_new').append(htmldiv);
				}
				$(".fs").click(likeClassFunc);
				
			},
			error:function(e){
				if(e.status == 300){
					alert('데이터를 가져오는데 실패했습니다.');
				};
			}
		});
	};
	
function getListP(page){
		
		$.ajax({
			type:'POST',
			dataType : 'json',
			data:{
				'page':page,
				'member':memberCode
			},
			url : '/bomulsum/midas/hInfoP.do',
			success :function(returnData){
				var htmldiv = '';
				var midasAddress = '';
				var midasImg = '';
				var pricePer = 0;
				var data = returnData.dataP;

				console.log(returnData);

				
				if(page == 1){
					$('.minwoo_class_space_popular').html('');
				}
				if(returnData.startNum <= returnData.totalCnt){
					if(data.length > 0){
						// for
						for(var i=0; i<data.length; i++){
							console.log(data[i]);
							
							midasImg = data[i].midasImg.split(',')[0]; // 사진 들어간 거 첫번째 사진만 가져오기
							var address1 = data[i].midasAddress1.split(' ')[0];
							var address2 = data[i].midasAddress1.split(' ')[1];
							
							midasAddress = address1 + ' ' + address2;
							
							htmldiv += '<div class=\"minwoo_uMhome_content_card\">'
								+ '<div class=\"minwoo_uMhome_content_card_img\" onClick=\"movePage();\">'
								+ '<input class=\"midasCodeSeq\" type=\"hidden\" value=\"'+ data[i].midasCodeSeq +'\"/>'
								+ '<div class=\"minwoo_uMhome_content_card_locagion\">' + midasAddress + '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_star\">';
								
								var imsi = 0;
								for(var j=0; j<returnData.wishList.length; j++){
									if(data[i].midasCodeSeq == returnData.wishList[j]){
										htmldiv += '<i class=\"fa fa-star fs\" style=\"color:#d64640\"></i>';
										console.log("같다!");
										imsi = 1;
										break;
									}
								}
								if(imsi == 0){
									htmldiv += '<i class=\"fa fa-star fs\"></i>'; 
								}
								
								htmldiv += '</div>'
								+ '<div class=\"minwoo_uMhome_content_card_img_link\">'
								+ '<img src=\"/bomulsum/upload/' + midasImg + '\" style=\"width:250px; height:250px\">'
								+ '</div>' 
								+ '</div>' //이미지 영역 종료
								+ '<div class=\"minwoo_uMhome_content_detail\">'
								+ '<div class=\"minwoo_uMhome_content_info\">'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_label\"><span>' + data[i].midasCategory + '</span></a><br/>'
								+ '<a href=\"#\" class=\"minwoo_uMhome_card_text\"><b style=\"font-size:14px\" onClick=\"movePage();\">' + data[i].midasName + '</b></a>'
								+ '</div>'
								+ '<div class=\"minwoo_uMhome_card_rating\">'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								//별점 컬럼 추가하고, 평균 내서 별점 값 뿌려주기
								//+ '<span style="font-size:14px; color:gray">'+ '참여후기 개수' +'</span>'
								+ '</div>'
								+ '</div>'
								+ '</div>'
						}// end for
					}else{
						//데이터 없을때.
					}
				}
				
				htmldiv = htmldiv.replace(/%20/gi, ' ');
				if(page == 1){
					$('.minwoo_class_space_popular').html(htmldiv);				
				}else{
					$('.minwoo_class_space_popular').append(htmldiv);
				}
				$(".fs").click(likeClassFunc);
				
			},
			error:function(e){
				if(e.status == 300){
					alert('데이터를 가져오는데 실패했습니다.');
				};
			}
		});
	};
	
	function movePage(){
		location.href='/bomulsum/midas/noPage.do';
	};
	
	likeClassFunc = function(e){
		e.stopPropagation();
		
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		
		var midasCode = $(this).parent().prev().prev().val();
		var option = '즐겨찾는클래스';
		
		
		var clickIcon = $(this);
		console.log(clickIcon);
		var tORf;
		
		if(clickIcon.css("color") == "rgb(128, 128, 128)"){
			clickIcon.css("color", "#d64640");
			tORf = true;
		}else{
			clickIcon.css("color", "gray");
			tORf = false;
		}
		
		$.ajax({
			url:'/bomulsum/midas/wish.do',
			data:{
				'member':memberCode,
				'option':option,
				'optionCode':midasCode,
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
			alert('즐겨찾는 클래스에 추가되었습니다.');
		}else{
			alert('해제되었습니다.');
		}
	};
	</script>	
	
</body>
</html>