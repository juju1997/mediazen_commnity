<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<title>login</title>
</head>
<body>
	<div class="container">
		<div class="text-center login-title">
			<h1 class="h1">Change Your Password!</h1>
		</div>
		<div class="card card-container login-card">
				<img id="profile-img" class="profile-img-card" src="https://cdn.pixabay.com/photo/2017/06/21/14/08/exclamation-point-2427335_960_720.png" />
				<p id="profile-name" class="profile-name-card"></p>
				<form class="form-signin">
						<span id="reauth-email" class="reauth-email"></span>
						<input type="password" id="password" class="form-control" placeholder="새로운 비밀번호를 입력하세요" required autofocus>
						<input name="password" type="password" id="passwordCheck" class="form-control" placeholder="비밀번호 확인" required>
						<input type="hidden" name="userId" value=${id} />
						<button class="btn btn-lg btn-primary btn-signin" type="button" id="change">변경</button>
				</form><!-- /form -->
		</div><!-- /card-container -->
</div><!-- /container -->
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
			/* findPassword */
			$("#change").on("click",function(){
				var pw=$("#password").val();
				var pwc=$("#passwordCheck").val();
				if(pw.length < 9 || pw.length > 14){
					alert("비밀번호는 9~14 자리로 해주세요.")
					return;
				}
				if((pw==null || pw=="") || (pwc==null || pwc=="")){
					if(pw==null || pw==""){
						alert("비밀번호를 입력해주세요")
					}
					else if(pwc==null || pwc==""){
						alert("비밀번호 재확인을 해주세요.")
					}
				}else{
					if(!(pw==pwc)){
						alert("비밀번호를 재확인 해주세요.")
						$("#passwordCheck").val("");
					}else{
						$("form").attr("method","POST").attr("action","/user/changePassword.do").submit();
					}
				}
			});
			
			$("#findCode").on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			});

		});
	</script>
</body>
</html>