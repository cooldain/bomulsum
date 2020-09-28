<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 작가홈</title>

<style type="text/css">

body a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	border: none;
}

/*민우 css 시작*/
.minwoo_writer_main{
	width:1100px;
	margin:auto;
	padding-bottom:50px;
	display:flex;
}


.minwwo_writer_side{
	width:150px;
	height:480px;
	padding:32px 16px 16px;
	border:1px solid #d9d9d9;
	border-top:none;
}

.minwwo_writer_side hr{
	border:0px;
	background-color: #d9d9d9;
	height:3px;
}

.minwoo_writer_profile{
	 width:150px;
	 /* height:260px; */
	 padding-bottom: 10px;
}

.minwoo_writer_profile_img{
	width:96px;
	height:96px;
	margin:0 auto;
}

.minwoo_writer_profile_img_bg{
	position:relative;
	width:100%;
	height:100%;
	margin:0 auto;
}

.minwoo_writer_profile_img_bg img{
	 position:absolute;
	 width:100%;
	 height:100%;
	 border-radius:50%;
	 /* border:1px solid black; */
}

.minwoo_writer_profile_name{
	 width:100%;
/* 	 height:40px; */
	 margin-top:15px;
	 margin-bottom:10px;
	 text-align:center;
	 font-size:15px;
}

.minwoo_writer_profile_name a{
	text-decoration: none;
}

.minwoo_writer_profile_sayhello{
	 width:100%;
	 margin-left:auto;
	 margin-right:auto;
	 text-align: center;
	 font-size: 13px;
	 color:#848484;
}

.minwoo_writer_profile_buttons{
	display:flex;
	flex-direction:column;
	margin:5px 0px;
	padding: 10px 0px;
	border-bottom:1px solid #d9d9d9;
	border-top: 1px solid #d9d9d9;
}

.minwoo_writer_profile_buttons button{
	 background-color:white;
	 width: 150px;
	 padding:5px 0px;
	 margin:5px 0px;
	 align: left;
	 border:1px solid #d9d9d9;
	 cursor: pointer;
	 outline: none;
	 border-radius: 2px;
	 font-size: 12px;
}

.minwoo_writer_profile_activity{
	 margin-top:15px;
	 margin-bottom:10px;
	 font-weight:bold;
	 font-size:12px;
	 width:100%;
}

.minwoo_writer_profile_activity_table{
	font-size:11px;
	width:100%;
	color:#848484;
}

.minwoo_writer_profile_activity_table td:nth-child(2){
	 text-align:right;
	 text-decoration: none;
}

.minwwo_writer_saleplace{
	width:860px;
	margin-left:20px;
}

.minwwo_writer_saleplace_header{
	width:100%;
	/* display:flex;
	align-items:center; */
}

.minwwo_writer_saleplace_header_form{
	font-size:12px;
	line-height:50px;
	width:100%;
}

.minwoo_writer_saleplace_header_form_input{
	width:160px;
	height:30px;
	border:1px solid #848484;
	border-radius:3px;
}

.minwwo_writer_saleplace_body{
	widht:100%;
	display:flex;
	flex-wrap:wrap;
}

/*우영이 CSS 영역 시작*/
.article{
   margin-top: 16px;
   margin-left: 8px;
   margin-right: 8px;
   width:196px;
   border: 1px solid #d9d9d9;
   border-radius:4px;
   background-color:#f8f9fb;
}

.article_img{
   display:flex;
   flex-direction: column;
   width:196px;
   height:196px;
   background-size:196px 196px;
   border-radius:4px;
   background-repeat: no-repeat;
}

.article_img i{
    font-size: 20px;
    align-self: flex-end;
    margin: 5%;
    color: gray;
    -webkit-text-stroke-width: 1px;
    -webkit-text-stroke-color: white;
}

.article_detail{
   padding: 8px 10px;
   height:90px;
   justify-content: flex-start;
   display:flex;
   flex-direction: column;
   border-bottom:1px solid #d9d9d9;
   font-size:12px;
}

.article_detail a{
   hegith:15px;
   font-size:12px;
   color:#999;
   margin-bottom:4px;
}

.article_detail span{
   font-size:14px;
   height:42px
}

.article_grade{
   font-size:12px;
   display:flex;
   flex-direction:column;
   padding-left:10px;
   padding-top:10px;
   padding-bottom:5px;
/*    align-items: flex-start; */
}

.article_grade span{
   color:#999;
}

.article_grade_text{
	display:flex;
	flex-direction: row;
	align-items: center;
}
.article_grade_comments{
	color:#6E6E6E;
	padding-top:3px;
}

.dain_ptag{
	margin: 0px;
	height: 50px;
	overflow: auto;
	font-size: 12px;
}

.dain_ptag::-webkit-scrollbar {
    width: 10px;
  }
  
