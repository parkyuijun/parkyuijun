<%@page import="com.hk.dtos.LoginDto"%>
<%@page import="com.hk.dtos.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
   /*  selector표현식의 대표적인 표현식3가지: id,> class,> tagName
      class="a"  ---> .a   (같은이름을 중복해서 선언할 수 있다.)
      id="b"     ---> #b   (같은 이름 중복을 선언할 수 없다.)
   */
   #replyForm{display: none;}
   #container{
      height: 400px;
      width: 800px;
      border: 1px solid red;
      overflow: auto;
   }
   
   .hk{width: 680px; height:400px; vertical-align: top;}

</style>
<script type="text/javascript">
  
</script>
</head>
<body>
<%
    BoardDto dto1=(BoardDto)request.getAttribute("dto");
   LoginDto ldto = (LoginDto)session.getAttribute("ldto");
%>
<jsp:include page="header.jsp"  />
<div id="container">
<h1>게시글상세보기</h1>
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
      <td>${dto.title}</td>
   </tr>
   <tr>
   	  <th>이미지</th>
   	  <td><img src="upload/${dto.fileup}"></td>  	 
   <tr>
      <th>내용</th>
      
      <td class="hk">${dto.content}</td>
   </tr>
   <tr>
      <td colspan="2">
         <button onclick="replyForm()">답글</button>
         <%
            String Tid = ldto.getTid();
         String Trole = ldto.getTrole();
         if(Tid.equals(dto1.getId())||Trole.equals("ADMIN")){
            %>
            <button onclick="updateForm(${dto.seq})">수정</button>
            <button onclick="delBoard(${dto.seq})">삭제</button>
            <%
            }
            String myboard=(String)session.getAttribute("myboard");
            if(myboard==null){
               %>
            <button onclick="location.href='BoardController.do?command=boardlistpage'">글목록</button>
                <%    
            }else{
               %>
            <button onclick="location.href='BoardController.do?command=boardlistpage2'">글목록</button>   
                   <%    
            }
         %>
            <button onclick="location.href='BoardController.do?command=sellbuy'" style="float: right;">판매완료</button>
      </td>
   </tr>
</table>
<div id="replyForm">
<h1>답글달기</h1>
<form action="BoardController.do" method="post" >
<input type="hidden" name="command" value="replyboard"/>
<input type="hidden" name="seq" value="${dto.seq}"/>
<input type="hidden" name="id" value="${sessionScope.ldto.tid}"/>

<table border="1">
   <tr>
      <th>작성자</th>
      <td>${sessionScope.ldto.tid}</td>
   </tr>
   <tr>
      <th>제목</th>
      <td><input type="text" name="title" class="inputval"/></td>
   </tr>
   <tr>
      <th>내용</th>
      <td><textarea rows="10" cols="60" name="content" class="inputval"></textarea> </td>
   </tr>
   <tr>
      <td colspan="2">
         <input type="submit" value="답글등록"/>
         <%            
            if(myboard==null){
               %>
            <input type="button" value="목록" 
                      onclick="location.href='BoardController.do?command=boardlistpage'"/>
                <%    
            }else{
               %>
               <input type="button" value="목록" 
                         onclick="location.href='BoardController.do?command=boardlistpage2'"/>
                   <%    
            }
         %>
      </td>
   </tr>
</table>
</form>
</div>
</div>
<script type="text/javascript">
   function replyForm(){
//       $("#replyForm").css("display","block");
//       $("#replyForm").toggle();
      $("#replyForm").show();
      var replyPosition=$("#replyForm").offset().top;//div태그의 상단 위치를 구함
      $("#container").animate({
         "scrollTop":replyPosition
      },1000);
      //animate({css속성값정의},지연시간,easing)
   }
   function updateForm(seq){
      location.href="BoardController.do?command=updateForm&seq="+seq;
   }
   function delBoard(seq){
      <%
      
      
      if(Trole.equals("admin")){
         %>
         location.href="BoardController.do?command=muldel&chk="+seq;
         <%
      }else{
         %>
         location.href="BoardController.do?command=muldel2&chk="+seq;
      <%
      }
      %>
      
   }
</script>
</body>
</html>
