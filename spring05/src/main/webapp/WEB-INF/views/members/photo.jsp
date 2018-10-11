<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- ckeditor 사용을 위해 js 파일 연결 -->
<script src="${path}/ckeditor/ckeditor.js"></script>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
function members_update(){
	var userid=$("#userid").val();
	var passwd=$("#passwd").val();
	var name=$("#name").val();
	var sex=$("#sex").val();
	var tel1=$("#tel1").val();
	var tel2=$("#tel2").val();
	var tel3=$("#tel3").val();
	var address1=$("#address1").val();
	var address2=$("#address2").val();
	var address3=$("#address3").val();
	if(userid==""){//빈값이면
		//문자열 비교 : java는 a.equals(b), javascript는 a==b
		alert("아이디를 입력하세요");
	    $("userid").focus(); //입력포커스 이동
	    return; //리턴값없이 함수 종료, 폼 데이터를 제출하지 않음
	}
	if(passwd=""){
		alert("비밀번호를 입력하세요");
		$("#passwd").focus();
		return;
	}
	if(name=""){
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	}
	if(sex=""){
		alert("성별을 입력하세요");
		$("#sex").focus();
		return;
	}
	//폼 데이터를 받을 주소
	document.form1.action="${path}/members/updateMembers.do";
	//폼 데이터를 서버에 전송
	document.form1.submit();
}

function daumZipCode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
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
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr
								+ ')' : '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('address2').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('address3').focus();
				}
			}).open();
}
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
<body>

<%@ include file="../include/menu.jsp" %>

<div id="all">
<form name="form1" method="post" 
enctype="multipart/form-data">
<table style="background-color:white; align:center; border:3; bordercolor:white; bordercolorlight:gray; cellspacing:1; cellpadding:3; width: 30%; height: 50%; margin: 50px;">
<tr bgcolor=#ececec align=center>
  <td colspan=3>회원정보 수정</td>
</tr>
         <tr >
                        <td bgcolor=#ececec align=center>아이디</td>
                        <td>
                        <input type="hidden" name="userid" value="${dto.userid}">
						${dto.userid}
					    </td>
					    <td> </td>
		</tr>
		<tr>					
							<td bgcolor=#ececec align=center>비밀번호</td>
							<td>
							 <input type="password" name="passwd" id="passwd" class="inpt"
							required="required" value="${dto.passwd}" placeholder="비밀번호">
							</td>
							<td> </td>
		</tr>
		<tr>					
							<td bgcolor=#ececec align=center>이름</td>
							<td><input type="hidden" name="name" value="${dto.name}">${dto.name}
		</tr>
		<tr>					
                        <td bgcolor=#ececec align=center>성별</td>
						<td><input type="hidden" name="sex" value="${dto.sex}">${dto.sex}</td>
                             <td> </td>
        </tr>                     
						<!-- <span> 
						<label> <input type="radio" name="sex"
								value="남성">남성
						</label>
						</span> <span> <label> <input type="radio" name="sex"
								value="여성">여성
						</label>
						
						</span><br> -->
						
		<tr>				
						<td bgcolor=#ececec align=center>프로필 사진</td>
                        <td><input type="file" name="file1" id="file1"></td>
                        <td><img src="${path}/images/${sessionScope.image}" width="200px"  height="200px">
                        <td> </td>
        </tr>               
		<tr>
		                 <td bgcolor=#ececec align=center>전화번호</td>				
						 <td><select name="tel1">
							<option value="010">010</option>
						</select> - <input type="text" name="tel2" id="tel2" size="2"
							required="required" value="${dto.tel2}" maxlength="4"> - <input type="text"
							name="tel3" id="tel3" size="2" required="required" value="${dto.tel3}" maxlength="4"></td>
							<td> </td>
        </tr>
        <tr>
                        <td bgcolor=#ececec align=center>주소</td>
						<td><input name="address1" id="address1" readonly size="10" value="${dto.address1}"> <input
							type="button" onclick="daumZipCode()" value="우편번호 찾기"><br><input
							name="address2" id="address2" value="${dto.address2}" size="20"></td>
							<td><input
							name="address3" id="address3" value="${dto.address3}" placeholder="상세주소"></td>
        </tr>
        <tr>
						
						<td><input type="hidden" name="user_num" value="${dto.user_num}"></td>
							<td><input type="button" value="수정"
                                    onclick="members_update()"></td>
                                    <td> </td>
						
		</tr>
						</table>
					</form>
</div>
</body>
</html>