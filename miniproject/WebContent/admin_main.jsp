<%
response.setHeader("Pragna", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%>
<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
<%
	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
%>
<h1>관리자 페이지</h1>
	<%
	if(ldto==null){
		response.sendRedirect("index.jsp");
	}else{
	%>
	<div>
		<%=ldto.getTid()%>님 반갑습니다.(등급 :<%=ldto.getTrole()%>)
		<a href="LoginController.do?command=logout">로그아웃</a>
	</div>
	<ul>
		<li><a href="LoginController.do?command=alluserstatus">회원상태정보조회</a></li>
		<li><a href="LoginController.do?command=alluserlist">회원정보목록조회</a></li>
	</ul>
	<%
	}
%>

</body>
</html>