<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 즐겨찾는작품</title>
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
#wonBookButton{
	cursor: pointer;
	text-decoration: none;
}
#wonBookContent{
	cursor: pointer;
	
}
#wonBookContent:hover {
	box-shadow: 1px 1px gray;
}



/*------------------ 다인추가 ------------------------*/
.dain_main_category_contents{
	display:flex;
	width:100%;
	flex-wrap: wrap;
}

.dain_main_category_content_box{
	width:23%; /* 4개씩 보여주기 (5개씩은 19%)*/
	margin-left:1%; 
	margin-right:1%; 
	margin-bottom:2%; 
	height:380px;
	cursor:pointer;
	font-size:13px;
}

.dain_main_category_content_box:hover{
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
	margin-bottom: 5%;
}

.content_img i{
	font-size:24px;
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
	padding:3%;
}

.content_detail_writer{
	color:#999999;
	font-size:12px;
	margin-bottom:1.5%;
	overflow: hidden;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
}

.content_detail_title{
	color:#333333;
	font-size:14px;
	margin-bottom:1.5%;
}

.content_detail_price_decount{
	font-size:16px;
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
	font-size:12px;
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

.category_option_selected div{
	display: flex;
	background: white;
	justify-content: space-between;
	align-items: center;
	margin: 1.5%;
	width: 12.5%;
	border: 1px solid #d9d9d9;
	border-radius: 15px;
	font-size:10px
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
}

.dainClikedTab {
	width: 33%;
	padding: 2%;
	border: 1px solid #D9D9D9;
	color: #333333;
	font-weight: bold;
	text-align: center;
}

.dainUnClikedTab {
	width: 33%;
	padding: 2%;
	border: 1px solid #D9D9D9;
	text-align: center;
	color: #ACACAC;
	background-color: #F5F5F5;
}


</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
var memberCode = '<%= (String)session.getAttribute("member") %>';
var likeArticleFunc;
/* var categoryOptionFunc;
var ajaxFilterFunc; */
/* var filtArr = []; */
/* var orderBy = 'orderByLike'; */

//스크롤 페이징
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



//세자리 콤마
function comma(x) { return !x ? '0' : x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") }


//작품 뿌려주는거 & 페이징
function getList(page){
	/* var category = '전자기기'; */
	
	$.ajax({
		type:'POST',
		dataType : 'json',
		data:{
			/* 'category':category, */
			'page':page,
			/* 'filtArr':filtArr, */
			/* 'orderBy':orderBy, */
			'member':memberCode
		},
		url : '/bomulsum//user/wishlist/bookmarkinfo.do',
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
						//상품 대표이미지
						artImg = data[i].artPhoto.split(',')[0];
						
						//가격 할인율
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
							htmldiv += '<a>'+ comma(data[i].artDiscount) +'</a> 원</span>';
						}
						
						htmldiv += '<span class="content_detail_other">';
						
						if(data[i].writerSendPrice == 0){
							htmldiv += '<span>무료배송</span>';
						}
						
						htmldiv += '</span></span></span></div></div>';
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

//좋아하는 작품 기능
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

</head>
<body>
<div>
	<!-- 헤더 -->
	<%@ include file="../../include/uHeader.jsp"  %>
	
	
	
	<div class="content">
	<!-- 사이드메뉴 -->
	<%@ include file="../../include/uside.jsp" %>
	<!-- 내용 여기다 넣으시오 -->
	
	<div style="margin-left:2%; width: 100%;">
		<div>
			<h2 style="margin: 1%;">즐겨찾는(★) 작품</h2>
		</div>
	<%-- 	'<c:url value='/user/board/noticeDetail.do?seq=admin_notice_seq174'/>' --%>
		<div style="display: flex; flex-direction: row; margin: 1%;">
			<a id="wonBookButton" class="dainClikedTab" href="<c:url value='/user/wishlist/bookmarkWork.do'/>" 
			style="border: 1px solid #d9d9d9;">작품</a>
			
			<a id="wonBookButton" class="dainUnClikedTab" href="<c:url value='/user/wishlist/bookmarkOnline.do'/>" 
			style="border-top: 1px solid #d9d9d9;border-bottom: 1px solid #d9d9d9;">온라인</a>
			
			<a id="wonBookButton" class="dainUnClikedTab" href="<c:url value='/user/wishlist/bookmarkOffline.do'/>" 
			style="border: 1px solid #d9d9d9;">오프라인</a>
		</div>
		
		<!-- 작품들 들어갈 부분 -->
		<div class="dain_main_category_contents">
		
		</div>
<%-- 		<div style="maring-top:1%;">
				<div style="display: flex; flex-wrap: wrap;">
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
					<div id="wonBookContent" style="width: 23%; text-decoration: none; margin:1%;">
					<!-- 내용물 -->
						<a style="margin:1%;">
							<img style="width: 100%;" src="<c:url value='/resources/img/test.png'/>" >
							<span style="color: #ABABAB; font-size: 80%;">판매자 계정</span><br>
							<span>상품설명</span><br>
							<span style="color: red;">할인율</span>&nbsp;<span>가격</span><br>
							<span style="text-decoration: line-through; color: #ABABAB; font-size: 70%;">원가</span><br>
							<span>별점</span><br>
							<span style="background-color:#EAEAEA; border:1px solid #EAEAEA; border-radius: 5px; font-size: 60%; color: #ABABAB;">후기</span>
							&nbsp;<span style="color: #ABABAB; font-size: 60%;">후기내용</span>
						</a>
					</div>
						
			</div>
		</div> --%>
	</div>
	
	
	
	
	</div>
	<!-- 푸터  -->
	<%@ include file="../../include/uFooter.jsp" %>
</div>
</body>
</html>