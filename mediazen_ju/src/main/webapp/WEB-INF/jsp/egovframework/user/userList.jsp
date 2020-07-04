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
	<title>Admin - Id List</title>
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
			<div class="col-md-3 lnb-box">
				<div class="lnb-title">
					<h2>UserManagement</h2>
				</div>
				<div id="accordion" role="tablist">
					<div class="card">
						<div class="card-header" role="tab" id="headingOne">
							<h5>
								<a class="collapsed" href="#" id="userList">
									User List
								</a>
							</h5>
						</div>
					</div>
					<div class="card">
						<div class="card-header" role="tab" id="headingTwo">
							<h5>
								<a class="collapsed" href="#" id="createUser">
									Create User
								</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-9">
				<div class="body-content">
					<h1 class="h1">User List</h1>

					<div class="row total-num">
						<div class="col-md-6 text-left">전체 : ${resultPage.totalCount } 명</div>
						<div class="col-md-2 text-right">
							<select class="form-control" id="searchCondition" name="searchCondition">
								<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? "selected" : "" }>ID</option>
								<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? "selected" : "" }>이름</option>
							</select>
						</div>
						<div class="col-md-3 text-right">
							<input type="text" class="form-control" id="searchKeyword" name="searchKeyword" placeholder="검색어를 입력하세요"
										value="${! empty search.searchKeyword ? search.searchKeyword : '' }">
						</div>
						<div class="col-md-1 text-right">
							<a href="javascript:fncGetList('1');" class="btn btn-info" role="button" aria-pressed="true" id="search">검색</a>
						</div>
					</div>
					<table class="table table-striped th-center">
						<colgroup>
							<col style="width:auto%" />
							<col style="width:auto;" />
							<col style="width:auto%" />
							<col style="width:auto%" />
							<col style="width:auto%" />
							<col style="width:auto%" />
						</colgroup>
						<thead>
							<tr>
								<th>ID</th>
								<th>이름</th>
								<th>팀명</th>
								<th>PHONE</th>
								<th>생일</th>
								<th>입사일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="user" items="${list }" varStatus="varStatus">
								<tr>
									<td>${user.userId }</td>
									<td>${user.name }</td>
									<td>${user.userTeamNo }</td>
									<td>
										<a href="#none" class="" data-toggle="modal" data-target="#userView">${user.phone}</a>
									</td>
									<td>${user.birth }</td>
									<td>${user.joinDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="text-center">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<li>
									<a href="javascript:fncGetList('1');" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
								<c:forEach var="i" begin="${resultPage.beginUnitPage }" end="${resultPage.endUnitPage }" step="1">
									<c:if test="${resultPage.currentPage == i }">
										<li><a style="background-color: #D8D8D8;" href="javascript:fncGetList('${i }');">${i }</a></li>
									</c:if>
									<c:if test="${resultPage.currentPage != i }">
										<li><a href="javascript:fncGetList('${i }');">${i }</a></li>
									</c:if>
								</c:forEach>
								<li>
									<a href="javascript:fncGetList('${resultPage.endUnitPage }');" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</ul>
						</nav>
					</div>
					<input type="hidden" name="currentPage" id="currentPage" value=""/>
					<!-- modal -->
					<div class="modal fade" id="userView" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="h4 modal-title">ID 상세</h4>
								</div>
								<div class="modal-body">
									<div class="table-responsive">
										<table class="table table-bordered th-color">
											<colgroup>
												<col style="width:15%" />
												<col style="width:35%" />
												<col style="width:15%" />
												<col style="width:35%" />
											</colgroup>
											<tbody>
												<tr>
													<th scope="row">ID</th>
													<td>Song~</td>
													<th scope="row">이름</th>
													<td>Song~</td>
												</tr>
												<tr>
													<th scope="row">소속팀</th>
													<td colspan="3">UX디자인팀</td>
												</tr>
												<tr>
													<th scope="row">이메일</th>
													<td colspan="3">Song@gmail.com</td>
												</tr>
												<tr>
													<th scope="row">사진</th>
													<td colspan="3">
														<div class="my-image">
															<img src="http://dummyimage.com/50x50" class="img-thumbnail" alt="" />
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
								</div>
							</div>
						</div>
					</div>
					<!-- //modal -->

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

<script type="text/javascript">
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
	//userList
	$("#userManagement").on("click", function(){
		location.reload();
	});
	//createUser
	$("#createUser").on("click",function(){
		self.location = "/user/createUserGet.do";
	});
	
	
	function fncGetList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method","POST").attr("action","/user/userList.do").submit();
		
	}
</script>
</body>
<style>
	#goMain:hover{
		color: black;
	}
	#userManagement{
		color: #00acc2;
	}
	#userList{
		color: #00acc2;
	}
</style>
</html>