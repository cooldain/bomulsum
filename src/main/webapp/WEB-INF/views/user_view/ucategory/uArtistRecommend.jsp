<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 작가님 추천</title>
</head>
<style>
.dain_main_category{
	width: 1073px;
	margin-left: auto;
	margin-right: auto;
}

.dain_main_category_title{
	margin-top:5%;
}

.dain_main_category_title .title{
	font-size:23px;
	font-weight:bold;
}

.dain_main_category_search_detail div{
	border:solid 1px #d9d9d9;
	border-radius: 2px;
	cursor:pointer;
	color:#666666;
	font-size: 13px;
	padding:0.5%;
}

.dain_main_category_search_detail select{
	width:10%;
}

.dain_main_category_search_detail select:focus{
	outline:none;
}

.dain_main_category_contents{
	margin-top: 3%;
	display:flex;
	width:100%;
	flex-wrap: wrap;
}

.dain_main_category_content_box{
	width:18.8%;
	margin-right:1%; 
	margin-bottom:2%; 
	height:380px;
	cursor:pointer;
	background-color: #f8f9fb;
    border: 1px solid #d9d9d9;
}

.dain_main_category_content_box:hover{
	box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
	transition: .5s;
}

.content_img{
	width: 100%;
	height: 50%;
	background-image: URL('../../resources/img/dog.jpg');
	background-repeat: no-repeat;
	background-size: 100%;
	display:flex;
	flex-direction: column;
}

.content_img i{
	font-size:30px;
	align-self:flex-end;
	margin:2%;
	color: gray;
	-webkit-text-stroke-width: 2px;
	-webkit-text-stroke-color: white;
}

.content_detail{
	display:flex;
	flex-direction: column;
	width:98%;
	padding:1%;
}

.content_detail_writer{
	color:#999999;
	font-size:14px;
	margin-bottom:1.5%;
}

.content_detail_title{
	color:#333333;
	font-size:15px;
	margin-bottom:1.5%;
}

.content_detail_price_decount{
	font-size:24px;
	color:#333333;
	margin-bottom:1%;
	font-weight:bold;
}

.content_detail_price_decount a:nth-child(1){
	color:#d64640;
}

.content_detail_price_orgin{
	margin-bottom:2%;
	color:#999999;
	font-size:14px;
	font-weight:bold;
	text-decoration: line-through;
	height:18px;
}

.content_detail_other{
	margin-bottom:4%;
	font-size:14px;
	font-weight:bold;
}

.content_detail_other span:nth-child(1){
	padding:1%;
	background-color: #e9f5ff;
	color: #0a91ff;
	margin:1%;
}

.content_detail_other span:nth-child(2){
	padding:1%;
	margin:1%;
	background-color: #e2fae6;
	color: #39af4d;
}

.content_detail_star span{
	color:#999999;
}

