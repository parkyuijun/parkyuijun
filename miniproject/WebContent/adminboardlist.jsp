<%@page import="java.util.Map"%>
<%@page import="com.hk.dtos.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@charset "utf-8";

/* 전체 옵션 */
a:hover{

   color:blue;
}

* {
   margin: 0 auto;
   padding: 0;
   font-family: 'Malgun gothic','Sans-Serif','Arial';
}
a {
   text-decoration: none;
   color:#333;
}
ul li {
   list-style:none;
}

/* 공통 */
.fl {
   float:left;
}
.tc {
   text-align:center;
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
#write_btn {
   position: absolute;
   margin-top:-35px;
   left: 15px;
}
img{width: 12px; height: 12px;}  

#muldel{
   position: absolute;
   top:353px;
   left:70px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title></title>
<script type="text/javascript">


   //function allSel(ele){
   //alert("gg");
   //var chks=document.getElementsByName("chk");
   //for(var i=0;i<chks.length;i++){
   // chks[i].checked=ele;
   //}
   //}
   function allSel(ele) {
      //document.getElementsByTagName("input")[0].attr();
      //js객체를 jq로 변환할때는  $(jsObj) 로 작성해주면 해결 
      //$(ele).attr("title","체크박스");
      $("input[name=chk]").prop("checked", $(ele).prop("checked"));
   }

   //js: 페이지로딩 이벤트 구현---> window.onload=function(){ 기능정의  }
   //jq:    ""           ---> $(document).ready(function(){기능정의})
   //                         $(function(){기능정의})
   $(function() {
      //document.getElementsByTagName("form")
      //이벤트메서드: change(), click(), mouseover()..... 
      //필터링메서드: eq(), find(), children(),
      //트리탐색메서드: next(), prev().....
      $("form").submit(function() {
         var bool = true;
         var count = $(this).find("input[name=chk]:checked").length;//체크된 input태그의 개수
         if (count == 0) {
            alert("최소하나이상 체크해야된다~~");
            bool = false;
         }
         return bool;
      });
   });
</script>
<style type="text/css">
   img{width: 12px; height: 12px;}
   
</style>
</head>
<%Map<String,Integer>map=(Map<String,Integer>)request.getAttribute("pmap");%>
<body>

<jsp:include page="header.jsp"  />
<%-- <%@include file="header.jsp" %> --%>
<%-- <% int a=5; %> --%>
<jsp:useBean id="util" class="com.hk.utils.Util"  />
<div id="board_area">
<h1>자유게시판</h1>


<form action="BoardController.do" method="post">
<input type="hidden" name="command" value="muldel" />
<table class="list-table">
   
   <col width="50px" />
   <col width="70px" />
   <col width="100px" />
   <col width="500px" />
   <col width="150px" />
   <col width="100px" />
   
   <thead>
   <tr>
      <th><input type="checkbox" name="all" onclick="allSel(this)"/></th>
      <th>번호</th>
      <th>작성자</th>
      <th>제 목</th>
      <th>작성일</th>
      <th>조회수</th>
   </tr>
   </thead>
   <tbody>
   <c:choose>
      <c:when test="${empty list}">
         <tr>
            <td colspan="10">----작성된 글이 없습니다.----</td>
         </tr>
      </c:when>
      <c:otherwise>
         <c:forEach items="${list}" var="dto">
            <tr>
               <td><input type="checkbox" name="chk" value="${dto.seq}"/></td>
               <td>${dto.seq}</td>
               <td>${dto.id}</td>
               <c:choose>
                  <c:when test="${dto.delflag == 'Y'}">
                     <td>-----삭제된 글입니다.-----</td>
                  </c:when>
                  <c:otherwise>
                     <td>
<!--                         AnsDto dto=new AnsDto(); -->
<!--                         dto.setSeq(5) -->
<!--                         dto.getSeq() -->
<%--                         <jsp:useBean id="dto" class="com.hk.ansdtos.AnsDto" /> --%>
<%--                         <jsp:setProperty property="seq" name="dto" value="${dto.depth}"/> --%>
<%--                         <jsp:getProperty property="seq" name="dto"/> --%>
<%--                         <c:forEach begin="1" end="${dto.depth}" step="1"> --%>
<!--                            &nbsp;&nbsp;&nbsp;&nbsp; -->
<%--                         </c:forEach> --%>
<%--                         <c:if test="${dto.depth > 0}"> --%>
<!--                            <img alt="답글" src="img/arrow.png"> -->
<%--                         </c:if> --%>
                        <jsp:setProperty property="arrowNbsp" name="util" value="${dto.depth}"/>
                        <jsp:getProperty property="arrowNbsp" name="util"/>
                        <a href="BoardController.do?command=boarddetail&seq=${dto.seq}">${dto.title}</a>
                     </td>
                  </c:otherwise>
               </c:choose>
               <td><fmt:formatDate value="${dto.regdate}" pattern="yyyy년MM월dd일"/> </td>
               <td>${dto.readcount}</td>
            </tr>
         </c:forEach>
      </c:otherwise>
   </c:choose>
   
   <tr>
               <td colspan="6" style="text-align: center;">
                  <% String myBoard=(String)session.getAttribute("myboard");
                     if(myBoard==null){
                        %>
                              <a href="BoardController.do?command=boardlistpage&pnum=<%=map.get("prePageNum")%>">◀</a>
                              <%  //requestScope["pcount",Object[Integer 1]]
//                                  int pcount=(Integer)request.getAttribute("pcount");
                                 for(int i=map.get("startPage");i<=map.get("endPage");i++){
                                    %>
                                    <a href="BoardController.do?command=boardlistpage&pnum=<%=i%>" style="text-decoration: none"><%=i%></a>
                                    <% 
                                 }
                              %>
                              <a href="BoardController.do?command=boardlistpage&pnum=<%=map.get("nextPageNum")%>">▶</a>   
                        <%
                     }else{
                        %>
                              <a href="BoardController.do?command=boardlistpage2&pnum=<%=map.get("prePageNum")%>">◀</a>
                              <%  //requestScope["pcount",Object[Integer 1]]
//                                  int pcount=(Integer)request.getAttribute("pcount");
                                 for(int i=map.get("startPage");i<=map.get("endPage");i++){
                                    %>
                                    <a href="BoardController.do?command=boardlistpage2&pnum=<%=i%>" style="text-decoration: none"><%=i%></a>
                                    <% 
                                 }
                              %>
                              <a href="BoardController.do?command=boardlistpage2&pnum=<%=map.get("nextPageNum")%>">▶</a>
                              
                        <%
                     }
                  %>   
               </td>
               
            </tr>
            </tbody>
   

</table>
<input type="submit" value="글삭제" id="muldel"/> 
</form>
<div id="write_btn">

         <input type="button" value="글추가" 
                onclick="location.href='BoardController.do?command=insertForm'"/>
         
</div>
<jsp:include page="footer.jsp" />

</div>   


</body>
</html>

