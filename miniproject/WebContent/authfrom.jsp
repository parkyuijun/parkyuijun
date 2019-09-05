<%@page import="com.hk.dtos.LoginDto"%>
<%@include file="header.jsp" %>
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
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>
<h1>등급변경</h1>
<form action="LoginController.do" method="post">
	<input type="hidden" name="command" value="authchange" />
	<input type="hidden" name="tid" value="<%=dto.getTid()%>" />
	<table border="1">
		
		<tr>
			<th>아이디</th>
			<td><%=dto.getTid()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getTname()%></td>
		</tr>
		<tr>
			<th>등급</th>
			<td>
				<select name="trole">
					<option value="ADMIN" <%=dto.getTrole().equals("ADMIN") ? "selected" : ""%>>관리자</option>
					<option value="MANAGER" <%=dto.getTrole().equals("MANAGER") ? "selected" : ""%>>정회원</option>
					<option value="USER" <%=dto.getTrole().equals("USER") ? "selected" : ""%>>일반회원</option>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등급변경" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>