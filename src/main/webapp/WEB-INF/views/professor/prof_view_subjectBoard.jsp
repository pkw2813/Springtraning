<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- plugins:css -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href='http://fonts.googleapis.com/css?family=Raleway:500' rel='stylesheet' type='text/css'/>
  <link rel="stylesheet" href="${path }/resources/assets/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="${path }/resources/assets/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${path }/resources/assets/css/style.css">
  <link rel="stylesheet" href="${path }/resources/css/modal.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${path }/resources/assets/images/favicon.png" />
  
  <script src="${path }/resources/js/jquery-3.4.1.min.js"></script>
  
    <!-- 웹소켓 js파일 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
</head>

<!-- Body section Start -->	
<!-- Main Content start -->	
<section>
			<div class="row" style="height : 100%;">
				<div class="col-md-12 grid-margin stretch-card">
					<div class="card">
						<div class="card-header">
						<div class="alert alert-primary" style="text-align : center;">
						  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
						  	<h3>과제 제목</h3>
						</div>
						</div>
						<div class="card-body" style="text-align : center;">
						<h4>과제 내용</h4>
						<hr/>
						<textarea rows=40 style="resize : none; width : 70em;" readonly>
						
						</textarea>
						</div>
						<div class="card-footer" style="text-align : right;">
						<h4>작성자 : 박성술</h4>
						</div>
					</div>
				</div>
			</div>
</section>
			
  <!-- plugins:js -->
 <script src="${path }/resources/assets/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <script src="${path }/resources/assets/vendors/chart.js/Chart.min.js"></script>
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${path }/resources/assets/js/off-canvas.js"></script>
  <script src="${path }/resources/assets/js/hoverable-collapse.js"></script>
  <script src="${path }/resources/assets/js/template.js"></script>
  <script src="${path }/resources/assets/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${path }/resources/assets/js/dashboard.js"></script>
  <script src="${path }/resources/assets/js/file-upload.js"></script>
  <!-- End custom js for this page-->
</body>

</html>