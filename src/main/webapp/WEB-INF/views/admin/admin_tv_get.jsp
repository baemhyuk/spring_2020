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
    <h1 class="page-header">Tv Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Tv Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
	          <label>번호</label> <input class="form-control" name='title'
	          readonly="readonly" value='<c:out value="${tv_get.prog_num}"/>'>
          </div>

        <div class="form-group">
          <label>포스터</label> 
          <div><img class="admin_image" src="<c:out value="${tv_get.poster}"/>"/></div>
          <input class="form-control" name='title'
            value='<c:out value="${tv_get.poster}"/>'readonly="readonly">
        </div>

		<div class="form-group">
          <label>제목</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.title}"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>연도</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.year}"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>평점</label> 
          <input class="form-control" name='title'
            value='<c:out value="${tv_get.rate }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="8" name='content' readonly="readonly">
          <c:out value="${tv_get.content}" /></textarea>
        </div>
        
        <div class="form-group">
          <label>나라</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.country }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>장르</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.genre }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>구분번호</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.div_num }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>예고편</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.video }"/>' readonly="readonly">
        </div>
        
        <div class="form-group">
          <label>좋아요</label> <input class="form-control" name='title'
            value='<c:out value="${tv_get.prog_like }"/>' readonly="readonly">
        </div>

		<button data-oper='modify' class="btn btn-default">Modify</button>
		<button data-oper='list' class="btn btn-info">List</button>

<form id='operForm' action="/admin/admin_tv_modify" method="get">
  <input type='hidden' id='prog_num' name='prog_num' value='<c:out value="${tv_get.prog_num}"/>'>
  <input type='hidden' name='poster' value='<c:out value="${tv_get.poster}"/>'>
  <input type='hidden' name='title' value='<c:out value="${tv_get.title}"/>'>
  <input type='hidden' name='year' value='<c:out value="${tv_get.year}"/>'>
  <input type='hidden' name='rate' value='<c:out value="${tv_get.rate}"/>'>
  <input type='hidden' name='content' value='<c:out value="${tv_get.content}"/>'>
  <input type='hidden' name='country' value='<c:out value="${tv_get.country}"/>'>
  <input type='hidden' name='genre' value='<c:out value="${tv_get.genre}"/>'>
  <input type='hidden' name='div_num' value='<c:out value="${tv_get.div_num}"/>'>
  <input type='hidden' name='video' value='<c:out value="${tv_get.video}"/>'>
</form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/admin/admin_tv_modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#prog_num").remove();
    operForm.attr("action","/admin/admin_tv")
    operForm.submit();
    
  });  
});
</script>


<%@include file="../includes/footer.jsp"%>
