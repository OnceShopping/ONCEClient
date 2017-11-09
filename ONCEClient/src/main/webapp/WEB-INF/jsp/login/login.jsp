<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>O N C E</title>
	<meta name="viewport" content="width=device-width, initial-scale=1  maximum-scale=1 user-scalable=no">
	<meta name="mobile-web-app-capable" content="yes">
	<meta name="HandheldFriendly" content="True">
	
	<link rel="shortcut icon" href="${ pageContext.request.contextPath }/resources/img/favicon.png">
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/font-awesome.min.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/materialize.min.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/slick.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/slick-theme.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/owl.carousel.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/owl.theme.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/owl.transitions.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/lightbox.min.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css">
</head>
<body>

	<!-- navbar -->
	<div class="navbar">
		<div class="container">
			<div class="panel-control-left">
				<a href="#" data-activates="slide-out-left" class="sidenav-control-left"><i class="fa fa-bars"></i></a>
			</div>
			<div class="site-title">
				<a href="index.html" class="logo"><h1> O N C E </h1></a>
			</div>
			<div class="panel-control-right">
				<a href="contact.html"><i class="fa fa-envelope-o"></i></a>
			</div>
		</div>
	</div>
	<!-- end navbar -->
		
	<!-- login-->
	<div class="login app-pages app-section">
		<div class="container">
			<div class="pages-title">
				<h3> L o g i n </h3>
			</div>
			<form action="${ pageContext.request.contextPath }/login/login" method="post">
				<div class="input-field">
					<input id="email" type="email" class="validate">
					<label for="email"> I D </label>
				</div> 
				<div class="input-field">
					<input id="password" type="password" class="validate">
					<label for="password">password</label>
				</div>
				<div><a href="" class="forgot">Forgot Password?</a></div>
				<div class="chebox">
					<input type="checkbox" id="checkbox" />
  					<label for="checkbox">Remember me</label>
				</div>
				<input type="submit" value="Login" class="button"/>
				<div class="create-account">Not Registered? <a href="">Create an account</a></div>
			</form>
		</div>
	</div>
	<!-- end login -->
	
	<!-- footer -->
	<footer>
	
	</footer>
	<!-- end footer -->
	
	<!-- script -->
	<script src="${ pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/materialize.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/slick.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/custom.js"></script>

</body>
</html>