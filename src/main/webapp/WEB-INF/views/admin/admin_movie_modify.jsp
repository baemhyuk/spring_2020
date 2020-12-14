<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@include file="../includes/header.jsp"%>

<script>
//썸네일 파일명을 가져오는 함수
function getThumbFileName(fullFilePath) {
	var arrString = fullFilePath.split("/");
	console.log(arrString);
	arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
	return arrString.join("/");
}
</script>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Movie Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Movie Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/admin/admin_movie_modify" method="post" enctype="multipart/form-data">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 
		<div class="form-group">
	          <label>번호</label> <input class="form-control" name='prog_num'
	          readonly="readonly" value='<c:out value="${movie_get.prog_num}"/>'>
          </div>

        <div class="form-group">
          <label>포스터</label> 
          <div><img class="admin_image" src="<c:out value="${movie_get.poster}"/>"/></div>
          <input class="form-control" name='poster'
            value='<c:out value="${movie_get.poster}"/>'>
        </div>

		<div class="form-group">
          <label>제목</label> <input class="form-control" name='title'
            value='<c:out value="${movie_get.title}"/>'>
        </div>
        
        <div class="form-group">
          <label>연도</label> <input class="form-control" name='year'
            value='<c:out value="${movie_get.year}"/>'>
        </div>
        
        <div class="form-group">
          <label>평점</label> 
          <input class="form-control" name='rate'
            value='<c:out value="${movie_get.rate }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="8" name='content'>
          <c:out value="${movie_get.content}" /></textarea>
        </div>
        
        <div class="form-group">
          <label>나라</label> <input class="form-control" name='country'
            value='<c:out value="${movie_get.country }"/>'>
        </div>
        
        <div class="form-group">
          <label>장르</label> <input class="form-control" name='genre'
            value='<c:out value="${movie_get.genre }"/>'>
        </div>
        
        <div class="form-group">
          <label>구분번호</label> <input class="form-control" name='div_num'
            value='<c:out value="${movie_get.div_num }"/>'>
        </div>
        
        <div class="form-group">
          <label>예고편</label> <input class="form-control" name='video'
            value='<c:out value="${movie_get.video }"/>'>
        </div>
        
        <div class="form-group">
          <label>좋아요</label> <input class="form-control" name='prog_like'
            value='<c:out value="${movie_get.prog_like }"/>' readonly="readonly">
        </div>

	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
	<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
  	<button type="submit" data-oper='list' class="btn btn-info">List</button>
</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/admin/admin_movie_remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/admin/admin_movie").attr("method","get");

	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);
	    }
	    
	    formObj.submit();
	  });

});
</script>
  




<%@include file="../includes/footer.jsp"%>
