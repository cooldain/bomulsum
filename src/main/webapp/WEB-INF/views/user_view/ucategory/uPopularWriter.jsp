<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 인기 작가</title>

<style>
a:link, a:visited, a:hover, a:active{
   text-decoration: none;
   color: black;
}
.jeonga_title_img{
   display:flex;
   width:100%;
   height:210px;
   background-image: url('../../resources/img/articles_head.png');
   background-repeat: no-repeat;
   background-size:100%;
   flex-direction: column;
   align-items: center;
   justify-content: center;
}

.jeonga_title_img h1{
   color:white;
}

.jeonga_title_img div{
   height:2px;
   width:64px;
   margin-top:15px;
   margin-bottom:15px;
   background-color:white;
}

.jeonga_title_img p{
   display:flex;
   justify-content:center;
   font-size:14px;
   color:white;
   width:100%;
}
/* 작가 리스트 */
.jeonga_artist_wrap{
	width:1100px;
	margin:0 auto;
}
.jeonga_artist_list{
	padding:0px;
	list-style-type: none;

}
.jeonga_artist_list_item{
	border-bottom:1px solid #D8D8D8;
}

.jeonga_profile_rank{
	padding-top:18px;
	padding-left:8px;
	position:absolute;
	z-index: 10;
}

.jeonga_profile_image{
	margin-top:30px;
	margin-left:31.6px;
	width:100px;
	height:100px;
	border-radius:70%;
	overflow:hidden;
	position:relative;
	z-index: 99;
}
.jeonga_profile_image1{
	margin-top:33.5px;
	margin-left:30.5px;
	width:100px;
	height:100px;
	border-radius:70%;
	overflow:hidden;
	position:relative;
	z-index: 99;
}

.jeonga_profileImage{
	width:100%;
	height:100%;
	object-fit:cover;
	background-color: white;
}

.jeonga_profile{
	display:flex;
	padding-top:3%;
	padding-bottom:3%;
}
.jeonga_profile_split_img{
	width:160px;
}
.jeonga_profile_split{
	padding:18px;
}

.jeonga_profile_content{
	width:200px;
}
.jeonga_profile_text{
	padding:2%;
	font-size:14px;
	overflow-y: scroll;
	height: 32px;
	overflow:auto;
}
.jeonga_profile_text::-webkit-scrollbar {
    width: 10px;
}
.jeonga_profile_text::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
}
.jeonga_profile_text::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
}

.jeonga_profile_buttons_top{
	display:flex;
}

.jeonga_profile_button_add{
	cursor: pointer;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:78px;
	margin:3px;
}

#jeonga_profile_writer_home{
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

#jeonga_profile_message{
	background-color: white;
	border:1px solid #D8D8D8;
	padding:7px;
	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	font-size: 12px;
	width:178px;
	margin-top:3px;
	margin-left:3px;
	

}
/*이미지 슬라이더 CSS*/
.jeonga_imageSlides_img{
	width:168.25px;
	height:168.25px;
	margin:0;
	padding:0;
}

.joenga_profile_imageslider_one {
	padding:1% 2%;
 	position: absolute;
 	width:673.25px;
 	height:168.25px;
 	margin-left:380px;
 	
}
.jeonga_imageSlides_buttons_one{
	width:673.25px;
	height:168.25px;
	/*visibility:hidden;*/
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}
/* Hide the images by default*/ 
.jeonga_imageSlides_one {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:673.25px;
	height:168.25px;
	padding:0;
 
}

#jeonga_imageSlides1_one {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:673.25px;
	height:168.25px;
}


/* Next & previous buttons */
.jeonga_imageSlides_one_prev {
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
.jeonga_imageSlides_one_next{
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
.jeonga_imageSlides_one_prev:hover, .jeonga_imageSlides_one_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
 opacity: 100;
}

/*이미지 슬라이더2 CSS*/
.jeonga_imageSlides_img{
	width:168.25px;
	height:168.25px;
	margin:0;
	padding:0;
}

.joenga_profile_imageslider_two {
	padding:1% 2%;
 	position: absolute;
 	width:673.25px;
 	height:168.25px;
 	margin-left:380px;
 	
}
.jeonga_imageSlides_buttons_two{
	width:673.25px;
	height:168.25px;
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
}

.jeonga_imageSlides_two {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:673.25px;
	height:168.25px;
	padding:0;
 
}

#jeonga_imageSlides1_two {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:673.25px;
	height:168.25px;
}


