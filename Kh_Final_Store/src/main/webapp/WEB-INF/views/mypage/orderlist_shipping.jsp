<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- 배송중 -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
		
		<script>
		function fin() {
			location.href = "fin.do";
		}
		
		function detail(){
			location.href = "detail.do";
		}
		
		function ready() {
			location.href = "ready.do";
		}
		
		function refund() {
			location.href = "refund.do";
		}
		</script>
		
		<style>
			.row input:hover{color: #f00;}
			h1{height: 100px;}
			
			input{
			  border: 0;
			  background-color: transparent;
			}
			.row{padding: 10px;}
			#header{width:900px; height: 400px;}
			.row #a1{text-align: left;}
			.row #a2{text-align: right;}
			
		</style>
		
	</head>
	
	<body>
		<h1 align="center">메인 페이지</h1>
	
		<h2 align="center">주문 내역</h2>
	<div id="header" class="container text-center">
		<div class="row">
		    <div class="col">
		     <input type="button" value="입금/결제" onclick="detail();">
		    </div>
		    <div class="col">
		      <input type="button" value="배송 준비중" onclick="ready();">
		    </div>
		    <div class="col">
		      배송중
		    </div>
		     <div class="col">
		      <input type="button" value="배송 완료" onclick="fin();">
		      
		    </div>
		     <div class="col">
		      <input type="button" value="교환/반품" onclick="refund();">
		    </div>
		</div>
	
		 <div class="row">
		    <div class="col" id="a1">
		      주문일
		    </div>
		    <div class="col" id="a2">
		      <a href="#">주문상세</a>
		    </div>
		  </div>
		  
		  <div class="row">
		    <div class="col-2" id="a1">
		      사진
		    </div>
		    <div class="col-md-auto">
		      브랜드/제품명<br>용량/수량
		    </div>
		    <div class="col" id="a2">
		      가격
		    </div>
		  </div>
	
		<div class="row">
		    <div class="col" id="a2">
		      <a href="#">배송 확인</a>
		    </div>
		</div>
	</div>
	
	
	
	</body>
</html>