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
		var name=$("#name").val();
		var tel2=$("#tel2").val();
		var tel3=$("#tel3").val();
		if(name == null || name == ""){
		     alert("이름을 입력해주세요.");
		     $("#name").focus();
		     return;
		}
		if(tel2 == null || tel2 == ""){
		     alert("휴대폰 번호를 입력해주세요.");
		     $("#tel2").focus();
		     return;
		}
		if(tel3 == null || tel3 == ""){
		     alert("휴대폰 번호를 입력해주세요.");
		     $("#tel3").focus();
		     return;
		}
		document.form1.submit();
	});
});
	
</script>
</head>
<body style="text-align: center;">
<h2>아이디 찾기</h2>
<form method="post" name="form1" action="${path}/members/findId.do">
이름 : <input type="text" id="name" name="name"><br>
휴대폰 : 
<select name="tel1">
 <option>010</option>
</select>
<input type="text" size="2" id="tel2" name="tel2" maxlength="4">
<input type="text" size="2" id="tel3" name="tel3" maxlength="4">
<button type="button" id="ok">확인</button>
</form>
<div id="div"></div>
</body>
</html>