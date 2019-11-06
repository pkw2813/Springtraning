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
                          <textarea name="reqContents" cols="40" rows="15" class="form-control">${reqOne.reqContents }</textarea>
                          </td>
                        </tr>
                        <tr>
                        	<td colspan="2">
                        		<button class="btn btn-inverse-info btn-fw" id="answerBtn">답변 보내기</button>&nbsp&nbsp&nbsp&nbsp
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
        var modal = document.getElementById("answerModal");
 
        // Get the button that opens the modal
        var btn = document.getElementById("answerBtn");
 
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
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>