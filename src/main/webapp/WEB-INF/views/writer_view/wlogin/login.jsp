<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Login</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css'/> " rel="stylesheet" >
  
   <style>
    .container { padding-left: 20%; }
    .container { padding-right: 20%; }
    .col-lg-6 {
   flex: 1 1 58.33333%;
   max-width: 100% 
   }
  </style>
  <script type="text/javascript">

	
  </script>

</head>

<body class="bg-gradient-primary">
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
            
              <!--  <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>-->
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                  </div>
                  <form class="user">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" required="required"
                      id="writerEmail" aria-describedby="emailHelp" placeholder="아이디">
                    </div>
                    <p align="center"  style="font-size: 60%;" id="emailChk"></p>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" 
                      id="writerPassword" placeholder="비밀번호">
                    </div>
                    <p align="center"  style="font-size: 60%;" id="pwCheck"></p>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">자동 로그인</label>
                      </div>
                    </div>
                    <a class="btn btn-primary btn-user btn-block" id="signIn-btn">
                         	로그인
                    </a>
                    <!--  <hr>
                    <a href="index.html" class="btn btn-google btn-user btn-block">
                      <i class="fab fa-google fa-fw"></i> Login with Google
                    </a>
                    <a href="index.html" class="btn btn-facebook btn-user btn-block">
                      <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                    </a>-->
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="/bomulsum/writer/forgot-password.wdo">비밀번호 찾기</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="/bomulsum/writer/register.wdo">회원가입</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js'/> "></script>
  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js'/> "></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/resources/resources/js/sb-admin-2.min.js'/> "></script>
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>

</body>
<script type="text/javascript">
//정규식 표현
const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
let chk1 = false, chk2 = false;
	$(function(){
		$('#writerEmail')
		.on(
				'keyup',
				function() {
					if ($("#writerEmail").val() == "") {
						$('#writerEmail').css("background-color", "pink");
						$('#emailChk')
								.html(
										'<b style="font-size:14px;color:red;">[이메일은 필수값 입니다.]</b>');
						chk1 = false;
					}

					//아이디 유효성검사
					else if (!getMail.test($("#writerEmail").val())) {
						$('#writerEmail').css("background-color", "pink");
						$('#emailChk')
								.html(
										'<b style="font-size:14px;color:red;">[이메일 형식이 옳바르지 않습니다.]</b>');
						chk1 = false;
					} else {
						$('#writerEmail').css("background-color", "aqua");
						$('#emailChk')
								.html(
										'<b style="font-size:14px;color:green;"></b>');
						chk1 = true;
					}
				});

//패스워드 입력값 검증.
$('#writerPassword')
		.on(
				'keyup',
				function() {
					//비밀번호 공백 확인
					if ($("#writerPassword").val() === "") {
						$('#writerPassword').css("background-color", "pink");
						$('#pwCheck')
								.html(
										'<b style="font-size:14px;color:red;">[패스워드는 필수값 입니다.]</b>');
						chk2 = false;
					}
					//비밀번호 유효성검사
					else if (!getPwCheck.test($("#writerPassword").val())
							|| $("#writerPassword").val().length < 8) {
						$('#writerPassword').css("background-color", "pink");
						$('#pwCheck')
								.html(
										'<b style="font-size:14px;color:red;">[특수문자 포함 8자이상 입니다.]</b>');
						chk2 = false;
					} else {
						$('#writerPassword').css("background-color", "aqua");
						$('#pwCheck')
								.html(
										'<b style="font-size:14px;color:green;"></b>');
						chk2 = true;
					}

				});

//로그인 버튼 클릭 이벤트
$("#signIn-btn")
		.click(
				function() {
					if (chk1 && chk2) {
						// ajax통신으로 서버에서 값 받아오기.
						const writerEmail = $("#writerEmail").val();
						const writerPassword = $("#writerPassword").val();

						// is() 함수는 상태여부를 판단하여 논리값을 리턴합니다.
						const autoLogin = $("input[id=customCheck]")
								.is(":checked");

						console.log("email : " + writerEmail);
						console.log("pw : " + writerPassword);
						console.log("auto : " + autoLogin);

						const userInfo = {
							writerEmail : writerEmail,
							writerPassword : writerPassword,
							autoLogin : autoLogin
						};

						$
								.ajax({
									type : "POST",
									url : "loginCheck.wdo",
									headers : {
										"Content-Type" : "application/json"
									},
									dataType : "text",
									data : JSON.stringify(userInfo),
									success : function(data) {
										console.log("result : " + data);
										if (data === "idFail") {
											$('#writerEmail').css(
													"background-color",
													"pink");
											$('#emailChk')
													.html(
															'<b style="font-size:14px;color:red;">[회원가입 먼저~~]</b>');
											$('#writerPassword').val("");
											$('#writerEmail').focus();
											chk2 = false;
										} else if (data === "pwFail") {
											$('#writerPassword').css(
													"background-color",
													"pink");
											$('#writerPassword').val("");
											$('#writerPassword').focus();
											$('#pwCheck')
													.html(
															'<b style="font-size:14px;color:red;">[비밀번호가 틀렸어요!]</b>');
											chk2 = false;
										} else if (data === "loginSuccess") {
											self.location = "home.wdo";
										}
									}

								});

					} else {
						alert("입력 정보를 다시 확인하세요!");
					}

				});
	});
</script>
</html>