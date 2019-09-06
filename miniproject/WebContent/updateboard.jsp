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
$(function(){
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
<h1>게시글수정하기</h1>
<form action="BoardController.do" method="post">
<input type="hidden" name="command" value="updateboard"/>
<input type="hidden" name="seq" value="${dto.seq}"/>
<table border="1">
	<tr>
		<th>번호</th>
		<td>${requestScope.dto.seq}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" value="${dto.title}"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea rows="10" cols="60" name="content">${dto.content}</textarea> </td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정완료"/>
			<button type="button" onclick="location.href='BoardController.do?command=boardlist'">글목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>