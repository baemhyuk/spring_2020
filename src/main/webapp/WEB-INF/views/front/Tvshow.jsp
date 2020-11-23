<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/front_header.jsp"%>

<body>

    <!--     start Header Section   -->
    <nav id="tm-header" class="uk-navbar ">
        <div class="uk-container uk-container-center ">
            <a class="uk-navbar-brand uk-hidden-small" href="/">
            <i class="uk-icon-small uk-text-primary uk-margin-small-right uk-icon-play-circle"></i> WEBFLIX</a>


            <div class="uk-navbar-flip uk-hidden-small">
                <div class="uk-button-group">
                    <a class="uk-button uk-button-link uk-button-large" href="/front/signup">Sign up</a>
                    <a class="uk-button uk-button-success uk-button-large uk-margin-left" href="/front/login">
                    	<i class="uk-icon-lock uk-margin-small-right"></i> Log in
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
    <nav class="uk-navbar uk-navbar-secondary  uk-hidden-small">
        <div class="uk-container-center uk-container">
            <ul class="uk-navbar-nav">
                <li ><a href="index">Movies</a></li>
                <li class="uk-active"><a href="Tvshow">TV Shows</a></li>
            </ul>
            <div class="uk-navbar-flip">
                <form class="uk-search uk-margin-small-top uk-margin-left uk-hidden-small">
                    <input class="uk-search-field" type="search" placeholder="Search..." autocomplete="off">
                    <div class="uk-dropdown uk-dropdown-flip uk-dropdown-search" aria-expanded="false"></div>
                </form>
            </div>
        </div>
    </nav>

    <!--     ./ Header Section   -->


    <!--     start Main Content Section   -->

    <div class="uk-container uk-container-center uk-margin-large-top uk-margin-large-bottom">

        <div class="uk-grid">

            <div id="tm-right-section" class="uk-width-large-1-1 uk-width-medium-7-10"
                data-uk-scrollspy="{cls:'uk-animation-fade', target:'img'}">
                <div class="uk-grid-width-small-1-3 uk-grid-width-medium-1-4 uk-grid-width-large-1-6"
                    data-uk-grid="{gutter: 20}">
                   
                   	<c:forEach items="${tv}" var="movie_program">					
					<div>
                        <div class="uk-overlay uk-overlay-hover">
                            <img src="<c:out value="${movie_program.poster}" />" alt="Image">
                            <div class="uk-overlay-panel uk-overlay-fade uk-overlay-background  uk-overlay-icon"></div>
                            <a class="uk-position-cover" href="/front/media"></a>
                        </div>
                        
                        
                        <div class="uk-panel">

                            <h5 class="uk-panel-title"><c:out value="${movie_program.title}" /></h5>
                            <p>
                            <span class="rating">
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                    <i class="uk-icon-star"></i>
                                </span>
                                <span class="uk-float-right"><c:out value="${movie_program.year}" /></span>
                            </p>
                        </div>
             		</div>
					</c:forEach>
					
				</div>
                
                <!--  Pagination 시작 -->
				<div class='uk-margin-large-top uk-margin-bottom'>
					<ul class="uk-pagination">
						
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous">
								<a href="${pageMaker.startPage -1}">
									<span><i class="uk-icon-angle-double-left"></i>
								</a>
							</li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!--  Pagination 끝 -->
				
				<!-- 페이징 Form 시작 -->
				<form id='actionForm' action="/front/tvshow" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
				<input type='hidden' name='keyword'	value='<c:out value="${ pageMaker.cri.keyword }"/>'>
				</form>
				
            </div>
        </div>
    </div>

<%@include file="../includes/front_footer.jsp"%>
    <script>
    $(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		// replaceState(data, title [, url ]) 히스토리를 수정
		history.replaceState({}, null, null);

		function checkModal(result) {
			// alert(history.state);
			// 글 등록 후 리스트 화면에서 model창이 나온 뒤 새로고침을 해도 model창이 안나오도록
			// result값 체크
			// result값은 controller에서 넘어온 1회성 값으로 페이지를 다시 읽으면 null이된다.
			// history.state 는 조회에서 back 했을때 history객체의 현재 정보를 읽어 값이 있다면 
			// modal창을 띄우지 않는다.
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result)	+ " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			self.location = "/front/tvshow";
		});
		
		var actionForm = $("#actionForm");

		// 페이지 번호 클릭 이벤트
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			// console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		// 상세보기 클릭 이벤트
		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/front/tvshow");
			actionForm.submit();
		});
		
		// 검색 버튼 클릭 이벤트
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
    </script>
    <!--     ./ Main Content Section   -->
