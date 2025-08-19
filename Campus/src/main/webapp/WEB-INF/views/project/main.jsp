<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
html, body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	height: 100%;
}
</style>
<body>
	<div class="wrap" style="height: 100vh;">
		<div class="card-header" style="border-bottom: none;">
			<h3 class="card-title ml-2 mt-2 mb-2"
				style="font-size: 25px; font-weight: bold;">프로젝트</h3>
		</div>
		<div class="row">
			<div style="width: 100px;"></div>
			<div class="col-8" style="font-weight: 600;">현재 진행중인 프로젝트 일정
				진행도: 70%</div>
		</div>
		<div class="row">
			<div style="width: 100px;"></div>
			<div class="col-10 mt-3">
				<div class="progress-group">
					<div class="progress progress-sm"
						style="height: 25px; border-radius: 8px; border: 1px solid #aaaaaa; background-color: #ffffff;">
						<div class="progress-bar"
							style="width: 70%; border-radius: 8px; background-color: #2ec4b6; color: #2ec4b6;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width:110px;"></div>
			<div class="mt-3" style="width:480px;">
				<div class="card card-primary card-outline" style="height:280px; border-top:3px solid #2ec4b6;">
					<div class="card-header">
						<h5 class="card-title m-0" style="font-size:16px; font-weight: 600;">현재 진행중인 프로젝트</h5>
					</div>
					<div class="card-body">
					<div class="row" style="margin-top:10px;">
						<div style="margin-left:30px;">
							<h4 style="font-size:18px; font-weight:600">프로젝트명</h4>
						</div>
						<div style="margin-left:30px;">
							<span>Camp_us</span>
						</div>												
					</div>
					<div class="row" style="margin-top:10px;">
						<div style="margin-left:30px;">
							<h4 style="font-size:18px; font-weight:600">기한</h4>
						</div>
						<div style="margin-left:30px;">
							<span>2025-03-28 ~ 2025-06-26</span>
						</div>												
					</div>
					<div class="row" style="margin-top:10px;">
						<div style="margin-left:30px;">
							<h4 style="font-size:18px; font-weight:600">담당교수</h4>
						</div>
						<div style="margin-left:30px;">
							<span>김형민</span>
						</div>												
					</div>
					<div class="row" style="margin-top:10px;">
						<div style="margin-left:30px;">
							<h4 style="font-size:18px; font-weight:600">팀장</h4>
						</div>
						<div style="margin-left:30px;">
							<span>김원희</span>
						</div>											
					</div>
					<div class="row" style="margin-top:10px;">
						<div style="margin-left:30px;">
							<h4 style="font-size:18px; font-weight:600">팀원</h4>
						</div>
						<div style="margin-left:30px;">
							<span>권오규,김민주,김선범,윤용선</span>
						</div>												
					</div>
					</div>
				</div>
			</div>
			<div class="mt-3" style="width:90px;"></div>
			<div class="mt-3" style="width:480px;">
				<div class="card card-primary card-outline" style="height:280px; border-top:3px solid #2ec4b6">
					<div class="card-header">
						<h5 class="card-title m-0">Featured</h5>
					</div>
					<div class="card-body">
						<h6 class="card-title">Special title treatment</h6>

						<p class="card-text">With supporting text below as a natural
							lead-in to additional content.</p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div style="width: 100px;"></div>
			<div class="col-10 mt-3">
				<div class="card card-info">
					<div class="card-header" style="background-color:#2ec4b6;">
						<h3 class="card-title">Line Chart</h3>

						<div class="card-tools">
							<button type="button" class="btn btn-tool"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn btn-tool"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<div class="chart">
							 <canvas id="lineChartCanvas" style="min-height:250px; height:250px; max-width:100%;"></canvas>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</div>
	</div>
	<script>
$(function(){
  var ctx = document.getElementById('lineChartCanvas').getContext('2d');
  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ["1월","2월","3월","4월","5월","6월"],
      datasets: [{
        label: "진행도",
        data: [10, 20, 40, 60, 80, 100],
        borderColor: "#2ec4b6",
        backgroundColor: "rgba(46,196,182,0.2)",
        fill: true
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: false
    }
  });
});
</script>
	
</body>