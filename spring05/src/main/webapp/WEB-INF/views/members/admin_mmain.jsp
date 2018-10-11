<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>

</head>
<style type="text/css">
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

#rounded-corner
{
	font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
	font-size: 12px;
	width: 480px;
	text-align: left;
	border-collapse: collapse;
}
#rounded-corner thead th.rounded-company
{
	background: #b9c9fe url('left.png') left -1px no-repeat;
}
#rounded-corner thead th.rounded-q4
{
	background: #b9c9fe url('right.png') right -1px no-repeat;
}
#rounded-corner th
{
	font-weight: normal;
	font-size: 13px;
	color: #039;
	background: #b9c9fe;
}
#rounded-corner td
{
	padding: 8px;
	background: #e8edff;
	border-top: 1px solid #fff;
	color: #669;
}
#rounded-corner tfoot td.rounded-foot-left
{
	background: #e8edff url('botleft.png') left bottom no-repeat;
}
#rounded-corner tfoot td.rounded-foot-right
{
	background: #e8edff url('botright.png') right bottom no-repeat;
}
#rounded-corner tbody tr:hover td
{
	background: #d0dafd;
}
</style>
<body>
<%@ include file="../include/menu.jsp" %>
<div class="container-fluid js-tm-page-content" data-page-no="3">

<div align="center">
			<form method="post" action="${path}/members/listAll.do">
				<input name="keyword">
				<input type="submit" value="조회">
			</form>
</div>
                            
<form method="post" name="form1">

                           <table id="rounded-corner" summary="2007 Major IT Companies' Profit" align="center">
                           <c:forEach var="row" items="${list}">       
                            <tr>
                             <td><img src="${path}/images/${row.image}" width="50px"  height="50px"></td>                              
                             <td><a href="${path}/members/detail/${row.userid}">${row.name}</a></td>
                             <td>
                             <input type="hidden" name="user_num" value="${row.user_num}">
                             <a href="${path}/members/delete/${row.user_num}"><button type="button">회원삭제</button></a>
                             </td>
                            </tr>
                           </c:forEach>
                           </table>
                           </form>
                            
                        </div>
</body>
</html>