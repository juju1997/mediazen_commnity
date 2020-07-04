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
	<title>ID produce</title>
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
					<h1 class="h1">Create User</h1>

					
						<div class="form-group">
							<label for="">ID</label>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="userId" name="userId" placeholder="중복검사를 해주세요" readonly="readonly">
								</div>
								<div class="col-md-6">
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#produceTeam">중복 검사</button>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">비밀번호</label>
							<div class="row">
								<div class="col-md-6">
									<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">비밀번호 확인</label>
							<div class="row">
								<div class="col-md-6">
									<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호를 입력하세요">
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="">이름</label>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요">
								
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">팀명</label>
							<div class="row">
								<div class="col-md-6">
									<select class="form-control" name="userTeamNo" id="userTeamNo">
										<c:forEach var="team" items="${teamList }" varStatus="status">
											<option value=${team.teamNo }>${team.teamName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">휴대폰 번호</label>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="phone" name="phone" placeholder='"-" 는 제외하고 입력해주세요'> 
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">성별</label>
							<div class="row">
								<div class="col-md-6">
									<select class="form-control" name="gender" id="gender">
										<option value=1>남</option>
										<option value=2>여</option>
									</select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="">생일</label>
							<div class="row">
								<div class="col-md-6">
									<div id="sandbox-container">
										<div class="input-daterange input-group" id="datepicker">
											<input type="text" class="form-control" name="birth" id="birth"/>
										</div>
									</div>
								</div>
							</div>
						</div> 
						
						<div class="form-group">
							<label for="">권한</label>
							<div class="row">
								<div class="col-md-6">
									<select class="form-control" name="role" id="role">
										<option value=1>일반</option>
										<option value=2>관리자</option>
									</select>
								</div>
							</div>
						</div>

					<div class="btn-group-view text-center">
						<button type="button" class="btn btn-default" id="createUserSubmit">생성</button>
					</div>

					<!-- modal -->
					<div class="modal fade" id="produceTeam" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
									<h4 class="h4 modal-title">중복 검사</h4>
								</div>
								<div class="modal-body">
										<div class="form-group">
											<label for="">ID</label>
											<input type="text" class="form-control" id="checkID" placeholder="8글자 이상 입력해주세요">
										</div>
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-default" data-dismiss="modal" id="checkDuplication">사용</button>
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
<script>
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
		//createUser
		$("#userManagement").on("click", function(){
			$("form").attr("method", "GET").attr("action","/user/userList.do").submit();
		})
		//userList
		$("#userList").on("click",function(){
			self.location = "/user/userList.do";
		});
		
		
		
		/* datepicker */
		$('#sandbox-container .input-daterange').datepicker({
				autoclose: true,
				format: "yyyy-mm-dd"
		});
		
		//ID중복검사
		$("#checkDuplication").on("click",function(){
			var userId = $("#checkID").val();
			$.ajax({
				url : "/user/rest/checkDuplication.do",
				method : "GET",
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json;charset=utf-8"
				},
				data : {
					userId : userId,
				},
				success : function(data){
					if(data==true){
						alert("중복되지 않은 ID");
						$("#userId").val(userId);
					}
					else{
						alert("중복된 ID");
						$("#userId").val("");
					}
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
			$("#produceTeam").on("hidden.bs.modal",function(){
				$("#checkID").val("");
			});
		});
		
		//모든 정보를 다 채웠는지 확인하는 전역변수
		var userId = false;
		var password = false;
		var name = false;
		var userTeamNo = false;
		var phone = false;
		var gender = false
		var birth = false;
		var role = false;
		//회원가입 유효성 검사 (버튼클릭)
		$(document).on("click","#createUserSubmit",function(){
			if(userId==true&&password==true&&name==true&&userTeamNo==true
					&&phone==true&&gender==true&&birth==true&&role==true){
				console.log($("#userId").val());
				console.log($("#password").val());
				console.log($("#name").val());
				console.log($("#userTeamNo").val());
				console.log($("#phone").val());
				console.log($("#gender").val());
				console.log($("#birth").val());
				console.log($("#role").val());
				$("form").attr("method", "POST").attr("action","/user/createUserPost.do").submit();
			}else{
				alert("모든 입력칸을 초록색으로 만들어주세요")
			}
		});
		$("#checkDuplication").on("click",function(){
			if(($("#checkID").val()).length > 8){
				$("#userId").attr("style","background-color:#A9F5A9");
				userId = true;
			}else{
				$("#userId").attr("style","background-color:#F5A9A9");
				userId = false;
			}		
		});
		$("#userId").blur(function(){
			if($(this).val().length > 8){
				$(this).attr("style","background-color:#A9F5A9");
				userId = true;
			}else{
				$(this).attr("style","background-color:#F5A9A9");
				userId = false;
			}
		});
		$("#password").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
			}else{
				$(this).attr("style","background-color:#A9F5A9");
			}
		});
		$("#passwordCheck").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				password = false;
			}else{
				var compare = $("#password").val();
				if($(this).val() != compare){
					$(this).attr("style","background-color:#F5A9A9");
					password = false;
				}else{
					$(this).attr("style","background-color:#A9F5A9");
					password = true;
				}
			}
		});
		$("#name").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				name = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				name = true;
			}
		});
		$("#userTeamNo").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				userTeamNo = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				userTeamNo = true;
			}
		});
		$("#phone").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				phone = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				phone = true;
			}
		});
		$("#phone").on("keyup", function() {
		    $(this).val($(this).val().replace(/[^0-9]/g,""));
		});
		$("#gender").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				gender = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				gender = true;
			}
		});
		$("#birth").change(function(){
			$(this).attr("style","background-color:#A9F5A9");
			birth = true;
		});
		$("#birth").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				birth = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				birth = true;
			}
		});
		$("#role").blur(function(){
			if($(this).val()==null || $(this).val()==""){
				$(this).attr("style","background-color:#F5A9A9");
				role = false;
			}else{
				$(this).attr("style","background-color:#A9F5A9");
				role = true;
			}
		});
	});
</script>
</body>
<style>
	#goMain:hover{
		color: black;
	}
	#userManagement{
		color: #00acc2;
	}
	#createUser{
		color: #00acc2;
	}
</style>
</html>