<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html lang="en">

<head>


  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>게시판 - 정책/등록 가이드</title>

  <!-- Custom fonts for this template -->
  <link href="<c:url value='/resources/vendor/fontawesome-free/css/all.min.css' /> " rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="<c:url value='/resources/css/sb-admin-2.min.css' /> " rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.css' /> " rel="stylesheet">
	
	<style>
	.writer_policyguide_detail:hover{
		cursor: pointer;
	}
	
	</style>
	
	
	<script src="<c:url value='/resources/vendor/jquery/jquery.min.js'/>"></script>
	<!-- 제이쿼리 -->
	<script type="text/javascript">
	   $(function(){
	      
	      $('.writer_policyguide_detail').click(function() {
	         const param = $.trim($(this).closest('tr').children('td').eq(2).text());
	         console.log('param : ', param);
	
	         
	         $.ajax({
	            url: "${pageContext.request.contextPath}"+"/writer/policyGuideArticle.wdo", //클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
	            data:   {"admin_notice_seq" : param}, //HTTP 요청과 함꼐 서버로 보낼 데이터
	            method: "GET", // HTTP 요청 메소드 (GET , POST 등)
	            dataType: "json",
	            success: function(data){
	               const jsData = data;
	               console.log(data);
	               console.log(jsData);
	               
	               function getFormatDate(date){
	                   var year = date.getFullYear() + " 년 ";              //yyyy
	                   var month = (1 + date.getMonth());          //M
	                   month = month >= 10 ? month : '0' + month + " 월 ";  //month 두자리로 저장
	                   var day = date.getDate();                   //d
	                   day = day >= 10 ? day : '0' + day + " 일";          //day 두자리로 저장
	                   return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	               }
	               
	               
	               var timestamp = jsData.admin_notice_date;
	               var date = new Date(timestamp);
	               
	               date = getFormatDate(date);
	               
	               
	               $('#staticBackdropTitle').text(jsData.admin_notice_title);
	               $('#staticBackdropContent').html(jsData.admin_notice_content);
	               $('#staticBackdropRegDate').text(date);
	            }
	         });
	      });
	   });
   </script>
</head>
<body>

<div id="wrapper">
		<!-- Header/Nav -->
		<jsp:include page="../include/side.jsp" />
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="content">
				<jsp:include page="../include/head.jsp" />
				<!-- end Header/Nav -->
				
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
         

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h3 class="m-0 font-weight-bold text-primary">정책/등록 가이드</h3>
            </div>
            <div class="card-body">
              <div class="table-responsive" style="scroll:no; overflow:hidden;">
                <table class="table table-bordered" id="dataTable" style="border-bottom: 1px solid #e3e6f0; border-left: 1px solid #e3e6f0;">
                  <thead>
                   	<tr style="text-align:center">
                      <th style="width:80%">제목</th>
                      <th style="width:20%;">등록날짜</th>
                      <th style="display:none;"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="writerBoardVO" items="${article}">
     
                    <tr>
                         <td data-toggle="modal" 
                            data-target="#staticBackdrop2" class="writer_policyguide_detail">
                            
                             ${writerBoardVO.admin_notice_title}
                          </td>
                         <td>
                            ${writerBoardVO.admin_notice_date}
                         </td>
                         <td style="display: none" class="admin_notice_seq">
                         
                         ${writerBoardVO.admin_notice_seq }</td>
                      </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          
          
          
          
    <!-- modal -->
          <div class="modal fade" id="staticBackdrop2" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document" style="max-width:1000px;">
            <div class="modal-content">
               <div class="modal-header">
                  <!-- <h5 class="modal-title" > </h5> -->
                     <button type="button" class="close" data-dismiss="modal"aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                     </button>
               </div>
               <div  style="display:flex; border-bottom: 1px solid #d9d9d9; height: 50px; margin:12px 30px 6px 30px; align-items: center; " >
                  <div id="staticBackdropTitle" style="font-weight: bold; font-size: 18px; color:#4273df;"></div>
               </div>
               <div  style="display: flex; height: 50px; margin:0px 30px 12px 30px; border-bottom: 1px solid #d9d9d9; align-items: center; ">
                   <h6 style="font-weight: bold; font-size: 13px; margin: 0px;">등록일:&nbsp;&nbsp; </h6>
                   <div id="staticBackdropRegDate" style="font-weight: bold; font-size: 13px;"></div>
               </div>
 
               <!-- body -->
                  
               <div id="staticBackdropContent" style="height: 400px; margin:20px 30px 12px 30px; overflow: auto;">
                <!--  <div style="height: 350px; border: 1px solid #d9d9d9; overflow: scroll; overflow-x: hidden; padding: 1%;">
                 </div> -->
               </div>


               <div class="modal-footer" style="display: flex; flex-direction: column;">
                  <button style="font-size: 100%;"class="close" data-dismiss="modal"aria-label="Close">닫기</button>
               </div>
            </div>
         </div>
         </div>
      <!-- modal end -->
                
                
                
                
                

        </div>
        <!-- /.container-fluid -->
      </div>
      <!-- End of Main Content -->

   

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

<%@ include file="../include/footer.jsp" %>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

  <!-- Bootstrap core JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery/jquery.min.js' /> "></script>
  <script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.bundle.min.js' /> "></script>

  <!-- Core plugin JavaScript-->
  <script src="<c:url value='/resources/vendor/jquery-easing/jquery.easing.min.js' /> "></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/resources/js/sb-admin-2.min.js'/> "></script>

  <!-- Page level plugins -->
  <script src="<c:url value='/resources/vendor/datatables/jquery.dataTables.min.js' /> "></script>
  <script src="<c:url value='/resources/vendor/datatables/dataTables.bootstrap4.min.js' /> "></script>

  <!-- Page level custom scripts -->
  <script src="<c:url value='/resources/js/demo/datatables-demo.js'/> "></script>

</body>

</html>
