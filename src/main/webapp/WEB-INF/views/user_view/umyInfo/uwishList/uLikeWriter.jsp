<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 좋아하는 작가</title>
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
.uLikeWriterWrap {
	width: 80%;
	margin-left: 2%;
}
/*작가 프로필*/
.jeonga_artist_list{
	padding:0px;
	list-style: none;
}
.jeonga_artist_list_item{
	border-bottom:1px solid #D8D8D8;
}


.jeonga_wprofile_image{
	width:80px;
	height:80px;
	border-radius:70%;
	overflow:hidden;
	position:relative;
}

.jeonga_wprofileImage{
	width:80px;
	height:80px;
	object-fit:cover;
	background-color: #f5f5f5;
}

.jeonga_wprofile{
	display:flex;
	padding-top:5px;
	padding-bottom: 15px;
}
.jeonga_wprofile_split{
	padding:2%;
}

.jeonga_wprofile_content{
	width:200px;
}

.jeonga_wprofile_text{
	padding:2%;
	font-size:14px;
	overflow-y: scroll;
	height: 34px;
	overflow:auto;
}

.jeonga_wprofile_text::-webkit-scrollbar {
    width: 10px;
}

.jeonga_wprofile_text::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.jeonga_wprofile_text::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
}

.jeonga_wprofile_title{
	text-decoration: none;
	color:black;
}
.jeonga_wprofile_button{
	text-decoration: none;
	color:black;
}
.jeonga_wprofile_buttons_top{
	display:flex;
}

.jeonga_wprofile_button_add{
	cursor:pointer;
	background-color:#DF3A01;
	border:1px solid #DF3A01;
	color:white;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:99px;
	margin:3px;
}

#jeonga_wprofile_writer_home{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:99px;
	margin:3px;
}

#jeonga_wprofile_message{
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
.jeonga_imageSlides_img{
	width:165px;
	height:165px;
	margin:0px;
	padding:0px;
	font-size:0px;
}

.joenga_wprofile_imageslider {
	margin-top:2%;
	margin-bottom:2%;
 	position: relative;
 	width:507px;
 	height:168.25px;
 	padding:0px;
 	margin-left:0px;
 	margin-rifht:0px;
 	overflow:hidden;
 	
}
.jeonga_imageSlides_buttons{
	width:505px;
 	height:168.25px;
	/*visibility:hidden;*/
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}

#jeonga_imageSlides1 {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:505px;
	height:168.25px;
} 


