<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="com.hk.dtos.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 	//탐색메서드: eq(),find(),prev(), next(), children(),parent()
	$(function(){
// 		$("form").submit(function() {
// 			var bool=true;
// 			//[input,input,textarea]
// 			$(this).find(".inputval").each(function(i){
// 				if($(this).val()==""){
// 					    //input -> td    -> th  -> text
// 					alert($(this).parent().prev().text()+"를 입력하세요");
// 					$(this).focus();
// 					bool=false;
// 					return false;
// 				}
// 			});
// 			return bool;
// 		});
		$("form").submit(function(){
			var bool=true;
			//[input,input,textarea]
			var inputs=$(this).find("td").children().filter("[name]");
			inputs.each(function(){
				if($(this).val()==""){
					alert($(this).parent().prev().text()+"를 입력하세요");
					$(this).focus();
					bool=false;
					return false;
				}
			});
			return bool;
		});

	})
</script>

</head>
<body>
<h1>게시글 추가하기</h1>
<form action="BoardController.do" method="post" >
<input type="hidden" name="command" value="insertboard"/>
<input type="hidden" name="id" value="${sessionScope.ldto.tid}"/>
<table border="1">
	
	<tr>
		<th>아이디</th>
		<td>${sessionScope.ldto.tid}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" class="inputval"/></td>
	</tr>
	<!-- 상품이미지 추가해야함 !! -->
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="content" class="inputval"></textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="글등록"/>
			<%
				String myboard=(String)session.getAttribute("myboard");
				if(myboard==null){
					%>
					<input type="button" value="목록" onclick="location.herf='BoardController.do?command=boardlistpage'"/>
					<% 
				}else{
					%>
					<input type="button" value="목록" onclick="location.herf='BoardController.do?command=boardlistpage2'"/>
					<% 
				}
					%>
			
		</td>
	</tr>
</table>

</form>
</body>
</html>











