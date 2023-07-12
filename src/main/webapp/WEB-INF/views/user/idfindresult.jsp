<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기 결과</title>
</head>
<body>
		<script>
			if('OK' == '${result}'){
				alert("메일이 발송되었습니다.")
				location.href='login';
			}else if('NO' == '${result}'){
				alert("이름 또는 이메일을 다시확인해주세요.")
				history.go(-1);
			}
		</script>
</body>
</html>