.dain_ptag::-webkit-scrollbar-thumb {
    background-color: white;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
.dain_ptag::-webkit-scrollbar-track {
    background-color: #d9d9d9;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
/*우영이 CSS 영역 종료*/

.dain_artimg{
	width:196px; 
	height: 196px; 
	background-color: white;
}
.minwoo_starRev{
	display:flex;
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
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
//공유하기기능 - 클립보드에 복사
function CopyUrlToClipboard()
{
	var obShareUrl = document.getElementById("ShareUrl");
	obShareUrl.value = window.document.location.href;  // 현재 URL 세팅
	obShareUrl.select();  // 해당 값이 선택되도록 select() 
	document.execCommand("copy"); // 클립보드에 복사
	obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈
	alert("작가님 URL이 복사되었습니다.\n원하는 곳에 붙여넣기(Ctrl+V) 해주세요."); 
}


//좋아하는 작품 추가
var memberCode = '<%= (String)session.getAttribute("member") %>';
var likeArticleFunc;
var categoryOptionFunc;
var ajaxFilterFunc;
var option = '좋아하는작품';
var writerCode = '${writerCode}';
var likeArtist = ${likeArtist};


$(function(){

	console.log(likeArtist);
	
  	//이미 관심작품 해둔거 반영
/* 	var wishData = ${wishArt};
	if(wishData != null){
		for(var i=0; i<wishData.length; i++){
			wishData[i].style.color="#d64640";
		} 
	}  */
	
	//이미 좋아하는 작가 해둔거 반영
	if(likeArtist > 0){ //좋아하는 작가일때
		$('#addArtistBtn').css("background-color", "#DF3A01"); //배경 red
		$('#addArtistBtn').css("color", "white"); //폰트컬러 white
		$('#addArtistBtn').html('♥ 하는 작가');
	} else{ //좋아하는 작가가 아닐때
		$('#addArtistBtn').css("background-color", "white"); 
		$('#addArtistBtn').css("color", "black"); 
		$('#addArtistBtn').html('♥ 작가 추가');
	}

	//관심작품(별 아이콘) 눌렀을때 함수 
	likeArticleFunc = function(e){
		e.stopPropagation();
		var clicked_id = $(this).attr('id');
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		} 
		
		console.log(clicked_id); //클릭한거 id값(작품코드) 받아옴
		
		//관심작품 추가
		if($('#'+clicked_id).css('color') == "rgb(128, 128, 128)"){
			$('#'+clicked_id).css("color", "#d64640"); //red
			tORf = true;
		//관심작품 해제
		}else{
			$('#'+clicked_id).css("color", "gray");
			tORf = false;
		}
		
		$.ajax({
			url:'/bomulsum/writerhome/wishart.do',
			data:{
				'member':memberCode,
				'option':option,
				'optionCode':clicked_id,
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

	}; 
	
	
	
//좋아하는 작가 추가
likeArtistFunc = function(clicked_id){
	if(memberCode == null || memberCode == 'null'){
		alert('로그인이 필요한 서비스입니다.');
		location.href='/bomulsum/user/login.do';
		return;
		} 
	
	console.log($('#addArtistBtn').css('background-color'));
	//관심작가 추가
	if($('#addArtistBtn').css('background-color') == 'rgb(255, 255, 255)'){
		console.log('화이트');
		$('#addArtistBtn').css("background-color", "#DF3A01"); //배경 red
		$('#addArtistBtn').css("color", "white"); //폰트컬러 white
		$('#addArtistBtn').html('♥ 하는 작가');
		addLike = true;
	//관심작가 해제
	}else{
		$('#addArtistBtn').css("background-color", "white");
		$('#addArtistBtn').css("color", "black"); 
		$('#addArtistBtn').html('♥ 작가 추가');
		addLike = false;
	}
	
 	$.ajax({
		url:'/bomulsum/writerhome/wishartist.do',
		data:{
			'member':memberCode,
			'option':'좋아하는작가',
			'optionCode':writerCode,
			'bool': addLike
		},
		type:'POST',
		success:function(data){
			
		},
		error:function(e){
			console.log(e);
		}
	});  
	
	if(addLike){
		alert('좋아하는 작가로 추가되었습니다.');
	}else{
		alert('해제되었습니다.');
	}
	
	};
});
</script>
</head>
<body>
<div>
	<%@ include file="include/uHeader.jsp"  %>
	
	<!-- 작가 홈 메인 영역 시작 -->
	<div class="minwoo_writer_main">

		<!-- 작가 사이드 영역 시작 -->
		<div class="minwwo_writer_side">			
			
			<!-- 작가 프로필 영역 시작-->
			<div class="minwoo_writer_profile">				
				<!-- 프로필 사진 영역 시작-->
				<div class="minwoo_writer_profile_img">
					<div class="minwoo_writer_profile_img_bg">
						<img src="<c:url value='/upload/${writerProfileImg}'/>">
					</div>
				</div>
				<!-- 프로필 사진 영역 종료 -->
				<!-- 작가명 시작-->
				<div class="minwoo_writer_profile_name">
					<a href="#">
						<span>${writerBrandName}</span>
					</a>
				</div>
				<!-- 작가명 종료 -->
				<!-- 작가 인사말?영역 시작 -->
				<div class="minwoo_writer_profile_sayhello">
					<p class="dain_ptag">${writerIntro}</p>
				</div>
				<!-- 작가 인사말?영역 종료 -->
			</div>
			<!-- 작가 프로필 영역 종료-->
			
			
			<!-- 버튼들 영역 시작-->
			<div class="minwoo_writer_profile_buttons">
				<button id="addArtistBtn" onclick = "likeArtistFunc()">♥ 작가 추가</button>
				<button id="${writerCode }" class="writer_message">메시지</button>
				<!-- <button>후원하기</button> -->
				<button onclick="javascript:CopyUrlToClipboard()">공유하기</button>
				<input type="text" id = "ShareUrl" style="color: white; max-height: 0px; border:none; cursor: default;">
			</div>
			<!-- 버튼들 영역 종료 -->

			<!-- 작가 활동 정보 영역 시작 -->
			<div  class="minwoo_writer_profile_activity">
				<p>활동정보</p>
				<table class="minwoo_writer_profile_activity_table">
					<tr><td>좋아하는 사람</td><td>${addLikes}명</td></tr>
					<tr><td>판매중인 작품</td><td>${salesArtCount}개</td></tr>
					<tr><td>구매후기</td><td>${reviewTotal}개</td></tr>
				</table>
			</div>
			<!-- 작가 활동 정보 영역 종료 -->

		</div>
		<!-- 작가 사이드 영역 종료 -->
		
		<!-- 작품 판매 영역 시작 -->
		<div class="minwwo_writer_saleplace">
		
			<!-- 헤더 영역 시작 -->
			<div class="minwwo_writer_saleplace_header">
				<h4 style=" color: #666666; margin-bottom: 10px; padding-bottom:10px; width: 100%;
				border-bottom: 1px solid #d9d9d9">${writerBrandName} 작가의 판매중인 작품</h4>
			<!-- 	<div style="float:right;">
					<form class="minwwo_writer_saleplace_header_form">
						<input type="text" name="" placeholder="작가님의 작품 검색" class="minwoo_writer_saleplace_header_form_input">
						<button type="submit" style="background-color:#1f76bb; border:1px solid #2E64FE;
	 							border-radius:3px; color:white; width:60px; height:32px;">검색</button>
					</form>
				</div> -->
			</div>
			<!-- 헤더 영역 종료 -->
		
			<!-- 작품들 영역 시작 -->
			<div class="minwwo_writer_saleplace_body">
			
			<c:forEach var="i" items="${artlist}" varStatus="status">
				<div id="${i.art_code_seq }" onclick="artCode(this)" class="article" style="cursor: pointer;">
					<div class="article_img" style="background-image: url('<c:url value='/upload/${artImg[status.index]}'/>')">
						<%-- <i class="fa fa-star fs" id="${i.art_code_seq}" style="cursor: pointer;"></i> --%>
					  <%-- <img class="dain_artimg" src="<c:url value='/upload/${artImg[status.index]}'/>" > --%>
					</div>
					<div class="article_detail">
						<a>${i.art_category}</a>
						<span>${i.art_name}</span>
						<span style="color:red;">
							[<fmt:formatNumber value="${1- (i.art_discount div i.art_price)}" type="percent"/>]
							<fmt:formatNumber value="${i.art_discount}" pattern="#,###" />원
							<span style="font-size:11px; color:#848484;"><del>
							<fmt:formatNumber value="${i.art_price}" pattern="#,###" />원</del></span>
						</span>
					</div>
					<div class="article_grade">
						<div class="minwoo_starRev" data-rate="${i.reviewStar }">
							<span class="minwoo_starR1">별1_왼쪽</span> <span class="minwoo_starR2">별1_오른쪽</span>
							<span class="minwoo_starR1">별2_왼쪽</span> <span class="minwoo_starR2">별2_오른쪽</span>
							<span class="minwoo_starR1">별3_왼쪽</span> <span class="minwoo_starR2">별3_오른쪽</span>
							<span class="minwoo_starR1">별4_왼쪽</span> <span class="minwoo_starR2">별4_오른쪽</span>
							<span class="minwoo_starR1">별5_왼쪽</span> <span class="minwoo_starR2">별5_오른쪽</span>
							<span>(<a>${i.reviewTotal }</a>)</span>
						</div>
					<!-- 	<div class="article_grade_comments">
							ㅠㅠ 좋아요...
						</div> -->
					</div>
				</div>
		
			</c:forEach>
			
		         
			</div>
			<!-- 작품들 영역 종료 -->
		</div>
		<!-- 작품 판매 영역 종료 -->
	</div>
	<!-- 작가 홈 메인 영역 종료 -->
	
	<%@ include file="include/uFooter.jsp" %>
</div>
</body>
<script>
var starRevPoint = $('.minwoo_starRev');
starRevPoint.each(function(){
	var targetScore = $(this).attr('data-rate');
	console.log(targetScore);
	$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
	$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
});

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}
$(function(){  
	$('.fs').click(likeArticleFunc);
	
	$('.writer_message').on('click',function(){
		var code = $(this).attr('id');
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		} else{
			location.href='/bomulsum/user/message.do?writer='+code;
		}
	});
});
</script>
</html>