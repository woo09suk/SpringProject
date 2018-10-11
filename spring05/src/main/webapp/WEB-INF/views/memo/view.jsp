<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<%@ include file="../include/header2.jsp" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>
<script type="text/javascript">
$(function() {
	$("#memo").summernote({
		height: 400,
		width: 800
	});
	$("#btnUpdate").click(function() {
		document.form1.action="${path}/memo/update/${dto.idx}";
		document.form1.submit();
	});
	$("#btnDelete").click(function() {
		if(confirm("삭제하시겠습니까?")) {
		document.form1.action="${path}/memo/delete/${dto.idx}";
		document.form1.submit();
		}
	});
	$("#btnCancle").click(function() {
		location.href="${path}/memo/list.do";
	})
});
</script>
<style>
#all:after {
	width: 100%;
	height: 100%;
	z-index: -1;
	position: fixed;
	top: 0;
	left: 0;
	content: "";
	background-repeat: repeat;
	background-image: url('${path}/images/배경화면후보2.jpg');
	background-size: cover;
	opacity: 0.2!important; filter: alpha(opacity=30);	
	background-position: center;
	background-origin: content-box;
}
.button {
	border-radius: 10px 0 10px 0;
}
</style>
</head>
<body>
<%@ include file="../include/menu2.jsp" %>
<div id="all">
<form name="form1" method="post">
	<table align="center" style="margin-bottom:100px; margin-top:200px; border-radius:5px; background:rgb(248,248,248); box-shadow:0 0 10px 50px rgb(248,248,248);">
		<tr>
			<td style="font-weight: bolder; font-size:1.3em;">${dto.name}
			<input type="hidden" name="userid" value="${dto.userid}">
				<em style="font-size:.7em; font-style:normal; color:rgb(223,223,223);">님께서 작성하신 글입니다.</em></td>
		</tr>
		<tr><td colspan="2" style="font-size:.1em;">&nbsp;</td></tr>
		<tr>
		<c:if test="${sessionScope.userid == dto.userid}">
			<td><textarea rows="5" cols="70" name="memo" id="memo">${dto.memo}</textarea></td>
		</c:if>
		<c:if test="${sessionScope.userid != dto.userid}">
			<td style="vertical-align:top; border:1px solid black; width:800px; height:400px; padding:10px;">${dto.memo}</td>
		</c:if>
		</tr>
		<tr><td colspan="2" style="font-size:.1em;">&nbsp;</td></tr>
		<tr align="center">
			<td colspan="2" align="right">
				<input type="hidden" name="idx" value="${dto.idx}">
					<c:if test="${sessionScope.userid == dto.userid}">
						<input class="button" type="button" value="수정" id="btnUpdate">
						<input class="button" type="button" value="삭제" id="btnDelete">
					</c:if>
				<input class="button" type="button" value="목록" id="btnCancle">
			</td>
		</tr>
	</table>
</form>
</div>
</body>
</html>