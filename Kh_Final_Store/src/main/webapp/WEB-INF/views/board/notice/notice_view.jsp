<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>뭐라하냐</title>
	</head>
	
	<body>
		<!-- 공지 상세보기 -->
		<table border="1">
			<tr>
				<td>글번호</td>
				<td>${ vo.idx }</td>
			</tr>
			
			<tr>
				<td>제목</td>
				<td>${ vo.title }</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>${ vo.content }</td>
			</tr>
			
			<tr>
				<td>게시일</td>
				<td>${ vo.regdate }</td>
			</tr>
		</table>
		<input type="button value="목록보기" onclick="history.go(-1);">
	</body>
</html>