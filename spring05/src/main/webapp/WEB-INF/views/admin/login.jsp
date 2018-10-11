<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="../include/css/bootstrap.css">
<link rel="stylesheet" href="../include/css/custom.css">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnLogin").click(function(){
		var userid=$("#userid").val(); //태그의 value 속성값
		var passwd=$("#passwd").val();
		if(userid==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus(); //입력 포커스 이동
			return; //함수 종료
		}
		if(passwd==""){
			alert("비밀번호를 입력하세요.");
			$("#passwd").focus();
			return;
		}
		//폼 데이터를 서버로 제출
		document.form1.action="${path}/admin/login_check.do";
		document.form1.submit();
	});
});
</script>
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

<h2>로그인</h2>
<form name="form1" method="post">
<table border="1" width="400px">
	<tr>
		<td>아이디</td>
		<td><input name="userid" id="userid"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd" id="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="btnLogin" value="로그인">

			<c:if test="${param.message == 'nologin' }">
				<div style="color:red;">
					로그인 하신 후 사용하세요.
				</div>				
			</c:if>
			<c:if test="${message == 'error' }">
				<div style="color:red;">
					아이디 또는 비밀번호가 일치하지 않습니다.
				</div>
			</c:if>
			<c:if test="${message == 'logout' }">
				<div style="color:blue;">
					로그아웃 처리되었습니다.
				</div>
			</c:if>
			
		</td>
	</tr>
</table>
</form>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="../include/js/bootstrap.js"></script>
</body>
</html>
