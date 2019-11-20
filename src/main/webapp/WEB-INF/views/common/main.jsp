<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
	<link  rel='stylesheet'  href='${path}/resources/css/fullcalendar.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/daygrid.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/timegrid.css'  />  
	<script src='${path}/resources/js/moment.min.js'></script>  
	<script src='${path}/resources/js/fullcalendar.min.js'></script>
	<script src='${path}/resources/js/interaction.js'></script>
	<script src='${path}/resources/js/daygrid.js'></script>
	<script src='${path}/resources/js/timegrid.js'></script>
	<script src='${path}/resources/js/ko.js'></script>
<jsp:include page="header.jsp" />

<!-- <div class="main-panel">
	<div class="content-wrapper">
		<div class="row">
			<div class="col-md-12 grid-margin">
				<div class="d-flex justify-content-between align-items-center">
					<div>
						<h4 class="font-weight-bold mb-0">Main Content</h4>
					</div>
				</div>
			</div>
			</div>
			<div class="row"> -->
			

            
 
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
    	  var Calendar = FullCalendar.Calendar;
    	  // var Draggable = FullCalendarInteraction.Draggable;
    	 
    	  var containerEl = document.getElementById('external-events');
    	  var calendarEl = document.getElementById('calendar');
    	  var checkbox = document.getElementById('drop-remove');


        
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        defaultView: 'dayGridMonth',
        defaultDate: new Date(),
        header: {
            left: 'prev,next today',
            center: 'title',
            // right: 'dayGridMonth,timeGridWeek,timeGridDay'
            right: ''
        },
         editable: true,
        


          locale: 'ko',
          selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
          selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
          // 선택했을때 함수
          select: function(data) {            
           let end = moment(new Date(moment(data.endStr, "YYYY-MM-DD").subtract(1, 'days').toDate())).format('YYYY-MM-DD');
           $(".modalCal").modal("show");
           $(".modal-backdrop").css("display","block");
           $('.modal-content').css('display','block');
            $(".modalCal")
              .find("#title")
              .val("");
            $(".modalCal")
              .find("#starts-at")
              .val(data.startStr);
            $(".modalCal")
              .find("#ends-at")
              .val(end);
            $("#save-event").show();
            $("input").prop("readonly", false);
          },
           eventClick:function(event) {
                if(confirm("일정을 삭제 하시겠습니까?")) {
                  // 삭제하는 로직 작성
                  $.ajax({
                    type:"post",
                    url:'${path}/deleteCalendar.hd',
                    data:{"title" : event.event._def.title,
                          "start" : moment(event.event._instance.range.start).format('YYYY-MM-DD'),
                          "end" : moment(event.event._instance.range.end).add(-1,'day').format('YYYY-MM-DD'),
                          "deptCode": event.event._def.groupId
                          },
                          success:function(data) {
                            location.href='${path}/schedule.hd';
                          }

                  });
                }
            }
     	
    });//calendar종료
 $(function(){
    calendar.render();
    $.ajax({
            url: '${pageContext.request.contextPath}/getCalendar.hd',
            type: 'post',
            //인포 찾기
            data: {"start": moment(new Date(calendar.state.dateProfile.activeRange.start)).format('YYYY-01-01'),
                   "end": moment(new Date(calendar.state.dateProfile.activeRange.end)).add(1,'year').format('YYYY-03-01')},
            success: function(data) {
              if(data != null) {
                  $.each(data, function(key, items) {
                    $.each(items,function(index, item) {
                      let depCode = "${sessionScope.loginMember.deptCode }";
                      let flag = moment(new Date()).format('YYYY-MM-DD') > moment(new Date(item['enDate'])).format('YYYY-MM-DD')?'rgba(0, 0, 0, 0.2)':depCode == item['deptCode']?"rgba(235, 160, 160, 0.3)":"rgba(104, 175, 255, 0.2)";
                      let title = depCode == item['deptCode']?item['planName']: "[" +item['deptName'] +"] " + item['planName'];
                      let end = moment(new Date(item['stDate'])).format('YYYY-MM-DD') == moment(new Date(item['enDate'])).format('YYYY-MM-DD')?moment(new Date(item['enDate'])).format('YYYY-MM-DD'):moment(new Date(item['enDate'])).add(1,'day').format('YYYY-MM-DD');
                          let setData = {
                              "title" : title,
                              "start" : moment(new Date(item['stDate'])).format('YYYY-MM-DD'),
                              "end" : end,
                              "groupId":item['deptCode'],
                              "color" : flag
                          };
                          calendar.addEvent(setData);
                    })
                  }) 
                //just to give a visual on the data. From what you were doing in your example it looks like your data is already in a format suitable to be used by fullCalendar, so no need to push it all into another array
              }
            },
            error: function(jqXHR, textStatus, errorThrown)
            {
              alert("Error when fetching events: " + textStatus + " - " + errorThrown);
            }
        });
   
      });
        });  
    
        // 모달창 close 하는 함수
        $(function(){
          $(".btn-default").click(function(){
            $(".modal-content").css("display","none");
            $(".modal-backdrop").css("display","none");

          });
        }); 

        $(function(){
          $(".closeCal").click(function(){
            $(".modal-content").css("display","none");
            $(".modal-backdrop").css("display","none");

          });
        });
        

        function insertPlan() {
          let start = $('#starts-at').val();
          let end = $('#ends-at').val();
          let title = $('#title').val();
          location.href='${pageContext.request.contextPath}/insertPlan.hd?start='+start+'&end='+end+'&title='+title+'&url=/schedule.hd';
        }

     
