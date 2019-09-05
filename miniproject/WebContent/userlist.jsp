<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="java.util.List"%>
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
	List<LoginDto> list = (List<LoginDto>)request.getAttribute("list");
%>
<h1>회원리스트조회</h1>
<table border="1">
	<tr>
	
		<th>아이디</th>
		<th>이름</th>
		<th>등급</th>
	
	</tr>
	<%
		for(LoginDto dto:list){
			%>
			<tr>
				
				<td><%=dto.getTid()%></td>
				<td><%=dto.getTname()%></td>
				<td>
					<%=dto.getTrole()%>
					<button onclick="auth('<%=dto.getTid()%>')">변경</button>
				</td>
				
			</tr>
			<%
		}
	%>
</table>
<script type="text/javascript">
	function auth(tid) {
		//등급변경 폼으로 이동
		location.href = "LoginController.do?command=roleForm&tid="+tid;
	}
</script>
</body>
</html>