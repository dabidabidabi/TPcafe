<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   if(session.getAttribute("username")==null){
   response.sendRedirect("/sessionover"); 
}
%>

<style>
.font-cafe {
	font-family: 'Roboto', sans-serif;
}

</style>
<%@ include file="/include/header.jsp" %>


	
      <form>
      	<div align="center" class="login-box">
         <h2>Mypage</h2><br>
         <hr>
         <span style="color: black; font-size: 20px;">${sessionScope.username } [ ${sessionScope.name } ] 님의 <br> 회원 정보를 관리합니다.</span>
         <hr>
         <br>
         
         <input type="button" value="회원정보 변경" class="btn first" onclick="location.href='update'" style="margin-bottom:-10px; margin-left: -1px;" >
         <input type="button" value="로그아웃" class="btn second" onclick="location.href='logout'" style="margin-left:-5px; margin-bottom:-10px;">
         <input type="button" value="비밀번호 변경" class="btn first" onclick="location.href='pwupdate'" style="margin-right: -10px; margin-left: -1px;">
         <input type="button" value="회원탈퇴" class="btn second" onclick="location.href='delete'" style="margin-left: 25px;">
      	</div>
      </form>
       
         
         
   

<%@ include file="/include/footer.jsp" %>