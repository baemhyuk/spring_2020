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

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
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
                            <h2 class="uk-text-contrast uk-margin-large-top"><c:out value="${tv.title}" />
	                            <span class="rating uk-margin-small-left uk-h4 uk-text-warning">
	                               <i class="uk-icon-star "></i>
	                               <span id="avg_rate"></span>     
	                            </span>
                            </h2>
                            <ul class="uk-subnav uk-subnav-line">
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
                            <sec:authorize access="isAuthenticated()">
                                <button id='addReplyBtn' class="uk-button uk-button-large uk-button-success uk-margin-top">Comment</button>                     
                            </sec:authorize>
                            </div>

                            <div class="uk-scrollable-box uk-responsive-width " data-simplebar-direction="vertical">
                            
                                <ul class="chat uk-comment-list uk-margin-top">
                                
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

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Replyer</label> 
						<input class="form-control" name='user_id' value='${principal.member.user_id}'>
					</div>
					
					<div class="form-group">
		                <label>Reply</label> 
		                <input class="form-control" rows="8" name='reply' value='New Reply!!!!' >
					</div>      
					
					<div class="form-group">
						<label>Rating</label> 
						<input name="rating">/5
					</div>
					<div class="form-group">
						<label>Reply Date</label> 
						<input class="form-control" name='replydate' value=''>
					</div>
				</div>
				
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
        <!-- /.modal-dialog -->
	</div>



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
	<script src="../../../resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../../../resources/js/reply.js"></script>
    <script src="../../../resources/front/js/simplebar.min.js"></script>
    <script src="../../../resources/front/js/uikit.min.js"></script>
    <script src="../../../resources/front/js/components/grid.min.js"></script>
    <script src="../../../resources/front/js/components/slideset.min.js"></script>
    
  	
    
  	
  	
 <script type="text/javascript">
$(document).ready(function () {
	  
	var bnoValue = '<c:out value="${tv.prog_num}"/>';
	var replyUL = $(".chat");
	
	showList(1);
	
	// 댓글 목록을 출력하는 함수
	function showList(page){
		
		// console.log("show list " + page);
	    
		replyService.getList({prog_num:bnoValue, page: page|| 1 }, function(replyCnt, list) {
	      
		    // console.log("replyCnt: "+ replyCnt );
		    // console.log("list: " + list);
		    // console.log(list);
	    	
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
 			
			var str="";
	     
			if(list == null || list.length == 0){
				replyUL.html("");
				return;
			}
	     	var rate = 0;
			for (var i = 0, len = list.length || 0; i < len; i++) {
					str +="<li data-rno='"+list[i].rno+"'><article class='uk-comment uk-panel uk-panel-space uk-panel-box-secondary'>";
					str +="<header class='uk-comment-header'><div class='header'>"
	  					+ "<img class='uk-comment-avatar uk-border-circle' src='../../../resources/images/avatar4.svg' width='50' height='50' alt=''>"
	  					+ "<h4 class='uk-comment-title'>"+list[i].user_id+"</h4>"; 
					str +="<div class='uk-comment-meta'>"
						+ replyService.displayTime(list[i].replydate)+"</div>"
						+"<div class='uk-comment-meta'> ⭐" + list[i].rating + "</div>" 
						+"</header>";
					str +="<div class='uk-comment-body'><p>"+list[i].reply+"</p></div></div></article></li>";

					rate += list[i].rating;
				}
			avg_rate = rate/list.length;

			dec_avg_rate = avg_rate.toFixed(1);
			
			document.getElementById("avg_rate").innerHTML = dec_avg_rate;
			
			replyUL.html(str);
	     
			showReplyPage(replyCnt);

	 
		});//end function
	     
	}//end showList

	// 댓글 페이징 처리
	var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
        endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e){
       e.preventDefault();
       console.log("page click");
       
       var targetPageNum = $(this).attr("href");
       
       console.log("targetPageNum: " + targetPageNum);
       
       pageNum = targetPageNum;
       
       showList(pageNum);
     });
 	// 댓글 페이징 처리 끝
 	
    
	/* 댓글 modal 창 동작 부분*/
	var modal = $(".modal");
    var modalInputReply = modal.find("input[name='reply']");
    var modalInputReplyer = modal.find("input[name='user_id']");
    var modalInputRating = modal.find("input[name='rating']");
    var modalInputReplyDate = modal.find("input[name='replydate']");
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");

 	// 댓글 인증 부분 추가
	var user_id = null;
    
    <sec:authorize access="isAuthenticated()">
    	var user_id = '<sec:authentication property="principal.username"/>';   
	</sec:authorize>
 
	const csrfHeaderName ="${_csrf.headerName}"; 
	const csrfTokenValue="${_csrf.token}";
    
    $("#modalCloseBtn").on("click", function(e){
    	modal.modal('hide');
    });
    
    $("#addReplyBtn").on("click", function(e){
		modal.find("input").val("");
		modal.find("input[name='user_id']").val(user_id);
		modalInputReplyDate.closest("div").hide();
		modal.find("button[id !='modalCloseBtn']").hide();
		
		modalRegisterBtn.show();
		$(".modal").modal("show");
    });

 	// Ajax Spring Security Header
    $(document).ajaxSend(function(e, xhr, options) { 
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	});
	
    // 댓글 등록
	modalRegisterBtn.on("click",function(e){
      
		var reply = {
			reply: modalInputReply.val(),
			user_id:modalInputReplyer.val(),
			rating: modalInputRating.val(),
            prog_num:bnoValue
		};
      
		replyService.add(reply, function(result){
        
        alert(result);
        
        modal.find("input").val("");
        modal.modal("hide");
        
        showList(1);
      });
      
    });
    
	//댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
      
		var rno = $(this).data("rno");
		console.log(rno);
		
		replyService.get(rno, function(reply){
	
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.user_id);
			modalInputRating.val(reply.rating);
			modalInputReplyDate.val(replyService.displayTime(reply.replydate)).attr("readonly","readonly");
			modal.data("rno", reply.rno);
			
			modal.find("button[id !='modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();
			
			$(".modal").modal("show");
		});
		
	});
	
 	// 댓글 수정 이벤트. security 적용 후
	modalModBtn.on("click", function(e){
		
		var originalReplyer = modalInputReplyer.val();
		
		var reply = {
				rno:modal.data("rno"), 
				reply: modalInputReply.val(),
				rating: modalInputRating.val(),
				user_id: originalReplyer
				};
	  
		if(!user_id){
			alert("로그인후 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}

		console.log("Original user_id: " + originalReplyer);
		
		if(user_id  != originalReplyer){
			alert("자신이 작성한 댓글만 수정이 가능합니다.");
			modal.modal("hide");
			return;
		}
		  
		replyService.update(reply, function(result){
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});

	// 댓글 삭제 부분. security 적용 후
	modalRemoveBtn.on("click", function (e){
	  	  
		var rno = modal.data("rno");

		console.log("RNO: " + rno);
		console.log("user_id: " + user_id);
	   	  
		if(!user_id){
			alert("로그인후 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		var originalReplyer = modalInputReplyer.val();
	   	  
		console.log("Original user_id: " + originalReplyer);
	   	  
		if(user_id !== originalReplyer){
	   		  
			alert("자신이 작성한 댓글만 삭제가 가능합니다.");
			modal.modal("hide");
			return;
		}
	   	  
		replyService.remove(rno, originalReplyer, function(result){
	   	        
			alert(result);
			modal.modal("hide");
			showList(pageNum);
		});
	});
	
	/* 댓글 modal 창 동작 부분*/
	
});
</script>
</html>