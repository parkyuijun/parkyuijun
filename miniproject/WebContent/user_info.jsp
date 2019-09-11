<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hk.dtos.LoginDto"%>
<%-- <%@include file="header.jsp" %> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monda&display=swap" rel="stylesheet">
<style type="text/css">
	h1{
			  margin-top: 10px;
			  text-align: center;
			  font-size: 35px;
			  color: white;
			  margin: opx;
			  font-family: 'Monda', sans-serif;
			}
			body{
	  min-height: 100vh;
	  background-image: linear-gradient(120deg,#3498db,#8e44ad);
	}
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
	.login-form{
	  width: 360px;
	  background: white;
	  height: 250px;
	  padding: 80px 40px;
	  border-radius: 10px;
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  transform: translate(-50%,-50%);
	}
	.sign2{
	font-family: 'Hi Melody', cursive;
	  font-size: 15px;
		color: black;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}	
	.sign2:hover{
		color:red;
</style>
<title>내 정보보기</title>
</head>
<body>

<%
	LoginDto dto = (LoginDto)request.getAttribute("dto");
%>
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
<hr style="border: solid 1px white;">

<h1 >MY PAGE</h1>
<div class="login-form">
			
			<div>ID</div>
	
			<div><%=dto.getTid()%></div>
		
			<div>NAME</div>
				
			<div><%=dto.getTname()%></div>
		
			<div>ADDRESS</div>
		
			<div><%=dto.getTaddress()%></div>
		
			<div>PHONE</div>
		
			<div><%=dto.getTphone()%></div>
		
			<div>EMAIL</div>
		
			<div><%=dto.getTemail()%></div>
		
</div>
<br>
			<button  class="sign2" onclick="withdraw('<%=dto.getTid()%>')">회원탈퇴</button>
			<button  class="sign2" onclick="userUpdate('<%=dto.getTid()%>')">정보수정</button>
			

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