<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=UTF-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">


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

</style>
<meta charset="UTF-8">
<title></title>
</head>

<body>
<div id="board_area">
<h1>회원정보 상태조회</h1>
<table class="list-table">
   
   <col width="100px" />
   <col width="50px" />
   <col width="150px" />
   <col width="150px" />
   <col width="200px" />
   <col width="100px" />
   <col width="100px" />
   
   <thead>
   <tr>
      <th>아이디</th>
      <th>이름</th>
      <th>주소</th>
      <th>전화번호</th>
      <th>이메일</th>
      <th>탈퇴여부</th>
      <th>회원등급</th>
   </tr>
   </thead>
   <tbody>
   <c:choose>
      <c:when test="${empty list}">
         <tr>
            <td colspan="1">----가입된 회원이 존재하지 않습니다.----</td>
         </tr>
      </c:when>
      <c:otherwise>
         <c:forEach items="${list}" var="dto">
            <tr>
               <td>${dto.tid}</td>
               <td>${dto.tname}</td>
               <td>${dto.taddress}</td>
               <td>${dto.tphone}</td>
               <td>${dto.temail}</td>
               <td>${dto.tenabled}</td>
               <td>${dto.trole}</td>
            </tr>
         </c:forEach>
      </c:otherwise>
   </c:choose>
   </tbody>
</table>
</div>
</body>
</html>