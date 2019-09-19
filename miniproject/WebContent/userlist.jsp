<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Gugi&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Hi+Melody&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Monda&display=swap" rel="stylesheet">
<style type="text/css">
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

/* 전체 옵션 */

h1 {text-align: center;}

* {
   margin: 0 auto;
   padding: 0;
   font-family: 'Malgun gothic','Sans-Serif','Arial';
}

/* 게시판 목록 */
#board_area {
   width: 900px;
   position: relative;
}
.list-table {
   margin-top: 40px;
}
.list-table thead th{
   height:40px;
   border-top:2px solid #09C;
   border-bottom:1px solid #CCC;
   font-weight: bold;
   font-size: 17px;
}
.list-table tbody td{
   text-align:center;
   padding:10px 0;
   border-bottom:1px solid #CCC; height:20px;
   font-size: 14px 
}
/*버튼 css */
.button {font-weight:bold;text-decoration:none;font-family:Arial;box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 4px 0px;o-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 4px 0px;-moz-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 4px 0px;-webkit-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 4px 0px;background:#77b6d1;background:-o-linear-gradient(90deg, #77b6d1, #7acff4);background:-moz-linear-gradient( center top, #77b6d1 5%, #7acff4 100% );background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #77b6d1), color-stop(1, #7acff4) );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77b6d1', endColorstr='#7acff4');background:-webkit-linear-gradient(#77b6d1, #7acff4);background:-ms-linear-gradient(#77b6d1, #7acff4);background:linear-gradient(#77b6d1, #7acff4);text-indent:0px;line-height:0px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px;text-align:center;vertical-align:middle;display:inline-block;font-size:12px;color:#395863;width:55px;height:0px;padding:13px;border-color:#59a9c6;border-width:1px;border-style:solid;}.ClassName:active {box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 0 0px;o-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 0 0px;-moz-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 0 0px;-webkit-box-shadow:inset #ffffff 0px 1px 1px -1px,#4895b1 0px 0 0px;position:relative;top:4px}.ClassName:hover {background:#7acff4;background:-o-linear-gradient(90deg, #7acff4, #77b6d1);background:-moz-linear-gradient( center top, #7acff4 5%, #77b6d1 100% );background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #7acff4), color-stop(1, #77b6d1) );filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#7acff4', endColorstr='#77b6d1');background:-webkit-linear-gradient(#7acff4, #77b6d1);background:-ms-linear-gradient(#7acff4, #77b6d1);background:linear-gradient(#7acff4, #77b6d1);}

</style>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
   List<LoginDto> list = (List<LoginDto>)request.getAttribute("list");
%>
<div class="main">
			<a href="admin_main.jsp" class="sign" style="text-decoration:none">MAIN</a>
			<a href="LoginController.do?command=logout" class="sign" style="text-decoration:none">LOGOUT</a>
		</div>
<div id="board_area">
<h1>회원리스트조회</h1>
<table class="list-table">

   <col width="100px" />
   <col width="100px" />
   <col width="150px" />
   
   <thead>   
   <tr>
   
      <th>아이디</th>
      <th>이름</th>
      <th>등급</th>
   
   </tr>
   <tbody>
   </thead>   
   <%
      for(LoginDto dto:list){
         %>
         <tr>         
            <td><%=dto.getTid()%></td>
            <td><%=dto.getTname()%></td>
            <td>
               <%=dto.getTrole()%>
               <button onclick="auth('<%=dto.getTid()%>')" class="button">변경</button>
            </td>
            
         </tr>
         <%
      }
   %>
   </tbody>
</table>
<script type="text/javascript">
   function auth(tid) {
      //등급변경 폼으로 이동
      location.href = "LoginController.do?command=roleForm&tid="+tid;
   }
</script>
</div>
</body>
</html>