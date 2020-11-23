<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class="uk-height-1-1">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Webflix - Streaming Media Theme - Recover Password</title>
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


            <div class="uk-navbar-flip">
                    <ul class="uk-navbar-nav uk-margin-right">
                        <li><a href="/front/signup.html">Sign up</a></li>
                    </ul>
                    <a class=" uk-button uk-button-success uk-button-large uk-float-left" href="/front/login.html">
                    <i class="uk-icon-lock uk-margin-small-right"></i>Log in</a>
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


    <!--   start Main Content   -->

    <div class="vid-container">
  <img class="uk-animation-fade tm-bg-cover bgvid" src="../../../resources/images/bg.jpg" width="100%" height="100%">
  <div class="inner-container">
    <div class="box">
      <h1>Reset your password</h1>
      <input type="text" placeholder="Email"/>
      <button>Rocover</button>
    </div>
  </div>
</div>
    <!-- ./ Main Content  -->

    <!-- start Offcanvas Menu  -->

    <div id="offcanvas" class="uk-offcanvas">
        <div class="uk-offcanvas-bar">
            <div class="uk-panel">
            </div>
            <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav>
                <li class="uk-active">
                    <a href="/">Movies</a>
                </li>
                <li>
                    <a href="/">TV Shows</a>
                </li>
            </ul>
        </div>
    </div>

    <!-- ./ Offcanvas Menu  -->

    <!-- Include JS  -->

    <script src="../../../resources/front/js/jquery.js"></script>
    <script src="../../../resources/front/js/uikit.min.js"></script>


</body>

</html>