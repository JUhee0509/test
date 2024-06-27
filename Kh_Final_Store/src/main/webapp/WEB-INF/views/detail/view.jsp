<%@page import="common.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String includePage = Common.index.VIEW_PATH + "index.jsp"; %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<jsp:include page="<%= includePage %>"/>
		
		
		<div>
			<div class="view_item">
				<div> <img src="resources/img/main_title_img/${ vo.l_image }.png"></div>
				<div> ${vo.brand }</div>
				<div> ${vo.p_name }</div>
				<div> ${vo.scent }</div>
				<div> ${vo.price }</div>
			</div>
		</div>
	</body>
</html>