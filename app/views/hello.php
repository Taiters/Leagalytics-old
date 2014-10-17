<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>Leagalytics</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
<link href="/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="/lib/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="/app/css/theme/pages/lock.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/app/css/theme/components.css" rel="stylesheet" type="text/css">
<link href="/app/css/theme/plugins.css" rel="stylesheet" type="text/css">
<link href="/app/css/theme/layout.css" rel="stylesheet" type="text/css">
<link href="/app/css/theme/default.css" rel="stylesheet" type="text/css" id="style_color">
<link href="/app/css/theme/custom.css" rel="stylesheet" type="text/css">
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
<div class="page-lock">
<!-- 	<div class="page-logo">
		<a class="brand" href="index.html">
		<img src="../../assets/admin/layout3/img/logo-big.png" alt="logo"/>
		</a>
	</div> -->
	<div class="page-body">
		<img class="page-lock-img" src="http://placehold.it/200x200" alt="">
		<div class="page-lock-info">
			<h3>Bob Nilson</h3>
			<span class="email">
			bob@keenthemes.com </span>
			<span class="locked">
			Locked </span>
			<form class="form-inline" action="index.html">
				<div class="input-group input-medium">
					<input type="text" class="form-control" placeholder="Password">
					<span class="input-group-btn">
					<button type="submit" class="btn blue icn-only"><i class="m-icon-swapright m-icon-white"></i></button>
					</span>
				</div>
				<!-- /input-group -->
				<div class="relogin">
					<a href="login.html">
					Not Bob Nilson ? </a>
				</div>
			</form>
		</div>
	</div>
	<div class="page-footer-custom">
		 2014 &copy; Metronic. Admin Dashboard Template.
	</div>
</div>
<script type='text/javascript' src='/lib/jquery/js/jquery.js'></script>
<script type='text/javascript' src='/lib/bootstrap/js/bootstrap.js'></script>
<script type='text/javascript' src='/lib/jquery.backstretch/js/jquery.backstretch.min.js'></script>
<script>
	var Lock = function () {
	    return {
	        //main function to initiate the module
	        init: function () {

	             $.backstretch([
			        "/img/1.jpg"
			        ], {
			          fade: 1000,
			          duration: 8000
			      });
	        }

	    };

	}();

	Lock.init();
</script>
</body>
<!-- END BODY -->
</html>