/* Next & previous buttons */
.jeonga_imageSlides_prev {
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
.jeonga_imageSlides_next{
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
.jeonga_imageSlides_prev:hover, .jeonga_imageSlides_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
 opacity: 100;
}


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//좋아하는 작가 취소
 $(function(){
	$(".jeonga_wprofile_button_add").click(function(){ 
		var $data = $(this).parent().next().children('#jeonga_wprofile_code').text();
		 console.log($data);
		 var param = $data;
		 console.log(param);
	
	 
		 $.ajax({
			url : "/bomulsum/user/wishlist/unLikeWriter.do",
			data : {"writer_code_seq" : param},
			success : function() {
				alert('좋아하는 작가를 취소합니다.');
				location.reload(true);
			},
			error : function(err) {
				console.log(err);
			}
			})

	});

 });
	
//이미지 슬라이드
	$(function(){
		$(document).on('click',".jeonga_imageSlides_prev",function(data){
			var n = -1;
			var $button = $(this);
			var $indexDiv = $button.parent().prev();
			var $index = $button.parent().prev().text();
			var $slideOne = $button.parent().next();
			//console.log($slideOne);
			console.log($index);
			
			var slideIndex = $index;
			var slide1 = $slideOne;
			slide1.css("display","none");
			
			var data = Number(slideIndex) + Number(n);
			var slides = new Array();
			var $slides1 = $button.parent().next().next();
			var $slides2 = $button.parent().next().next().next();
			var $slides3 = $button.parent().next().next().next().next();
					
			slides.push($slides1);
			slides.push($slides2);
			slides.push($slides3);

			console.log(slides);
			if(data > slides.length){
				slideIndex = 1;
			}
			if(data < 0){
				slideIndex = slides.length;
			}
			for(var k=0; k<slides.length; k++){
				slides[k].css('display','none');
			}
			var i = Number(slideIndex)-1;
			slides[i].css('display','block');
			
			$indexDiv.text(i);
		}); 

	$(document).on('click',".jeonga_imageSlides_next",function(data){
			var n = 1;
			var $button = $(this);
			var $indexDiv = $button.parent().prev();
			var $index = $button.parent().prev().text();
			var $slideOne = $button.parent().next();
			console.log($slideOne);
			
			console.log($index);
			var slideIndex = $index;
			var slide1 = $slideOne;
			slide1.css('display','none');
			
			var data = Number(slideIndex) + Number(n);
			var slides = new Array();
			var $slides1 = $button.parent().next().next();
			var $slides2 = $button.parent().next().next().next();
			var $slides3 = $button.parent().next().next().next().next();
					
			slides.push($slides1);
			slides.push($slides2);
			slides.push($slides3);

			console.log(slides);
				
			if(data > slides.length){
				slideIndex = 0;
			}
			if(data < 0){
				slideIndex = slides.length;
			}
			for(var k=0; k<slides.length; k++){
				slides[k].css('display','none');
			}
			
			var i = Number(slideIndex)+1;
			slides[slideIndex].css('display','block');
			$indexDiv.text(i);
		});
	 
	});

</script>
</head>
<body>
	<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"%>

	<div class="content">
		<!-- 사이드메뉴 -->
		<%@ include file="../../include/uside.jsp"%>
		<!-- 내용 여기다 넣으시오 -->
		<div class="uLikeWriterWrap">
			<div class="jeonga_uLikeWriter_title">
			<h2 id="jeonga_uLikeWriter_text">좋아하는(♥) 작가</h2>
			</div>
			<c:if test="${empty artListInfo}">
			좋아하는 작가를 추가하세요.
			</c:if>
			<c:if test="${not empty artListInfo}">
			<!-- 좋아하는 작가 목록 -->
			<ul class="jeonga_artist_list">

			<c:forEach var="artList" items='${artListInfo}'>
				<li class="jeonga_artist_list_item">
					<!-- 작가 프로필  -->
					<div class="jeonga_wprofile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_wprofile_split">
							<div class="jeonga_wprofile_image">
							<a href="/bomulsum/writerhome/${artList.writer_url}.do" target="#" class="jeonga_wrpofile_image_link"> 
							 	<c:if test="${artList.writer_profile_img eq null}">
									<img class="jeonga_wprofileImage" src="<c:url value='/resources/img/test.png'/>">
							 	</c:if>
							 	<c:if test="${artList.writer_profile_img ne null}">
									<img class="jeonga_wprofileImage" src="<c:url value='/upload/${artList.writer_profile_img}'/>">
							 	</c:if>
							 
							 </a></div>
						</div>
						<div class="jeonga_wprofile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_wprofile_content">
							<a href="/bomulsum/writerhome/${artList.writer_url}.do" class="jeonga_wprofile_title" target="">${artList.writer_brand_name}</a>
							<p class="jeonga_wprofile_text">${artList.writer_intro}</p>
							<div class="jeonga_wprofile_buttons">
								<div class="jeonga_wprofile_buttons_top">
									<div class="jeonga_wprofile_button_add">♥︎하는 작가</div>

									<div id="jeonga_wprofile_writer_home">
									<a class="jeonga_wprofile_button" href="/bomulsum/writerhome/${artList.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_wprofile_message">
									<a href="/bomulsum/user/message.do?writer=${artList.writer_code_seq}" class="jeonga_wprofile_button">메시지 보내기</a>
									<div id="jeonga_wprofile_code" style="display:none">${artList.writer_code_seq}</div>
									<!-- 메시지 대상 보내기 -->
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
					 <div class="joenga_wprofile_imageslider"> 
					 	<div class="index" style="display:none">1</div>
					  	<div class="jeonga_imageSlides_buttons">
 						<a class="jeonga_imageSlides_prev">❮</a>
 						<a class="jeonga_imageSlides_next">❯</a>
						</div> 

						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo1}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo2}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo3}'/>">
  						</div>
  						<div id="jeonga_imageSlides2">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo4}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo5}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo6}'/>">
  						</div>
  						<div id="jeonga_imageSlides3">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo7}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo8}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo9}'/>">
  						</div>
  						<div id="jeonga_imageSlides4">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo1}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo2}'/>"><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${artList.art_photo3}'/>">
  						</div>

				</div>
				</li>
				</c:forEach>
 			
			</ul>
		</c:if>
		</div>
	</div>
		<!-- 푸터  -->
		<%@ include file="../../include/uFooter.jsp"%>
	</div>
</body>
</html>