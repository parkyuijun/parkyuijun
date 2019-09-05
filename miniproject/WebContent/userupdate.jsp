<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보수정하기</title>
</head>
<body>

<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>
<form action="LoginController.do">
	<input type="hidden" name="command" value="update"/>
	<input type="hidden" name="tid" value="<%=dto.getTid()%>"/>
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
			<th>주소</th>
			<td><input type="text" name="address" value="<%=dto.getTaddress()%>"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" value="<%=dto.getTphone()%>"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" value="<%=dto.getTemail()%>"/></td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="submit" value="정보수정"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>