dain_main_category_title span:nth-child(2){

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
</style>
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	
	<div class="dain_main_category">
	
		<div class="dain_main_category_title">
			<span class="title">작가님 추천</span>
			<span style="font-size: 10px; font-weight:bold; margin-left:5px; color: #d9d9d9;">광고</span>
			
			<div class="dain_main_category_contents">
			
			</div>
		</div>
	</div>
	
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
var likeArticleFunc;

var page = 1;

$(function(){
	getList(page);
	page++;
});

$(window).scroll(function() {
    if ( Math.round($(window).scrollTop()) >= $(document).height() - $(window).height()) {
    	getList(page);
    	page++;
    }
});

function comma(x) { return !x ? '0' : x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") }

/* <div class="dain_main_category_content_box">
<div class="content_img">
	<i id="${i}bookmark" class="fa fa-star fs"></i>
</div>
<div class="content_detail">
	<span class="content_detail_writer">메종드미우</span>
	<span class="content_detail_title">Square Pearl Collar_Rose Pink</span>
	<span class="content_detail_price_decount"><a></a><a> 38,000</a> 원</span>
	<span class="content_detail_price_orgin"></span>
	<span class="content_detail_other">
		<span>무료배송</span>
	</span>
	<span class="content_detail_star">
		<i class="fa fa-star" style="color:gold"></i>
		<i class="fa fa-star" style="color:gold"></i>
		<i class="fa fa-star" style="color:gold"></i>
		<i class="fa fa-star" style="color:gold"></i>
		<i class="fa fa-star" style="color:gold"></i>
		<span>(<a>1252</a>)</span>
	</span>
</div>
</div> */

function getList(page){
	
	$.ajax({
		type:'POST',
		dataType : 'json',
		data:{
			'page':page,
			'methodName':'artistRecommend',
			'member':memberCode
		},
		url : '/bomulsum/category/InfoForHeadCategory.do',
		success :function(returnData){
			console.log(returnData.totalCnt);
			var htmldiv = '';
			var writerName = '';
			var artImg = '';
			var pricePer = 0;
			var data = returnData.data;
			console.log(returnData);
			if(page == 1){
				$('.dain_main_category_contents').html('');
			}
			if(returnData.startNum <= returnData.totalCnt){
				if(data.length > 0){
					// for
					for(var i=0; i<data.length; i++){
						console.log(data[i]);
						if(data[i].writerBrandName == null){
							writerName = data[i].writerName;
						}else{
							writerName = data[i].writerBrandName;
						}
						artImg = data[i].artPhoto.split(',')[0];
						
						pricePer = (data[i].artPrice - data[i].artDiscount) / data[i].artPrice * 100;
						
						htmldiv += '<div class="dain_main_category_content_box" onclick="artCode(this);" id="'+data[i].artCode+'">'
							+ '<input class="artCode" type="hidden" value="'+ data[i].artCode +'"/>'
							+ '<div class="content_img" style="background-image: URL(\'/bomulsum/upload/'
							+ artImg +'\' )">';
						var imsi = 0;
						for(var j=0; j<returnData.wishList.length; j++){
							if(data[i].artCode == returnData.wishList[j]){
								htmldiv += '<i class="fa fa-star fs" style="color:#d64640"></i>';
								imsi = 1;
								break;
							}
						}
						if(imsi == 0){
							htmldiv += '<i class="fa fa-star fs"></i>'; 
						}
							
						htmldiv += '</div><div class="content_detail">'
							+ '<span class="content_detail_writer">'+ writerName +'</span>'
							+ '<span class="content_detail_title">'+ data[i].artName +'</span>'
							+ '<span class="content_detail_price_decount">';
						
						if(pricePer != 0){
							htmldiv += '<a class="discount_price">'+ comma(Math.round(pricePer)) +'%  </a>'
								+ '<a>'+ comma(data[i].artDiscount) +'</a> 원</span>'
								+ '<span class="content_detail_price_orgin">'+ comma(data[i].artPrice) +'원</span>';
						}else{
							htmldiv += '<a>'+ comma(data[i].artDiscount) +'</a> 원</span>'
								+ '<span class="content_detail_price_orgin"></span>';
						}
						htmldiv += '<span class="content_detail_other">';
						if(data[i].writerSendPrice == 0){
							htmldiv += '<span>무료배송</span>';
						}else{
							htmldiv += '<span style="background-color:white"></span>';
						}
						
						if(data[i].articleReview.length==0){
							var review=0;
							var reviewCnt = 0;
							htmldiv += '</span><br><div class=\"minwoo_starRev\" data-rate=\"'+ review +'\">'
							+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span>'
							+ '<span style="font-size:14px; color:gray; margin-left: 10px;">('+ reviewCnt +')</span></div></div></div>';
						}else{
							var reviewCnt = data[i].articleReview.length;
							var review=0;
							for(var j=0; j<reviewCnt; j++){
								review += data[i].articleReview[j];
							}
							review = Math.round(review / reviewCnt);
							
							htmldiv	+= '</span><br><div class=\"minwoo_starRev\" data-rate=\"'+ review +'\">'
							+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span>'
							+ '<span style="font-size:14px; color:gray; margin-left: 10px;">('+ reviewCnt +')</span></div></div></div>';
						} 
					}// end for
				}else{
					//데이터 없을때.
				}
			}
			
			htmldiv = htmldiv.replace(/%20/gi, ' ');
			if(page == 1){
				$('.dain_main_category_contents').html(htmldiv);				
			}else{
				$('.dain_main_category_contents').append(htmldiv);
			}
			
			$(".fs").click(likeArticleFunc);
			
			var starRevPoint = $('.minwoo_starRev');
			starRevPoint.each(function(){
				var targetScore = $(this).attr('data-rate');
				console.log(targetScore);
				$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
				$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
			});
			
		},
		error:function(e){
			if(e.status == 300){
				alert('데이터를 가져오는데 실패했습니다.');
			};
		}
	});
}
function artCode(e){
		var art_code = e.id;
		var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
		window.open(url, "_blank");
}

$(function(){
	
	likeArticleFunc = function(e){
		e.stopPropagation();
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		
		var artCode = $(this).parent().prev().val();
		var option = '좋아하는작품';
		
		
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
	};
});
</script>
</html>