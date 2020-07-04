<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 기본 meta -->
	<meta charset="UTF-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- //기본 meta -->
	
	<!-- sns 정보제공 -->
	<meta property="og:title" content="영상DB수집 관리툴" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="http://www.oooo.go.kr"/>
	<meta property="og:image" content="http://www.oooo.go.kr/images/main/sitemain.png" />
	<meta property="og:description" content="영상DB수집 관리툴입니다." />
	<!-- //sns 정보제공 -->

	<!-- 검색로봇 -->
	<meta name="description" content="홈페이지 설명 150자 미만, 서울의 도시재생의 이런 저런 것들의 정보" />
	<meta name="keywords" content="영상DB수집 관리툴" />
	<link rel="canonical" href="http://www.oooo.go.kr" />
	<!-- //검색로봇 -->

	<!-- 선행script -->
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script> -->
	<!-- <script src="../../_resource/js/frontend-start-script.js"></script> --><!-- 퍼블 -->
	<script src=""></script><!-- 개발 -->
	<!-- //선행script -->

	<!-- stylesheet : @import 시키지 않는게 성능상 좋습니다. -->
	<link rel="stylesheet" href="../../_resource/css/font-awesome.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="../../_resource/css/style.css" />
	<link rel="stylesheet" href="../../_resource/css/bootstrap-datepicker.min.css" >

	<!-- //stylesheet -->
	<title>main</title>
</head>
<body>
<form>
<div class="top-title">
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<h1><a id="goMain" href="#" style="font-weight: bold; text-decoration: none;">Mediazen Team Community</a></h1>
			</div>
			<div class="col-md-4 text-right">
				<div class="top-info-box">
					<a href="#" id="logout"><i class="fa fa-sign-in" aria-hidden="true"></i> Logout</a>
					<!-- <a href="#none"><i class="fa fa-sign-out" aria-hidden="true"></i> Login</a> -->
					<a href="../mypage/mypage.html"><i class="fa fa-user" aria-hidden="true"></i> Mypage</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="nav-box">
	<div class="container text-center">
		<ul class="nav nav-pills">
			<li role="presentation"><a href="../main/main.html" class="nav-link">Main</a></li>
			<li role="presentation"><a href="../community/qnaList.html" class="nav-link">Community</a></li>
			<c:if test="${sessionScope.user.role == 2}">
				<li role="presentation"><a href="#" class="nav-link" id="userManagement">User Management</a></li>
				<li role="presentation"><a href="#" class="nav-link" id="teamManagement">Team Management</a></li>
			</c:if>
		</ul>
	</div>
