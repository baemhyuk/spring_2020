<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication var="principal" property="principal"/>    

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><c:out value="${tv.title}" /> - TV</title>
    <link rel="shortcut icon" href="../../../resources/images/favicon.ico" type="../../../resources/images/x-icon">
    <link rel="apple-touch-icon-precomposed" href="../../../resources/images/apple-touch-icon.png">

    <!--     Include UIKit CSS   -->
    <link rel="stylesheet" href="../../../resources/front/css/uikit.css">

    <!--     Include Simplebar CSS   -->
    <link rel="stylesheet" href="../../../resources/front/css/simplebar.css">

    <!--     Theme CSS   -->
    <link rel="stylesheet" href="../../../resources/front/css/theme.css">

</head>

<body>
    <nav id="tm-header" class="uk-navbar  ">
        <div class="uk-container uk-container-center ">
            <a class="uk-navbar-brand uk-hidden-small" href="/"><i
                    class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> WEBFLIX</a>

            <form class="uk-search uk-margin-small-top uk-margin-left uk-hidden-small">
                <input class="uk-search-field" type="search" placeholder="Search..." autocomplete="off">
                <div class="uk-dropdown uk-dropdown-flip uk-dropdown-search" aria-expanded="false"></div>
            </form>
            
            <sec:authorize access="isAnonymous()">
				
            <div class="uk-navbar-flip uk-hidden-small">
                <div class="uk-button-group">
                    <a class="uk-button uk-button-link uk-button-large" href="/front/signup">Sign up</a>
                    <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/front/login">
                    	<i class="uk-icon-lock uk-margin-small-right"></i> Log in
                    </a>
                </div>
            </div>
     
        </sec:authorize>
        
		<sec:authorize access="isAuthenticated()">
			
			<sec:authorize access="hasRole('ROLE_USER')">
			<div class="uk-navbar-flip uk-hidden-small">
				<div class="uk-button-group">
					<p class="uk-button uk-button-link uk-button-large">${principal.member.user_name}님</p>
					<a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/front/logout">
	                	 Log out
	                </a>
	        	</div>
	        </div>
	        </sec:authorize>
	        
	        <sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="uk-navbar-flip uk-hidden-small">
				<div class="uk-button-group">
					<p class="uk-button uk-button-link uk-button-large">관리자 ${principal.member.user_name}님</p>
					<a class="uk-button uk-button-admin uk-button-large uk-margin-left" href="../admin/admin_movie">Admin</a>
					<a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/front/logout">
	                	 Log out
	                </a>
	        	</div>
	        </div>
	        </sec:authorize>
	        
		</sec:authorize>
            
            <a href="#offcanvas" class="uk-navbar-toggle uk-visible-small uk-icon-medium" data-uk-offcanvas></a>
            <div class="uk-navbar-flip uk-visible-small">
                <a href="#offcanvas" class="uk-navbar-toggle uk-navbar-toggle-alt uk-icon-medium" data-uk-offcanvas></a>
            </div>
            <div class="uk-navbar-brand uk-navbar-center uk-visible-small"><i
                    class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> Webflix</div>
        </div>
    </nav>
    <nav class="uk-navbar uk-navbar-secondary  uk-hidden-small">
        <div class="uk-container-center uk-container">
            <ul class="uk-navbar-nav">
                <li><a href="/front/index">Movies</a></li>
                <li><a href="/front/Tvshow">TV Shows</a></li>
            </ul>
        </div>
    </nav>

    <!-- ./ Header Section  -->


    <!-- start Main Content (Media Page Section) -->

    <div id="tm-media-section" class="uk-block uk-block-small">

        <div class="uk-container uk-container-center uk-width-8-10">
            <div class="media-container  uk-container-center">
                <a class="uk-button uk-button-large uk-button-link uk-text-muted" href="/front/Tvshow"><i
                        class=" uk-icon-arrow-left uk-margin-small-right"></i> Back</a>
            </div>

            <div class="uk-grid">
                <div class="uk-width-medium-3-10">
                    <div class="media-cover">
                        <img src="<c:out value="${tv.poster}" />" alt="Image" class="uk-scrollspy-inview uk-animation-fade">
                    </div>
                    <a class="uk-button uk-button-primary uk-button-large uk-width-1-1 uk-margin-top"
                        href="login.html"><i class="uk-icon-heart uk-margin-small-right"></i> Add to Favourites</a>
                </div>
                <div class="uk-width-medium-7-10">
                    <div class="">
                        <ul class="uk-tab uk-tab-grid " data-uk-switcher="{connect:'#media-tabs'}">
                            <li class="uk-width-medium-1-3 uk-active"><a href="#">Description</a></li>
                            <li class="uk-width-medium-1-3"><a href="#">Reviews</a></li>
                            <li class="uk-width-medium-1-3"><a href="#">Trailer</a></li>
                            <li class="uk-tab-responsive uk-active uk-hidden" aria-haspopup="true"
                                aria-expanded="false"><a>Active</a>
                                <div class="uk-dropdown uk-dropdown-small uk-dropdown-up">
                                    <ul class="uk-nav uk-nav-dropdown"></ul>
                                    <div></div>
                                </div>
                            </li>
                        </ul>
                    </div>
					
                    <ul id="media-tabs" class="uk-switcher">

                        <!--     start Tab Panel 1 (Reviews Sections) -->

                        <li>
                            <h2 class="uk-text-contrast uk-margin-large-top"><c:out value="${tv.title}" /><span
                                    class="rating uk-margin-small-left uk-h4 uk-text-warning">
                                    <i class="uk-icon-star "></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                </span></h2>
                            <ul class="uk-subnav uk-subnav-line">
                                <li><i class="uk-icon-star uk-margin-small-right"></i><c:out value="${tv.rate}" /></li>
                                <li><c:out value="${tv.year}" /></li>
                            </ul>
                            <hr>
                            <p class="uk-text-muted uk-h4"><c:out value="${tv.content}" /></p>
                            <dl class="uk-description-list-horizontal uk-margin-top">
                                <dt>Genres</dt>
                                <dd>
                                    <ul class="uk-subnav ">
                                        <li><c:out value="${tv.genre}" /></li>
                                    </ul>
                                </dd>
                                <dt>Countries</dt>
                                <dd>
                                    <ul class="uk-subnav ">
                                        <li><c:out value="${tv.country}" /></a></li>
                                    </ul>
                                </dd>
                            </dl>

                        </li>

                        <!--    ./ Tab Panel 1  -->

                        <!--     start Tab Panel 2  (Reviews Section) -->

                        <li>
                            <div class="uk-margin-small-top">
                                <h3 class="uk-text-contrast uk-margin-top">Post a Review</h3>
                                <div class="uk-alert uk-alert-warning" data-uk-alert="">
                                    <a href="" class="uk-alert-close uk-close"></a>
                                    <p><i class="uk-icon-exclamation-triangle uk-margin-small-right "></i> Please <a
                                            class="uk-text-contrast" href="login.html"> Log in</a> or Sign up to post
                                        reviews quicker.</p>
                                </div>
                                <form class="uk-form uk-margin-bottom">
                                    <div class="uk-form-row">
                                        <textarea class="uk-width-1-1" cols="30" rows="5"
                                            placeholder="Type your review here..."></textarea>
                                        <p class="uk-form-help-block">The <code>.uk-form-help-block</code> class creates
                                            an associated paragraph.</p>
                                    </div>
                                    <div class="uk-form-row">
                                        <a href=""
                                            class="uk-button uk-button-large uk-button-success uk-float-right">Post</a>
                                    </div>
                                </form>
                            </div>

                            <div class="uk-scrollable-box uk-responsive-width " data-simplebar-direction="vertical">
                                <ul class="uk-comment-list uk-margin-top">
                                    <li>
                                        <article class="uk-comment uk-panel uk-panel-space uk-panel-box-secondary">
                                            <header class="uk-comment-header">
                                                <img class="uk-comment-avatar uk-border-circle"
                                                    src="../../../resources/images/avatar3.jpg" width="50" height="50" alt="">
                                                <h4 class="uk-comment-title">@movielover</h4>
                                                <div class="uk-comment-meta">2 days ago </div>
                                            </header>
                                            <div class="uk-comment-body">
                                                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam
                                                    nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam
                                                    erat, sed diam voluptua.</p>
                                            </div>
                                        </article>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <!--     ./ Tab Panel 2  -->


                        <!--     start Tab Panel 3 (Trailer Section)  -->

                        <li>
                            <div class="uk-cover uk-margin-top" style="height: 400px;">
                                <iframe data-uk-cover
                                    src="<c:out value="${tv.video}" />" width="560" height="315" frameborder="0" allowfullscreen=""></iframe>
                            </div>
                        </li>

                        <!--     ./ Tab Panel 3  -->


                    </ul>
                </div>
            </div>
        </div>
    </div>
    </div>

    <!-- ./ Main Content (Media Page Section) -->



    <!--     ./ Similar Media Section  -->

    <!-- start Footer Section -->

    <footer id="tm-footer" class="uk-block uk-block-secondary uk-block-small ">
        <div class="uk-container-center uk-container">
            <div class="uk-grid">
                <div class="uk-width-medium-3-10">
                    <div class="copyright-text">&copy; 2016 <span class="uk-text-bold">Webflix</span> - Streaming Media
                        Theme
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- ./ Footer Section -->

    <!-- start Offcanvas Menu -->

    <div id="offcanvas" class="uk-offcanvas">
        <div class="uk-offcanvas-bar">
            <div class="uk-panel">
                <form class="uk-search">
                    <input class="uk-search-field" type="search" placeholder="Search...">
                </form>
                <div class="uk-button-group">
                    <a class="uk-button uk-button-link uk-button-large uk-text-muted" href="signup.html">Sign up</a>
                    <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="login.html"><i
                            class="uk-icon-lock uk-margin-small-right"></i> Log in</a>
                </div>
            </div>
            <ul class="uk-nav uk-nav-offcanvas uk-nav-parent-icon" data-uk-nav>
                <li class="uk-active">
                    <a href="#">Featured</a>
                </li>
                <li>
                    <a href="#">Movies</a>
                </li>
                <li>
                    <a href="index.html">TV Shows</a>
                </li>

                <li>
                    <a href="index.html">Music</a>
                </li>
                <li class="uk-parent">
                    <a href="#">Genre</a>
                    <ul class="uk-nav-sub">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Animation</a> </li>
                        <li><a href="#">Anime</a> </li>
                        <li><a href="#">Adventure</a> </li>
                        <li><a href="#">Biography</a> </li>
                        <li><a href="#">Comedy</a> </li>
                        <li><a href="#">Crime</a> </li>
                        <li><a href="#">Romance</a> </li>
                        <li><a href="#">Documentary</a> </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>

    <!-- ./ Offcanvas Menu -->

    <!-- Include JS -->

    <script src="../../../resources/front/js/jquery.js"></script>
    <script src="../../../resources/front/js/simplebar.min.js"></script>
    <script src="../../../resources/front/js/uikit.min.js"></script>
    <script src="../../../resources/front/js/components/grid.min.js"></script>
    <script src="../../../resources/front/js/components/slideset.min.js"></script>
</body>

</html>