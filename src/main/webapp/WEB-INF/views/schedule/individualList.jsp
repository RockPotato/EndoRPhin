<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<body>

<script>

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
	
           var trashEl = $(this).el;
           var ofs = trashEl.offset();

           var x1 = ofs.left;
           var x2 = ofs.left + trashEl.outerWidth(true);
           var y1 = ofs.top;
           var y2 = ofs.top + trashEl.outerHeight(true);
           
           return false;
           
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
         if(title!=null){
        	/*  var userid=null; */
        	/*  if($("#frmTap").hasClass('active')){
        		 userid =; 
        	 } */
        		 
        	 
            $.ajax({
                url         : "${cp}/schedule/scheduleInsertAjax" ,
                method      : "get",
                traditional : true,
                 data      : {  title: title,
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
	                	 datas.push({id : temp.schedule_no,
	                         title : temp.schedule_title,
	                          start : temp.schedule_start,
	                          end : temp.schedule_end});
	                 
                 
                
              }   
            	 calendar.refetchEvents();
              suss(datas);
  
           }                 
        }); 
        
     }
      
     });
    calendar.render();
  });
                   
  
                                           
  $(document).ready(function() {
	  
	    var session = '${employeeVo.deptname}';
	   
	   if(session == '인사'){
		   $('#company').css('pointer-events', 'inherit');
	   }  
	   
	   
	$("#frmTap").trigger('click');
		
		
  });
		                       
  
</script>
