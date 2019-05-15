<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.c3-area {
	opacity: 1;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-1"></div>

		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-bar"></i>&nbsp;월별 매출 현황
			</h3>
			<canvas id="canvas1" height="450" width="600"></canvas>
		</div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-bar"></i>&nbsp;월별 수주 잔고
			</h3>
			<canvas id="canvas2" height="450" width="600"></canvas>
		</div>

		<div class="col-md-1"></div>
	</div>

	<div class="row" style="margin-top: 70px">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-bar"></i>&nbsp;공지 사항
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
					</tr>
					<tr class="table-active">
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Approved</td>
					</tr>
					<tr class="table-success">
						<td>2</td>
						<td>TB - Monthly</td>
						<td>02/04/2012</td>
						<td>Declined</td>
					</tr>
					<tr class="table-warning">
						<td>3</td>
						<td>TB - Monthly</td>
						<td>03/04/2012</td>
						<td>Pending</td>
					</tr>
					<tr class="table-danger">
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
						<td>Call in to confirm</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-5">
			<h3>
				<i class="fa fa-chart-bar"></i>&nbsp; 최근 뉴스
			</h3>
			<table class="table">
				<thead>
					<tr>
						<th>#</th>
						<th>Product</th>
						<th>Payment Taken</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Default</td>
					</tr>
					<tr class="table-active">
						<td>1</td>
						<td>TB - Monthly</td>
						<td>01/04/2012</td>
						<td>Approved</td>
					</tr>
					<tr class="table-success">
						<td>2</td>
						<td>TB - Monthly</td>
						<td>02/04/2012</td>
						<td>Declined</td>
					</tr>
					<tr class="table-warning">
						<td>3</td>
						<td>TB - Monthly</td>
						<td>03/04/2012</td>
						<td>Pending</td>
					</tr>
					<tr class="table-danger">
						<td>4</td>
						<td>TB - Monthly</td>
						<td>04/04/2012</td>
						<td>Call in to confirm</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="col-md-1"></div>
	</div>

</div>

<script>
$(document)
.ready(
    function() {

        //월별 매출현황 시작
        var randomScalingFactor = function() {
            return Math.round(Math.random() * 100)
        };
        var months = ["January", "February", "March", "April",
            "May", "June", "July", "August", "September",
            "October", "November", "December"
        ];
        var barChart = null;
        var barChartData = {
            labels: ["January", "February", "March", "April",
                "May", "June", "July"
            ],
            datasets: [{
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,0.8)",
                highlightFill: "rgba(220,220,220,0.75)",
                highlightStroke: "rgba(220,220,220,1)",
                data: [randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
            }, {
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,0.8)",
                highlightFill: "rgba(151,187,205,0.75)",
                highlightStroke: "rgba(151,187,205,1)",
                data: [randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
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

        var randomScalingFactor = function() {
            return Math.round(Math.random() * 100)
        };
        var months = ["January", "February", "March", "April",
            "May", "June", "July", "August", "September",
            "October", "November", "December"
        ];
        var radarChart = null;
        var radarChartData = {
            labels: ["January", "February", "March", "April",
                "May", "June", "July"
            ],
            datasets: [{
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
            }, {
                label: "My Second dataset",
                fillColor: "rgba(151,187,205,0.2)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(151,187,205,1)",
                data: [randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor(),
                    randomScalingFactor()
                ]
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