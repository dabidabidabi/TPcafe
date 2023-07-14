<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/include/header.jsp" %>
<% session.invalidate(); %>
<body>
<div class="login-box">
  <h2>Login</h2><br>
  <form name="regForm" action="login" method="post">
    <div class="user-box">
      <input type="text" name="username"  required="true">
      <label>Username</label>
 	 </div>
     <div class="user-box">
      <input type="password" name="password" required="true">
      <label>Password</label>
    </div>
	<div style="margin-left: 45px;">
		<input type="button" style="margin: 20px;" value ="로그인" class="btn second" onclick=check()>
		<input type="button" style="margin: 20px;" value ="회원가입" class="btn second" onclick="location.href='join'">
		<input type="button" style="margin: 18px;" value ="ID 찾기" class="btn first" onclick="location.href='IdFind'">
		<input type="button" style="margin: 18px;" value ="pw 찾기" class="btn first" onclick="location.href='PwFind'">
	</div>
  </form>
</div>
	<script>
		function check(){
			//form은 document.태그이름.태그이름으로 하위태그에 접근이 가능함...(dom접근)
			//console.log(documnet.regform.id.value); 공백이 출력됨
			if(document.regForm.username.value == ''){
				alert("아이디는 필수 사항입니다.")
				return;
			}else if(document.regForm.password.value == ''){
				alert("비밀번호는 필수 사항입니다.")
				return;
			}else if(confirm("로그인 하시겠습니까?")){
				document.regForm.submit(); //자바스크립트의 submit()는 form태그 submit기능
				
			}
		}
		
	</script>
</body>
<%@include file ="/include/footer.jsp" %>