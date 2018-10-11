<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" 
uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/custom.css">
<title>Insert title here</title>
</head>
<body>

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
          <a class="navbar-brand" href="${path}/main/main.do">FMOW</a>
      </div>
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="${path}/memo/list.do">타임라인</a></li>
            <li><a href="${path}/board/list.do">페이지</a></li>
            <li><a href="${path}/members/list.do">팔로우추천</a></li>
            <li><a href="${path}/members/friend.do">팔로우목록</a></li>
            <li><a href="${path}/email/write.do">Q&A</a></li>
         </ul>
           
           <c:if test="${sessionScope.userid == 'admin'}">
           
           <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">관리자용<span class="caret"></span></a>
              <ul class="dropdown-menu">
                 <li><a href="${path}/memo/adminList.do">타임라인관리</a></li>
                 <li><a href="${path}/board/adminList.do">페이지관리</a></li>
                 <li><a href="${path}/board/adminReq.do">페이지요청관리</a></li>
                 <li><a href="${path}/members/adminList.do">회원관리</a></li>
                 <li><a href="${path}/members/logout.do">로그아웃</a></li>
              </ul> 
            </li>
         </ul>
         </c:if>
           <c:if test="${sessionScope.userid != 'admin'}">
           <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
              <a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-haspopup="true"
               aria-expanded="false">${sessionScope.name}님<span class="caret"></span></a>
              <ul class="dropdown-menu">
              <li><a href="${path}/members/photo.do">프로필 수정</a></li>
                 <li><a href="${path}/members/logout.do">로그아웃</a>
              </ul> 
            </li>
            <li><img src="${path}/images/${sessionScope.image}" width="50px"  height="50px"></li>
         </ul>
         </c:if>
         
            
        
      </div>
      
    </nav>
    
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</body>
</html>            
