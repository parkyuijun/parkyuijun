<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	
	window.onload = function(){
		
		var id = opener.document.getElementsByName("tid")[0].value; 
		//opener : 현재 페이지를 열어준 부모페이지
		document.getElementsByName("tid")[0].value = id;
	}
	
	function kk(bool){
		var parentPage = opener.document.getElementsByName("tid")[0];
		if(bool){
			opener.document.getElementsByName("tname")[0].focus();
			parentPage.setAttribute("class","y");
		}else{
			parentPage.value = "";
			parentPage.focus();
		}
		self.close(); //현재창을 닫는다
	}
</script>
</head>
<body>
<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
	boolean isS = false;
	if(dto == null || dto.getTid() == null){
		isS = true;
	}
%>
<table border="1">
	<tr>
		<td><input type="text" name="tid" /></td>
	</tr>
	<tr>
		<td><%=isS ? "사용가능합니다." : "중복된 아이디 입니다."%></td>
	</tr>
	<tr>
		<td><input type="button" value="확인" onclick="kk(<%=isS%>)" /></td>
	</tr>
</table>
</body>
</html>