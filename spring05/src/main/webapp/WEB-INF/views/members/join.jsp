<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
	<head>
	<meta charset="UTF-8">
	<title>http://www.blueb.co.kr</title>
	<%@ include file="../include/header.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	$(function() {
		$("#btnLogin").click(function() {
			var userid = $("#userid").val(); //태그의 value 속성값
			var passwd = $("#passwd").val();
			if (userid == "") {
				alert("아이디를 입력하세요.");
				$("#userid").focus(); //입력 포커스 이동
				return; //함수 종료
			}
			if (passwd == "") {
				alert("비밀번호를 입력하세요.");
				$("#passwd").focus();
				return;
			}
			//폼 데이터를 서버로 제출
			document.form1.action = "${path}/members/login_check.do";
			document.form1.submit();
		});
	});

	function daumZipCode() {
		 new daum.Postcode({
		     oncomplete: function(data) {
		// 팝업에서 검색결과 항목을 클릭했을때 
		//실행할 코드를 작성하는 부분.

		         // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 
		//이를 참고하여 분기 한다.
		         var fullAddr = ''; // 최종 주소 변수
		         var extraAddr = ''; // 조합형 주소 변수

		         // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 
		         //가져온다.
		// 사용자가 도로명 주소를 선택했을 경우         
		         if (data.userSelectedType === 'R') { 
		             fullAddr = data.roadAddress;

		         } else { // 사용자가 지번 주소를 선택했을 경우(J)
		             fullAddr = data.jibunAddress;
		         }
		      // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
		         if(data.userSelectedType === 'R'){
		             //법정동명이 있을 경우 추가한다.
		             if(data.bname !== ''){
		                 extraAddr += data.bname;
		             }
		// 건물명이 있을 경우 추가한다.
		             if(data.buildingName !== ''){
		                 extraAddr += (extraAddr !== '' ? ', ' 
		+ data.buildingName : data.buildingName);
		             }
		// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		             fullAddr += (extraAddr !== '' ? 
		            		 ' ('+ extraAddr +')' : '');
		         }

		         // 우편번호와 주소 정보를 해당 필드에 넣는다.
		         document.getElementById('address1').value 
		         	= data.zonecode; //5자리 새우편번호 사용
		         document.getElementById('address2').value 
		         	= fullAddr;

		         // 커서를 상세주소 필드로 이동한다.
		         document.getElementById('address3').focus();
		     }
		 }).open();
		}
	function passwdCheck(){
		var passwd=$("#passwd").val();
		 
		 var exp2 = /^[a-zA-z0-9]{8,}$/;
		 if(!exp2.test(passwd)){
		     document.getElementById("passwdCheck").innerHTML = "영문자,숫자 8자리이상으로 입력하세요.";
			 return;
		 }else if(exp2.test(passwd)){
			 document.getElementById("passwdCheck").innerHTML = "유효한 비밀번호입니다.";
			 return;
		 }
		 
	}
	function passwd1Check(){
		var passwd=$("#passwd").val();
		var passwd1=$("#passwd1").val();
		
		if(passwd == passwd1){
			document.getElementById("passwd1Check").innerHTML = "비밀번호가 일치합니다.";
		}
		if(passwd != passwd1){
			document.getElementById("passwd1Check").innerHTML = "비밀번호가 틀립니다.";
		}
		
	}
	function nameCheck(){
		var name=$("#name").val();
		var exp5=/^[가-힣\x20]{2,10}$/;
		  if(!exp5.test(name)){
			  document.getElementById("nameCheck").innerHTML = "한글 2~10자 이내로  입력하세요.";
		  }
		  if(exp5.test(name)){
			  document.getElementById("nameCheck").innerHTML = "유효한 이름입니다.";
		  }
	}
	function juminCheck(){
		var jumin=$("#jumin").val();
		var exp6=/^[0-9]{6}-[1-4]{1}[0-9]{6}$/;
		  if(!exp6.test(jumin)){
			  document.getElementById("juminCheck").innerHTML = "주민번호를 정확히 입력하세요.";
		  }
		  if(exp6.test(jumin)){
			  document.getElementById("juminCheck").innerHTML = "유효한 주민번호입니다.";
		  }
	}
	function emailCheck(){
		var email=$("#email").val();
		var exp4=/^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
		  if(!exp4.test(email)){
			  document.getElementById("emailCheck").innerHTML = "이메일 형식이 잘못 되었습니다.";
		  }
		  if(exp4.test(email)){
			  document.getElementById("emailCheck").innerHTML = "유효한 이메일입니다.";
		  }
	}
	function hpCheck(){
		var hp=$("#hp").val();
		 var exp7=/^[0]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}$/;
		  if(!exp7.test(hp)){
			  document.getElementById("hpCheck").innerHTML = "연락처 형식이 잘못 되었습니다.";
		  }
		  if(exp7.test(hp)){
			  document.getElementById("hpCheck").innerHTML = "유효한 연락처입니다.";
		  }
	}
	function jusoCheck(){
		var juso=$("#juso").val();
		var exp5=/^[가-힣\x20]{2,}$/;
		  if(!exp5.test(juso)){
			  document.getElementById("jusoCheck").innerHTML = "한글 2글자 이상입력하세요.";
		  }
		  if(exp5.test(juso)){
			  document.getElementById("jusoCheck").innerHTML = "유효한 주소입니다.";
		  }
	}
