<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#friendDelete").click(function(){
		/* var user_num=$("#user_num").val(); */
	     if(confirm("삭제하시겠습니까?")){
	    	 document.form1.submit();
	     }
	});
});
</script>
<style>
.button {
  background-color: #f2f2f2;
  background-image: linear-gradient(to bottom, #f2f2f2, #f2f2f2);
  border: 1px solid #bfbfbf;
  box-shadow: inset 0 1px 0 white, inset 0 -1px 0 #d9d9d9, inset 0 0 0 1px #f2f2f2, 0 2px 4px rgba(0, 0, 0, 0.2);
  color: #8c8c8c;
  text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
  border-radius: 3px;
  cursor: pointer;
  display: inline-block;
  font-family: Verdana, sans-serif;
  font-size: 12px;
  font-weight: 400;
  line-height: 20px;
  transition: all 20ms ease-out;
  vertical-align: top;
}

table {border-spacing: 0; }
table {
	font-family: Arial, Helvetica, sans-serif;
	color: #666;
	font-size: 12px;
	text-shadow: 1px 1px 0px #fff;
	background: #eaebec;
	margin: 20px;
	border: #ccc 1px solid;

	-webkit-border-radius: 3px;
	border-radius: 3px;

	-webkit-box-shadow: 0 1px 2px #d1d1d1;
	box-shadow: 0 1px 2px #d1d1d1;
}
table > thead > tr:first-child > th:last-child {
	-webkit-border-top-right-radius: 3px;
	border-top-right-radius: 3px;
}
table > tbody > tr {
	text-align: center;
	padding-left: 20px;
}
table > tbody > tr > td:first-child {
	text-align: left;
	padding-left: 20px;
	border-left: 0;
}
table > tbody > tr > td {
	padding:18px;
	border-top: 1px solid #ffffff;
	border-bottom: 1px solid #e0e0e0;
	border-left: 1px solid #e0e0e0;

	background: #fbfbfb; /* Old browsers */
	background: -moz-linear-gradient(top,  #fbfbfb 0%, #fafafa 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#fbfbfb), color-stop(100%,#fafafa)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #fbfbfb 0%,#fafafa 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #fbfbfb 0%,#fafafa 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fbfbfb', endColorstr='#fafafa',GradientType=0 ); /* IE6-9 */
}
table > tbody > tr:nth-child(even) > td{
	background: #f8f8f8; /* Old browsers */
	background: -moz-linear-gradient(top,  #f8f8f8 0%, #f6f6f6 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f8f8f8), color-stop(100%,#f6f6f6)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #f8f8f8 0%,#f6f6f6 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #f8f8f8 0%,#f6f6f6 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
}
table > tbody > tr:last-child > td{
	border-bottom: 0;
}
table > tbody > tr:last-child > td:first-child {
	-webkit-border-bottom-left-radius: 3px;
	border-bottom-left-radius: 3px;
}
table > tbody > tr:last-child > td:last-child {
	-webkit-border-bottom-right-radius: 3px;
	border-bottom-right-radius: 3px;
}
table > tbody > tr:hover > td {
	background: #f2f2f2; /* Old browsers */
	background: -moz-linear-gradient(top,  #f2f2f2 0%, #f0f0f0 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f2f2f2), color-stop(100%,#f0f0f0)); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  #f2f2f2 0%,#f0f0f0 100%); /* IE10+ */
	background: linear-gradient(to bottom,  #f2f2f2 0%,#f0f0f0 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f2f2', endColorstr='#f0f0f0',GradientType=0 ); /* IE6-9 */
}
#all:after {
	width:100%;
	height:100%;
	z-index:-1;
	position:fixed;
	top:0;
	left:0;
	content:"";
	background-repeat:repeat;
	background-image: url('${path}/images/배경화면후보2.jpg');
	background-size: cover;
	opacity: 0.3!important; filter:alpha(opacity=30);	
	background-position:center;
	background-origin:content-box;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="all">
<div align="center">
<h2>회원정보</h2>
</div>
<div align="center">
<form method="post" name="form1" action="${path}/members/friendDelete.do">
<table>
 <tr>
  <td><img src="${path}/images/${dto.image}" width="300px" height="300px"></td>
  <td>
    <table>
      <tr>
        <td>이름</td>
        <td>${dto.name}</td>
      </tr>
      <tr>
        <td>성별</td>
        <td>${dto.sex}</td>
      </tr>
      <tr>
      	<td>핸드폰번호</td>
      	<td>${dto.tel1}-${dto.tel2}-${dto.tel3}</td>
      </tr>
      <tr>
      	<td>주소</td>
      	<td>${dto.address1}${dto.address2}${dto.address3}</td>
      </tr>
      <tr>
       <td>가입날짜</td>
       <td><fmt:formatDate value="${dto.joinDate}" pattern="yyyy년 MM월 dd일" /></td>
      </tr>
      <tr align="center">
      	<td colspan="2" align="center">
      	<input type="hidden" id="user_num" name="user_num" value="${dto.user_num}">
      	<button class="button" type="button" id="friendDelete">친구삭제</button>
      	</td>
      </tr>
    </table>
  </td>
 </tr>
</table>
</form>
</div>
</div>
</body>
</html>