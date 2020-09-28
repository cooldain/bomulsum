<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>보물섬 | 로그인</title>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<c:url value='/resources/vendor/fontawesome-free/css/all.css' />">
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
</style>

<body>
	<c:if test="${checkValue eq 1}">
		<script>
			location.href="/bomulsum/home.do";
		</script>
	</c:if>
	<c:if test="${checkValue eq 0}">
		<script>
			alert("이메일 혹은 비밀번호가 틀립니다.");
			location.href="/bomulsum/user/login.do";
		</script>
	</c:if>
	<c:if test="${not empty rememberedEmail}">
		<script>
		$(function(){
			$(document).ready(function() {
				$("#rememberEmail").prop("checked","checked");
				console.log("실행");
			});
		});
		</script>
	</c:if>
    <div id="wrapper">
        <div id="content">
            <img id="toHome" src="<c:url value='/resources/img/MainLogo.png'/>" style="width: 150px; height: 150px; cursor:pointer">
            <!-- <section id="login_SNS">
                	<h4 style="padding:0px 15px; background-color:white; margin:0; top:-10px; position:relative">SNS 로그인</h4>
                
	                <div style="width:40%; margin-top:3%; margin-bottom:3%"><a id="kakao-login-btn"></a></div>
	                <a href="http://developers.kakao.com/logout"></a>
                
            </section> --><!-- 1f76bb -->
            
            <form action="loginCheck.do" method="post">
	            <section id="login_Email">
	            	<h4 style="padding:0px 15px; background-color:white; margin:0; top:-12px; position:relative">이메일 로그인</h4>
	            	<!-- <div style="width:100%; margin: 2% auto; padding:2%;">
	            		<input style="width:90%; height:30px;" type="text" id="email" placeholder="이메일">
	            		<input style="width:90%; height:30px;" type="text" id="password" placeholder="비밀번호">
	            	</div> -->
	            	<div style="display: flex; flex: 1 1 0%; flex-flow: column wrap; width: 100%; margin-bottom:1%">
	            		<div style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-bottom:2%"> 
	            			<input style="width: 95%; padding: 3% 0;" type="text" id="email" name="email" placeholder="이메일" value="${rememberedEmail}">
	            		</div>
	            		<div style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-bottom:2%"> 
		            		<input style="width: 95%; padding: 3% 0;" type="password" id="password" name="password" placeholder="비밀번호">
	            		</div>
	            	
	            		<div style="width: 100%; display: flex; flex-direction: row; 
	            			justify-content: space-between; height:50px; margin-bottom:2%;
	            			padding-left:1%; padding-right:1.5%;">
	            			<a href="javascript:onClick()" style="text-decoration:none; color:gray; font-size:13px;">
	            				<input type="checkbox" id="rememberEmail" name="rememberEmail" /> 이메일 저장하기
	            			</a>
	            			<a href="findAboutAccount.do" style="text-decoration:none; color:gray; font-size:13px;">
	            				아이디 / 비밀번호를 잊어버리셨나요?
	            			</a>
	            		</div>
	            	
	            		<div style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-bottom:2%"> 
	            			<input style="width: 95%; padding: 3% 0;" type="submit" id="login" value="로그인">
	            		</div>
	            		<div style="display: flex; flex-direction: row; justify-content: center; height:50px; margin-bottom:3%"> 
		            		<input style="width: 95%; padding: 3% 0;" type="button" id="newAccount" value="회원가입" onclick="location.href ='newAccount.do'">
	            		</div>
	            		
	            		<div id="firstNewAccount" style="flex-direction: row; justify-content: center; height:50px; display:none;">
	            			<div style="width: 70%%; padding: 3% 0; font-size:12px; text-align:center; background-color:ivory;">
	            				<a>신규 회원가입 시</a><br>
	            				<a>총 </a><a style="color:red">5,000원</a><a>의 쿠폰 지급 & 첫 달 무조건 </a><a style="color:red">2%</a><a> 적립</a>
	            			</div>
	            		</div>
	            		
	            	
	            	</div>
	            	
	            </section>
	            
            </form>
        </div>
    </div>
</body>

<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>" ></script>
<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/>" ></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/> "></script>


<script>
   /*  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('dbab6039d51f4966a42e02bf4f7b5dd0');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
        container: '#kakao-login-btn',
        success: function (authObj) {
            alert(JSON.stringify(authObj));
            Kakao.API.request({
            	url: '',
            	success:function(res){
         			 //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
                    console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
                    console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
                    console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
                											// res.properties.nickname으로도 접근 가능 )
                    console.log(authObj.access_token);
                    
            	},
            	fail:function(e){
            		alert(e);
            	}
            });
        },
        fail: function (err) {
            alert(JSON.stringify(err));
        }
    });
    
    $(function(){
    	$("#kakao-login-btn").css({
        	"width":"100%"
        });
    });
    
    //]]> */
    
    
    var onClick = function(){
    	var check = document.getElementById("rememberEmail");
    	check.checked = !check.checked;
    };
    
    $(function(){
    	$("#toHome").click(function(event){ // 로고 이미지 클릭 시.
    		location.href="/bomulsum/home.do";
    	});
    	
    	
    	$("#newAccount").hover(function(){
    		$("#firstNewAccount").css("display","flex");
    	}, function(){
    		$("#firstNewAccount").css("display","none");
    	});
    });
    
</script>

</html>