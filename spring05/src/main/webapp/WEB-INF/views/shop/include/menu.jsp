<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="../include/css/bootstrap.css">
<link rel="stylesheet" href="../include/css/custom.css">

<nav class="navbar navbar-default">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
          data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
          aria-expanded="false">
          <span class="icon-bar"></span>
          <span class="icon-
          bar"></span>
          <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${path}">FaceBook</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         
           <ul class="nav navbar-nav navbar-right">
        <div style="text-align:right;">
            <c:choose>
               <c:when test="${sessionScope.userid == null }">
	           <!-- 로그인하지 않은 상태 -->|
	             <a href="${path}/admin/login.do">로그인</a>
               </c:when>
            <c:otherwise>
            <!-- 로그인한 상태 -->
                ${sessionScope.name}님이 로그인중입니다.
                <a href="${path}/member/logout.do">로그아웃</a> 
            </c:otherwise>
           </c:choose>
      </div>
         </ul> 
      </div>
    </nav>
        <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="include/js/bootstrap.js"></script>
<hr>
 
