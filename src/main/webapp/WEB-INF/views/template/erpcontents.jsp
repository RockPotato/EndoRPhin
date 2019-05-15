<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<style>
.c3-area {
	opacity: 1;
}
.col-md-5 > h3{
	font-family: 'BMHANNAAir';
}

 #content-wrapper::-webkit-scrollbar { 
    display: none !important;
  }
</style>

<div class="container-fluid" >
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-bar"></i>&nbsp;월별 매입/매출 현황
			</h3>
			<canvas id="canvas1" height="400" width="700"></canvas>
		</div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-pie"></i>&nbsp;월별 입/출고 현황
			</h3>
			<canvas id="canvas2" height="400" width="700"></canvas>
		</div>

		<div class="col-md-1"></div>
	</div>


	<div class="row" style="margin-top: 40px; margin-bottom: 40px">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-bell"></i>&nbsp;공지 사항
			</h3>
			<table class="table table-hover">
				<thead class=" modalSketchedHeader">
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일시</th>
						<th>작성자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach begin="0" end="5" varStatus="index">
						<c:if test="${postList[index.index]!=null}">
							<tr class="noticeTr">
								<td>${postList[index.index].boardNo}</td>
								<td>${postList[index.index].title}</td>
								<td>${postList[index.index].postDate}</td>
								<td><input type="hidden" value="${postList[index.index].contents}">관리자</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-paperclip"></i>&nbsp; 최근 뉴스
			</h3>
			<div id="nt-example2-container">
		                <ul id="nt-example2" style="height: 60px; overflow: hidden;">
		                	<c:forEach items="${newsList}" var="vo">
		                	<li data-infos="${vo.description}" style="margin-top: 0px;">
								<i class="fa fa-fw state fa-play"></i>
								<span class="hour">${fn:substring(vo.pubDate,0,16)}</span> 
								<a href="${vo.link}" target="_sub">${vo.title }</a>
							</li>
							</c:forEach>
		                	</ul>
		                <div id="nt-example2-infos-container" style="display: block;">
			                <div id="nt-example2-infos-triangle">
			                </div>
			                <div id="nt-example2-infos" class="row">
			                	<div class="col-xs-4">
				                	<div class="infos-hour">${fn:substring(newsList[0].pubDate,0,16)}</div>
				                	<i class="fa fa-arrow-left" id="nt-example2-prev"></i>
				                	<i class="fa fa-arrow-right" id="nt-example2-next"></i>
			                	</div>
			                	<div class="col-xs-8">
			                		<div class="infos-text" >
			                		${newsList[0].description}
			                		</div>
			                	</div>
			                </div>
		                </div>
		            </div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" >
			<img src="/images/EndoRPhin_OrganizationLargeWidth.png" style="width:100%;height:70%;">
		</div>
	</div>
</div>

<div class="dialog" style="width: 600px;">
	 <span class="dialog__close">&#x2715;</span> <label for="inputName">공지사항</label>
		<div class="modal-body" >
			<label>제목 : </label>
			<input class="form-control" type="text" name="title" readonly/>
			<label>내용 : </label>
			<textarea style="height: 200px;" class="form-control" name="contents" readonly></textarea>
		</div>	 
</div>

