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
		
		<h5>여기에 분류기준</h5><hr>
		<!-- 분류 -->
			<%-- <table border="1">
				<tr>
					<td>브랜드</td>
					<td>
						<c:forEach var="vo" items="${ list }">
							<input type="checkbox" name="brand" value="${ vo.brand }">
							<label>${ vo.brand }</label>
						</c:forEach>	
					</td>
				</tr>	
				
				<tr>
					<td>향</td>
					<td>
						<c:forEach var="vo" items="${ list }">
							<input type="checkbox" name="scent" value="${ vo.scent }">
							<label>${ vo.scent }</label>
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td>가격</td>
					<td>
					<c:forEach var="vo" items="${ list }">
							<input type="checkbox" name="brand" value="${ vo.price }">
							<label>${ vo.price }</label>
						</c:forEach>
					</td>
				</tr>
				
				<tr>
					<td>용량</td>
					<td>
						<c:forEach var="vo" items="${ list }">
							<input type="checkbox" name="brand" value="${ vo.volume }">
							<label>${ vo.volume }</label>
						</c:forEach>
					</td>
				</tr>
						
				<tr>
					<td>성별</td>
					<td>
					</td>
				</tr>
			</table> --%>
		</body>
</html>