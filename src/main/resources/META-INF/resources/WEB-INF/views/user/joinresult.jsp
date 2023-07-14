<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>	
<html>
<head>
<meta charset="UTF-8">
<title>회원가입확인</title>
</head>
<body>
		<script>
			if('OK' == '${result}'){
				alert("회원 가입을 축하합니다.")
				location.href='login';
			}else if('emailExist!' == '${result}'){
				alert("이메일이 가입 된 이메일입니다.")
				history.go(-1);
			}else if('idExist!' == '${result}'){
				alert("아이디가 가입 된 아이디입니다.")
				history.go(-1);
			}
		</script>
</body>
</html>