.jeonga_imageSlides_two_prev {
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
.jeonga_imageSlides_two_next{
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
.jeonga_imageSlides_two_prev:hover, .jeonga_imageSlides_two_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
  opacity: 100;
}

/*이미지 슬라이더3 CSS*/
.joenga_profile_imageslider_three {
	padding:1% 2%;
 	position: absolute;
 	width:673.25px;
 	height:168.25px;
 	margin-left:380px;
 	
}
.jeonga_imageSlides_buttons_three{
	width:673.25px;
	height:168.25px;
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}
.jeonga_imageSlides_three {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:673.25px;
	height:168.25px;
	padding:0;
 
}

#jeonga_imageSlides1_three {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:673.25px;
	height:168.25px;
}


.jeonga_imageSlides_three_prev {
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
.jeonga_imageSlides_three_next{
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
.jeonga_imageSlides_three_prev:hover, .jeonga_imageSlides_three_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
  opacity: 100;
}
/*이미지 슬라이더4 CSS*/
.joenga_profile_imageslider_four {
	padding:1% 2%;
 	position: absolute;
 	width:673.25px;
 	height:168.25px;
 	margin-left:380px;
 	
}
.jeonga_imageSlides_buttons_four{
	width:673.25px;
	height:168.25px;
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}
.jeonga_imageSlides_four {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:673.25px;
	height:168.25px;
	padding:0;
}

#jeonga_imageSlides1_four {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:673.25px;
	height:168.25px;
}


.jeonga_imageSlides_four_prev {
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
.jeonga_imageSlides_four_next{
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
.jeonga_imageSlides_four_prev:hover, .jeonga_imageSlides_four_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
 opacity: 100;
}

/*이미지 슬라이더5 CSS*/

.joenga_profile_imageslider_five {
	padding:1% 2%;
 	position: absolute;
 	width:673.25px;
 	height:168.25px;
 	margin-left:380px;
 	
}
.jeonga_imageSlides_buttons_five{
	width:673.25px;
	height:168.25px;
  	z-index:99;
  	display:flex;
  	justify-content: space-between;
  	position: absolute;
  	
}
.jeonga_imageSlides_five {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:80;
	width:673.25px;
	height:168.25px;
	padding:0;
 
}

#jeonga_imageSlides1_five {
	display:flex;
	justify-content: space-between;
	position:relative;
	z-index:20;
	width:673.25px;
	height:168.25px;
}


.jeonga_imageSlides_five_prev {
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
.jeonga_imageSlides_five_next{
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
.jeonga_imageSlides_five_prev:hover, .jeonga_imageSlides_five_next:hover{
  background-color: rgba(0, 0, 0, 0.8);
  color:white;
  opacity: 100;
} 
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
//좋아하는 작가 확인
 $(document).ready(function(){
	 $('.jeonga_profile_button_add').click(LikeWriterFunction);
	
 });

LikeWriterFunction = function(){
		
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
		}
		
		else{
			var $data = $(this).next().text();
			console.log($data);
			var writerCode = $data;
			var option = '좋아하는작가';
		
			var addButton = $(this);
			var tf;
			var text = $(this).text();
			console.log(text);


 		if(text == '♥︎작가로추가'){
			$(this).text('♥︎하는작가');
			$(this).css("color","white");
			$(this).css("border","1px solid #DF3A01");
			$(this).css("background-color","#DF3A01");
			tf = true;
		}
 		else{
			$(this).text('♥︎작가로추가');
			$(this).css("color","#DF3A01");
			$(this).css("border","1px solid #D9D9D9");
			$(this).css("background-color","white");
			tf = false;
		} 

		 $.ajax({
			url:'/bomulsum/user/likeWriter.do',
			data:{
				'member':memberCode,
				'option':option,
				'optionCode':writerCode,
				'bool': tf
			},
			type:'POST',
			success:function(data){
			},
			error:function(e){
				console.log(e);
			}
		}); 
 	 	if(tf==true){
			alert('좋아하는 작가에 추가되었습니다.');
		}
	 	if(tf==false){
			alert('좋아하는 작가를 취소합니다.');
		} 
	 
		}
};



var slideIndex = 0;
showSlides(slideIndex);

function plusSlides_one(n) {
  var slides1 = document.getElementById("jeonga_imageSlides1_one");
  slides1.style.display="none";
  showSlides(slideIndex += n);
}

function plusSlides_two(n) {
	  var slides1 = document.getElementById("jeonga_imageSlides1_two");
	  slides1.style.display="none";
	  showSlides_two(slideIndex += n);
}

function plusSlides_three(n) {
	  var slides1 = document.getElementById("jeonga_imageSlides1_three");
	  slides1.style.display="none";
	  showSlides_three(slideIndex += n);
}

function plusSlides_four(n) {
	  var slides1 = document.getElementById("jeonga_imageSlides1_four");
	  slides1.style.display="none";
	  showSlides_four(slideIndex += n);
}
function plusSlides_five(n) {
	  var slides1 = document.getElementById("jeonga_imageSlides1_five");
	  slides1.style.display="none";
	  showSlides_five(slideIndex += n);
} 
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("jeonga_imageSlides_one");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  slides[slideIndex-1].style.display = "block";

}
function showSlides_two(n) {
	  var i;
	  var slides = document.getElementsByClassName("jeonga_imageSlides_two");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  slides[slideIndex-1].style.display = "block";
}

