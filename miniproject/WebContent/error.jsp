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
	//request 스코프에 담는 순간 Object타입으로 형변환 되어 저장
	// --> Object로 반환되기 때문에 String = (String)Object
	String msg = (String)request.getAttribute("msg");
%>
<h1>시스템 오류</h1>
<h2>관리자에게 문의하세요 (오류내용:<%=msg%>)</h2>
<%
	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
	if(ldto==null || ldto.getTid()==null){
		%>
		<a href="index2.jsp">메인페이지</a>
		<%
	}else{
		if(ldto.getTrole().equals("ADMIN")){
			response.sendRedirect("admin_main.jsp");
		}else{
			response.sendRedirect("user_main.jsp");
		}
		
	}
%>
</body>
</html>