<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="/store/resources/js/httpRequest.js"></script>
		<script>
			function login(f) {
				let c_id = f.c_id.value;
				let pwd = f.pwd.value;
				
				if(c_id == '' || pwd == ''){
					alert("아이디/비밀번호를 입력해 주세요");
					return;
				}
				
				let url = "login.do";
				let param = "c_id=" + c_id + "&pwd=" + encodeURIComponent(pwd);
				sendRequest(url, param, LoginFunction, "post");
			}
			function LoginFunction() {
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					let json = (new Function('return '+ data))();
					
					if(json[0].result == "no_id"){
						alert("아이디가 존재하지 않습니다.");
						//location.href = "member_join_form.do";
						return;
					} else if(json[0].result == "no_pwd"){
						alert("비밀번호가 일치하지 않습니다");
					} else {
						alert(json[0].c_id + "님 환영합니다.");
						location.href = "login_success_mainGO.do";
					}
				}
			}
		</script>
		
	</head>
	<body>
	<form>
	<input type="button"  value="home" onclick="location.href='main.do'" align="center"><!-- home 이동 --><br>
		<table border="1" align="center" width="500" >
		<caption>로그인 페이지</caption>
			<tr>
				<td>*아이디</td>
				<td>
					<input name="c_id" placeholder="아이디 입력(6~20글자)" size="35">
					<input type="button" value="아이디 찾기" style="float: right;">
				</td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td>
					<input name="pwd" placeholder="비밀번호 입력(문자, 특수문자 포함 8~20자)" size="35">
					<input type="button" value="비밀번호 찾기" style="float: right;">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="기존 회원 로그인" style="width:50%;"
						   onclick="login(this.form)">
					<input type="button" value="회원가입" onclick="location.href='member_join_form.do'" 
						   style="float: right;">
				</td>
			</tr>
			
		</table>
	</form>
	</body>
</html>