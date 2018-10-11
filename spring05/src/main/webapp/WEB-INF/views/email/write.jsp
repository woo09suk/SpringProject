<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A</title>
<%@ include file="../include/header.jsp" %>

</head>

<script type="text/javascript">
$(function(){
	$("#ok").click(function(){
		var subject=$("#subject").val();
		var senderName=$("#senderName").val();
		var senderMail=$("#senderMail").val();
		var tel3=$("#tel3").val();
		var tel3=$("#tel3").val();
		if(subject == null || subject == ""){
		     alert("제목을 입력해주세요.");
		     $("#subject").focus();
		     return;
		}
		if(senderName == null || senderName == ""){
		     alert("발신자를 입력해주세요.");
		     $("#senderName").focus();
		     return;
		}
		if(senderMail == null || senderMail == ""){
		     alert("발신자메일을 입력해주세요.");
		     $("#senderMail").focus();
		     return;
		}
		if(receiveMail == null || receiveMail == ""){
		     alert("수신자 메일을 입력해주세요.");
		     $("#receiveMail").focus();
		     return;
		}
		if(message == null || message == ""){
		     alert("내용을 입력해주세요.");
		     $("#message").focus();
		     return;
		}
		document.form1.submit();
	});
});
	
</script>
<style>
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
<h1>Q&A</h1>
<h4>기타 오류 등 문의사항이 있으면 보내주세요.</h4>
<hr>

<form name="form1" method="post" action="${path}/email/send.do" >
   
<table width="0" border="0" cellspacing="0" cellpadding="0" style="background-color: white;">
  <tr>
    <td><img src="../images/back_1.jpg" width="568" height="19" /></td>
  </tr>
  
  <tr>
    <td><table width="0" border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td><img src="../images/back_3.jpg" width="21" height="472" /></td>
        <td width="525" align="center">
         
        <table width="100" border="0" cellpadding="0" cellspacing="5">
          <tr>
            <td width="100" align="right"><font color="#663300"><img src="../images/subject.jpg"  /></font></td>
            <td width="500" align="left"><input name="subject" id="subject" type="text" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; WIDTH: 350px; COLOR: #333333; BORDER-BOTTOM: #cccccc 1px solid; HEIGHT: 20px"
             size="32" /></td>
          </tr>
          <tr>
            <td align="right"><img src="../images/name.jpg"  /></td>
            <td align="left"><input name="senderName" id="senderName" type="text" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; WIDTH: 350px; COLOR: #333333; BORDER-BOTTOM: #cccccc 1px solid; HEIGHT: 20px"
             size="32" /></td>
          </tr>
            <tr>
            <td align="right"><img src="../images/sender.jpg" /></td>
            <td align="left"><input name="senderMail" id="senderMail" type="text" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; WIDTH: 350px; COLOR: #333333; BORDER-BOTTOM: #cccccc 1px solid; HEIGHT: 20px"
             size="32" /></td>
          </tr>
          
          <tr>
            <td align="right"><img src="../images/receiver.jpg" /></td>
            <td align="left"><input name="receiveMail" id="receiveMail" type="text" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; WIDTH: 350px; COLOR: #333333; BORDER-BOTTOM: #cccccc 1px solid; HEIGHT: 20px"
             size="32" value="kunho920@gmail.com"></td>
          </tr>
          <tr>
            <td align="center"><font color="#663300"><img src="../images/request.jpg" /> </font></td>
            <td align="left"><textarea name="message" id="message" style="BORDER-RIGHT: #cccccc 1px solid; BORDER-TOP: #cccccc 1px solid; BORDER-LEFT: #cccccc 1px solid; WIDTH: 350px; COLOR: #333333; BORDER-BOTTOM: #cccccc 1px solid; HEIGHT: 198px"
             rows="5" cols="26"></textarea></td>
          </tr>
          <tr align="left">
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td  align="right"><input name="button" id="ok" type="button" value="보내기" src="../images/ok.jpg"  />
          </tr>
        </table></td>
        <td><img src="../images/back_4.jpg" width="22" height="472" /></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td><img src="../images/back_2.jpg" width="568" height="19" /></td>
  </tr>
</table>
</form>
</div>
</body>
</html>
