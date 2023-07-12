<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디찾기 결과</title>
</head>
<body>
		<script>
			if('OK' == '${result}'){
				alert("존재하지않는 아이디입니다.")
				history.go(-1);
			}else if('idExist!' == '${result}'){
				alert("로그인 페이지로 이동합니다.")
				location.href='login';
			}
		</script>
</body>
</html>