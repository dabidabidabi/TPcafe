<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/include/header.jsp" %>

<div class="login-box">
  <h2>아이디 찾기</h2><br>
  <form name="regForm" action="IdFind" method="post">
  	<div class="user-box">
      <input type="text" name="name" required="true">
      <label>이름을 입력하세요</label>
    </div>
    <div class="user-box">
      <input type="email" name="email"  required="true">
      <label>가입하신 이메일로 아이디를 보내드립니다. </label>
 	 </div>
	<div>
		<input type="button" style="margin-left: 80px;" value ="뒤로" class="btn first" onclick=goBack()>
		<input type="button" style="margin-left: 20px;" value ="찾기" class="btn second" onclick=check()>
	</div>
  </form>
</div>
<script>
function check(){
	if(regForm.name.value ==''){
        alert("이름을 입력하세요.")
        return;
     }else  if (regForm.email.value == '') {
         alert("이메일을 입력하세요.");
         return;
     }else if (regForm.email.value.search("@") == -1 || regForm.email.value.search(".") == -1) {
         alert("이메일 형식 오류입니다.");
         return;
     }else if(confirm("아이디를 찾으시겠습니까?")){
         regForm.submit(); //자바스크립트의 submit()는 form태그 submit기능
         alert("메일이 발송되었습니다.");
       
     }
}
</script>

<script>
function goBack() {
  history.back();
}
</script>

	<%@include file ="/include/footer.jsp" %>	