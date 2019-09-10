<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link href="css/ko_KR/smart_editor2.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="SE2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="js/lib/jindo2.all.js" charset="utf-8"></script>
<script type="text/javascript" src="js/lib/jindo_component.js" charset="utf-8"></script>
<script type="text/javascript" src="js/service/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
<script type="text/javascript" src="js/service/SE2BasicCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/smarteditor2.js" charset="utf-8"></script>
<style type="text/css">
td{width: 680px;}
</style>
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
<%-- 		<td><textarea rows="10" cols="60" name="content">${dto.content}</textarea> </td> --%>
		<td><textarea name="content" id="content" rows="10" cols="100" title="HTML 편집 모드" class="se2_input_syntax se2_input_htmlsrc" style="display:none;outline-style:none;resize:none">
		${dto.content}</textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="button" id="savebutton" value="수정완료"/>
			<%
				String myboard=(String)session.getAttribute("myboard");
				if(myboard==null){
					%>
					<button type="button" onclick="location.href='BoardController.do?command=boardlistpage'">글목록</button>
					<% 
				}else{
					%>
					<button type="button" onclick="location.href='BoardController.do?command=boardlistpage2'">글목록</button>
					<% 
				}
					%>
			
		</td>
	</tr>
</table>
</form>
<script type="text/javascript">

var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "SE2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2",
		 htParams: { fOnBeforeUnload : function(){}}

	
// 	 htParams: {
// 		 bUseToolbar:true,
// 		 bUseVerticalResizer:true,
// 		 bUseModeChanger:true
// 	 }
	});	
	$("#savebutton").click(function(){
	    //id가 smarteditor인 textarea에 에디터에서 대입
	    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	     
	    // 이부분에 에디터 validation 검증
	     
	    //폼 submit
	    $("form").submit(); 
	})

</script>
</body>
</html>