<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hk.dtos.LoginDto"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보보기</title>
</head>
<body>

<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>
<h1>내 정보보기</h1>
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
		<td><%=dto.getTaddress()%></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getTphone()%></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getTemail()%></td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<button onclick="withdraw('<%=dto.getTid()%>')">회원탈퇴</button>
			<button onclick="userUpdate('<%=dto.getTid()%>')">정보수정</button>
		</td>
	</tr>
</table>
<script type="text/javascript">
	function userUpdate(tid) {
		location.href = "LoginController.do?command=userUpdate&tid="+tid;
	}
	
	function withdraw(tid) {
		location.href = "LoginController.do?command=withdraw&tid="+tid;
	}
</script>
</body>
</html>