<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page import="com.kh.finalProject.student.model.vo.Student" %>
<%@ page import="com.kh.finalProject.employee.model.vo.Employee" %>
<%@ page import="com.kh.finalProject.professor.model.vo.Professor" %>
<!DOCTYPE html>
<html lang="en">
<% if(session.getAttribute("loginMember") instanceof Professor){%>
<c:set var="userId" value="${loginMember.profId }"/>
<%} else if(session.getAttribute("loginMember") instanceof Student){%>
<c:set var="userId" value="${loginMember.stuNo }"/>
<%} else if(session.getAttribute("loginMember") instanceof Employee){%> 
<c:set var="userId" value="${loginMember.empId }"/>
<%} %>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Haxa Direct</title>
  <!-- plugins:css -->
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
  <%-- <% } else if(session.getAttribute("loginMember") instanceof Student){%>  --%>
  
</head>
<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo mr-5" href="index.html"><img src="${path }/resources/assets/images/logo.svg" class="mr-2" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="${path }/resources/assets/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <!-- <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="ti-view-list"></span>
        </button> -->
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
                <span class="input-group-text" id="search">
                  <i class="ti-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" id="navbar-search-input" placeholder="Search now" aria-label="search" aria-describedby="search">
            </div>
            </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
        <li class="nav-item dropdown mr-1">
        	<button id="myBtn" class="btn btn-inverse-info btn-fw">
            	건의
            </button>
        </li>
          <li class="nav-item dropdown mr-1">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="ti-email mx-0"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                    <img src="${path }/resources/assets/images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="item-content flex-grow">
                  <h6 class="ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="ti-bell mx-0"></i>
              <span class="count"></span>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Notifications</p>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-success">
                    <i class="ti-info-alt mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Application Error</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Just now
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-warning">
                    <i class="ti-settings mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">Settings</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    Private message
                  </p>
                </div>
              </a>
              <a class="dropdown-item">
                <div class="item-thumbnail">
                  <div class="item-icon bg-info">
                    <i class="ti-user mx-0"></i>
                  </div>
                </div>
                <div class="item-content">
                  <h6 class="font-weight-normal">New user registration</h6>
                  <p class="font-weight-light small-text mb-0 text-muted">
                    2 days ago
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="${path }/resources/assets/images/faces/face28.jpg" alt="profile"/>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item">
                <i class="ti-settings text-primary"></i>
                Settings
              </a>
              <a class="dropdown-item" href="${path }/login">
                <i class="ti-settings text-primary"></i>
                Login
              </a>
              <a class="dropdown-item">
                <i class="ti-power-off text-primary"></i>
                Logout
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="ti-view-list"></span>
        </button>
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas sidebar1" id="sidebar">
        <ul class="nav">
       	  <div class="sidebar-heading">
	      	 교수
	      </div>
          <li class="nav-item">
            <a class="nav-link"data-toggle="collapse" href="#ui-basic1" aria-expanded="false" aria-controls="ui-basic1">
              <i class="ti-shield menu-icon"></i>
              <span class="menu-title">강의정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">개설과목 입력</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">개설과목 조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">강의 계획서</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">주별 강의계획서</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">강의자료 업로드</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">강의 내역</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">담당교수별 강의시간표</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">결/보강 신청</a></li>
              </ul>
            </div>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="ti-palette menu-icon"></i>
              <span class="menu-title">학생정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">학생수강 신청관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">학생 시험관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">학생 과제관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">학생 출결관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">학생 출석부</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">학생성적 관리(성적입력)</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.html">과목별 학생수강 평가조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic2" aria-expanded="false" aria-controls="ui-basic2">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">교수 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">교수 정보보기</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic3" aria-expanded="false" aria-controls="ui-basic3">
              <i class="ti-pie-chart menu-icon"></i>
              <span class="menu-title">상담</span>
            <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic3">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">건의사항</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">진로및질문, 면담신청</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">출결이의 신청</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.html">성적이의 신청</a></li>
              </ul>
            </div>
          </li>
          <div class="sidebar-heading">
	      	 학생
	      </div>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic4" aria-expanded="false" aria-controls="ui-basic4">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">학생 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path}/student/studentInfo.hd">기본 정보</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#ui-basic5" aria-expanded="false" aria-controls="ui-basic5">
              <i class="ti-layout-list-post menu-icon"></i>
              <span class="menu-title">성적 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic5">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/gradeSearchAll.hd">전체 성적조회</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/gradeSearchNow.hd">현재학기 성적조회</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="ti-user menu-icon"></i>
              <span class="menu-title">수업 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/applyClass.hd"> 강의조회 및 수강신청 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/myClassInfo.hd"> 수강신청 내역 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/allClassInfo.hd"> 전체 시간표조회 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/mySchedule.hd"> 개인 시간표조회 </a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/classBoard.hd"> 강의게시판 </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth1" aria-expanded="false" aria-controls="auth1">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">등록금 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth1">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/tuitionBill.hd">등록금 고지서</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/student/tuitionCert.hd">등록금 납입 증명서</a></li>
              </ul>
            </div>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth2" aria-expanded="false" aria-controls="auth2">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">졸업 정보</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth2">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/student/myGraduation.hd">졸업인정 학점조회</a></li>
               </ul>
            </div>
          </li>
          <div class="sidebar-heading">
	      	 관리자
	      </div>
	      <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth5" aria-expanded="false" aria-controls="auth5">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">총괄 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth5">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="${path }/enrollStudent.hd">입학 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">교수 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">직원 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="${path }/reqList.hd">건의사항 관리</a></li>
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth3" aria-expanded="false" aria-controls="auth3">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">대학 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth3">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">기타</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">행사 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">학과 관리</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">기자재</a></li>
               </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth4" aria-expanded="false" aria-controls="auth4">
              <i class="ti-write menu-icon"></i>
              <span class="menu-title">학과 관리자</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth4">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">기자재 신청</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">행사 신청</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">학과 리스트</a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html">학생 조회</a></li>
               </ul>
            </div>
          </li>
        </ul>
      </nav>
      
      <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <form action="${path}/req.hd">
			<span class="close" id="close">&times;</span>
			<p>건의사항</p>
			<div class="form-group">
			<hr>
			<label class="control-label">제목</label>
			<input type="text" id="reqTitle" name="reqTitle" placeholder="제목을 입력하세요" class="form-control" required />
			<hr>
			<input type="hidden" id="toName" name="toName" value="${userId }"/>
			<label class="control-label">받는사람</label>
			<input type="hidden" id="fromName" name="fromName" value="EA000000000"/>
			<input type="text" class="form-control" value="관리자" readonly/>
			
			<hr>
			<label class="control-label">내용</label>
			<textarea name="reqContents" cols="40" rows="8" class="form-control" placeholder="내용을 입력하세요" ></textarea>
			</div>
			<input type="button" class="btn btn-inverse-info btn-fw" id="close1" value="취소" style="float: right; margin: 7px;">
			<input type="submit" class="btn btn-inverse-info btn-fw" value="보내기" style="float: right; margin: 7px;">
			<br>
			<br>
		</form>
      </div>
 
    </div>
    
    <script>
     // Get the modal
        var modal = document.getElementById('myModal');
 
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
 
        // Get the <span> element that closes the modal
        var close = document.getElementById("close");                                          
        var close1 = document.getElementById("close1");  
        // When the user clicks on the button, open the modal 
        btn.onclick = function() {
            modal.style.display = "block";
        }
 
        // When the user clicks on <span> (x), close the modal
        close.onclick = function() {
            modal.style.display = "none";
        }
        close1.onclick = function() {
            modal.style.display = "none";
        }
 
        // When the user clicks anywhere outside of the modal, close it
        /* window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        } */

        </script>
      