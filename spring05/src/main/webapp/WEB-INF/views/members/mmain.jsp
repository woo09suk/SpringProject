<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
/* $(function(){
	$(".rere").click(function(){
		if(confirm("팔로우추가를 하시겠습니까?")){
			return;
		}
	});
}); */
    function list(){
    	location.href="${path}/members/list.do";
    }
    function list_man(){
    	location.href="${path}/members/list_man.do";
    }
    function list_woman(){
    	location.href="${path}/members/list_woman.do";
    }
    </script>
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
<div id="all" class="container-fluid js-tm-page-content" data-page-no="3">
                            <div align="center">
                            <button class="button" onclick="list()">전체</button>
                            <button class="button" onclick="list_man()">남자</button>
                            <button class="button" onclick="list_woman()">여자</button> 
                            </div>
<form method="post" action="${path}/members/friendInsert.do">
                           <table id="rounded-corner" summary="2007 Major IT Companies' Profit" align="center">
                           <c:forEach var="row" items="${list}">       
                            <tr>
                             <td><img src="${path}/images/${row.image}" width="50px"  height="50px"></td>                              
                             <td><a href="${path}/members/detail/${row.userid}">${row.name}</a></td>
                             <td>
                             <%-- <input type="hidden" name="user_num" value="${row.user_num}"> --%>
                             <a class="rere" href="${path}/members/friendInsert/${row.user_num}"><button class="button" type="button" id="friendInsert">친구추가</button></a>
                             </td>
                            </tr>
                           </c:forEach>
                           </table>
                           </form>
                            
                        </div>
</body>
</html>