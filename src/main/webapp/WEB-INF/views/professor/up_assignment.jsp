<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- 달력 import start -->
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css"
	rel="stylesheet" type="text/css" />
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js"
	type="text/javascript"></script>
<!-- 달력 import end -->


<div class="main-panel">
	<div class="content-wrapper">
		<!-- Body section Start -->
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h3 class="font-weight-bold mb-0">과제등록</h3>
					</div>
				</div>
			</div>
		</div>
		<!-- Main Content start -->
		<div class="row">
			<div class="col-12 grid-margin stretch-card">
				<div class="card">
					<form class="forms">
						<div class="card-header">
							<h3 class="card-title">강의 설정</h3>
							<div class="row">
								<div class="col-md-3" id="choiceClass">
								<label for="choiceClass" class="text-warning">강의선택</label>
									<select class="form-control">
										<option>강의1</option>
										<option>강의12</option>
										<option>강의13</option>
									</select>
								</div>
							</div>
						</div>

						<div class="card-body">
							<div class="row">
								<div class="form-group col-md-4">
									<label for="exampleInputName1">과제 제목</label> <input type="text"
										class="form-control" id="exampleInputName1" placeholder="Name">
								</div>
								<div class="form-group">
                      <label>File upload</label>
                      <input type="file" name="img[]" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" class="form-control file-upload-info" disabled="" placeholder="Upload Image">
                        <span class="input-group-append">
                          <button class="file-upload-browse btn btn-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
							</div>

							<div class="form-group">
								<label for="exampleTextarea1">과제 설명</label>
								<textarea class="form-control" id="exampleTextarea1" rows="25"></textarea>
							</div>
						</div>

						<div class="card-footer" style="text-align: center;">
							<button type="submit" class="btn btn-primary mr-2">Submit</button>
							<button class="btn btn-light">Cancel</button>

						</div>
					</form>
				</div>
			</div>
		</div>
	</div>




	<!-- Main-content End -->
	<!-- Body section End -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />