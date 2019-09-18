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
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
<style type="text/css">
	.sign{
	font-family: 'Sunflower', sans-serif;
	  font-size: 20px;
		color: #808080;
		background: white;
		padding: 5px 10px;
	  border-radius: 5px;
	}	
 a {
 font-family: 'Sunflower', sans-serif;
  text-decoration: none; color: white;
   }

.member{
	text-align:center;
		font-family: 'Sunflower', sans-serif;
	  font-size: 40px;
	  color: #138535;
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
		width:500px;
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
</style>
<title>사용자페이지</title>
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
	<div  class="sign" >
		&nbsp; ID:<%=ldto.getTid()%>&nbsp; &nbsp;(등급 : <%=ldto.getTrole().equals("USER") ? "일반회원" : "정회원"%>)
	</div><br>
	<div id="menu1">
	<ul>
		<li class="l" ><a href="LoginController.do?command=userinfo&tid=<%=ldto.getTid()%>" style="text-decoration:none">MY PAGE</a></li>
		<li class="l"><a href="BoardController.do?command=boardlistpage2&pnum=1"  style="text-decoration:none">내가 쓴 글 보기</a></li>
		<li class="l"><a href="BoardController.do?command=boardlistpage&pnum=1"  style="text-decoration:none">전체 글 보기</a></li>
		<li class="l"><a href="LoginController.do?command=logout" style="text-decoration:none">로그아웃</a></li>
	</ul>
	</div>
<!-- 	<legend>의류</legend> -->
<!-- 	<select name="selsite" onchange="selPage06()"> -->
<!-- 		<option value=#>---</option> -->
<!-- 		<option value="http://www.naver.com">상의</option> -->
<!-- 		<option value="http://www.daum.net">하의</option> -->
<!-- 		<option value="http://www.hankyung.com">신발</option> -->
<!-- 	</select> -->
	<%
	}
%>

</body>
</html>