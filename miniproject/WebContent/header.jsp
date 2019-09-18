<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<style type="text/css">
	.main{
		  margin-top: 10px;
		  text-align: left;
		  font-size: 15px;
		  color: black;
		   margin: opx;
/* 		  padding: 10px 0px 10px 0px; */
		}
	.sign{
	font-family: 'Hi Melody', cursive;
	  font-size: 20px;
		color: black;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}	
	.sign:hover{
		color:red;
	}
</style>
<title></title>
</head>
<body>
<%
	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
	if(ldto.getTrole().equals("ADMIN")){
		%>
		<div class="main">
			<a href="admin_main.jsp" style="text-decoration:none">MAIN</a>
			<a href="LoginController.do?command=logout" style="text-decoration:none">LOGOUT</a>
		</div>
		<%
	}else{
		%>
		<div class="main">
			<a href="user_main.jsp" class="sign" style="text-decoration:none">MAIN</a>
			<a href="LoginController.do?command=logout" class="sign" style="text-decoration:none">LOGOUT</a>
		</div>
		<%
	}
%>

</body>
</html>