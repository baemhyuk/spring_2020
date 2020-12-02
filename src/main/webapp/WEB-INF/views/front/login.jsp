<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-height-1-1">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Webflix - Streaming Media Theme - Log in</title>
    <link rel="shortcut icon" href="../../../resources/images/favicon.ico" type="../../../resources/images/x-icon">
    <link rel="apple-touch-icon-precomposed" href="../../../resources/images/apple-touch-icon.png">

    <!--     Include UIKit CSS   -->

    <link rel="stylesheet" href="../../../resources/front/css/uikit.min.css">

    <!--     Theme CSS   -->

    <link rel="stylesheet" href="../../../resources/front/css/theme.css">

</head>

<body class="uk-height-1-1" cz-shortcut-listen="true">



    <!--     start Top Navbar   -->

    <div class="tm-navbar tm-navbar-overlay tm-navbar-transparent tm-navbar-contrast">
        <nav id="login-header" class="uk-navbar ">
        <div class="uk-container uk-container-center ">
            <a class="uk-navbar-brand uk-hidden-small" href="/">
            <i class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> WEBFLIX</a>


            <div class="uk-navbar-flip uk-hidden-small">
                <div class="uk-button-group">
                    <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/front/signup">
                    	Sign up
                    </a>
                </div>
            </div>
            <a href="#offcanvas" class="uk-navbar-toggle uk-visible-small uk-icon-medium" data-uk-offcanvas></a>
            <div class="uk-navbar-flip uk-visible-small">
                <a href="#offcanvas" class="uk-navbar-toggle uk-navbar-toggle-alt uk-icon-medium" data-uk-offcanvas></a>
            </div>
            <div class="uk-navbar-brand uk-navbar-center uk-visible-small"><i
                    class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> Webflix</div>
        </div>
    </nav>
    </div>

    <!--     ./ Top Navbar   -->


    <!--     Start Main Content  -->

    <div class="vid-container">
  <img class="uk-animation-fade tm-bg-cover bgvid" src="../../../resources/images/bg.jpg" width="100%" height="100%">
  <div class="inner-container">
  	<form role="form" method="post" action="/login">
	    <div class="box">
	      <h1>Login</h1>
	      <input type="text" placeholder="Username"name="username"/>
	      <input type="password" placeholder="Password" name="password"/>
	      <button class="btn-success">Login</button>
	      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	      <p>Forgot your password? <a href="/front/forgot-password">forget-pwd</a></p>
	    </div>
    </form>
  </div>
</div>

    <!--     ./ Offcanvas Menu  -->

    <!--   Include JS  -->

    <script src="../../../resources/front/js/jquery.js"></script>
    <script src="../../../resources/front/js/uikit.min.js"></script>
	<script>
		$(".btn-success").on("click", function(e) {
			e.preventDefault();
			$("form").submit();
		});
	</script>
</body>

</html>