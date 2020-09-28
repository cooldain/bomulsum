<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin 2 - Register</title>

  <!-- Custom fonts for this template-->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css'/> " rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css'/> " rel="stylesheet">

  <style>
    .container { padding-left: 20%; }
    .container { padding-right: 20%; }
    .col-lg-7 {
   flex: 1 1 58.33333%;
   max-width: 100%
   }
  </style>
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <!--   <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>-->
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
              </div>
              <form class="user">
                <div class="form-group">
                    <input type="text" class="form-control form-control-user" id="user_name" 
                    placeholder="이름">
                   <p align="center"  style="font-size: 60%;" id="nameChk"></p>
                </div>
                
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="email"
                    placeholder="이메일 주소">
                </div>
                <p align="center"  style="font-size: 60%;" id="emailChk"></p>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="password"
                      placeholder="비밀번호">
                  </div>
                   <p align="center"  style="font-size: 60%;" id="pwChk"></p>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-user" id="password_check"
                      placeholder="비밀번호 재입력">
                  </div>
                   <p align="center"  style="font-size: 60%;" id="pwChk2"></p>
                <a class="btn btn-primary btn-user btn-block" id="signup-btn">
                  회원가입 완료
                </a>
                <hr>
                <!--
                <a href="index.html" class="btn btn-google btn-user btn-block">
                  <i class="fab fa-google fa-fw"></i> Register with Google
                </a>
                <a href="index.html" class="btn btn-facebook btn-user btn-block">
                  <i class="fab fa-facebook-f fa-fw"></i> Register with Facebook
                </a>
                -->
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="/bomulsum/writer/forgot-password.wdo">비밀번호 찾기</a>
              </div>
              <div class="text-center">
                <a class="small" href="/bomulsum/writer/login.wdo">로그인</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/> "></script>
	<script type="text/javascript">
		$(function() {

			//정규식 표현
			const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
			const getName = RegExp(/^[가-힣]+$/);
			const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
			let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
			$("#email")
			.on(
					'keyup',
					function() {
						if ($("#email").val() === "") {
							$("#email").css("background-color", "pink");
							$("#emailChk")
									.html(
											'<b style="font-size:14px; color:red;">[이메일은 필수 정보입니다.]</b>');
							chk1 = false;
						}

						// 아이디 유효성 검사
						else if (!getMail.test($("#email").val())) {
							$("#email").css("background-color", "pink");
							$("#emailChk")
									.html(
											'<b style="font-size:14px; color:red;">[이메일 형식이 옳바르지 않습니다.]</b>');

							//ID 중복확인 비동기 처리
						} else {

							//ID 중복확인 통신을 위해 id값을 가져오기.
							const id = $(this).val();
							console.log(id);

							$.ajax({
										type : "POST",
										url : "/bomulsum/writer/checkId.wdo",
										headers : {
											"Content-Type" : "application/text"
										},
										dataType : "text",
										data : id,
										success : function(result) {
											if (result === "OK") {
												console.log("result " + result);
												$("#email").css(
														"background-color",
														"aqua");
												$("#emailChk")
														.html(
																'<b style="font-size:14px; color:green;">[사용가능한 이메일 입니다.]</b>');
												chk1 = true;
											} else {
												console.log(result);
												$("#email").css(
														"background-color",
														"pink");
												$("#emailChk")
														.html(
																'<b style="font-size:14px; color:red;">[중복된 이메일입니다.]</b>');
												chk1 = false;
											}
										},
										error : function() {
											console.log("통신 실패!");
										}
									});

						}
					});
			$('#user_name')
					.on(
							'keyup',
							function() {
								//이름값 공백 확인
								if ($("#user_name").val() === "") {
									$('#user_name').css("background-color",
											"pink");
									$('#nameChk')
											.html(
													'<b style="font-size:14px;color:red;">[이름은 필수정보입니다.]</b>');
									chk2 = false;
								}
								//이름값 유효성검사
								else if (!getName.test($("#user_name").val())) {
									$('#user_name').css("background-color",
											"pink");
									$('#nameChk')
											.html(
													'<b style="font-size:14px;color:red;">[이름은 한글로만 사용 가능합니다.]</b>');
									chk4 = false;
								} else {
									$('#user_name').css("background-color",
											"aqua");
									$('#nameChk')
											.html(
													'<b style="font-size:14px;color:green;">[완료]</b>');
									chk2 = true;
								}

							});

			$('#password')
					.on(
							'keyup',
							function() {
								//비밀번호 공백 확인
								if ($("#password").val() === "") {
									$('#password').css("background-color",
											"pink");
									$('#pwChk')
											.html(
													'<b style="font-size:14px;color:red;">[패스워드는 필수정보입니다.]</b>');
									chk3 = false;
								}
								//비밀번호 유효성검사
								else if (!getPwCheck.test($("#password").val())
										|| $("#password").val().length < 8) {
									$('#password').css("background-color",
											"pink");
									$('#pwChk')
											.html(
													'<b style="font-size:14px;color:red;">[특수문자 포함 8자이상 입력하셔야 합니다.]</b>');
									chk3 = false;
								} else {
									$('#password').css("background-color",
											"aqua");
									$('#pwChk')
											.html(
													'<b style="font-size:14px;color:green;">[완료]</b>');
									chk3 = true;
								}

							});

			//패스워드 확인란 입력값 검증.
			$('#password_check')
					.on(
							'keyup',
							function() {
								//비밀번호 확인란 공백 확인
								if ($("#password_check").val() === "") {
									$('#password_check').css(
											"background-color", "pink");
									$('#pwChk2')
											.html(
													'<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
									chk4 = false;
								}
								//비밀번호 확인란 유효성검사
								else if ($("#password").val() != $(
										"#password_check").val()) {
									$('#password_check').css(
											"background-color", "pink");
									$('#pwChk2')
											.html(
													'<b style="font-size:14px;color:red;">[동일한 비밀번호를 입력해주세요.]</b>');
									chk4 = false;
								} else {
									$('#password_check').css(
											"background-color", "aqua");
									$('#pwChk2')
											.html(
													'<b style="font-size:14px;color:green;">[완료]</b>');
									chk4 = true;
								}

							});
			$('#signup-btn').click(function() {
				if (chk1 && chk2 && chk3 && chk4) {
					//아이디 정보
					const email = $("#email").val();
					//패스워드 정보
					const pw = $("#password").val();
					//이름 정보
					const name = $("#user_name").val();

					const user = {
						writerEmail : email,
						writerPassword : pw,
						wrtierName : name
					};

					$.ajax({
						type : "POST",
						url : 'insertWriterData.wdo',
						data : {
							"writerEmail" : $("#email").val(),
							"writerPassword" : $("#password").val(),
							"writerName" : $("#user_name").val(),
						},
						success : function() {
							console.log("데이터 전송 성공");
							var email = $('#email').val();
							location.href = "login.wdo";
							alert('회원가입이 완료되었습니다.');
						},
						error : function() {
							console.log("데이터 전송 실패");
						}
					});
				} else {
					alert('입력정보를 다시 확인하세요!');
				}

			}); //signup-btn 이벤트 처리

		});
	</script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' /> "></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' /> "></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/resources/resources/js/sb-admin-2.min.js' /> "></script>

</body>

</html>