</script>
<style>
 
  html, body {
    margin: 0;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
 
  #external-events {
    position: fixed;
    /* z-index: 2; */
    top: 300px;
    left: 240px;
    width: 150px;
    padding: 0 10px;
    border: 1px solid #ccc;
    background: #eee;
  }
 
  .demo-topbar + #external-events { /* will get stripped out */
    top: 60px;
  }
 
  #external-events .fc-event {
    margin: 1em 0;
    cursor: move;
  }
 
  #calendar-container {
    position: relative;
    /* z-index: 1; */
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }

  /* 여기부터 모달 */
  #wrap {
  width: 1100px;
  margin: 0 auto;
}


input {
  width: 50%;
}

input[type="text"][readonly] {
  border: 2px solid rgba(0, 0, 0, 0);
}

/*info btn*/
.dropbtn {
  /*background-color: #4CAF50;*/
  background-color: #eee;
  margin: 10px;
  padding: 8px 16px 8px 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  left: 50%;
  background-color: #f1f1f1;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
  z-index: 5;
  margin-left: 100px;
  margin-top: -300px;
}


.dropdown-content p {
  color: black;
  padding: 4px 4px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}

.dropdown:hover .dropbtn {
  background-color: grey;
}

.dropdown:hover .dropbtn span {
  color: white;
}

.modal-content {
  display: none;
  position: absolute !important;
  width: 400px !important;
  top: -700px !important;
  left: 11.5% !important;
  z-index: 9999 !important;
}

.form-control{
  display: inline-block !important;
  width: 250px !important;
  /* float: left; */
}

.col-xs-4 {
  margin-left: 25px;
  width: 80px;
}

/* closrCal */
.closeCal {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            border-radius: 5px;
            position: absolute;
            top: 5%;
            right: 5%;
        }
        .closeCal:hover,
        .closeCal:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        
       th,td{
       	text-align:center;
       }

</style>

		<div class="main-panel">
      <div class="content-wrapper">
      <div class="row">
        <div class="col-lg-6 grid-margin stretch-card">
        <div class='card card-body'>
          
         
    <!-- 이건 행사 신청을 위한 drop event 
      <div id="external-events">
        <p>
          <strong>Draggable Events</strong>
        </p>
        신청한 이벤트들 for문으로 집어 넣기 
    <div class="fc-event">My Event 1</div>
    <input type='hidden' value = ''>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div> -->
<div id='calendar'></div>
</div></div>

<div id='calendar'></div>

<!-- 도움말 설정하는 div 
<div class="dropdown">
  <div class="dropdown-content">
    <p>Click a calendar date to invoke a Bootstrap Modal Box.</p>
    <p>Add event title/description, start date, and end date.</p>
    <p>Click "Save" to save event.</p>
    <p>Click event again to re-open in Bootstrap Modal Box (Event is non-editable).
      <p>
        <p>Click "x" to delete event.</p>
  </div>
  <button class="fa dropbtn" style="font-size:24px; margin-left: 75%; color: black"><span>&#xf128;</span></button>
</div> -->

<div id='datepicker'></div>

			
			
			
				<div class="col-lg-6 grid-margin stretch-card">
				<div class='card card-body'>
                  <h4 class="card-title">Hoverable Table</h4>
                  <p class="card-description">
                    Add class <code>.table-hover</code>
                  </p>
                  <div class="table-responsive"  style="overflow-y:hidden;">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>제목</th>
                          <th>날짜</th>
                          <th>조회수</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="l" items="${list}">
                        <tr onclick='location.href="/notice/viewContent.hd?boardNo=${l.boardNo}"'>
                         	<td style="width:10%;">${l.boardNo }</td>
	                        <td style="width:60%;">${l.boardTitle}</td>
	                        <td style="width:20%;">${l.regDate }</td>
	                        <td style="width:10%;">${l.hitCount }</td>
                        </tr>
                       </c:forEach>
                        
                      </tbody>
                    </table>
                    ${pageBar }
                  </div>
                </div>
              </div>
			</div>


			<jsp:include page="footer.jsp" />