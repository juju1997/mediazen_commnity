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
	<title>Admin - team List</title>
</head>
<body>
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
			<div class="col-md-3 lnb-box">
				<div class="lnb-title">
					<h2>TeamManagement</h2>
				</div>
				<div id="accordion" role="tablist">
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<h5>
								<a class="collapsed" href="#" id="teamList">
									Team List
								</a>
							</h5>
						</div>
					</div>
					<div class="card">
						<div class="card-header" role="tab" id="headingTwo">
							<h5>
								<a class="collapsed" href="#" id="teamGeneration">
									Create Team
								</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="body-content">
					<h1 class="h1">Team List</h1>
					<div class="row col-md-12">
						<c:forEach var="team" items="${teamList}" varStatus="status">
							<div class="col-md-4">
									<ol class="tree-structure">
										<li>
											<span class="check"></span>
											<form id="${team.teamNo }">
												<label for="" style="font-size: 23px;" class="teamName">&nbsp;&nbsp;&nbsp;
													<a href="#">${team.teamName}</a>
												</label>
												<input type="hidden" class="teamNo" name="teamNo" value="${team.teamNo }"/>
											</form>
											<ol>
												<c:forEach var="user" items="${userList}" varStatus="status">
													<c:if test="${user.userTeamNo == team.teamNo }">
														<li>
															<span class="check"></span>
																<c:choose>
																	<c:when test="${team.master eq user.userId}">	
																		<label for="">${user.name }&nbsp;<i class="fas fa-crown" id="crown"></i></label>
																	</c:when>
																	<c:otherwise>
																		<label for="">${user.name }</label>
																	</c:otherwise>
																</c:choose>
															<input type="hidden" id="userId" name="userId" value="${user.userId }"/>
														</li>
													</c:if>
												</c:forEach>
											</ol>
										</li>
									</ol>
								</div>
							</c:forEach>
						</div>
				</div>
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
<!-- script -->
	<!-- <script src="../../_resource/js/vendor/jquery-2.2.4.min.js"></script> -->

	<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.0/Chart.min.js"></script>
	<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>

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
		});
		$("#teamList").on("click",function(){
			$("form").attr("method","POST").attr("action","/team/teamList.do").submit();
		});
		$("#teamGeneration").on("click",function(){
			self.location = "/team/teamGenerationGet.do";
		});
		
		//팀 정보 조회
		$(".teamName").on("click",function(){
			var teamNo = $(this).parent().find(".teamNo").val();
			$("form#"+teamNo).attr("method","POST").attr("action","/team/getTeam.do").submit();
		});
		//회원 관리
		$("#userManagement").on("click", function(){
			self.location = "/user/userList.do";
		});
	});
</script>
</body>
<style>
	#goMain:hover{
		color: black;
	}
	#teamManagement{
		color: #00acc2;
	}
	#teamList{
		color: #00acc2;
	}
	#crown{
		color: yellow;
	}
</style>
</html>