</script>

<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color: #f8f8f8;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 500px;
  margin: 80px auto 0;
  background-color: #ffffff;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("images/jaeun2.jpg");
  background-size: 400px;
  background-repeat: no-repeat;
}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 11px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 287px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 14px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: #999999;
  border: 1px solid #d9d9d9;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "?";
}
body .container .content .submit-wrap {
  position: relative;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

</style>
</head>
<body>

<section class="container" style="height: 700px;">
		    <article class="half">
			        <h1>Azure</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#">로그인</a></span>
				            <span class="tab signup"><a href="#">회원가입</a></span>
			        </div>
			        <div class="content">
				            <div class="signin-cont cont">
					                <form name="form1" method="post">
						                    <input name="userid" id="userid" required="required" placeholder="Your ID">
						                    <input type="password" name="passwd" id="passwd" required="required" placeholder="Your password">
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
			</td>
        					        </form>
    				        </div>
    				        <div class="signup-cont cont">
                <form method="post" action="${path}/members/join.do">
						<input type="text" name="userid" id="userid" class="inpt"
							required="required" placeholder="아이디"> 
							<input type="password" name="passwd" id="passwd" class="inpt"
							oninput="passwdCheck()" required="required" placeholder="비밀번호">
							<div id="passwdCheck" style="font-size: 0.8em;"></div>
							 <input
							type="text" name="name" id="name" class="inpt"
							required="required" placeholder="이름">

						<select name="sex">
                              <option value="남성">남성</option>
                              <option value="여성">여성</option>
                             </select>
						<!-- <span> 
						<label> <input type="radio" name="sex"
								value="남성">남성
						</label>
						</span> <span> <label> <input type="radio" name="sex"
								value="여성">여성
						</label>
						
						</span><br> -->
						
						 <select name="tel1">
							<option value="010">010</option>
							<option value="011">011</option>
						</select> - <input type="text" name="tel2" id="tel2" size="2"
							required="required" maxlength="4"> - <input type="text"
							name="tel3" id="tel3" size="2" required="required" maxlength="4"><br>

						<input name="address1" id="address1" readonly size="10"> <input
							type="button" onclick="daumZipCode()" value="우편번호 찾기"> <input
							name="address2" id="address2" size="34"><br> <input
							name="address3" id="address3" placeholder="상세주소" size="34">

						<div class="submit-wrap">
							<input type="submit" value="회원가입" class="submit"> <a
								href="#" class="more">Terms and conditions</a>
						</div>
					</form>
            </div>
			        </div>
		    </article>
		    <div class="half bg"></div>
	</section>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>
</body>
</html>
