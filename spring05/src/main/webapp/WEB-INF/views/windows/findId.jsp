<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	$("#ok").click(function(){
		window.close();
	});
});
</script>
</head>
<body style="text-align: center;">
<h2>아이디</h2>
<table align="center">
<c:if test="${map.count == 0}">
 <h3>아이디가 없습니다.</h3>
</c:if>
<c:if test="${map.count != 0}">
<c:forEach var="row" items="${map.list}">
 <tr>
  <td><h3>${row.userid}</h3></td>
 </tr>
</c:forEach>
</c:if>
</table>
<button type="button" id="ok">확인</button>
</body>
</html>