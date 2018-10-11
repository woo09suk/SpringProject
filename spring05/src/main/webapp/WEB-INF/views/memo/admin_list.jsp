<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIME_LINE</title>
<%@ include file="../include/header.jsp" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="${path}/summernote/summernote.css" rel="stylesheet">
<script src="${path}/summernote/summernote.js"></script>
<script>
$(function() {
	$("#memo").summernote({
		height: 100, 
		width: 600
	});
});
function memo_view(idx) {
	location.href="${path}/memo/view/"+idx;
}
$(function() {
	$("#write").click(function() {
		var writer = $("#writer").val();
		var memo = $("#memo").val();
		if(writer == "") {
			alert("이름을 작성해주세요.");
			$("#writer").focus();
			return;
		}
		if(memo == "") {
			alert("내용을 작성해주세요.");
			$("#memo").focus();
			return;
		}
		document.form1.action="${path}/memo/insert.do";
		document.form1.submit();
	});
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
	background-image: url('${path}/images/img.jpg');
	background-size: cover;
	opacity: 0.2!important; filter:alpha(opacity=30);	
	background-position: center;
	background-origin: content-box;
}
textarea {
	font-weight: bolder;
}
#top:hover {
	font-size: 1em;
	font-weight: normal;
}
a {
	text-decoration: none;
	font-style: normal;
	color: black;
}
#fresh {
	text-decoration: none;
	font-style: normal;
	color: black;
   	position:fixed;
	left: 1350px;
	top: 600px;
	margin: 200px;
}
a:hover {
	text-decoration: none;
	font-style: normal;
	color: black;
}
a {
	text-decoration: none;
	font-style: normal;
	color: black;
}
td, th {
	border: 1px solid transparent;
	height: 30px;
	transition: all 0.3s;
}
/* #content:hover {
	background: rgb(248,248,248);
	color: #FFF;
	font-weight: bolder;
	font-size: 1.5em;
} */
a.tooltips {
	position: relative;
	display: inline;
}
a.tooltips span {
	position: relative;
	width: 140px;
	color: #FFFFFF;
	background: #000000;
	height: 30px;
	line-height: 30px;
	text-align: center;
	display: none;
	border-radius: 6px;
}
a.tooltips span:after {
	content: '';
	position: absolute;
	/* top: 100%; */
	left: 50%;
	margin-left: -8px;
	width: 0;
	height: 0;
	border-top: 8px solid #000000;
	border-right: 8px solid transparent;
	border-left: 8px solid transparent;
}
a:hover.tooltips{
	display: block;
	font-weight:bolder;
	align: left;
	z-index: 999;
	color: black;
	text-decoration: none;
}
a:visited.tooltips{
	color:black;
}
input {
	border: 0px;
	border-radius: 0px;
	-webkit-appearance: none;
	height: 30px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
input:focus {
	border: solid 1.5px black;
}
input:focus {
	outline: none;
}
</style>
</head>
<body>
<%@ include file="../include/menu2.jsp" %>
<table align="center" style="margin-top:100px">
<tr><td><FONT face="Comic Sans MS" style="font-weight:bolder; font-size:3em; text-align:center;" align="center">
<a href="${path}/memo/list.do" style="color:black; font-weight: bolder; text-decoration: none;">TIME_LINE</a></FONT>
</td></tr>
</table>
<br><br><br><br>

<div id="all">
<form method="post" name="form1" action="${path}/memo/insert.do">
	<table align="center" border="1" style="background:rgb(248,248,248); border-radius:5px; box-shadow:0 0 10px 15px rgb(248,248,248);">
		<tr>
			<td colspan="2" style="font-weight: bolder; font-size:1.3em;">${sessionScope.name}<em style="font-size:.7em; font-style:normal; color:rgb(223,223,223);">님 무슨 생각을 하고 있나요?</em></td>
		</tr>
		<tr>
			<td><textarea style="border:0px" rows="3" cols="50" name="memo" id="memo"></textarea></td>
			<td style="vertical-align:bottom; padding-bottom:20px; padding-left:10px;"><input style="border-radius:10px 0 10px 0;" type="button" id="write" value="확인"></td>
		</tr>
	</table>
</form>
<br><br><br>
	<table id="table" class="table" align="center" style="width:900px; margin-top:10px; background:rgb(248,248,248); border-radius: 5px; box-shadow: 0 0 10px 50px rgb(248,248,248);">
		<c:forEach items="${list}" var="row">
			<tr align="center">
				<td style="width:70px; font-size:1.1em; font-weight:bolder;">${row.name}</td>
				<td style="text-align:right; font-size:.7em; color:gray;">
					<fmt:formatDate value="${row.post_date}" pattern="yyyy년 MM월 dd일" />&nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="2" id="content" style="text-align:justify; padding-left:90px; padding-right:95px;">
						<a href="#" class="tooltips" onclick="memo_view('${row.idx}')">${row.memo}
						</a><br><br><br><br>	
				</td>
			</tr>
			<tr>
			 <td colspan="2" align="right"><a href="${path}/memo/adminDelete/${row.idx}"><button>삭제</button></a></td>
			</tr>
<!-- 			<tr>
				<td colspan="2" style="padding-left:90px;">
					<input id="name" style="border-radius: 10px 0 0 10px; width: 90px;" placeholder=" 이름">
					<input size="80" style="border-radius: 0 10px 10px 0;" placeholder=" 댓글은 여기다 써">
					<input type="button" id="btnReply" style="border-radius: 10px 0 10px 0;" value="확인">
				</td>
			</tr>
			<tr>
				<td><div id="listReply"></div></td>
			</tr> -->
			<tr>
				<td colspan="2"><hr></td>
			</tr>
		</c:forEach>
 		<tr>
			<td align="right" colspan="2"><a href="#" id="top" onclick="window.scrollTo(0,0); return false;"><img class="top" src="../images/top.jpg"></a></td>
		</tr>
	</table>
	<p>&nbsp;<p>&nbsp;
</div>
</body>
</html>