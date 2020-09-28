<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 검색</title>
</head>
<style>
.dndud_main_category{
	width: 1073px;
	margin-left: auto;
	margin-right: auto;
}

.dndud_main_category_title{
	margin-bottom:3%;
}

.dndud_main_category_title .title{
	font-size:23px;
	font-weight:bold;
}

.dndud_main_category_searchBox{
	font-size:13px;
	color:#333;
	margin-top:1px;
	display:flex;
	flex-direction:column;
	width:100%;
	border:1px solid #d9d9d9;
	margin-bottom:3%;
}


.dndud_main_category_searchBox span{
    display: flex;
    align-items: center;
	margin:1.5%;
	width:13%;
}

/* .dndud_main_category_searchBox category_option_list:nth-child(1){
	border-bottom:1px solid #f5f5f5;
} */

.dndud_main_category_searchBox div:nth-child(2) span:nth-child(2) a{
	font-size:13px;
	font-weight:bold;
	padding:1%;
	background-color: #e9f5ff;
    color: #0a91ff;
}

.dndud_main_category_searchBox div span:nth-child(1){
	color:#999;
}

.dndud_main_category_search_detail{
	display:flex;
	justify-content: space-between;
	flex-direction: row;
	margin-bottom:3%;
}

.dndud_main_category_search_detail div{
	border:none;
	border-radius: 2px;
	color:#FFFFFF;
	font-size: 13px;
	padding:0.5%;
}

.dndud_main_category_search_detail select{
	width:10%;
}

.dndud_main_category_search_detail select:focus{
	outline:none;
}

.dndud_main_category_contents{
	display:flex;
	width:100%;
	flex-wrap: wrap;
}

.dndud_main_category_content_box{
	width:19%;
	margin-right:1%; 
	margin-bottom:2%; 
	height:450px;
	cursor:pointer;
}

.dndud_main_category_content_box:hover{
	box-shadow:2px 2px 2px 2px #d9d9d9;
	transition: .5s;
}

.content_img{
	width: 100%;
	height: 50%;
	background-repeat: no-repeat;
	background-size: 100% auto;
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
	overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
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

.content_detail_price_decount .discount_price{
	color:#d64640;
}

.content_detail_price_orgin{
	margin-bottom:2%;
	color:#999999;
	font-size:14px;
	font-weight:bold;
	text-decoration: line-through;
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

.category_option_checkbox{
	cursor:pointer;
}

.category_option_selected{
	display:none;
	background-color:#f5f5f5;
}

.selected_option{
	display: inline-block;
    background: white;
    margin: 5px 1%;
    padding: 5px 0;
    border: 1px solid #d9d9d9;
    border-radius: 15px;
    font-size: 10px;
}

.selected_option_span{
	padding: 5px 10px;
}

.atag{
	cursor:pointer;
}

.category_option_list{
	display: flex;
    flex-direction: row;
    width: 100%;
    border-bottom: 1px solid #d9d9d9;
}

.category_option_list_2{
	display: flex;
    flex-direction: row;
    width: 100%;
}

.category_option_div{
	display: flex;
    flex-direction: row;
    width: 100%;
    font-size: 15px;
    font-weight: bold;
}

.category_option_div div:nth-child(1){
	border-right: 1px solid #d9d9d9;
}

.category_option_div span{
	margin: 2.5% 0;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.div_active{
    width: 50%;
    border: 0;
    display: flex;
    align-items: center;
    background-color: white;
}

.div_active a{
	color:#333333;
}

/* .div_active span{
	width: 100%;
	display: flex;
	align-items: center;
	margin: 0;
	justify-content: center;
} */

.div_active_none{
	cursor:pointer;
	width: 50%;
    border: 0;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #d9d9d9;
    background-color: #f5f5f5;
}

/* .div_active_none span{
	width: 100%;
    display: flex;
    align-items: center;
    margin: 0;
    justify-content: center;
} */

.dndud_class_content{
    width: 250px;
    border: 0.5px solid #D8D8D8;
    border-radius: 5px 5px 5px 5px;
    margin: 8.3px;
}

.dndud_class_content_location{
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

.dndud_class_content_star{
    margin: 1%;
    padding-left: 190px;
    position: absolute;
    z-index: 80;
}

.dndud_class_content_star i{
	font-size: 30px;
    align-self: flex-end;
    margin: 2%;
    color: gray;
    -webkit-text-stroke-width: 2px;
    -webkit-text-stroke-color: white;
}

.dndud_class_content_img, .dndud_class_card_text {
	cursor: pointer;
}

.dndud_class_content_img_link{
	position: relative;
    z-index: -1;
    margin: 0;
    padding: 0;
}

.dndud_class_content_detail{
	padding: 8px 10px;
}

.dndud_class_content_info{
    padding: 8px 10px;
}

.dndud_class_card_rating{
	padding: 10px;
}

.dndud_class_card_label span{
	color: #dd5850;
	font-size:12px;
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
	
	<div class="dndud_main_category">
	
		<div class="dndud_main_category_title">
			<div class="dndud_main_category_searchBox">
				<div class="category_option_div">
					<div id="art" class="div_active_none">
						<span>
							<a>"${param.headerSearch }"</a>
							에 대한 작품 검색결과
						</span>	
					</div>
					<div id="midas" class="div_active">
						<span>
							<a>"${param.headerSearch }"</a>
							에 대한 금손 클래스 검색결과
						</span>
					</div>
				</div>
				
			</div>
			
			
			<div class="dndud_main_category_contents">
			
				
				<%-- <c:forEach var="i" begin="0" end="70">
					<div class="dndud_main_category_content_box">
						<div class="content_img" style="background-image: URL('<c:url value="/resources/img/category_testimg.png"/> ')">
							<i class="fa fa-star fs"></i>
						</div>
						<div class="content_detail">
							<span class="content_detail_writer">작가명</span>
							<span class="content_detail_title">상품 이름</span>
							<span class="content_detail_price_decount"><a class="discount_price">할인가</a><a> 최종가</a> 원</span>
							<span class="content_detail_price_orgin">원가</span>
							<span class="content_detail_other">
								<span>무료배송</span><span>안전식품</span>
							</span>
							<span class="content_detail_star">
								<i class="fa fa-star" style="color:gold"></i>
								<i class="fa fa-star" style="color:gold"></i>
								<i class="fa fa-star" style="color:gold"></i>
								<i class="fa fa-star" style="color:gold"></i>
								<i class="fa fa-star" style="color:gold"></i>
								<span>(<a>후기 댓글 수</a>)</span>
							</span>
						</div>
					</div>
				</c:forEach>
				 --%>
				
			</div>
			
		</div>
	
	</div>
	
	<%@ include file="../include/uFooter.jsp" %>
</div>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
var word = '<%= (String)request.getParameter("headerSearch") %>';
var likeArticleFunc;
var artORclass = 'midas';
var option = '즐겨찾는클래스';
var page = 1;
var changeClass;
var movePage;


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


function getList(page){
	$.ajax({
		type:'POST',
		dataType : 'json',
		data:{
			'artORclass':artORclass,
			'word':word,
			'page':page,
			'member':memberCode
		},
		url : '/bomulsum/search/info.do',
		success :function(returnData){
			
			// 클래스 검색 결과 출력
			console.log(returnData);
			
			var htmldiv = '';
			var location = '';
			var midasImg = '';
			var pricePer = 0;
			var data = returnData.data;
			if(page == 1){
				$('.dndud_main_category_contents').html('');
			}
			if(returnData.startNum <= returnData.totalCnt){
				console.log('data');
				if(data.length > 0){	
					// for
					for(var i=0; i<data.length; i++){
						
						var address1 = data[i].midasAddress1.split(' ')[0];
						var address2 = data[i].midasAddress1.split(' ')[1];
						location = address1 + ' ' + address2;
						
						midasImg = data[i].midasImg.split(',')[0];
						
						htmldiv += '<div class="dndud_class_content"><div class="dndud_class_content_img">'
							+ '<input class="midasCodeSeq" type="hidden" value="'+ data[i].midasCodeSeq +'">'
							+ '<div class="dndud_class_content_location">'+ location +'</div><div class="dndud_class_content_star">';
							
						var imsi = 0;
						for(var j=0; j<returnData.wishList.length; j++){
							if(data[i].artCode == returnData.wishList[j]){
								htmldiv += '<i class="fa fa-star fs" aria-hidden="true" style="color:#d64640"></i>';
								imsi = 1;
								break;
							}
						}
						if(imsi == 0){
							htmldiv += '<i class="fa fa-star fs" aria-hidden="true"></i>'; 
						}
							
						htmldiv += '</div><div class="dndud_class_content_img_link"><img src="/bomulsum/upload/'+ midasImg +'" style="width:250px; height:250px">'
							+ '</div></div><div class="dndud_class_content_detail"><a class="dndud_class_card_label"><span>'
							+ data[i].midasCategory +'</span></a><br><a class="dndud_class_card_text"><b style="font-size:14px">'
							+ data[i].midasName +'</b></a></div><div class="dndud_class_card_rating">';
						
						if(data[i].midasReview.length == 0){
							htmldiv += '</div></div></div>';
						}else{
							var review = 0;
							var reviewCnt = 0;
							for(var j=0; j<data[i].midasReview.length; j++){
								reviewCnt++;
								review += data[i].midasReview[j];
							}
							review = Math.round(review / reviewCnt);
							htmldiv	+= '<div class=\"minwoo_starRev\" data-rate=\"'+ review +'\">'
								+ '<span class=\"minwoo_starR1\">별1_왼쪽</span> <span class=\"minwoo_starR2\">별1_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별2_왼쪽</span> <span class=\"minwoo_starR2\">별2_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별3_왼쪽</span> <span class=\"minwoo_starR2\">별3_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별4_왼쪽</span> <span class=\"minwoo_starR2\">별4_오른쪽</span>'
								+ '<span class=\"minwoo_starR1\">별5_왼쪽</span> <span class=\"minwoo_starR2\">별5_오른쪽</span></div>'
								+ '<span style="font-size:14px; color:gray; margin-left: 10px;">('+ reviewCnt +')</span></div></div></div>';
							
						}
						
							
					}// end for
				}
			}else{
				//데이터 없을때.
				if($('.dndud_main_category_contents').children().length == 0){
					console.log('nodata' + page);
					htmldiv += '<p style="width:100%; margin:50px 0; display:flex; justify-content:center;">'
						+ '<a style="font-size:20px; color:#333; font-weight:bold">\''+ word +'\'</a><a style="font-size:20px; color:#666">'
						+ '에 대한 검색 결과가 없습니다.</a></p>';
					$('.dndud_main_category_contents').html(htmldiv);
				}
			}
			
			htmldiv = htmldiv.replace(/%20/gi, ' ');
			if(page == 1){
				$('.dndud_main_category_contents').html(htmldiv);				
			}else{
				$('.dndud_main_category_contents').append(htmldiv);
			} 
			
			$(".dndud_class_content_img, .dndud_class_card_text").click(movePage);
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

$(function(){
	
	movePage = function(){
		location.href='/bomulsum/midas/noPage.do';
	};
	
	likeArticleFunc = function(e){
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
	
	$(".div_active_none").on('click', changeClass = function(){
		var div = $('.div_active');
		div.attr('class', 'div_active_none');
		$('.div_active_none').click(changeClass);
		$(this).attr('class', 'div_active');
		
		location.href="/bomulsum/search/result.do?headerSearch="+word;
	});
	
});




</script>
</html>