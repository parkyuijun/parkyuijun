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
<style type="text/css">
	h1{
			  margin-top: 10px;
			  text-align: center;
			  font-size: 35px;
			  color: #138535;
			  margin: opx;
			  font-family: 'Monda', sans-serif;
			}
	table.type03 {
	    border-collapse: collapse;
	    
	    text-align: left;
	    line-height: 1.5;
	    border-top: 1px solid #ccc;
	    border-left: 3px solid #138535;
	  margin : 20px 10px;
	  
	}
	table.type03 th {
	    width: 147px;
	    padding: 10px;
	    font-weight: bold;
	    vertical-align: top;
	    color: #138535;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	
	}
	table.type03 td {
	    width: 700px;
	    padding: 10px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
</style>
</head>
<body>

<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>
<form action="LoginController.do">
	<input type="hidden" name="command" value="update"/>
	<input type="hidden" name="tid" value="<%=dto.getTid()%>"/>
	<h1 >정보 수정</h1>
	<table class="type03" style="margin-left: auto; margin-right: auto;">
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
			<td><input type="text" name="taddress" value="<%=dto.getTaddress()%>"/></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="tphone" value="<%=dto.getTphone()%>"/></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="temail" value="<%=dto.getTemail()%>"/></td>
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