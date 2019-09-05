<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
	if(ldto.getTrole().equals("ADMIN")){
		%>
		<a href="admin_main.jsp">메인메뉴</a>
		<%
	}else{
		%>
		<a href="user_main.jsp">메인메뉴</a>
		<%
	}
%>
<hr />
</body>
</html>