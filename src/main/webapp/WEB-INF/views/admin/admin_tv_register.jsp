<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Movie Register</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Tv Register</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/admin/admin_tv_register" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	
          <div class="form-group">
            <label>포스터</label> <input class="form-control" name='poster' placeholder="사진 경로">
          </div>
          
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title' placeholder="제목 입력">
          </div>
          
          <div class="form-group">
            <label>연도</label> <input class="form-control" name='year' placeholder="연도 입력">
          </div>
          
          <div class="form-group">
            <label>평점</label> <input class="form-control" name='rate' value="1" readonly="readonly">
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="7" name='content' placeholder="내용 입력"></textarea>
          </div>
          
          <div class="form-group">
            <label>나라</label> <input class="form-control" name='country' placeholder="나라 입력">
          </div>
          
          <div class="form-group">
            <label>장르</label> <input class="form-control" name='genre' placeholder="장르 입력">
          </div>
          
          <div class="form-group">
            <label>구분번호</label> <input class="form-control" name='div_num' value="2" readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>예고편</label> <input class="form-control" name='video' placeholder="유튜브 영상 경로 입력">
          </div>
          
          <button type="submit" class="btn btn-default">Submit Button</button>
          <button type="reset" class="btn btn-default">Reset Button</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>
