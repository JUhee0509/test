<%@page import="common.Common"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String includePage = Common.index.VIEW_PATH + "index.jsp"; %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="resources/js/gango.js"></script>
	</head>
	
	<body>
		<jsp:include page="<%= includePage %>"/><!-- 메인메뉴 받음 -->
		<!-- 광고 이동 페이지 -->
		<div class="wrap">
			<div class="img_header">
				<div class="img_inner"><!-- 메인페이지 사진광고 -->
					<div class="img s1"><img alt="img1" src="resources/img/main_title_img/home1.png"></div>
					<div class="img s2"><img alt="img2" src="resources/img/main_title_img/home2.png"></div>
					<div class="img s3"><img alt="img3" src="resources/img/main_title_img/home3.png"></div>
					<div class="img s4"><img alt="img4" src="resources/img/main_title_img/home4.png"></div>
				</div>
			</div>
				<div class="slider_dot"><!-- 메인메뉴 현재 사진 이동 버튼 -->
			</div>
		</div>
		
		<div class="md-container">
		    <c:forEach var="vo" items="${ list }">
		        <div class="md-item">
		            <div class="md"><a href="view.do?p_idx=${ vo.p_idx }"><img src="resources/img/main_title_img/${ vo.s_image }.png"></a></div>
		            <div>${ vo.p_name }</div>
		            <div>${ vo.brand }</div>
		            <div>${ vo.price }</div>
		        </div>
		    </c:forEach>
		</div>
	</body>
</html>