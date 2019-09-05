<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인화면</title>
<script type="text/javascript">
	function regist(){
		location.href="LoginController.do?command=regist";
	}
</script>
</head>
<body>
	<h1>로그인</h1>
	<form action="LoginController.do" method="post">
		<input type="hidden" name="command" value="login" />
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="tid" /></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="tpassword" /></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" />
					<input type="button" value="회원가입" onclick="regist()" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>