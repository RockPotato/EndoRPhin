<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>

#calendar {
background-color: #FBF5EF;
}     
.fc-title{
    font-size: 1.5em;
    color: white;
}     
     

  .fc-sun {color:#e31b23; background-color:#F8E0E0 }
.fc-sat {color:#007dc3;  background-color:#E0F2F7 }
  
  
a:hover,a:focus{
    outline: none;
    text-decoration: none;
}
.nav{
	background-color:#f5f4f0 !important;
}
.tab .nav-tabs{
    position: relative;
    border-bottom: 0 none;
    background: #fff;
}
.tab .nav-tabs li{
    text-align: center;
    margin-right: 0;
}
.tab .nav-tabs li a{
    font-size: 15px;
    font-weight: 600;
    color: #999;
    text-transform: uppercase;
    padding: 15px 30px;
    background: #fff;
    margin-right: 0;
    border-radius: 0;
    border: 1px solid #ddd;
    border-right: none;
    border-bottom: 2px solid #ddd;
    position: relative;
    transition: all 0.5s ease 0s;
}
.tab .nav-tabs li:last-child a,
.tab .nav-tabs li:last-child.active a,
.tab .nav-tabs li:last-child a:hover{
    border-right: 1px solid #ddd;
}
.tab .nav-tabs li a:hover,
.tab .nav-tabs li.active a{
    color: #4981F2;
    border-bottom: 2px solid #4981F2;
    border-right: none;
}
.tab .tab-content{
    font-size: 14px;
    color: #6f6c6c;
    line-height: 26px;
    padding: 20px 10px;
    margin-top: 10px;
}
.tab .tab-content h3{
    font-size: 24px;
    color: #000;
    margin-top: 0;
}
@media only screen and (max-width: 480px){
    .tab .nav-tabs li{
        width: 100%;
        border-right: 1px solid #ddd;
        margin-bottom: 8px;
    }
}

#company{

pointer-events: none;

} 
  
</style> 
                          
<body>


   <div  class="container-fluid">

		<div class="row" style="margin-top: 10px" onchange="test()">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<h1 style="font-weight: bolder; margin-bottom: 20px;" >
	               <i style="color: #4981F2" class="fas fa-calendar-alt"></i> 일정 관리
	            </h1>
              
				<div class="tab" role="tabpanel" style="margin-bottom: 10px;">
					<!-- Nav tabs -->
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a id="frmTap"
							href="#Section1" aria-controls="home" role="tab"
							data-toggle="tab">회사 일정</a></li>
						<li role="presentation"><a href="#Section2" 
							aria-controls="profile" role="tab" data-toggle="tab">개인 일정 </a></li>
					</ul>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

		<div class="tab-content tabs">
			<div role="tabpanel" class="tab-pane fade in active" id="Section1">
				<div class="row" style="margin-top: 10px">
					<div class="col-md-1"></div>
					<div class="col-md-10" id="company">
						<!-- 회사 달력 시작 -->
						<div id='calendar'></div>
						<!-- 회사 달력 종료 -->
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane fade in active" id="Section2">
				<div class="row" style="margin-top: 10px">
					<div class="col-md-1"></div>
					<div class="col-md-10" id="individual">
						<!-- 회사 달력 시작 -->
						<div id='calendar2'></div>
						<!-- 회사 달력 종료 -->
					</div>
					<div class="col-md-1"></div>
				</div>
			</div>
		</div>


	</div>
	
	
   
<script>
var userid = '${employeeVo.userId}';
var session = '${employeeVo.deptname}';


//========================날짜포멧 시작
function getFormatDate(date){
   var year = date.getFullYear();                         //yyyy
   var month = (1 + date.getMonth());                     //M
   month = month >= 10 ? month : '0' + month;             // month 두자리로 저장
   var day = date.getDate();                              //d
   day = day >= 10 ? day : '0' + day;                     //day 두자리로 저장
   return  year + '-' + month + '-' + day;
}
//========================날짜포멧 종료

var calendar;

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'timeGrid' ],
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      defaultDate: getFormatDate(new Date()),
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      
      //============================================캘린더 수정부분 시작 
      
      eventResize : function(event) {
       var id = event.event.id;
        var title = event.event.title;
       var start = getFormatDate(event.event.start);
       var end = getFormatDate(event.event.end);
                                                       
     $.ajax({
           url         : "${cp}/schedule/scheduleUpdateAjax" ,
           method      : "get",
           traditional : true,
            data      : {  schedule_no: id,
                       schedule_title: title,
                       schedule_start: start,
                       schedule_end: end
            }, 
           success      : function(data) {
              calendar.refetchEvents();
           } 
        }); 
   
   },
   
   //===========================================================캘린더 수정부분 종료
   
   
    //============================================타이틀 수정 시작
    	  
   eventClick: function(event, element) {
		
		var title = prompt('Event Title:');
		
	    event.event.setProp = title;
	    
	    
	 var id =  event.event.id;
	 var title = event.event.setProp;
	    
	    $.ajax({
	          url         : "${cp}/schedule/scheduleUpdateAjax" ,
	          method      : "get",
	          traditional : true,
	           data      : {  schedule_no: id,
	                          schedule_title: title
	           }, 
	          success      : function(data) {
	             calendar.refetchEvents();
	          } 
	       });  
	   
	  },
	  
   //===========================================================타이틀 수정 종료
   
                              
 
    //============================================일정 이동하기 시작
   eventDrop: function(info) {
       
       if(info.event.end != null){
    	   var id =  info.event.id;
           var title = info.event.title;
           var start = getFormatDate(info.event.start);
           var end = getFormatDate(info.event.end); 
       }else if(info.event.end == null){
    	   var id =  info.event.id;
           var title = info.event.title;
           var start = getFormatDate(info.event.start);
           var end = getFormatDate(info.event.start); 
       }
       
       
                                                      
	   $.ajax({
	          url         : "${cp}/schedule/scheduleUpdateAjax" ,
	          method      : "get",
	          traditional : true,
	           data      : {  schedule_no: id,
	                          schedule_title: title,
		                      schedule_start: start,
		                      schedule_end: end
	           }, 
	          success      : function(data) {
	             calendar.refetchEvents();
	          } 
	       });  
	   
   },
 //============================================일정 이동하기 종료
 
 
      eventDragStop: function(event) {
      
           var trashEl = jQuery('#calendar');
	
           var ofs = trashEl.offset();

           var x1 = ofs.left;
           var x2 = ofs.left + trashEl.outerWidth(true);
           var y1 = ofs.top;
           var y2 = ofs.top + trashEl.outerHeight(true);
           
           if (!(event.jsEvent.pageX >= x1 && event.jsEvent.pageX<= x2 &&
                event.jsEvent.pageY >= y1 && event.jsEvent.pageY <= y2)) {
                 event.el.remove();
              $.ajax({
                 url         : "${cp}/schedule/scheduleDeleteAjax" ,
                 method      : "get",
                 traditional : true,
                  data      : {  scNo: event.event.id}, 
                 success      : function(allSchedule) {
                    event.event.remove();
                    calendar.refetchEvents();
                 } 
              }); 
              }
        },   
      select: function(arg) {
        var title = prompt('Event Title:');
         if(title==''){
            alert('일정을 입력하세요');
            return false;
         }
         
         
         
         if(title!=null && $('#Section1').attr('class').split(' ').length == 5){
        	  var userid=null;

            $.ajax({
                url         : "${cp}/schedule/scheduleInsertAjax" ,
                method      : "get",
                traditional : true,
                 data      : {    title: title,
                	              userid : userid,
                                  start: arg.startStr,
                                   end: arg.endStr,
                                   allDay: arg.allDay}, 
                success      : function(data) {
                      calendar.refetchEvents();
                } 
             }); 
         }
        calendar.unselect()
      },
              
      
      editable: true,
      eventLimit: true, // allow "more" link when too many events
      events:function (timeStamp,suss,fail){
    	  
    	  
         
          
        $.ajax({
           url         : "${cp}/schedule/getAllSchedule" ,
           method      : "get",
           async: false,
           success      : function(allSchedule) {
        		
              var datas=[];
            for (var i = 0; i < allSchedule.length; i++) {
                 var temp = allSchedule[i];
                 if(temp.userid==null){
                	 
	                	 datas.push({id : temp.schedule_no,
	                         title : temp.schedule_title,
	                          start : temp.schedule_start,
	                          end : temp.schedule_end});
                 }
              }   
              suss(datas);
  
           }                 
        }); 
               
     }
      
     });
    calendar.render();
             calendar.refetchEvents();
  });
                   
  
  $(document).ready(function() {
	  
	   
	   
	   if(session == '인사'){
		   $('#company').css('pointer-events', 'inherit');
	   }  
	   
	   
	$("#frmTap").trigger('click');
		
		
  });
		                       
  
</script>
<script src='/resources/packages/list/individualList.js'></script> 
                                                             
<%--   --%>



</body>

