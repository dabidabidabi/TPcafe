<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/resources/include/h2.jsp"%>

<script type="text/javascript">
const route = window.location.pathname.replace('/','');
</script>

<%
if (session.getAttribute("username") == null) {
	response.sendRedirect("adminSessionover");
}
%>
<style>
body {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 50px auto;
	margin-top: 100px;
}

img {
	width:30%;
	height:30%;
}
</style>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">All</div>
						<a class="nav-link" href="/menu">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 전체 메뉴
						</a>
						<div class="sb-sidenav-menu-heading">WRITE</div>
						<a class="nav-link" href="/menuRegister">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 메뉴 등록
						</a>

						<div class="sb-sidenav-menu-heading">
						<c:choose>
							<c:when test="${sessionScope.username!=null}">
								<span style="color: white; font-size: 15px;">${sessionScope.username }</span>
							</c:when>
						</c:choose>
					</div>
					<a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
						<div class="sb-nav-link-icon">
							<i class="fas fa-book-open"></i>
						</div> 멤버
						<div class="sb-sidenav-collapse-arrow">
							<i class="fas fa-angle-down"></i>
						</div>
					</a>
					<div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
						<nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
							<nav class="sb-sidenav-menu-nested nav">
								<c:choose>
									<c:when test="${sessionScope.username==null}">
										<a class="nav-link" href="adminLogin">로그인</a>
									</c:when>
								</c:choose>
								<a class="nav-link" href="mypage">마이페이지 이동</a> <a class="nav-link" href="update">내 정보변경</a> <a class="nav-link" href="pwupdate">비밀번호 변경</a> <a class="nav-link" href="logout">로그아웃</a>
							</nav>
						</nav>
					</div>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<h2 class="mt-4" style="text-align: center;">메뉴 수정</h2>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active"></li>
				</ol>

				<div class="row">
					<div class="row-col-xl-1">
						<div class="card mb-4">
							<div class="card-header">
								<h3 class="left-box"></h3>
							</div>
							<div class="card-body">
								<form class="regform" name="regform" action="modifyMenu" method="post" enctype="multipart/form-data">
									<tr>
										<td><input type="hidden" name="id" value="${menu.id }"></td>
									</tr>
										메뉴명 <input type="text" name="name" id="name" value="${menu.name }" style="width: 100%;" required>
									<hr>
										상품 구분 : <select id="type" name="type">
											<option value="${menu.type }" selected>${menu.type}</option>
										</select>
									<hr>
										가격 : <input type="text" name="price" id="price" value="${menu.price }" required>
									<hr>							
										<c:if test="${not empty menu.filename }">
			                              <img src="/resources/files/${menu.filename }">
			                              <input type="hidden" name="filename" value="${menu.filename }">
			                              <input type="hidden" name="filepath" value="${menu.filepath }">
			                              <br>
			                           </c:if>
			                           
			                           
	                           <br>
	                           <input type="file" name="file" id="file" value="${menu.filename }">

								<hr>
									내용 : <br>
									<div class="text_box">
										<textarea name="content" id="content" placeholder="내용을 입력해주세요." class="text" rows="5" cols="150" required>${menu.content }</textarea>
										<div class="count"></div>
										<br>
									</div>
									<p style="text-align: right">
										<br> 
										<input type="button" value="수정" onclick=modifyCheck()> 
										<input type="button" value="목록" onclick=listnum()> 
										<input type="button" value="삭제" onclick=deleteCheck()>
									</p>
								</form>
							</div>
						</div>
					</div>
	
					
<script>
	function modifyCheck() {
	   if(regform.name.value == ''){
	      alert("메뉴명을 입력하세요.");
	      return;
	   }else if(regform.content.value == ''){
	      alert("내용을 입력해주세요.")
	      return;
	   }else if(confirm("게시글을 수정하겠습니까?")){
	      regform.submit();
	      alert("게시글이 수정되었습니다")
	   }
	}
</script>


<script>
   function deleteCheck(){
	   if(regform.id.value != '${menu.id}'){
		   alert("게시글 수정 및 삭제 권한이 없습니다")
		   return;
	   } else if (confirm("게시글을 삭제하시겠습니까?")){
		   location.href="deleteMenu?id="+"${menu.id}";
		   alert("게시글이 삭제되었습니다")
	   }
   }
</script>


<script>
   function listnum(){
      if(${sessionScope.listnum} == '1'){
         history.go(-1);
         return;
      }else if(${sessionScope.listnum} == '2'){
         history.go(-2);
      }else if(${sessionScope.listnum} == '3'){   
         history.go(-2);
      }
   }
</script>

<script>
   $('.text_box textarea').keyup(function(){
      var content = $(this).val();
      $('.text_box .count span').html(content.length);
      if (content.length > 500){
        alert("최대 500자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 500));
        $('.text_box .count span').html(500);
      }
    });
   
</script>

				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="resources/assets/demo/chart-area-demo.js"></script>
	<script src="resources/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/datatables-simple-demo.js"></script>
</body>
</html>