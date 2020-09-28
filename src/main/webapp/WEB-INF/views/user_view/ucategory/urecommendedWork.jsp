<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 추천작품</title>
</head>
<style>
.dndud_title_img{
	display:flex;
	width:100%;
	height:210px;
	background-image: url("<c:url value='/resources/img/articles_head.png'/> ");
	background-repeat: no-repeat;
	background-size:100%;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.dndud_title_img h1{
	color:white;
}

.dndud_title_img div{
	height:2px;
	width:64px;
	margin-top:15px;
	margin-bottom:15px;
	background-color:white;
}

.dndud_title_img p{
	display:flex;
	justify-content:center;
	font-size:14px;
	color:white;
	width:100%;
}

.dndud_content{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items: center;
}

.articles{
	display:flex;
	flex-wrap:wrap;
	align-items:center;
	width:1073px;
	margin-top: 16px;
	margin-bottom: 30px;
}

.article{
	cursor:pointer;
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
	background-image: url("<c:url value='/resources/img/recommendedWork_img.PNG' /> ");
	width:196px;
	height:196px;
	background-size: 196px;
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
	height:96px;
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
	flex-direction: row;
	padding:8px 10px;
	justify-content: flex-start;
	align-items: center;
	height:18px;
}

.article_grade span:nth-last-child(1){
	display: flex;
    align-items: center;
    padding-left: 10px;
    color: #999;
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
<body>
<div>
	<%@ include file="../include/uHeader.jsp"  %>
	<div class="dndud_content">
		<div class="dndud_title_img">
			<h1>오늘의 추천작품</h1>
			<div></div>
			<p>보물섬이 추천하는 작품을 소개 드려요.</p>
		</div>
	
	
		
		<div class="articles">
			
		</div>
		
		
	</div>
	
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
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

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}

function getList(page){
	var category = $('.title').text();
	/* <div class="article">
		<div class="article_img">
			<i class="fa fa-star"></i>
		</div>
		<div class="article_detail">
			<a>CONVEY.G</a>
			<span>[3일할인][인기]차량용 우드불 디퓨저</span>
		</div>
		<div class="article_grade">
			<i class="fa fa-star" style="color:gold"></i>
			<i class="fa fa-star" style="color:gold"></i>
			<i class="fa fa-star" style="color:gold"></i>
			<i class="fa fa-star" style="color:gold"></i>
			<i class="fa fa-star" style="color:gold"></i>
			<span>(<a>3</a>)</span>
		</div>
	</div> */
	
	$.ajax({
		type:'POST',
		dataType : 'json',
		data:{
			'page':page,
			'member': memberCode,
			'methodName':'recommendWork'
		},
		url : '/bomulsum/category/InfoForHeadCategory.do',
		success :function(returnData){
			
			console.log(returnData);
			var data = returnData.data;
			var htmldiv = '';
			var writerName = '';
			var artImg = '';
			
			if(page == 1){
				$('.articles').html('');
			}
			
			if(returnData.startNum <= returnData.totalCnt){
				if(data.length > 0){
					// for
					for(var i=0; i<data.length; i++){
						if(data[i].writerBrandName == null){
							writerName = data[i].writerName;
						}else{
							writerName = data[i].writerBrandName;
						}
						artImg = data[i].artPhoto.split(',')[0];
						
						htmldiv += '<div class="article" onclick="artCode(this);" id="'+data[i].artCode+'"><div class="article_img" style="background-image : URL(\'/bomulsum/upload/'+ artImg +'\' );" >';
						
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
						
						htmldiv += '<input type="hidden" value="'+data[i].artCode+'"/></div><div class="article_detail">'
							+ '<a>' + writerName + '</a>' + '<span>' + data[i].artName + '</span></div><div class="article_grade">';
						
						if(data[i].articleReview.length==0){
							var review=0;
							var reviewCnt=0;
							htmldiv += '<div class=\"minwoo_starRev\" data-rate=\"'+ review +'\">'
							+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
							+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span>'
							+ '<span>(<a>'+ reviewCnt +'</a>)</span></div>';
						}else{
							var reviewCnt = data[i].articleReview.length;
							var review=0;
							for(var j=0; j<reviewCnt; j++){
								review += data[i].articleReview[j];
							}
							review = Math.round(review / reviewCnt);
							
							/* htmldiv += '<i class="fa fa-star" style="color:gold"></i><i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i><i class="fa fa-star" style="color:gold"></i><i class="fa fa-star" style="color:gold"></i>'
								+ '<span>(<a>3</a>)</span>'; */
							htmldiv += '<div class=\"minwoo_starRev\" data-rate=\"'+ review +'\">'
								+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span>'
								+ '<span>(<a>'+ reviewCnt +'</a>)</span></div>';
							
						}
														
						htmldiv += '</div></div>';
					}
					
				}else{
					//데이터 없을때.
				}
			}
			
			htmldiv = htmldiv.replace(/%20/gi, ' ');
			
			if(page == 1){
				$('.articles').html(htmldiv);
			}else{
				$('.articles').append(htmldiv);
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
	
	
	
	likeArticleFunc = function(e){
		e.stopPropagation();
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		
		var artCode = $(this).next().val();
		var option = '좋아하는작품';
		console.log(artCode);
		
		
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
}
</script>
</html>