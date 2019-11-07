<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<style>
	th{
		text-align:center !important;
	}
	td{
		heigth:20px !important;
		text-align:center !important;
	}
	.firsttd{
		width:30px !important;
	}
</style>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

<div class="main-panel">
	<div class="content-wrapper">
			   <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Hoverable Table</h4>
                  <p class="card-description">
                    Add class <code>.table-hover</code>
                  </p>
                  <div class="table-responsive">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <td class="firsttd">보낸 사람</td>
                          <td>${reqOne.toName }</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>보낸 시간</td>
                          <td>${reqOne.toTime }</td>
                        </tr>
                        <tr>
                        </tr>
                        <tr>
                          <td>제목</td>
                          <td>${reqOne.reqTitle }</td>
                        </tr>
                        <tr>
                          <td>내용</td>
                          <td>
                          <textarea name="reqContents" cols="40" rows="15" class="form-control" readonly="readonly" disabled>${reqOne.reqContents }</textarea>
                          </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<button class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/answerUpdate.hd?reqNo=${reqOne.reqNo }&reqTitle=${reqOne.reqTitle }&reqContents=${reqOne.reqContents }&toName=${reqOne.toName }&fromName=${reqOne.fromName }&toTime=${reqOne.toTime }&reqRead=${reqOne.reqRead} '">처리 완료</button>&nbsp&nbsp&nbsp&nbsp
                        		<c:if test="${reqOne.reqRead eq '처리 완료'}">
                        		<button class="btn btn-inverse-info btn-fw" id="answerBtn">답변 보내기</button>&nbsp&nbsp&nbsp&nbsp
                        		</c:if>
                        		<button class="btn btn-inverse-info btn-fw" onclick="location.href='${path}/reqList.hd'">목록으로</button>
                        	</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
              
            
            <div id="answerModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <form action="${path}/req.hd">
			<span class="close" id="close2">&times;</span>
			<p>건의사항 답변 (처리완료시 답변)</p>
			<div class="form-group">
			<hr>
			<label class="control-label">제목</label>
			<input type="text" id="reqTitle" name="reqTitle" placeholder="제목을 입력하세요" class="form-control" value="${reqOne.reqTitle } [건의사항 처리완료]" required />
			<hr>
			<input type="hidden" id="toName" name="toName" value="EA000000000"/>
			<label class="control-label">받는사람</label>
			<input type="hidden" id="fromName" name="fromName" value="${reqOne.toName }"/>
			<input type="text" class="form-control" value="${reqOne.toName }" readonly/>
			
			<hr>
			<label class="control-label">내용</label>
			<textarea name="reqContents" cols="40" rows="8" class="form-control">[건의사항 처리완료]</textarea>
			</div>
			<input type="button" class="btn btn-inverse-info btn-fw" id="close3" value="취소" style="float: right; margin: 7px;">
			<input type="submit" class="btn btn-inverse-info btn-fw" value="보내기" style="float: right; margin: 7px;">
			<br>
			<br>
		</form>
      </div>
 
    </div>
    
    <script>
     // Get the modal
        var modal = document.getElementById("answerModal");
 
        // Get the button that opens the modal
        var btn = document.getElementById("answerBtn");
 
        // Get the <span> element that closes the modal
        var close = document.getElementById("close2");                                          
        var close1 = document.getElementById("close3");  
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
        </script>
           
           
           
           
           
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>