<%@page import="common.Common"%>
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
	<!-- SHOP 페이지 -->
		<%-- <jsp:include page="<%= includePage %>"/> --%>
	<!-- 분류 -->
		<jsp:include page="classification.jsp"/>
		
		<hr>
			
			<c:forEach var="vo" items="${ list }">
				<%-- <div class="visit_box">
					
				<c:if test="${ vo.filename } ne 'no_filename">
					<img src="/vs/resources/upload/${ vo.filename }" width="200"><!-- 절대경로로 접근 -->
				</c:if>
					<div class="type_content"><pre>${ vo.content }</div><!-- <pre> : 엔터값 적용시킴 -->
					<div class="type_name">작성자 : ${ vo.name }(${ vo.ip })</div>
					<div class="type_regdate">작성일 : ${ vo.regdate }</div>
				
				</div> --%>
				<div class="prod">
					제품명 : ${ vo.p_name }<br>
					브랜드 : ${ vo.brand }<br>
					가격 : ${ vo.price }<br>
					용량 : ${ vo.volume }<br>
					향 : ${ vo.scent }<br>
					<hr>
				</div>
			</c:forEach>
			
			
			
		</div>
	</body>
</html>