<script>
function boardModal(){
		var dialogBox = $('.dialog'), 
		noticeTr = $('.noticeTr'), 
		dialogChild = $('.dialog *'), 
		dialogClose = $('.dialog__close');
		// Open the dialog
		noticeTr.on('click', function(e) {
			$("input[name=title]").val($(this).children('td').eq(1).html());
			$("textarea[name=contents]").html($(this).children('td').eq(3).children('input').val().replace(/(<([^>]+)>)/ig,''));
			dialogBox.toggleClass('dialog--active');
			e.stopPropagation()
		});

		// Close the dialog - click close button
		dialogClose.on('click', function() {
			dialogBox.removeClass('dialog--active');
		});

		// Close the dialog - press escape key // key#27
		$(document).keyup(function(e) {
			if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
			}
		});

		// Close dialog - click outside
		$(document).on(
				"click",
				function(e) {
					if ($(e.target).is(dialogBox) === false 
							&& $(e.target).is(dialogChild) === false) {
						dialogBox.removeClass("dialog--active");
					}
		});	
}
function news(){
	//newsTicker
	var nt_example2 = $('#nt-example2').newsTicker({
		row_height: 60,
		max_rows: 1,
		speed: 300,
		duration: 6000,
		prevButton: $('#nt-example2-prev'),
		nextButton: $('#nt-example2-next'),
		hasMoved: function() {
	    	$('#nt-example2-infos-container').fadeOut(200, function(){
	        	$('#nt-example2-infos .infos-hour').text($('#nt-example2 li:first span').text());
	        	$('#nt-example2-infos .infos-text').text($('#nt-example2 li:first').data('infos'));
	        	$(this).fadeIn(400);
	        });
	    },
	    pause: function() {
	    	$('#nt-example2 li i').removeClass('fa-play').addClass('fa-pause');
	    },
	    unpause: function() {
	    	$('#nt-example2 li i').removeClass('fa-pause').addClass('fa-play');
	    }
	});
	$('#nt-example2-infos').hover(function() {
	    nt_example2.newsTicker('pause');
	}, function() {
	    nt_example2.newsTicker('unpause');
	});
}
var salesList=new Array();
var purchaseList = new Array();
var buyList= new Array();
var sellList= new Array();
function getTax_calList(){
	
	$.ajax({
		method : "get",
		url : "/getTax_calSum6Months",
		async : false,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				if(i%2==0){
					purchaseList.push(parseInt(data[i].sumValue.replace(/,/gi,''))/10000);
				}else{
					salesList.push(parseInt(data[i].sumValue.replace(/,/gi,''))/10000);
				}
			}
		}
	});
	$.ajax({
		method : "get",
		url : "/groupSelectReceiveWhileThisYear",
		async : false,
		success : function(data) {
			for(var i=0;i<data.length;i++){
				if(i%2==0){
					buyList.push(parseInt(data[i].quantity));
				}else{
					sellList.push(parseInt(data[i].quantity));
				}
			}
		}
	});
}
$(document)
.ready(
    function() {
    	getTax_calList();
		news();
		boardModal();
        //월별 매출현황 시작
        
        var randomScalingFactor = function() {
            return Math.round(Math.random() * 100)
        };
        var months = ["Jan", "Feb", "Mar", "Apr",
            "May", "Jun", "Jul", "Aug", "Sep",
            "Oct", "Nov", "Dec"
        ];
        var selectMonths = new Array();
        var month = new Date().getMonth();
        if(month<6){
    		for(var i=0;i<6;i++){
    			selectMonths.push(months[i]);
    		}
    	}else{
    		for(var i=6;i<12;i++){
    			selectMonths.push(months[i]);
    		}
    	}
        var barChart = null;
        var barChartData = {
            labels: selectMonths,
            datasets: [{
                fillColor: "#6C757D",
                strokeColor: "#6C757D",
                highlightFill: "#6C757D",
                highlightStroke: "#6C757D",
                data: purchaseList
            }, {
                fillColor: "#6C757D",
                strokeColor: "#6C757D",
                highlightFill: "#6C757D",
                highlightStroke: "#6C757D",
                data: salesList
            }]
        };

        $(function() {
            var ctx = document.getElementById("canvas1")
                .getContext("2d");
            barChart = new Chart(ctx).Bar(barChartData, {
                //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
                scaleBeginAtZero: false,
                //Boolean - Whether grid lines are shown across the chart
                scaleShowGridLines: true,
                //String - Colour of the grid lines
                scaleGridLineColor: "rgba(0,0,0,0.05)",
                //Number - Width of the grid lines
                scaleGridLineWidth: 1,
                //Boolean - If there is a stroke on each bar
                barShowStroke: false,
                //Number - Pixel width of the bar stroke
                barStrokeWidth: 2,
                //Number - Spacing between each of the X value sets
                barValueSpacing: 5,
                //Number - Spacing between data sets within X values
                barDatasetSpacing: 1,
                onAnimationProgress: function() {},
                onAnimationComplete: function() {}
            });
        });

        $("input#btnAdd")
            .on(
                "click",
                function() {
                    barChart
                        .addData(
                            [
                                randomScalingFactor(),
                                randomScalingFactor()
                            ],
                            months[(barChart.datasets[0].bars.length) % 12]);
                });

        $("canvas1").on("click", function(e) {
            var activeBars = barChart.getBarsAtEvent(e);

            for (var i in activeBars) {}
        });
        //월별 매출현황 종료

        var radarChart = null;
        var radarChartData = {
            labels:selectMonths,
            datasets: [{
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: sellList
            }, {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: buyList
            }]
        };

        $(function() {
            var ctx = document.getElementById("canvas2")
                .getContext("2d");
            radarChart = new Chart(ctx).Radar(radarChartData, {
                //Boolean - Whether to show lines for each scale point
                scaleShowLine: true,
                //Boolean - Whether we show the angle lines out of the radar
                angleShowLineOut: true,
                //Boolean - Whether to show labels on the scale
                scaleShowLabels: false,
                // Boolean - Whether the scale should begin at zero
                scaleBeginAtZero: true,
                //String - Colour of the angle line
                angleLineColor: "rgba(0,0,0,0.1)",
                //Number - Pixel width of the angle line
                angleLineWidth: 1,
                //String - Point label font declaration
                pointLabelFontFamily: "'Arial'",
                //String - Point label font weight
                pointLabelFontStyle: "normal",
                //Number - Point label font size in pixels
                pointLabelFontSize: 10,
                //String - Point label font colour
                pointLabelFontColor: "#666",
                //Boolean - Whether to show a dot for each point
                pointDot: true,
                //Number - Radius of each point dot in pixels
                pointDotRadius: 3,
                //Number - Pixel width of point dot stroke
                pointDotStrokeWidth: 1,
                //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                pointHitDetectionRadius: 20,
                //Boolean - Whether to show a stroke for datasets
                datasetStroke: true,
                //Number - Pixel width of dataset stroke
                datasetStrokeWidth: 2,
                //Boolean - Whether to fill the dataset with a colour
                datasetFill: false,
                onAnimationProgress: function() {},
                onAnimationComplete: function() {}
            });
        });

        $("input#btnAdd")
            .on(
                "click",
                function() {
                    radarChart
                        .addData(
                            [
                                randomScalingFactor(),
                                randomScalingFactor()
                            ],
                            months[(radarChart.datasets[0].points.length) % 12]);
                });

        $("canvas2").on("click", function(e) {
            var activePoints = radarChart.getPointsAtEvent(e);

            for (var i in activePoints) {}
        });

    });
</script>