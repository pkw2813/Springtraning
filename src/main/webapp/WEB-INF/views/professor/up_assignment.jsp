<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/sool_header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<div class="container col-md-12" style="text-align: center;">
	<section style="background-color: white;">
		<div class="row col-md-4"></div>
		<div class="row col-md-4">

				<ul class="nav nav-pills">
					<li role="presentation" class="active"><a href="#">Home</a></li>
					<li role="presentation"><a href="#">Profile</a></li>
					<li role="presentation"><a href="#">Messages</a></li>
				</ul>


			<table class="table table-bordered table-hover"
				style="text-align: center;">
				<thead class="thead-dark">
					<tr>
						<th>
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="sizing-addon3">과제명
									&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
									aria-describedby="sizing-addon3" value="" />
							</div>
						</th>
						<th>
							<div class="input-group input-group-sm">
								<span class="input-group-addon" id="sizing-addon3">제출기한
									&nbsp;&nbsp;&nbsp;</span> <input type="text" class="form-control"
									aria-describedby="sizing-addon3" value="" />
							</div>
						</th>
					</tr>
				</thead>
			</table>
		</div>



	</section>



</div>


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<jsp:include page="/WEB-INF/views/common/sool_footer.jsp" />