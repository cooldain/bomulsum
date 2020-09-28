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
    box-shadow: 0 2px 8px 0 rgba(0, 0, 0, 0.2);
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
					<div id="art" class="div_active">
						<span>
							<a>"${param.headerSearch }"</a>
							에 대한 작품 검색결과
						</span>	
					</div>
					<div id="midas" class="div_active_none">
						<span>
							<a>"${param.headerSearch }"</a>
							에 대한 금손 클래스 검색결과
						</span>
					</div>
				</div>
				<div class="category_option_list">
					<span>배송</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="무료배송"><a>무료배송</a> 만 보기</span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>
				<div class="category_option_list">
					<span>가격대</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="1만원 미만">1만원 미만</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="1만원대">1만원대</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="2만원대">2만원대</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="3만원대">3만원대</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="4만원대">4만원대</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="5만원대">5만원대</span>
				</div>
				<div class="category_option_list_2">
					<span>카테고리</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|식음료">식음료</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|문구팬시">문구팬시</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|전자기기">전자기기</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|패션잡화">패션잡화</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|반려동물 용품">반려동물 용품</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|인테리어 소품">인테리어 소품</span>
				</div>
				<div class="category_option_list_2">
					<span></span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|신발">신발</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|의류">의류</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|육아,아동">육아,아동</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|인형,장난감">인형,장난감</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|공예">공예</span>
					<span class="category_option_checkbox"><input type="checkbox" name="check" value="c|기타">기타</span>
				</div>
				<div class="category_option_selected">
					<span style="cursor:pointer" id="cancle_check_all">전체해제</span>
					<div class="category_test" style="width:84%;padding: 1% 0;">
					</div>
				</div>
			</div>
			
			<div class="dndud_main_category_search_detail">
				<div id="show_only_image">
					<span>이미지만 볼래요</span>
				</div>
				<select id="dndud_order_option">
					<option value="orderByLike">인기순</option>
					<option value="orderByRecently">최신순 (NEW)</option>
					<option value="orderByLowPrice">낮은 가격순</option>
					<option value="orderByHighPrice">높은 가격순</option>
				</select>
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
var categoryOptionFunc;
var ajaxFilterFunc;
var artORclass = 'art';
var filtArr = [];
var orderBy = 'orderByLike';
var category = [];
var option = '좋아하는작품';
var page = 1;
var changeClass;

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

function artCode(e){
	var art_code = e.id;
	var url = "/bomulsum/user/uProductInfo/"+art_code+".do?memberCode="+memberCode;
	window.open(url, "_blank");
}


function comma(x) { return !x ? '0' : x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") }


function getList(page){
	$.ajax({
		type:'POST',
		dataType : 'json',
		data:{
			'artORclass':artORclass,
			'word':word,
			'page':page,
			'filtArr':filtArr,
			'category':category,
			'orderBy':orderBy,
			'member':memberCode
		},
		url : '/bomulsum/search/info.do',
		success :function(returnData){
			console.log(returnData);
			// 작품 검색 결과 출력
			if(artORclass = 'art'){
				var htmldiv = '';
				var writerName = '';
				var artImg = '';
				var pricePer = 0;
				var data = returnData.data;
				if(page == 1){
					$('.dndud_main_category_contents').html('');
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
							
							pricePer = (data[i].artPrice - data[i].artDiscount) / data[i].artPrice * 100;
							
							htmldiv += '<div class="dndud_main_category_content_box" id="'+ data[i].artCode +'" onclick="artCode(this);">'
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
							
							
							/* htmldiv += '<span class="content_detail_star">'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<i class="fa fa-star" style="color:gold"></i>'
								+ '<span>(<a>num</a>)</span></span></div></div>'; */
								
							
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
				
				$(".fs").click(likeArticleFunc);
				
				var starRevPoint = $('.minwoo_starRev');
				starRevPoint.each(function(){
					var targetScore = $(this).attr('data-rate');
					console.log(targetScore);
					$(this).find('span:nth-child(-n+'+ targetScore +')').parent().children('span').removeClass('on');
					$(this).find('span:nth-child(-n+'+ targetScore +')').addClass('on').prevAll('span').addClass('on');
				});
				
			}
			
		},
		error:function(e){
			if(e.status == 300){
				alert('데이터를 가져오는데 실패했습니다.');
			};
		}
	});
}

$(function(){
	
	$(".category_option_checkbox").on('click', function(){
		var check = $(this).find('input[name=check]');
		
		if(check.is(":checked")){
			check.prop('checked', false);
			$(".selected_option").each(function(){
				if($(this).children(":first").text() == check.val() || ('c|' + $(this).children(":first").text()) == check.val()){
					$(this).remove();
					return;
				}
			});
		}else{
			check.prop('checked', true);
			var html='';
			if(check.val().split('|')[0] != 'c'){
				html = '<div class="selected_option"><a class="selected_option_span">'+ check.val() +'</a>'
					+ '<a class="selected_option_span atag">X</a></div>';
			}else{
				html = '<div class="selected_option"><a class="selected_option_span">'+ check.val().split('|')[1] +'</a>'
				+ '<a class="selected_option_span atag">X</a></div>';
			}
			$(".category_test").append(html);
			
			$('.atag').click(function(){
				var tag = $(this).parent();
				var value = $(this).prev().text();
				$('input[name=check]').each(function(){
					if($(this).val() == ('c|'+value)){
						tag.remove();
						$(this).prop('checked', false);
					}
				});
				categoryOptionFunc();
				ajaxFilterFunc();
			});
		}
		
		categoryOptionFunc();
		ajaxFilterFunc();
	});
	
	$("#dndud_order_option").on('change', function(){
		orderBy = $("#dndud_order_option option:selected").val();
		page = 1;
		getList(page);
	});
	
	$("#cancle_check_all").on('click', function(){
		$('input[name=check]').prop('checked', false);
		categoryOptionFunc();
		ajaxFilterFunc();
	});
	
	categoryOptionFunc = function(box){
		if($("input[name=check]").is(':checked')){
			$(".category_option_selected").css('display', 'flex');
		}else{
			$(".category_option_selected").css("display", "none");
			$('.selected_option').remove();
		}
	}
	
	ajaxFilterFunc = function(){
		filtArr = [];
		category = [];
		$('input[name=check]').each(function(){
			if($(this).is(':checked')){
				if($(this).val().split('|')[0] == 'c'){
					category.push($(this).val().split('|')[1]);
				}else{					
					filtArr.push($(this).val());
				}
			}
		});
		page = 1;
		getList(page);
	}
	
	
	likeArticleFunc = function(e){
		e.stopPropagation();
		if(memberCode == null || memberCode == 'null'){
			alert('로그인이 필요한 서비스입니다.');
			location.href='/bomulsum/user/login.do';
			return;
		}
		
		var artCode = $(this).parent().prev().val();
		
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
	
	$(".div_active_none").on('click', changeClass = function(){
		var div = $('.div_active');
		div.attr('class', 'div_active_none');
		$('.div_active_none').click(changeClass);
		$(this).attr('class', 'div_active');
		
		location.href="/bomulsum/search/result/class.do?headerSearch="+word;
	});
	
});




</script>
</html>