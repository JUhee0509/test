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
			<!-- 문의 첫페이지 -->
			<input type="button"  value="home" onclick="location.href='main.do'"><!-- home 이동 --><br>
			<table border="1">
				<tr>
					<td>글번호</td>
					<td>문의종류</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				
				<c:forEach var="vo" items="${ list }">
					<tr>
						<td>${ vo.i_idx }</td>
						<td>${ vo.type }</td>
						<td><a href="inquire_view.do?i_idx=${ vo.i_idx }">${ vo.title }</a></td>
						<td>${ vo.c_id }</td>
						<td>${ vo.regdate }</td>
					</tr>
				</c:forEach>
			</table>
			<input type="button" value="문의하기" onclick="location.href='inquire_write.do'">
		</body>
</html>