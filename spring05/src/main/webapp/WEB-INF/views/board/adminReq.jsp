<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<table align="center" border="1" width="600px" class="type08">
<thead>
	<tr>
		<th>제목</th>
		<th>개설자</th>
		<th>개설날짜</th>
		<th>허가</th>
	</tr>
</thead>
	<!-- forEach var="개별데이터" items="집합데이터" -->
<c:forEach var="row" items="${list}">
<tbody>
	<tr>
		<td>
			<a href="${path}/board/view.do?bno=${row.bno}">
			${row.title}
			</a>
			</td>
		<td>${row.writer}</td>
		<td><fmt:formatDate value="${row.regdate}"
			pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			<td><a href="${path}/board/permit/${row.bno}"><button>수락</button></a></td>
			<td><a href="${path}/board/boardDelete/${row.bno}"><button>거절</button></a></td>
	</tr>
</tbody>
</c:forEach>
</table>
</body>
</html>