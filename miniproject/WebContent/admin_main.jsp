<%
response.setHeader("Pragna", "no-cache");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setDateHeader("Expires", 0L);
%>
<%@page import="com.hk.dtos.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.member{
	text-align:center;
		font-family: 'Sunflower', sans-serif;
	  font-size: 40px;
	  color: #138535;
	}
		.sign{
	font-family: 'Sunflower', sans-serif;
	  font-size: 20px;
		color: #808080;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}	
	.l {
	 margin-top: 10px;
	 margin-bottom: 10px;
		  text-align: left;
		  font-size: 15px;
		  color: yellow;
    list-style: none;
    border-radius: 5px;
	}
	.l:hover{
		color:red;
		}
		
	#menu1{
		background:#138535;
	}	
	#menu1 ul{
		width:650px;
		margin:0 auto;
		overflow:hidden;
	}	
	#menu1 ul li{
		float:left;
		width:25%;
		height:100%;
		text-align:center;
		background:#138535;
	
		
	}	
	#menu1 ul li a{
		display:block;
	}
	#menu1 ul li a:hover{

		background: #98E0AD;
		color:yellow;
	}
	 a {
 font-family: 'Sunflower', sans-serif;
  text-decoration: none; color: white;
   }
</style>
<title>관리자페이지</title>
</head>
<body>
<%
	LoginDto ldto = (LoginDto)session.getAttribute("ldto");
%>
<h1 class="member">중&nbsp;&nbsp;고&nbsp;&nbsp;나&nbsp;&nbsp;라</h1>
	<%
	if(ldto==null){
		response.sendRedirect("index.jsp");
	}else{
	%>
	<div class="sign" >
		<%=ldto.getTid()%>님 반갑습니다.(등급 :<%=ldto.getTrole()%>)
	</div>
	<div id="menu1">
	<ul>
		<li class="l" ><a href="LoginController.do?command=alluserstatus" style="text-decoration:none">회원상태 정보조회</a></li>
		<li class="l" ><a href="LoginController.do?command=alluserlist" style="text-decoration:none">회원정보 목록조회</a></li>
		<li class="l" ><a href="BoardController.do?command=boardlistpage&pnum=1" style="text-decoration:none">전체 글 보기</a></li>
		<li class="l"><a href="LoginController.do?command=logout" style="text-decoration:none">로그아웃</a></li>
	</ul>
	</div>
	<%
	}
%>

</body>
</html>