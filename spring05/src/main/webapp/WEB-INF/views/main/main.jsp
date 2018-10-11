<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
function realtimeClock() {
	document.rtcForm.rtcInput.value = getTimeStamp();
	setTimeout("realtimeClock()", 1000);
}
function getTimeStamp() {
	var d = new Date();
	var s = leadingZeros(d.getFullYear(), 4) + '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate(), 2) + ' ' +
			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2) + ':' +
			leadingZeros(d.getSeconds(), 2);
	return s;
}
function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();
	if (n.length < digits) {
		for (i = 0; i < digits - n.length; i++)
			zero += '0';
		}
	return zero + n;
}
</script>
<style type="text/css">
div:after {
	width: 100%;
	height: 100%;
	z-index: -1;
	position: fixed;
	top: 0;
	left: 0;
	content: "";
	background-repeat: repeat;
	background-image: url('${path}/images/back.jpg');
	background-size: cover;
	opacity: 1!important; filter:alpha(opacity=30);	
	background-position: center;
	background-origin: content-box;
}
</style>
</head>
<body onload="realtimeClock()">
<%@ include file="../include/menu.jsp" %>
<div width="100%" style="color:white; margin-top:200px; text-align:right; padding-right:250px;">
<p style="font-size:10em; font-weight:bolder;">Welcome!!</p>
<c:if test="${sessionScope.userid != null}">
	<h4>${sessionScope.name}<em style="font-size:.6em; font-style:normal;">(${sessionScope.userid})</em>님의 방문을 환영합니다.</h4>
</c:if>
</div>
<form name="rtcForm" style="padding-right:213px; color:white;" align="right">
현재시각&nbsp;&nbsp;&nbsp;<input type="text" name="rtcInput" size="20" style="border:0px; background:none;" readonly />
</form>
</body>
</html>