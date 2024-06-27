<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
		<body>
		<!-- 공지사항 페이지 -->
		<input type="button"  value="home" onclick="location.href='main.do'"><!-- home 이동 --><br>
			<table border="1">
				
				<tr>
					<td>글번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.idx }</td>
						<td><a href="notice_view.do?idx=${vo.idx}">${ vo.title }</a></td>
						<td>관리자</td>
						<td>${ vo.regdate }</td>
					</tr>
					
				</c:forEach>
			</table>
		</body>
</html>