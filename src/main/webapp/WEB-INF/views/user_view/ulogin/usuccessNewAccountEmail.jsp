<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보물섬 | 회원가입 완료</title>
<link rel="stylesheet" href="<c:url value='/vendor/fontawesome-free/css/all.css' />">
<style type="text/css">
    #wrapper {
        min-width: 100%;
        max-width: 100%;
        margin-top: 3%;
    }

    #content {
        margin-top: 2%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

    #login_SNS {
    	width:450px;
    	display: flex;
    	flex-direction: column;
    	flex: 1 1 0;
        margin-top: 2%;
       	justify-content: center;
       	align-items: center;
       	postition : relative;
    	border-top: 1px solid gray;
    }

    #login_Email {
        width:450px;
    	display: flex;
    	flex-direction: column;
    	flex: 1 1 0;
        margin-top: 2%;
       	justify-content: center;
       	align-items: center;
       	postition : relative;
    	border-top: 1px solid gray;
    }
    
    #kakao-login-btn img{ width:100%; }
    
    h3{
    	margin:0;
    	margin-bottom: 2%;
    	display:flex;
    	justify-content:center;
    }
    span{
   	 	margin:0;
    	display:flex;
    	justify-content:center;
    }
    
    .dndud_coupon_img{
    	width: 400px;
    	height: 200px;
    }
    
    button{
    	cursor: pointer;
    	width: 100%;
    	height: 40px;
    	margin-top:6%
    }
    button:hover{
    	border: 1px solid #1f76bb;
    	background-color: #1f76bb;
    	color: white;
    }
    button:focus{
    	outline: none;
    }
    
</style>
</head>
<body>
    <div id="wrapper">
        <div id="content">
            <img id="toHome" src="<c:url value='/resources/img/MainLogo.png'/>" style="width: 150px; height: 150px; cursor:pointer">
            <section id="login_SNS">
               	<h4 style="padding:0px 15px; background-color:white; margin:0; top:-10px; position:relative">회원가입 완료</h4>
                <div style="display:flex; flex-direction: column; margin-top:5%">
                	<h3><a id="dndud_name"><%= request.getParameter("memberName") %></a>님</h3>
                	<h3><a>보물섬 회원이 되신 것을 환영합니다!</a></h3>
                	<span style="font-size: 13px; margin-bottom:7%">신규 가입 감사 할인쿠폰을 쿠폰함에서 확인해보세요.</span>
                </div>
                <div style="display:flex; flex-direction: column;">
                	<img id="coupon_2000" class="dndud_coupon_img" src="<c:url value='/resources/img/coupon_2000.png'/>" >
                	<img id="coupon_3000" class="dndud_coupon_img" src="<c:url value='/resources/img/coupon_3000.png'/>" >
                	<button id="dndud_go_to_article">작품 구경하러 가기</button>
                </div>
                
                
	                
                
            </section><!-- 1f76bb -->
            <div style="display:flex; flex-direction: row; margin-top:1%; font-size:14px; font-weight:bold">
            	<a id="dndud_time"></a><a>초 후 홈으로</a>
            </div>
            
            
            
        </div>
    </div>
</body>

<script src="<c:url value='/vendor/jquery/jquery.min.js'/>" ></script>
<script src="<c:url value='/vendor/bootstrap/js/bootstrap.bundle.min.js'/>" ></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/vendor/jquery-easing/jquery.easing.min.js'/> "></script>
<script>
var tt=3;

var timeout = setInterval(function(){ // 윈도우 로드후 5초간의 시간.
	if(tt >= 0){
		$("#dndud_time").html(tt);
	}else{
		clearInterval(tt);
		location.href="/bomulsum/home.do" // 홈화면 경로
	}
	tt--;
}, 1000);

$(window).on('load',function(){
	timeout;
});


$(function(){
	$("#toHome").click(function(){
		location.href = "/bomulsum/home.do"; // 아이콘 클릭시 홈으로 경로
	});
	
	$("#dndud_go_to_article").click(function(){
		location.href = '/bomulsum/category/recommended.do'; // 작품들 있는 페이지로.
	});
});
</script>
</html>