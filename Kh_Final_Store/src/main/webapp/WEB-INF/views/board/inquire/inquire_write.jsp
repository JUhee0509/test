<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(f){
				f.action="inq.do";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<!-- 문의 글작성 -->
		<jsp:include page="inq_login.jsp"/><!-- 로그인여부 확인 -->
		<form>
		<input type="button" value="shop" onclick="location.href='main.do'"><!-- shop페이지 이동 --><br>
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input name="title"></td>
			</tr>
			
			<tr>
				<td>종류</td>
				<td><select name="type">
						<option value="배송">배송</option>
						<option value="반품">반품</option>
						<option value="교환">교환</option>
						<option value="환불">환불</option>
						
					</select>
				</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><input name="content"></td>
			</tr>
			
			<tr>
				<td>첨부파일</td>
				<td>나중에 넣어라</td>
			</tr>
			
			
		</table>
		<input type="button" value="등록" onclick="send(this.form);">
		<input type="button" value="취소" onclick="history.go(-1);">
		</form>
	</body>
</html>