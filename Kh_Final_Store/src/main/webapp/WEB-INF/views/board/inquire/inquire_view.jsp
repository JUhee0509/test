<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
		<body>
			<!-- 문의 상세보기 -->
			<input type="button" value="home" onclick="location.href='main.do'"><!-- shop페이지 이동 --><br>
			<form>
				<table border="1">
				
					<tr>
						<td>글번호</td>
						<td>${ vo.i_idx }</td>
					</tr>
					
					<tr>
						<td>작성자</td>
						<td>${ vo.c_id }</td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td>${ vo.title }</td>
					</tr>
					
					<tr>
						<td>작성일</td>
						<td>${ vo.regdate }</td>
					</tr>
					
					<tr>
						<td>분류</td>
						<td>${ vo.type }</td>
					</tr>
					
					
					
					<tr>
						<td>내용</td>
						<td>${ vo.content }</td>
					</tr>
					
					<tr>
						<td>
							<input type="button" value="목록으로" onclick="history.go(-1);">
						</td>
						<td>
							<input type="button" value="수정하기" onclick="location.href='inq_modify.do?i_idx=${vo.i_idx}';">
						</td>
					</tr>
				</table>
				<input type="hidden" value="${ vo.i_idx }" name="i_idx">
				
				
			</form>
			
			<hr>
			
			<table>
				<tr>
					<td>제목</td>
					<td>${ a_vo.title }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${ a_vo.content }</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${ a_vo.regdate }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>관리자</td>
				</tr>
			</table>
		</body>
</html>
