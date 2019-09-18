<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
	//사용한 이벤트 : onload,onsubmit
	//submit 이벤트를 취소하는 방법 : return false
	//DOM의 개념 : 탐색하는 메서드 - getElementsByTagName(), querySelectorAll() ...
	//input 태그의 입력값을 구하는 방법 : input.value
	window.onload = function(){
		var form = document.getElementsByTagName("form")[0];
		form.onsubmit = function(){
			var inputs = document.querySelectorAll("table input");
			if(inputs[3].value != inputs[4].value){
				alert("비밀번호를 확인하시오");
				inputs[3].value = "";
				inputs[4].value = "";
				inputs[3].focus();
				return false;
			}else{
				for (var i=0;i<inputs.length;i++) {
					if(inputs[i].value == ""){
						var tagEleTxt = inputs[i].parentNode.previousElementSibling.textContent;
						//							부모태그		앞에있는개체				내용
						alert(tagEleTxt+"을(를) 입력하시오");
						inputs[i].focus();
						return false;
					}
				}
			}
		}
	}
	
	function idChk(){
		
		var id = document.getElementsByName("tid")[0].value;
		//open("url","title","창의 속성설정")
		window.open("LoginController.do?command=idChk&tid="+id,"","width=300px,height=300px");
		
	}
</script>
<style type="text/css">
	h1{
			  margin-top: 10px;
			  text-align: center;
			  font-size: 35px;
			  color: #138535;
			  margin: opx;
			  font-family: 'Monda', sans-serif;
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
</head>
<body>
<h1>회원가입</h1>
<form action="LoginController.do" method="post">
	<input type="hidden" name="command" value="insertuser" />
	<table class="type03" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="tid" class="n" />
				<input type="button" value="중복체크" onclick="idChk()" />
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="tname" /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="tpassword" /></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="tpassword2" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="taddress" /></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="tphone" /></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="temail" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="가입완료" />
			</td>
		</tr>
	</table>
</form>

</body>
</html>