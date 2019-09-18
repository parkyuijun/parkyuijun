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
			  color: #138535;
			  margin: opx;
			  font-family: 'Monda', sans-serif;
			}
/* 			body{ */
/* 	  min-height: 100vh; */
/* 	  background-image: linear-gradient(120deg,#3498db,#8e44ad); */
/* 	} */
	.main{
		  margin-top: 10px;
		  text-align: left;
		  font-size: 15px;
		  color: black;
		  background: white;
		   margin: opx;
		   border-radius: 5px;
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
	  width: 300px;
	  background: white;
	  height: 250px;
	  padding: 60px 40px;
	  border-radius: 10px;
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  transform: translate(-50%,-50%);
	}
	.sign2{
	position: static;
	
	 text-align: center;
	  font-size: 15px;
		color: black;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}	
	.sign2:hover{
		color:red;
		}
	div{
	  text-align: center;
	  margin-bottom: 10px;
	}	
	
	 @media ( max-width: 500px ) {
	 		body{
	 width: auto;
	}
	h1{
			 width: auto;
	 }
	 .login-form{
	   width: 70%;
	  background: white;
	  height: 70%;
	  padding: 80px 40px;
	  border-radius: 10px;
	  position: absolute;
	  left: 50%;
	  top: 50%;
	  transform: translate(-50%,-50%);
	  	margin-bottom: 30px;
	}
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
	    width: 349px;
	    padding: 10px;
	    vertical-align: top;
	    border-right: 1px solid #ccc;
	    border-bottom: 1px solid #ccc;
	}
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

<h1 >MY PAGE</h1>
<table class="type03" style="margin-left: auto; margin-right: auto;">
	    <tr>
	        <th scope="row">ID</th>
	        <td><%=dto.getTid()%></td>
	    </tr>
	    <tr>
	        <th scope="row">NAME</th>
	        <td><%=dto.getTname()%></td>
	    </tr>
	    <tr>
	        <th scope="row">ADDRESS</th>
	        <td><%=dto.getTaddress()%></td>
	    </tr>
	    <tr>
	        <th scope="row">PHONE</th>
	        <td><%=dto.getTphone()%></td>
	    </tr>
	    <tr>
	        <th scope="row">EMAIL</th>
	        <td><%=dto.getTemail()%></td>
	    </tr>
	    
	</table>
	<br> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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