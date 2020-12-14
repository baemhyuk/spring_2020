<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   
<sec:authentication var="principal" property="principal"/>    

<!DOCTYPE html>
<html lang="en-gb" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Webflix</title>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="/resources/images/x-icon">
    <link rel="apple-touch-icon-precomposed" href="/resources/images/apple-touch-icon.png">

    <!--     Include UIKit CSS   -->
    <link rel="stylesheet" href="/resources/front/css/uikit.min.css">

    <!--     Theme CSS   -->
    <link rel="stylesheet" href="/resources/front/css/theme.css">
</head>

<body>

    <!--     start Header Section   -->
    <nav id="tm-header" class="uk-navbar ">
        <div class="uk-container uk-container-center ">
            <a class="uk-navbar-brand uk-hidden-small" href="/">
            <i class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> WEBFLIX</a>

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
    