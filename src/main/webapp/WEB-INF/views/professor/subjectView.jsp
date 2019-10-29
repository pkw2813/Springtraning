<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="{$pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/sonHeader.jsp">
		<jsp:param name="pageTitle" value=""/>
	</jsp:include>

<div class="container-fluid">
	<div class="row">
		<div class="col-6">
			<table class="table">
				<tr>
					<th>ㅎㅇ</th>
					<th>ㅎㅇ</th>
					<th>ㅎㅇ</th>
					<th>ㅎㅇ</th>
					<th>ㅎㅇ</th>
				</tr>
				<tr>
					<td>ㅂㅇ</td>
					<td>ㅂㅇ</td>
					<td>ㅂㅇ</td>
					<td>ㅂㅇ</td>
					<td>ㅂㅇ</td>
				</tr>
			</table>
		</div>
	</div>
</div>

	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>