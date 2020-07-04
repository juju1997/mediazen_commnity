<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
	<title>팀 상세보기</title>
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
	<div class="container content-box">
		<div class="body-content">
			<h1 class="h1">${team.teamName }</h1>
			<input type="hidden" id="teamNo" name="teamNo" value="${team.teamNo }"/>
			<div class="table-responsive">
				<table class="table table-bordered th-color">
					<colgroup>
						<col style="width:20%" />
						<col style="width:auto" />
						<col style="width:16%" />
						<col style="width:16%" />
						<col style="width:16%" />
						<col style="width:16%" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row" style="font-weight: bold;">팀장</th>
							<td colspan="5">
								<c:if test='${team.masterName eq null || team.masterName eq ""}'>
									<span>등록된 팀장이 없습니다.</span>
								</c:if>
								<span style="font-weight: bold; color:#337ab7;">${team.masterName}</span>
								<!-- <input type="text" class="form-control" id="" placeholder="제목을 입력하세요"> -->
							</td> 
						</tr>
						<tr>
							<th scope="row" style="font-weight: bold;">팀 소개</th>
							<td colspan="5">
								<div id="sandbox-container">
									<div class="input-daterange input-group" id="datepicker">
										<c:if test='${team.teamIntroduction eq null || team.teamIntroduction eq ""}'>
											등록된 팀 소개가 없습니다.
										</c:if>
										${team.teamIntroduction }
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row" style="font-weight: bold;">팀 사진</th>
							<td colspan="5">
								<c:choose>
									<c:when test='${team.teamProfileName eq null || team.teamProfileName eq ""}'>
										등록된 팀 사진이 없습니다.
									</c:when>
									<c:otherwise>
										<img src="../../../../../_resource/images/team/${team.teamProfileName }"  width="600" height="400" alt="Team Image">
									</c:otherwise>
								</c:choose>
									
							</td>
						</tr>
						<tr class="total-table">
							<th rowspan="6" class="text-left" style="font-weight: bold;">팀 구성원</th>
							<!-- 수행자가 늘어나면 상단 rowspan도 count 되어야 합니다. 수행자수 + 2(total) -->
							<th rowspan="1">이름</th>
							<th rowspan="1">전화번호</th>
							<th>성별</th>
							<th>자기소개</th>
							<th>입사일</th>
						</tr>
						<!-- 반복영역 -->
						<c:choose>
							<c:when test="${fn:length(user) eq 0}">
								<tr class="total-table">
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
									<td> - </td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="user" items="${user }" varStatus="status">
									<tr class="total-table">
										<td class="not-yet" style="font-weight: bold;">
											<c:choose>
												<c:when test="${team.master eq user.userId }">
													${user.name} <i class="fas fa-crown" id="crown"></i>
												</c:when>
												<c:otherwise>
													${user.name}
												</c:otherwise>
											</c:choose>
										</td>
										<td>${user.phone }</td>
										<c:if test="${user.gender eq 1 }">
											<td>남</td>
										</c:if>
										<c:if test="${user.gender eq 2 }">
											<td>여</td>
										</c:if>
										<td>${user.selfIntroduction }</td>
										<td>${user.joinDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<input type="button" id="goBack" style="float: right;" class="btn btn-default" value="뒤로가기"/>
							&nbsp;&nbsp;&nbsp;
				<c:if test="${sessionScope.user.role eq 2}">
					<c:if test="${fn:length(user) eq 0}">
						<input type="button" id="deleteTeam" style="float:right;" class="btn btn-danger" value="팀삭제"/>
					</c:if>
				</c:if>
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
	<script src="https://kit.fontawesome.com/6ffe1f5c93.js" crossorigin="anonymous"></script>
	<script src=""></script> <!-- 개발 -->
<!-- //script -->
</div>

<script type="text/javascript">
	/* datepicker */
	$('#sandbox-container .input-daterange').datepicker({
			autoclose: true
	});
	
	//메인으로 - 공통
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
		
		//deleteTeam
		$("#deleteTeam").on("click", function(){
			$("form").attr("method", "POST").attr("action","/team/deleteTeam.do").submit();
		});
		//goBack
		$("#goBack").on("click",function(){
			history.back(-1);
		});
		//회원관리
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
	#crown{
		color: #FFBF00;
	}
</style>
</html>