<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@  taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
<link  rel='stylesheet'  href='${path}/resources/css/fullcalendar.css'  />  
  <script src='${path}/resources/js/moment.min.js'></script>  
<script src='${path}/resources/js/fullcalendar.js'></script>

 
	<div class="container-fluid">
		<div class="row">
	<div>
	
	
	<div  id="calendar"> </div>



	
	
	
<!-- 				<div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>

        <p>대학 행사</p>
    </div>
    <div id="cal_tab" class="cal">
   </div>
 -->    </div>

		</div>
			</div>

<!-- 
<script>
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar 그리기
    function drawCalendar(){
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
                setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap">';
                setTableHTML+='    <div class="cal-day"></div>';
                setTableHTML+='    <div class="cal-schedule"></div>';
                setTableHTML+='</td>';
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //날짜 초기화
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar 날짜표시
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        for(var i=firstDay.getDay();i<firstDay.getDay()+lastDay.getDate();i++){
            $tdDay.eq(i).text(++dayCount);
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar 월 이동
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
</script>



<style>
	
	.cal_top{
    text-align: center;
    font-size: 30px;
}
.cal{
    text-align: center;    
}
table.calendar{
    border: 1px solid black;
    display: inline-table;
    text-align: left;
}
table.calendar td{
    vertical-align: top;
    border: 1px solid skyblue;
    width: 100px;
}
	
	
</style>

 -->


<script type="text/javascript">

$(function(){
 calendarEvent();
});

function calendarEvent(eventData){
 $("#calender").html("");
 var date = new Date();
 var d = date.getDate();
 var m = date.getMonth();
 var y = date.getFullYear();
 var calendar = $('#calender').fullCalendar({
  header: {
   left: "",
   center: "title",
//    right: "month,basicWeek,basicDay"
   right: "today prev,next"
   },
   editable: true,
   titleFormat: {
   month: "yyyy년 MMMM",
   week: "[yyyy] MMM dd일{ [yyyy] MMM dd일}",
   day: "yyyy년 MMM d일 dddd"
   },
   allDayDefault: false,
   defaultView: "month",
   editable: false,
   monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
   dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
   dayNamesShort: ["일","월","화","수","목","금","토"],
   buttonText: {
   today : "오늘",
   month : "월별",
   week : "주별",
   day : "일별",
   },
   events : eventData,
   timeFormat : "HH:mm",
 });
 
</script>


	<jsp:include page = "/WEB-INF/views/common/footer.jsp"/>