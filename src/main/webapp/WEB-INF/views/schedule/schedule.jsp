<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page = "/WEB-INF/views/common/header.jsp"/>

	<link  rel='stylesheet'  href='${path}/resources/css/fullcalendar.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/daygrid.css'  />  
	<link  rel='stylesheet'  href='${path}/resources/css/timegrid.css'  />  
	<script src='${path}/resources/js/moment.min.js'></script>  
	<script src='${path}/resources/js/fullcalendar.min.js'></script>
	<script src='${path}/resources/js/interaction.js'></script>
	<script src='${path}/resources/js/daygrid.js'></script>
	<script src='${path}/resources/js/timegrid.js'></script>
	<script src='${path}/resources/js/ko.js'></script>
            
 
  <script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
    	  var Calendar = FullCalendar.Calendar;
    	  var Draggable = FullCalendarInteraction.Draggable;
    	 
    	  var containerEl = document.getElementById('external-events');
    	  var calendarEl = document.getElementById('calendar');
    	  var checkbox = document.getElementById('drop-remove');

        	
        	new Draggable(containerEl, {
            itemSelector: '.fc-event',
            eventData: function(eventEl) {
              return {
                title: eventEl.innerText
              };
            }
          });

        
        
        var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: ['interaction', 'dayGrid', 'timeGrid'],
        defaultView: 'dayGridMonth',
        defaultDate: new Date(),
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
         editable: true,
         droppable: true, // this allows things to be dropped onto the calendar
         drop: function(info) {
           // is the "remove after drop" checkbox checked?
          if (checkbox.checked) {
            // if so, remove the element from the "Draggable Events" list
            info.draggedEl.parentNode.removeChild(info.draggedEl);
          }
        },
          locale: 'ko',
          selectable: true,  //사용자가 클릭 및 드래그하여 선택을 할 수 있도록
          selectHelper: true,//사용자가 드래그되는 동안 "자리"이벤트를 그릴 것인지 여부를 지정할 수 있습니다.
          // 선택했을때 함수
          // select: function(data) {
          //   console.log(data);
          //  console.log(data.allDay);
          //  console.log(data.startStr);
          //  console.log(data.endStr);
          // },
          //나중에 생성과 동시에 이벤트 넣는게 가능한지 실험해볼 코드 샘플
        // eventSources: [{
        //     events : function(info, successCallback, failureCallback) {
        //         $.ajax({
    		//  /*  contentType:'application/json',
    	  //       dataType:'json', */
    	  //       url:'${pageContext.request.contextPath}/getCalendar.hd',
    	  //       type:'post',
        //         data: {"start": moment(info.startStr).format('YYYY-MM-DD'),
        //         		"end": moment(info.endStr).format('YYYY-MM-DD')},
    	  //       async: false,
    	  //       /* data:JSON.stringify(viewData), */
    	  //       success:function(data){
        //               if(data != null) {
        //             let setData = {
        //                 "title" : data.list[0]['planName'],
        //                 "start" : data.list[0]['stDate'],
        //                 "end" : data.list[0]['enDate']
        //             };
        //             setData = JSON.stringify(setData);
        //             console.log(setData);
        //             successCallback(setData);                     
    	  //       },
    	  //       error:function(){
    	  //           alert('저장 중 에러가 발생했습니다. 다시 시도해 주세요.');
    	  //       }
        //       	    });
                      // }
        // }]
     	
    });//calendar종료
 $(function(){
    calendar.render();
    $.ajax({
            url: '${pageContext.request.contextPath}/getCalendar.hd',
            type: 'post',
            //인포 찾기
            data: {"start": moment(new Date(calendar.state.dateProfile.activeRange.start)).format('YYYY-MM-DD'),
                    "end": moment(new Date(calendar.state.dateProfile.activeRange.end)).format('YYYY-MM-DD')},
            success: function(data) {
              if(data != null) {
                  $.each(data, function(key, items) {
                    $.each(items,function(index, item) {

                      console.log(index);
                      console.log(item);
                          let setData = {
                              "title" : item['planName'],
                              "start" : item['stDate'],
                              "end" : item['enDate']
                          };
                          console.log(setData);
                          calendar.addEvent(setData);
                          console.log(calendar.getEvents());
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
        
		    
        // //클릭 했을때 이벤트
        $('.fc-day').on('click',function (){
        //     //클릭한 날짜에 일일 스케쥴로 이동시키기
            let day = this.attributes['data-date'].nodeValue;
        //     //인덱스
            let index = $('.fc-day').index(this);	
        
            console.log(this.attributes['data-date'].nodeValue);
                console.log(index);
            alert(day);
            
        });
    
        });  
     
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
    z-index: 2;
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
    z-index: 1;
    margin-left: 200px;
  }
 
  #calendar {
    max-width: 900px;
    margin: 20px auto;
  }
 
</style>

		<div class="main-panel">
   		<div class="content-wrapper">

	<div class='card card-body'>
        
         
<div id="external-events">
    <p>
      <strong>Draggable Events</strong>
    </p>
    <!-- 신청한 이벤트들 for문으로 집어 넣기 -->
    <div class="fc-event">My Event 1</div>
    <input type='hidden' value = ''>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <div class="fc-event">My Event 1</div>
    <div class="fc-event">My Event 2</div>
    <div class="fc-event">My Event 3</div>
    <div class="fc-event">My Event 4</div>
    <div class="fc-event">My Event 5</div>
    <p>
      <input type="checkbox" id="drop-remove">
      <label for="drop-remove">remove after drop</label>
    </p>
  </div>
<div id='calendar'></div>
<input type="button" id="btnAddTest" value="추가">
    </div>
    

	


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>