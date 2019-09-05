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
<meta charset="UTF-8">
<title></title>
</head>

<body>
<h1>회원정보 상태조회</h1>
<table border="1">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>탈퇴여부</th>
		<th>회원등급</th>
	</tr>
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
</table>
</body>
</html>