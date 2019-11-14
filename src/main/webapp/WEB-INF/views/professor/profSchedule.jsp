<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/son_pro_header.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>


<div class="main-panel">
	<div class="content-wrapper">
<!-- Body section Start -->	
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">시간표</h4>
					</div>
				</div>
			</div>
			</div>
<!-- Main Content start -->	
<div class="row">
	<div class="col-12 grid-margin stretch-card">
		<div class="card">
			<div class="card-body">
				<table class="table table-hover" Border="1" style="text-align:center;">
					<thead>
						<tr>
							<th>/</th>
							<th>월</th>
							<th>화</th>
							<th>수</th>
							<th>목</th>
							<th>금</th>
							<th style="color:red;">토</th>
							<th style="color:blue">일</th>
						</tr>
					</thead>
					<c:set value="09:00" var="nine"/>
					<c:set value="월" var="th"/>
					<tbody>
						<tr>
							<!-- <th style="width:50px;"><input type='text' value="1교시 (09:00~10:00)" style="border:none;text-align:center;font-weight:bold;" readonly/></th> -->
							<th style="width:50px;">1교시 (09:00~10:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>2교시 (10:00~11:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>3교시 (11:00~12:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>4교시 (14:00~15:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>5교시 (15:00~16:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>6교시 (16:00~17:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>7교시 (17:00~18:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>8교시 (19:00~20:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>9교시 (20:00~21:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
						<tr>
							<th>10교시 (21:00~22:00)</th>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td><div class="className"></div></td>
							<td style="background-color:lightpink;"><div class="className"></div></td>
							<td style="background-color:skyblue;"><div class="className"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>

</script>

<style>
	.gap0{
		height:50px;
	}
	.gap1{
		height:100px;
	}
	.gap2{
		height:200px;
	}
	.gap3{
		height:300px;
	}
</style>

<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>