function showSlides_three(n) {
	  var i;
	  var slides = document.getElementsByClassName("jeonga_imageSlides_three");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  slides[slideIndex-1].style.display = "block";

}
function showSlides_four(n) {
	  var i;
	  var slides = document.getElementsByClassName("jeonga_imageSlides_four");
	  if (n > slides.length) {slideIndex = 1}
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";
	  }
	  slides[slideIndex-1].style.display = "block";

}
function showSlides_five(n) {
	  var i;
	  var slides = document.getElementsByClassName("jeonga_imageSlides_five");
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
	<%@ include file="../include/uHeader.jsp"  %>
	<div class="uPopularWriterWrap">
		<!-- 배너 헤더 -->
		<div class="jeonga_title_img">
      	<h1>인기작가</h1>
      	<div></div>
     	<p>많은 사람들의 인기를 받고있는 작가님을 소개합니다.</p>
   		</div>
   		
   		<!-- 콘텐츠 -->
   		<div class="jeonga_artist_wrap">
   			<!-- 좋아하는 작가 목록 -->
			<ul class="jeonga_artist_list">

				<!-- 1등 -->
				<li class="jeonga_artist_list_item">
					<!-- 작가 프로필  -->
					<div class="jeonga_profile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_profile_split_img">
							<div class="jeonga_profile_rank">
									<img src="<c:url value='/resources/img/1.png'/>" style="width:150px; height:150px">
							</div>
							<div class="jeonga_profile_image">
							<a href="/bomulsum/writerhome/${rank1.writer_url}.do" target="#" class="jeonga_profile_image_link">
								<c:if test="${rank1.writer_profile_img eq null}">
									<img class="jeonga_profileImage" src="<c:url value='/resources/img/test.png'/>" style="width:100px; height:100px">
							 	</c:if>
							 	<c:if test="${rank1.writer_profile_img ne null}">
									<img class="jeonga_profileImage" src="<c:url value='/upload/${rank1.writer_profile_img}'/>" style="width:100px; height:100px">
							 	</c:if>
							 </a></div>
						</div>
						<div class="jeonga_profile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_profile_content">
							<a href="/bomulsum/writerhome/${rank1.writer_url}.do" class="jeonga_profile_title" target="">${rank1.writer_brand_name}</a>
							<p class="jeonga_profile_text">${rank1.writer_intro}</p>
							<div class="jeonga_profile_buttons">
								<div class="jeonga_profile_buttons_top">
									<c:if test="${rank1.likeWriter eq 'yes'}">
										<div class="jeonga_profile_button_add" style="border:1px solid #DF3A01; background-color:#DF3A01;color:white;">♥︎하는작가</div>
									</c:if>
									<c:if test="${rank1.likeWriter eq null}">
										<div class="jeonga_profile_button_add" style="border:1px solid #D8D8D8;color:#DF3A01;">♥︎작가로추가	</div>
									</c:if>
								<div style="display:none">${rank1.writer_code_seq}</div>
									<div id="jeonga_profile_writer_home">
									<a class="jeonga_profile_button" href="/bomulsum/writerhome/${rank1.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_profile_message">
									<a href="/bomulsum/user/message.do?writer=${rank1.writer_code_seq}" class="jeonga_profile_button">메시지 보내기</a>
									<div id="jeonga_wprofile_code" style="display:none">${rank1.writer_code_seq}</div>
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
 					<div class="joenga_profile_imageslider_one">
					 	<div class="jeonga_imageSlides_buttons_one">
  						<a class="jeonga_imageSlides_one_prev" onclick="plusSlides_one(-1)">❮</a>
 						<a class="jeonga_imageSlides_one_next" onclick="plusSlides_one(1)">❯</a>
						</div>
						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1_one">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto4}'/>" >
  						</div>
						<!-- 슬라이드 한 세트 -->
					 	<div class="jeonga_imageSlides_one" style="display:none">
   							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto5}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto6}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto7}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto8}'/>" >
  						</div>		
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_one" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto9}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto10}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto11}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto12}'/>" >
  						</div>
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_one" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank1.artPhoto4}'/>" >
  						</div>
  					</div> 
				</div>
				</li>

		
		<!-- 2등 -->
				<li class="jeonga_artist_list_item">
					<!-- 작가 프로필  -->
					<div class="jeonga_profile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_profile_split_img">
							<div class="jeonga_profile_rank">
									<img src="<c:url value='/resources/img/2.png'/>" style="width:150px; height:150px">
							</div>
							<div class="jeonga_profile_image">
							<a href="/bomulsum/writerhome/${rank2.writer_url}.do" target="#" class="jeonga_profile_image_link">
								<c:if test="${rank2.writer_profile_img eq null}">
									<img class="jeonga_profileImage" src="<c:url value='/resources/img/test.png'/>" style="width:100px; height:100px">
							 	</c:if>
							 	<c:if test="${rank2.writer_profile_img ne null}">
									<img class="jeonga_profileImage" src="<c:url value='/upload/${rank2.writer_profile_img}'/>" style="width:100px; height:100px">
							 	</c:if>
							 </a></div>
						</div>
						<div class="jeonga_profile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_profile_content">
							<a href="/bomulsum/writerhome/${rank2.writer_url}.do" class="jeonga_profile_title" target="">${rank2.writer_brand_name}</a>
							<p class="jeonga_profile_text">${rank2.writer_intro}</p>
							
							<div class="jeonga_profile_buttons">
								<div class="jeonga_profile_buttons_top">
									<c:if test="${rank2.likeWriter eq 'yes'}">
									<div class="jeonga_profile_button_add" style="border:1px solid #DF3A01; background-color:#DF3A01;color:white;">♥︎하는작가</div>
									</c:if>
									<c:if test="${rank2.likeWriter eq null}">
									<div class="jeonga_profile_button_add" style="border:1px solid #D8D8D8;color:#DF3A01;">♥︎작가로추가</div>
									</c:if>
									<div style="display:none">${rank2.writer_code_seq}</div>
									<div id="jeonga_profile_writer_home">
									<a class="jeonga_profile_button" href="/bomulsum/writerhome/${rank2.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_profile_message">
									<a href="/bomulsum/user/message.do?writer=${rank2.writer_code_seq}" class="jeonga_profile_button">메시지 보내기</a>
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
					<div class="joenga_profile_imageslider_two">
					 	<div class="jeonga_imageSlides_buttons_two">
  						<a class="jeonga_imageSlides_two_prev" onclick="plusSlides_two(-1)">❮</a>
 						<a class="jeonga_imageSlides_two_next" onclick="plusSlides_two(1)">❯</a>
						</div>
						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1_two">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto4}'/>" >
  						</div>
						<!-- 슬라이드 한 세트 -->
					 	<div class="jeonga_imageSlides_two" style="display:none">
   							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto5}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto6}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto7}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto8}'/>" >
  						</div>		
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_two" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto9}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto10}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto11}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto12}'/>" >
  						</div>
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_two" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank2.artPhoto4}'/>" >
  						</div>
  					</div> 
				</div>
				</li>
				<!-- 3등 -->
				<li class="jeonga_artist_list_item">
					<!-- 작가 프로필  -->
					<div class="jeonga_profile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_profile_split_img">
							<div class="jeonga_profile_rank">
									<img src="<c:url value='/resources/img/3.png'/>" style="width:147px; height:147px;">
							</div>
							<div class="jeonga_profile_image1">
							<a href="/bomulsum/writerhome/${rank3.writer_url}.do" target="#" class="jeonga_profile_image_link">
								<c:if test="${rank3.writer_profile_img eq null}">
									<img class="jeonga_profileImage" src="<c:url value='/resources/img/test.png'/>" style="width:100px; height:100px">
							 	</c:if>
							 	<c:if test="${rank3.writer_profile_img ne null}">
									<img class="jeonga_profileImage" src="<c:url value='/upload/${rank3.writer_profile_img}'/>" style="width:100px; height:100px">
							 	</c:if>
							 </a></div>
						</div>
						<div class="jeonga_profile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_profile_content">
							<a href="/bomulsum/writerhome/${rank3.writer_url}.do" class="jeonga_profile_title" target="">${rank3.writer_brand_name}</a>
							<p class="jeonga_profile_text">${rank3.writer_intro}</p>
							
							<div class="jeonga_profile_buttons">
								<div class="jeonga_profile_buttons_top">
									<c:if test="${rank3.likeWriter eq 'yes'}">
										<div class="jeonga_profile_button_add" style="border:1px solid #DF3A01; background-color:#DF3A01;color:white;">♥︎하는작가</div>
									</c:if>
									<c:if test="${rank3.likeWriter eq null}">
										<div class="jeonga_profile_button_add" style="border:1px solid #D8D8D8;color:#DF3A01;">♥︎작가로추가</div>
									</c:if>
										<div style="display:none">${rank3.writer_code_seq}</div>
									<div id="jeonga_profile_writer_home">
									<a class="jeonga_profile_button" href="/bomulsum/writerhome/${rank3.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_profile_message">
									<a href="/bomulsum/user/message.do?writer=${rank3.writer_code_seq}" class="jeonga_profile_button">메시지 보내기</a>
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
					<div class="joenga_profile_imageslider_three">
					 	<div class="jeonga_imageSlides_buttons_three">
  						<a class="jeonga_imageSlides_three_prev" onclick="plusSlides_three(-1)">❮</a>
 						<a class="jeonga_imageSlides_three_next" onclick="plusSlides_three(1)">❯</a>
						</div>
						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1_three">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto4}'/>" >
  						</div>
						<!-- 슬라이드 한 세트 -->
					 	<div class="jeonga_imageSlides_three" style="display:none">
   							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto5}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto6}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto7}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto8}'/>" >
  						</div>		
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_three" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto9}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto10}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto11}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto12}'/>" >
  						</div>
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_three" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank3.artPhoto4}'/>" >
  						</div>
  					</div> 
				</div>
				</li>
				<!-- 4등 -->
				<li class="jeonga_artist_list_item">
					<!-- 작가 프로필  -->
					<div class="jeonga_profile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_profile_split_img">
							<div class="jeonga_profile_rank">
									<img src="<c:url value='/resources/img/3.png'/>" style="width:147px; height:147px;">
							</div>
							<div class="jeonga_profile_image1">
							<a href="/bomulsum/writerhome/${rank4.writer_url}.do" target="#" class="jeonga_profile_image_link">
								<c:if test="${rank4.writer_profile_img eq null}">
									<img class="jeonga_profileImage" src="<c:url value='/resources/img/test.png'/>" style="width:100px; height:100px">
							 	</c:if>
							 	<c:if test="${rank4.writer_profile_img ne null}">
									<img class="jeonga_profileImage" src="<c:url value='/upload/${rank4.writer_profile_img}'/>" style="width:100px; height:100px">
							 	</c:if>
							 </a></div>
						</div>
						<div class="jeonga_profile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_profile_content">
							<a href="/bomulsum/writerhome/${rank4.writer_url}.do" class="jeonga_profile_title" target="">${rank4.writer_brand_name}</a>
							<p class="jeonga_profile_text">${rank4.writer_intro}</p>
							
							<div class="jeonga_profile_buttons">
								<div class="jeonga_profile_buttons_top">
									<c:if test="${rank4.likeWriter eq 'yes'}">
										<div class="jeonga_profile_button_add" style="border:1px solid #DF3A01; background-color:#DF3A01;color:white;">♥︎하는작가</div>
									</c:if>
									<c:if test="${rank4.likeWriter eq null}">
										<div class="jeonga_profile_button_add" style="border:1px solid #D8D8D8;color:#DF3A01;">♥︎작가로추가</div>
									</c:if>
										<div style="display:none">${rank4.writer_code_seq}</div>
									<div id="jeonga_profile_writer_home">
									<a class="jeonga_profile_button" href="/bomulsum/writerhome/${rank4.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_profile_message">
									<a href="/bomulsum/user/message.do?writer=${rank4.writer_code_seq}" class="jeonga_profile_button">메시지 보내기</a>
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
					<div class="joenga_profile_imageslider_four">
					 	<div class="jeonga_imageSlides_buttons_four">
  						<a class="jeonga_imageSlides_four_prev" onclick="plusSlides_four(-1)">❮</a>
 						<a class="jeonga_imageSlides_four_next" onclick="plusSlides_four(1)">❯</a>
						</div>
						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1_four">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto4}'/>" >
  						</div>
						<!-- 슬라이드 한 세트 -->
					 	<div class="jeonga_imageSlides_four" style="display:none">
   							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto5}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto6}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto7}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto8}'/>" >
  						</div>		
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_four" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto9}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto10}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto11}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto12}'/>" >
  						</div>
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_four" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank4.artPhoto4}'/>" >
  						</div>
  					</div> 
				</div>
				</li>
				<!-- 5등 -->
				<li class="jeonga_artist_list_item1">
					<!-- 작가 프로필  -->
					<div class="jeonga_profile">
						<!-- 작가 프로필 사진 -->
						<div class="jeonga_profile_split_img">
							<div class="jeonga_profile_rank">
									<img src="<c:url value='/resources/img/3.png'/>" style="width:147px; height:147px;">
							</div>
							<div class="jeonga_profile_image1">
							<a href="/bomulsum/writerhome/${rank5.writer_url}.do" target="#" class="jeonga_profile_image_link">
								<c:if test="${rank5.writer_profile_img eq null}">
									<img class="jeonga_profileImage" src="<c:url value='/resources/img/test.png'/>" style="width:100px; height:100px">
							 	</c:if>
							 	<c:if test="${rank5.writer_profile_img ne null}">
									<img class="jeonga_profileImage" src="<c:url value='/upload/${rank5.writer_profile_img}'/>" style="width:100px; height:100px">
							 	</c:if>
							 </a></div>
						</div>
						<div class="jeonga_profile_split">
						<!-- 작가 프로필 내용 -->
							<div class="jeonga_profile_content">
							<a href="/bomulsum/writerhome/${rank5.writer_url}.do" class="jeonga_profile_title" target="">${rank5.writer_brand_name}</a>
							<p class="jeonga_profile_text">${rank5.writer_intro}</p>
							
							<div class="jeonga_profile_buttons">
								<div class="jeonga_profile_buttons_top">
									<c:if test="${rank5.likeWriter eq 'yes'}">
										<div class="jeonga_profile_button_add" style="border:1px solid #DF3A01; background-color:#DF3A01;color:white;">♥︎하는작가</div>
									</c:if>
									<c:if test="${rank5.likeWriter eq null}">
										<div class="jeonga_profile_button_add" style="border:1px solid #D8D8D8;color:#DF3A01;">♥︎작가로추가</div>
									</c:if>
									<div style="display:none">${rank5.writer_code_seq}</div>
									<div id="jeonga_profile_writer_home">
									<a class="jeonga_profile_button" href="/bomulsum/writerhome/${rank5.writer_url}.do">작가홈</a>
									</div>
								</div>
								<div id="jeonga_profile_message">
									<a href="/bomulsum/user/message.do?writer=${rank5.writer_code_seq}" class="jeonga_profile_button">메시지 보내기</a>
								</div>
							</div>
							</div>
						</div>

					<!-- 이미지 슬라이더 -->
					<div class="joenga_profile_imageslider_five">
					 	<div class="jeonga_imageSlides_buttons_five">
  						<a class="jeonga_imageSlides_five_prev" onclick="plusSlides_five(-1)">❮</a>
 						<a class="jeonga_imageSlides_five_next" onclick="plusSlides_five(1)">❯</a>
						</div>
						<!-- 슬라이드 기본 세트 -->
  						<div id="jeonga_imageSlides1_five">
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto4}'/>" >
  						</div>
						<!-- 슬라이드 한 세트 -->
					 	<div class="jeonga_imageSlides_five" style="display:none">
   							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto5}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto6}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto7}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto8}'/>" >
  						</div>		
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_five" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto9}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto10}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto11}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto12}'/>" >
  						</div>
  						<!-- 슬라이드 한 세트 -->	
  						<div class="jeonga_imageSlides_five" style="display:none" >
							<img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto1}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto2}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto3}'/>" ><img class="jeonga_imageSlides_img" src="<c:url value='/upload/${rank5.artPhoto4}'/>" >
  						</div>
  					</div> 
				</div>
				</li>

			</ul>
		</div>
	</div>
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
</html>