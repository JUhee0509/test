<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function modify(f){
				f.action="inq_modify_fin.do"
				f.submit();
			}
		</script>
	</head>
		
	<body>
	<!-- 문의 수정 -->
		문의 수정 : 답변전에만 수정 가능.(답변중, 답변완료는 안됨)
		<jsp:include page="inq_login.jsp"/><!-- 로그인여부 확인  -->
		<input type="button" value="shop" onclick="location.href='main.do'"><!-- shop페이지 이동 --><br>
		
		<form>
			<table border="1">
				<tr>
					<td>제목</td>
					<td><input value="${ vo.title }" name="title"></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><input value="${ vo.content }" name="content"></td>
				</tr>
				
				<tr>
					<td>종류</td>
					<td>
						<select name="type">
							<option value="배송">배송</option>
							<option value="return">반품</option>
							<option value="exchange">교환</option>
							<option value="refund">환불</option>
						</select>
					</td>
				</tr>
			</table>
			${ vo.i_idx }
			<input type="hidden" value="${ vo.i_idx }" name="i_idx">
			<input type="button" value="수정하기" onclick="modify(this.form);">
			<input type="button" value="취소하기" onclick="history.go(-1);">
		</form>	
	</body>
</html>