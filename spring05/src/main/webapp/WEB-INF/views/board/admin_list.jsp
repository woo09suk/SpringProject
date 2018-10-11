<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
function list(page){
	location.href="${path}/board/list.do?curPage="+page;
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
	background-image: url('../images/12.jpg');
	background-size: cover;
	opacity: 0.3!important; filter:alpha(opacity=30);	
	background-position:center;
	background-origin:content-box;
}

table.type08 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
    margin: 20px 10px;
}

table.type08 thead th {
    padding: 10px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: white;
}
table.type08 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-right: 1px solid white;
    border-bottom: 1px solid white;
    background: white;
}
table.type08 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid white;
    border-bottom: 1px solid white;
}
.intro{
  width:100%;
  height:30px;
}
.intro h1{
  font-family:'Oswald', sans-serif;
  letter-spacing:2px;
  font-weight:normal;
  font-size:14px;
  color:#222;
  text-align:center;
  margin-top:10px;
}

.intro a{
  color:#e74c3c;
  font-weight:bold;
  letter-spacing:0;
}
.intro img{
  width:20px;
  heght:20px;
  margin-left:5px;
  margin-right:5px;
  position:relative;
  top:5px;
}

*{margin:0;padding:0;box-sizing:border-box;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;}
#container{
  width:715px;
  height:230px;
  margin:50px auto;
}

HTML  CSS  JS Result
EDIT ON
 .page {
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
}
.color-bg-start {
  background-color: salmon;
}

.bg-animate-color {
  animation: random-bg .5s linear infinite;
}

@keyframes random-bg {
  from {
    filter: hue-rotate(0);
  }
  to {
    filter: hue-rotate(360deg);
  }
}

.fun-btn {
  /* change bg color to get different hues    */
  background-color: gray;
  color: white;
  padding: 2em 3em;
  border: none;
  transition: all .3s ease;
  border-radius: 5px;
  letter-spacing: 2px;
  text-transform: uppercase;
  outline: none;
  align-self: center;
  cursor: pointer;
  font-weight: bold;
}

.fun-btn:hover {
  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
}

.start-fun {
  background-color: #fff !important;
  /* change color of button text when fun is started   */
  color: white !important;
}

/* pulsating effect on button */
@keyframes grow {
  0% {
    transform: scale(1);
  }
  14% {
    transform: scale(1.2);
  }
  28% {
    transform: scale(1);
  }
  42% {
    transform: scale(1.2);
  }
  70% {
    transform: scale(1);
</style>
</head>
<body>
<div id="all">
<%@ include file="../include/menu.jsp" %>
<div id="container">
<h1>페이지</h1>
<!-- 검색폼 -->
<form name="form1" method="post"
	action="${path}/board/list.do">
	<select name="search_option">
		<option value="name"
<c:if test="${map.search_option == 'name'}">selected</c:if>
		>개설자</option>
		<option value="title" 
<c:if test="${map.search_option == 'title'}">selected</c:if>
		>페이지 이름</option>
		<option value="content" 
<c:if test="${map.search_option == 'content'}">selected</c:if>
		>페이지 소개</option>
		<option value="all" 
<c:if test="${map.search_option == 'all'}">selected</c:if>
		>작성자+이름+소개</option>
	</select>
	<input name="keyword" value="${map.keyword}">
	<input type="submit" value="조회">
</form>
<div class="page">
<button type="button" id="btnWrite" class="fun-btn">페이지 생성</button>
</div>
${map.count}개의 페이지가 있습니다.
<table border="1" width="600px" class="type08">
<thead>
	<tr>
		<th>제목</th>
		<th>개설자</th>
		<th>개설날짜</th>
		<th>Today</th>
		<th>관리</th>
	</tr>
</thead>
	<!-- forEach var="개별데이터" items="집합데이터" -->
<c:forEach var="row" items="${map.list}">
<tbody>
	<tr>
		<td>
			<a href="${path}/board/view.do?bno=${row.bno}">
			${row.title}
			</a>
			<c:if test="${row.cnt > 0}">
				<span style="color:red;">( ${row.cnt} )</span>
			</c:if>
			</td>
		<td>${row.name}</td>
		<td><fmt:formatDate value="${row.regdate}"
			pattern="yyyy-MM-dd HH:mm:ss"/> </td>
		<td>${row.viewcnt}</td>
		<td><a href="${path}/board/boardDelete/${row.bno}"><button>삭제</button></a></td>
	</tr>
</tbody>
</c:forEach>
<!-- 페이지 네비게이션 출력 -->
	<tr>
		<td colspan="5" align="center">
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="#" onclick="list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" 
				begin="${map.pager.blockBegin}"
				end="${map.pager.blockEnd}">
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
					<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
						<span style="color:red;">${num}</span>
					</c:when>
					<c:otherwise>
						<a href="#" onclick="list('${num}')">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${map.pager.curBlock < map.pager.totBlock}">
				<a href="#" 
				onclick="list('${map.pager.nextPage}')">[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage < map.pager.totPage}">
				<a href="#" 
				onclick="list('${map.pager.totPage}')">[끝]</a>
			</c:if>
		</td>
	</tr>
</table>
</div>
</div>
</body>
</html>