</div>
	<div class="container content-box left-bg">
		<div class="row">
			<div class="col-md-3">
				<div class="card text-center main-profile">
					<img class="img-circle" src="http://dummyimage.com/120x120" alt=""> 
					<div class="card-body">
						<h4 class="card-title">Jun Sung</h4>
						<p class="card-text">junsung@gmail.com</p>
						<p class="card-text">High Tech Division OS Team(3)</p>
					</div>
					<a href="../mypage/mypage.html" class="btn btn-edit">EDIT</a>
				</div>
			</div>
			<div class="col-md-6">
				<div class="row task-group">
					<div class="col-md-6">
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title">Indoor</h4>
								<div class="task-box">
									<canvas id="doughnutChart0"></canvas>
									<span class="percentage"></span>
									<div class="progress-box">
										<span class="progress1">2250</span>
										<span>/</span>
										<span class="progress2">3000</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted">
								<div class="row">
									<div class="col-md-6 text-left">
										<i class="fa fa-mobile" aria-hidden="true"></i>
										<span>H.P(1)</span>
									</div>
									<div class="col-md-6 text-right">NG Count:<span> 3</span></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title">CCTV</h4>
								<div class="task-box">
									<canvas id="doughnutChart1"></canvas>
									<span class="percentage"></span>
									<div class="progress-box">
										<span class="progress1">7</span>
										<span>/</span>
										<span class="progress2">70</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted">
								<div class="row">
									<div class="col-md-6 text-left">
										<i class="fa fa-user-circle" aria-hidden="true"></i>
										<span>Person(2)</span>
									</div>
									<div class="col-md-6 text-right">NG Count:<span> 3</span></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title">Indoor</h4>
								<div class="task-box">
									<canvas id="doughnutChart2"></canvas>
									<span class="percentage"></span>
									<div class="progress-box">
										<span class="progress1">20</span>
										<span>/</span>
										<span class="progress2">100</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted">
								<div class="row">
									<div class="col-md-6 text-left">
										<i class="fa fa-mobile" aria-hidden="true"></i>
										<span>H.P(1)</span>
									</div>
									<div class="col-md-6 text-right">NG Count:<span> 3</span></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card text-center">
							<div class="card-body">
								<h4 class="card-title">CCTV</h4>
								<div class="task-box">
									<canvas id="doughnutChart3"></canvas>
									<span class="percentage"></span>
									<div class="progress-box">
										<span class="progress1">225</span>
										<span>/</span>
										<span class="progress2">3000</span>
									</div>
								</div>
							</div>
							<div class="card-footer text-muted">
								<div class="row">
									<div class="col-md-6 text-left">
										<i class="fa fa-user-circle" aria-hidden="true"></i>
										<span>Person(2)</span>
									</div>
									<div class="col-md-6 text-right">NG Count:<span> 3</span></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<ul class="list-group">
					<li class="list-group-item">
						<i class="fa fa-briefcase" aria-hidden="true"></i>
						Notice List</li>
					<li class="list-group-item">
						<div class="media">
							<div class="media-left media-middle">
								<a href="#">
									<img src="http://dummyimage.com/50x50" class="media-object img-circle"  alt="...">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Yong Jun Lee</h4>
								<p>[CCTV P] Request defect details</p>
								<span>2017. 08. 16</span>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="media">
							<div class="media-left media-middle">
								<a href="#">
									<img src="http://dummyimage.com/50x50" class="media-object img-circle"  alt="...">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Yong Jun Lee</h4>
								<p>[CCTV P] Request defect details</p>
								<span>2017. 08. 16</span>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="media">
							<div class="media-left media-middle">
								<a href="#">
									<img src="http://dummyimage.com/50x50" class="media-object img-circle"  alt="...">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Yong Jun Lee</h4>
								<p>[CCTV P] Request defect details</p>
								<span>2017. 08. 16</span>
							</div>
						</div>
					</li>
					<li class="list-group-item">
						<div class="media">
							<div class="media-left media-middle">
								<a href="#">
									<img src="http://dummyimage.com/50x50" class="media-object img-circle"  alt="...">
								</a>
							</div>
							<div class="media-body">
								<h4 class="media-heading">Yong Jun Lee</h4>
								<p>[CCTV P] Request defect details</p>
								<span>2017. 08. 16</span>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer-box">
	<div class="container">
		<div class="row">
			<div class="col-12 copyright text-center">
				<span>Copyright ⓒ 2017 Annotation Platform. All rights reserved.</span>
			</div>
		</div>
	</div>
</div>
</form>
<!-- script -->
	<!-- <script src="../../_resource/js/vendor/jquery-2.2.4.min.js"></script> -->

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>

	<script src="../../_resource/js/vendor/drag-arrange.min.js"></script>
	<script src="../../_resource/js/common.js"></script> <!-- 퍼블 -->
	<script src="../../_resource/js/vendor/bootstrap-datepicker.min.js"></script>
	<script src=""></script> <!-- 개발 -->
<!-- //script -->
<script>
	//doughnut
	$(document).ready(function(){
		//gomain
		$("#goMain").on("click",function(){
			$("form").attr("method","POST").attr("action","/user/goMain.do").submit();
		});
		//logout
		$("#logout").on("click",function(){
			$(location ).attr("href", "/user/logout.do");
		});
		//teamManagement
		$("#teamManagement").on("click", function(){
			$("form").attr("method","POST").attr("action","/team/teamList.do").submit();
		})
		//회원관리
		$("#userManagement").on("click", function(){
			self.location = "/user/userList.do";
		});

		$(".task-group .task-box").each(function(e){
			var progress1 = Number($(this).find(".progress1").text());
			var progress2 = Number($(this).find(".progress2").text());
			var percentage = progress1/progress2*100;
			$(this).find(".percentage").text(percentage);
			chartGroup(e, percentage);
		});
 	
		function chartGroup(e, per){
			var ctxD = $("#doughnutChart"+e);
			var chartList = [
			{
				type: 'doughnut',
				data: {
					labels: false,
					datasets: [
						{
							data: [per, 100-per],
							backgroundColor: ["#f52d51", "#e3e3e3"],
							hoverBackgroundColor: ["#f52d51", "#e3e3e3"],
							borderColor: ["#263238", "#263238"],
							borderWidth:1,
							hoverBorderWidth:0
						}
					]
				},
				options: {
					responsive: true,
					cutoutPercentage: 80
				}
			}];
			var myLineChart = new Chart(ctxD, chartList[0]);
		}
	});
</script>
</body>
<style>
	#goMain:hover{
		color: black;
	}

	
</style>
</html>