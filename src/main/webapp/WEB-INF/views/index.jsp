<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

		<script>
			if('orderFail' == '${orderFail}'){
				alert("결제 실패. 메인페이지로 이동합니다.")
			}
		</script><head>
<style>
.menu {
	margin-top: 150px;
}

.menu-item {
  background-color: #ffffff;
  flex-grow: 1;
  transition: 0.5s;
}

.menu-item2 {
  background-color: #ffffff;
  flex-grow: 1;
}

.menu-item:hover {
  background-color: crimson;
  flex-grow: 1.2;
}
.menu-link {
  /* block이면 마우스 클릭영역이 더 커짐, a태그는 inline으로서 클릭영역이 콘텐츠에 한정됨*/
  display: block; 
  padding: 16px;
  font-size: 18px;
  font-weight: bold;
  color: #555;
  text-decoration: none;
  text-align: center;
}

.menu-link2 {
  /* block이면 마우스 클릭영역이 더 커짐, a태그는 inline으로서 클릭영역이 콘텐츠에 한정됨*/
  display: block; 
  padding: 16px;
  font-size: 40px;
  font-weight: bold;
  color: #555;
  text-decoration: none;
  text-align: center;
}

.menu-link:hover {
  color: white;
}

ul, li {
  list-style:none;
}

.swiper-slide img {
   max-width: 1000%;
   background-size :contain;
    margin: auto;
   display: block;
}

.swiper {
	margin: 270px;
	width: 1000px;
}

.font-cafe {
	font-family: 'Roboto', sans-serif;
}
 
</style>
	<style>
		div.a{float:center; height:auto; width:auto; margin: 1px; border :1px ; text-align:center;}
	</style>
   
       <meta charset="utf-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
       <meta name="description" content="" />
       <meta name="author" content="" />
       <title>카페</title>
       <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
       <link href="resources/css/styles.css" rel="stylesheet" />
       <link href="resources/css/btn.css" rel="stylesheet" />
       
       <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

    <body class="sb-nav-fixed" style="background-color:#ffffff">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="margin: 30px;">
         <!-- Navbar Brand-->
            <b><a class="navbar-brand ps-3 font-cafe" href="/" style="margin: 2px 6px; margin-left: 800px; font-size: 50px;">TeampCafe</a></b>
        
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="#">
                   <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                
                   <c:choose>
                   <c:when test="${sessionScope.username==null}">
                    <span style="color: #41464b; font-size: 18px; margin-top: 6px;" >로그인을 해주세요</span>
                   </c:when>
                   <c:when test="${sessionScope.username!=null}">
                    <span style="color: #41464b; font-size: 18px; margin-top: 6px;" >${sessionScope.username } [ ${sessionScope.name } ]</span>
                    
                    
                   	
                   </c:when>
                   </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <c:choose>
                     <c:when test="${sessionScope.username==null}">
                        <li><a class="dropdown-item" href="/login">Login</a></li>
                        <li><a class="dropdown-item" href="/join">Join</a></li>
                        <li><a class="dropdown-item" href="/adminLogin">AdminLogin</a></li>
                        </c:when>
               <c:otherwise>
               
               <li class="nav-item dropdown">
                </li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                        <li><a class="dropdown-item" href="/mypage">Mypage</a></li>
                        <li><a class="dropdown-item" href="/MyCart">장바구니</a></li>
                        <li><a class="dropdown-item" href="/MyOrder">구매내역</a></li>
                         </c:otherwise>
                    </c:choose>
                    </ul>
                </li>
                
            </ul>
                </div>
            </form>
        </nav>
    <!-- 사이드 네비 -->
    
       <div id="layoutSidenav">

		<div id="layoutSidenav_nav" style="margin-left: 130px">
			<ul class="menu">
				<li class="menu-item2">
		            <h2 class="menu-link2">MENU</h2>
		        </li>
		        <li class="menu-item">
		            <a href="menu" class="menu-link">All</a>
		        </li>
		        <li class="menu-item">
		            <a href="coffee" class="menu-link">COFFEE</a>
		        </li>
		        <li class="menu-item">
		            <a href="milkTea" class="menu-link">MILK TEA & LATTE</a>
		        </li>
		        <li class="menu-item">
		            <a href="juice" class="menu-link">JUICE & DRINK</a>
		        </li>
		        <li class="menu-item">
		            <a href="smoothie" class="menu-link">SMOOTHIE</a>
		        </li>
		        <li class="menu-item">
		            <a href="tea" class="menu-link">TEA & ADE</a>
		        </li>
		        <li class="menu-item">
		            <a href="bread" class="menu-link">BREAD</a>
		        </li>
		        <li class="menu-item">
		            <a href="dessert" class="menu-link">DESSERT</a>
		        </li>
		        <li class="menu-item">
		            <a href="md" class="menu-link">MD</a>
		        </li>
		    </ul>
		</div>	

         <div id="layoutSidenav_content">
    <main >
	    <div class="container-fluid px-4" >
	       <div class="swiper">
	      <div class="swiper-wrapper">
	        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/person1.png" alt=""></div>
	        <div class="swiper-slide"><img src="resources/person2.png" alt=""></div>
	        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        
	      </div>
	      <div class="swiper-button-prev"></div>
	      <div class="swiper-button-next"></div>
	    </div>
		
	    <div id="content" style="margin-top: 10px;">
	     
	          
		 
	   </div>
   </main>

       





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="resources/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="resources/assets/demo/chart-area-demo.js"></script>
<script src="resources/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="resources/js/datatables-simple-demo.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/gsap.min.js" integrity="sha512-VEBjfxWUOyzl0bAwh4gdLEaQyDYPvLrZql3pw1ifgb6fhEvZl9iDDehwHZ+dsMzA0Jfww8Xt7COSZuJ/slxc4Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.10.4/ScrollToPlugin.min.js" integrity="sha512-lZACdYsy0W98dOcn+QRNHDxFuhm62lfs8qK5+wPp7X358CN3f+ml49HpnwzTiXFzETs4++fADePDI+L2zwlm7Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link
	rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<script>
const swiper = new Swiper( '.swiper', {
autoplay: true,
loop: true,
navigation: {
nextEl: '.swiper-button-next',
prevEl: '.swiper-button-prev',
},
slidesPerView: 1,
slidesPerGroup : 1,
breakpoints: {
768: {
slidesPerView: 1,
},
1024: {
slidesPerView: 1,
}
}
} );

</script>


    </body>
</html>