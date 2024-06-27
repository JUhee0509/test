<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/store/resources/js/httpRequest.js"></script>

		<%-- <c:if test="${ empty user }">
			<script>
				alert("로그인 후 이용가능");
				location.href="login_main.do";
			</script>
		</c:if>  --%>
<script>
        	let isDuplicateChecked = false;//아이디 중복확인
        	let isEmailChecked = false; //이메일 인증 확인
        	
	
        function sendUserJoin(f) {

        	let c_id = f.c_id.value.trim(); //아이디
            let pwd = f.pwd.value.trim(); //비밀번호
            let pwd_check = f.pwd_check.value.trim(); //비밀번호 체크
            let name = f.name.value.trim(); //이름
            
            let inputEmail = f.inputEmail.value.trim(); //이메일
            let email_at = '@';
            let selectEmail = f.selectEmail.value.trim(); //이메일 선택 select
            
            let email = inputEmail + email_at + selectEmail; //전체 이메일
            
            let email_check = f.email_check.value.trim(); //인증코드
            let tel = f.tel.value.trim(); //전화번호
            let selectGender = f.selectGender.value.trim(); //성별 선택

            //경고창을 띄우기 위해 id를 가져오는 코드 
            let idError = document.getElementById("id-error");
            let pwdError = document.getElementById("pwd-error");
            let pwdCheckError = document.getElementById("pwd_check-error");
            let nameError = document.getElementById("name-error");
            let emailError = document.getElementById("email-error");
            let emailCheckError = document.getElementById("email_check-error");
            let telError = document.getElementById("tel-error");
            let genderError = document.getElementById("gender-error");
			
            let IDCheck_Every = /^[a-z0-9]+$/;
            
			//---------------------------------아이디 중복확인 체크
            if (!isDuplicateChecked) {
                alert("아이디 중복확인은 필수입니다");
                return;
            } else if(c_id == pwd){
            	pwdError.textContent = "아이디와 같은 비밀번호는 사용할 수 없습니다";
            	return;
            }
            
            //비밀번호 유효성 체크 정규식
            let pwdCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9!@#$%^&*()\-_=+\\|\[\]{};:'",.<>\/?]{5,20}$/;
            let pwdEmptyCheck = /^\S+$/;

            if (pwd !== pwd_check) {
                pwdCheckError.textContent = "비밀번호가 일치하지 않습니다";
                return;
            } else if (pwd.length < 5 || pwd.length > 20) {
                pwdError.textContent = "비밀번호는 영문 대소문자/특수문자/숫자 중 2가지 조합하여 5~20자";
                return;
            } else if (!pwdCheck.test(pwd)) {
                pwdError.textContent = "비밀번호는 영문 대소문자/특수문자/숫자 중 2가지 조합하여 5~20자";
                return;
            } 

            pwdError.textContent = ""; 
            pwdCheckError.textContent = "";
            
			//----------------------------------이름 공백 체크
            let nameCheck = /^[가-힣\\s]*$/; 
			
			if(name == '' || !nameCheck.test(name)){
				nameError.textContent = "올바른 이름을 입력해 주십시오";
				return;
			}

			//----------------------------------이메일 인증확인 체크
            if(!isEmailChecked){
            	alert("이메일 인증은 필수입니다.");
            	return;
            }
			
          	//--------------------------------전화번호 체크
			//입력하고 넘어가면 자동으로 -넣는 정규식          	
    		if(tel.length >= 10 && tel.length <= 11){
    			let numbers = tel.replace(/[^0-9]/g, "").replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
    			tel = numbers;
    		}
    		
            telError.textContent = ''; 
			
            alert("유효성 체크 완료");
            
            //------전화번호 성별을 입력하지 않았을 때
            if(tel == '' || selectGender == ''){
            	if(!confirm("전화번호와 성별 정보를 입력하지 않으셨습니다.\n 회원가입을 계속 진행하시겠습니까?")){
            		
            	}else{
            //Ajax로 회원가입 성공 띄우기
            let url = "join_insert.do";
            let param = "c_id=" + c_id + "&pwd=" + encodeURIComponent(pwd) + 
						"&name=" + name + "&email=" + encodeURIComponent(email) +
            			"&tel=" + tel + "&gender=" + selectGender;
            sendRequest(url, param, joinResult, "post");
            		
            	}//confirm창 예버튼 눌렀을 때
            }
			
            
        }//sendUserJoin
        
      
        
        //----------------------------회원가입 Ajax joinResult 함수 호출
        function joinResult() {
			if(xhr.readyState == 4 && xhr.status == 200){
				let data = xhr.responseText;
				let json = (new Function('return '+data))();
				
				if(json[0].result == 'success'){
					alert(json[0].name + "님 환영합니다");
					location.href = "login_form.do";
				}
			}
		}

        //아이디 중복체크 함수
        function duplicate_checkID(c_id) {
          let idError = document.getElementById("id-error");
          let inputID = c_id.value;

          // 대문자가 포함되어 있는지 확인
          let IDCheck_EngUpper = /[A-Z]/.test(inputID);
          let IDCheck_Number = /^[0-9]+$/.test(inputID);
          let IDCheck_Every = /^[a-z0-9]+$/;
		
          alert(c_id.value);
          if (inputID == '') {
              idError.textContent = "아이디를 입력해 주세요.";
              return;
          } 
			
          if (!IDCheck_Every.test(inputID) || IDCheck_EngUpper) {
              idError.textContent = "공백/대문자/특수문자/한글이 포함된 아이디는 사용할 수 없습니다.";
              return;
          } else if(IDCheck_Number){
             idError.textContent = "숫자로만 입력한 아이디는 사용할 수 없습니다.";
             return;
          } else if (inputID.length < 4  || inputID.length > 14 ) {
        	    idError.textContent = "아이디는 영문 소문자/숫자 포함 4~14자로 입력해주세요.";
        	    return;
          } 

          let url = "duplicate_checkID.do";
          let param = "c_id=" + c_id.value;
          sendRequest(url, param, function() {
              checkID(c_id);
          }, "post");
      }

        //아이디 중복체크 Ajax함수 호출
        function checkID(c_id) {
            if (xhr.readyState == 4 && xhr.status == 200) {
                let data = xhr.responseText;
                let json = (new Function('return ' + data))();
                let idError = document.getElementById("id-error");

                if (json[0].param == 'fail') {
                    idError.textContent = "이미 사용중인 아이디 입니다";
                    c_id.value = '';  // 아이디 입력 창 비우기
                } else if (json[0].param == 'sucess') {
                    idError.textContent = "사용 가능한 아이디 입니다";
                   	/* let c_id = document.getElementById("c_id");
                   	c_id.readonly = false; */
                    isDuplicateChecked = true;
                }
            }
        }//checkID

        // 아이디 변경 시 중복체크 상태 초기화 및 재체크 함수
        function resetAndCheckID() {
            isDuplicateChecked = false;
            let c_id = document.getElementsByName("c_id")[0].value.trim();

            if (c_id === '') {
                return; // 아이디가 비어있으면 체크하지 않음
            }

            // 중복 체크 함수 호출
            duplicate_checkID(c_id);

        }

        //-------------------------------email 인증 함수 호출 
      	function mailCheck(f) {
			let inputEmail = f.inputEmail.value.trim(); //이메일
		    let email_at = '@';
		    let selectEmail = f.selectEmail.value.trim(); //이메일 선택 select
		    let email = inputEmail + email_at + selectEmail; //전체 이메일
     
    		let emailError = document.getElementById("email-error");
    		let emailCheck_Every = /^[가-힣ㄱ-ㅎㅏ-ㅣ!@#$%^&*()_+~\-=`{}|[\]\\:";'<>?,./\s]+$/;

    		//이메일 유효성 체크
    		if(inputEmail == '' || emailCheck_Every.test(inputEmail)){
    			emailError.textContent = "올바른 아이디를 입력해 주십시오";
    			return;
    		}else if( selectEmail == '' ){
    			emailError.textContent = "이메일 주소를 선택해 주십시오";
    			return;
    		}
    		
    		let url = "mailCheck.do";
    		let param = "email=" + encodeURIComponent(email);
    		sendRequest(url, param, checkEmailCertify, "post");
		}

		let res;

		//인증함수 호출 Ajax
		function checkEmailCertify() {
    		if(xhr.readyState == 4 && xhr.status == 200){
        		let data = xhr.responseText;
        		let email_check = document.getElementsByName("email_check")[0];
        		
        		alert("인증코드가 입력하신 이메일로 전송 되었습니다.");
        		
        		email_check.disabled = false;
        		res = data;
    		}
		}//checkEmailCertify

		function check_certify() {
    		let email_check = document.getElementsByName("email_check")[0].value;
    		let emailCheckError = document.getElementById("email_check-error");

    		if(email_check == res){
       		 	emailCheckError.textContent = "인증번호가 일치합니다.";
       		 	//alert("인증번호가 일치합니다.");
       		 	email_check.readOnly = true;
       		 	isEmailChecked = true;
    		}else{
        		emailCheckError.textContent = "인증번호가 일치하지 않습니다.";
        		//alert("인증번호가 일치하지 않습니다.");
    		}
		}

    </script>
<style>

/* 회원가입 정보 경고창 색깔 */
.error-message {
	color: red;
	font-size: 12px;
}
</style>
</head>

<body>
	<form name="f">
		<input type="button" value="home" onclick="location.href='main.do'"
			align="center">
		<!-- home 이동 -->
		<br>
		<table border="1" align="center" width="500">
			<caption>회원가입 페이지</caption>
			<tr>
				<td>*아이디</td>
				<td><input name="c_id" placeholder="ID" size="35" id="c_id">
					<input type="button" value="중복 확인" style="float: right;"
					name="check_id" onclick="duplicate_checkID(this.form.c_id)">
					<br> <span id="id-error" class="error-message"></span> <span>소문자/숫자
						포함 4~14자</span></td>
			</tr>
			<tr>
				<td>*비밀번호</td>
				<td><input name="pwd" type="password" size="35"
					placeholder="PWD"> <br> <span id="pwd-error"
					class="error-message"></span> <span>영문 대소문자/특수문자/숫자 중 2가지
						조합하여 5~20자</span></td>
			</tr>
			<tr>
				<td>*비밀번호 확인</td>
				<td><input name="pwd_check" type="password" size="35">
					<span id="pwd_check-error" class="error-message"></span></td>
			</tr>
			<tr>
				<td>*이름</td>
				<td><input name="name" size="35"> <span id="name-error"
					class="error-message"></span></td>
			</tr>
			<tr>
				<td>*이메일</td>
				<td><input name="inputEmail" size="12"> @ <select
					name="selectEmail" style="width: 34%;">
						<option value="">E-Mail 선택</option>
						<option value="naver.com" id="naver.com">naver.com</option>
						<option value="gmail.com" id="gmail.com">gmail.com</option>
						<option value="nate.com" id="nate.com">nate.com</option>
						<option value="empal.com" id="empal.com">empal.com</option>
						<option value="daum.net" id="daum.net">daum.net</option>
						<option value="hanmail.net" id="hanmail.net">hanmail.net</option>
				</select> <input type="button" value="인증하기" style="float: right;"
					onclick="mailCheck(this.form)"> <br> <span
					id="email-error" class="error-message"></span></td>
			</tr>
			<tr>
				<td>*인증번호 확인</td>
				<td><input name="email_check" size="35" disabled="disabled">
					<input type="button" value="인증번호 확인" onclick="check_certify()">
					<br> <span id="email_check-error" class="error-message"></span>
				</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input name="tel" size="35"
					placeholder="'-'를 제외한 번호를 입력해주세요"> <br> <span
					id="tel-error" class="error-message"></span></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>남 <input name="selectGender" type="radio" value="남">
					여 <input name="selectGender" type="radio" value="여"> <span
					id="gender-error" class="error-message"></span>
				</td>
			</tr>
		</table>
		<br>
		<div align="center">
			<input type="button" value="가입하기" style="width: 10%;"
				onclick="sendUserJoin(this.form)">
		</div>
	</form>
</body>
</html>