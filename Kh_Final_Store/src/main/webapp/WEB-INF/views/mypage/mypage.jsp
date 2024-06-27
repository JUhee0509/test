<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<!-- 첫 페이지 -->
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function fin() {
				location.href = "fin.do";
			}
			
			function detail(){
				location.href = "detail.do";
			}
			
			function ship() {
				location.href = "ship.do";
			}
			
			function ready() {
				location.href = "ready.do";
			}
			
			function refund() {
				location.href = "refund.do";
			}
			
			function add() {
				location.href = "addr_add.do";
			}

			function review_move() {
				location.href = "review_move.do";
			}
			
			function require_move() {
				location.href = "require_move.do";
			}
		</script>
		
		<style>
			.row input:hover{color: #f00;}
			h1{height: 100px;}
			
			input{
			  border: 0;
			  background-color: transparent;
			}
			
			#header{width:900px; height: 400px;}
			.row{padding: 10px;}
			.row #a2{text-align: left;}
			.row #a1{text-align: right; }
			/* .row #a2{position: relative; left: -150px;} */
			/* .row .col #a1{position: relative; right: -150px;} */
		</style>
		<!-- 부트스트랩 연결 링크 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
	</head>
	
	<body>
	<input type="button" value="home" onclick="location.href='main.do'"><!-- home 이동 --><br>
		<h1 align="center">메인 페이지</h1>
	
		<h2 align="center">마이 페이지</h2>
	
	
		<div class="container text-center" id="header">
		<!-- 수정 예정 -->
		<c:forEach var="vo" items="${list}">
		 <div class="row">
		 	<div class="col" id="a2">
		      이름
		    </div>
		    <div class="col">
		     <c:out value="${vo.name }"/>
		    </div>
		    <div class="col">
		      적립금
		    </div>
		    <div class="col">
		      <c:out value="${vo.bonus_point}"/>점
		    </div>
		  </div>
		
		<div class="row">
		    <div class="col" id="a2">
		      로그인 정보
		    </div>
		    <div class="col" id="a1">
		      <a href="#">수정</a>
		    </div>
		</div>
		
		  <div class="row">
		    <div class="col" id="a2">
		      주문 내역
		    </div>
		    <div class="col" id="a1">
		     <input type="button" value="상세보기" onclick="detail();">
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col">
		     <input type="button" value="입금/결제" onclick="detail();">
		    </div>
		    <div class="col">
		      <input type="button" value="배송 준비중" onclick="ready();">
		    </div>
		    <div class="col">
		      <input type="button" value="배송중" onclick="ship();">
		    </div>
		     <div class="col">
		      <input type="button" value="배송 완료" onclick="fin();">
		      
		    </div>
		     <div class="col">
		      <input type="button" value="교환/반품" onclick="refund();">
		    </div>
		    
		</div>
		
		<div class="row">
		    <div class="col" id="a2">
		      배송지 관리
		    </div>
		    <div class="col-md-auto">
		      (배송지)
		    </div>
		    <div class="col"id="a1">
		      <input type="button" value="추가" onclick="add();">
		    </div>
		</div>
		
		<div class="row">
		    <div class="col" id="a2">
		      내 리뷰
		    </div>
		    <div class="col" id="a1">
		      <input type="button" value="이동" onclick="review_move();">
		    </div>
		</div>
		
		<div class="row">
		    <div class="col" id="a2">
		      내 문의
		    </div>
		    <div class="col" id="a1">
		      <input type="button" value="이동" onclick="require_move();">
		    </div>
		</div>
		</c:forEach>
		
		</div>
		
	</body>
</html>