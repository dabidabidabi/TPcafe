<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
    <style>

.contents {
	padding: 100px;
}

.menu {
  display: flex;
}
.menu-item {
  background-color: gold;
  flex-grow: 1;
  transition: 0.5s;
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
.menu-link:hover {
  color: white;
}

body,ul,li {
  margin: 0;
  padding: 0;
}

ul, li {
  list-style:none;
}

</style>
    	<style>
 오후 4:33 2023-06-30
</style>
   		<style>
 		 div.a{float:center; height:auto; width:auto; margin: 1px; border :1px ; text-align:center;}

		</style>
		<style>
		#to-top {
  width: 42px;
  height: 42px;
  background-color: #333;
  color: #fff;
  border: 2px solid #fff;
  border-radius: 10px;
  cursor: pointer;
  display: flex;
  justify-content: center;
  align-items: center;
  position: fixed;
  bottom: 30px;
  right: 30px;
  z-index: 9;
}
		
		</style>
    
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>영화 카페</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
        <link href="resources/css/btn.css" rel="stylesheet" />
        
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
	<body class="sb-nav-fixed" style="background-color:#FFFFFF">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
         <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/">Movie Commu</a>
        	
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="#">
                   <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                   <c:choose>
               
                   <c:when test="${sessionScope.username!=null}">
                    <span style="color: white; font-size: 22px;" >${sessionScope.username } [ ${sessionScope.name } ]</span>
                   </c:when>
                   </c:choose>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <c:choose>
                     <c:when test="${sessionScope.username==null}">
                        <li><a class="dropdown-item" href="/login">Login</a></li>
                        <li><a class="dropdown-item" href="/join">Join</a></li>
                        </c:when>
               <c:otherwise>
                  <li><a class="dropdown-item" href="/mypage">Mypage</a></li>
                        <li><a class="dropdown-item" href="/logout">Logout</a></li>
                         </c:otherwise>
                    </c:choose>
                    </ul>
                </li>
            </ul>
                </div>
            </form>
        </nav>
               
                        
 

	<div class="contents">
		<center><font size="7">Cafe</font></center>
		<br><br>
	        <ul class="menu">
		        <li class="menu-item">
		            <a href="menu" class="menu-link">MENU</a>
		        </li>
		        <li class="menu-item">
		            <a href="coffee" class="menu-link">COFFEE</a>
		        </li>
		        <li class="menu-item">
		            <a href="milktea" class="menu-link">NOTICE</a>
		        </li>
		        <li class="menu-item">
		            <a href="/login" class="menu-link">SIGN IN</a>
		        </li>
		    </ul>   
		    </div>


 <div class="swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="resources/takealook.jpg" alt=""></div>
        <div class="swiper-slide"><img src="resources/takealook2.jpg" alt=""></div>
        <div class="swiper-slide"><img src="resources/cat.jpg" alt=""></div>
        <div class="swiper-slide"><img src="resources/cat.jpg" alt=""></div>
        <div class="swiper-slide"><img src="resources/cat.jpg" alt=""></div>
      </div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>

	
	
	
	
   <div id="content" style="height: 33%; margin-top: 40px;">
     
          
 </div>
   
  <main >
     <div class="container-fluid px-4" >
        <h2 class="mt-4" style="color:#FFFFFF">상영 예정작</h2>
       <div class="swiper">
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/sanrio.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/라일락블라썸티.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/캐모마일릴렉서.jpg" alt=""></div>
	        <div class="swiper-slide"><img src="resources/라일락블라썸티.jpg" alt=""></div>
      </div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-button-next"></div>
    </div>
	
    <div id="content" style="margin-top: 10px;">
     
          
	 
   </div>
   </main>
   
      

 	  		<div id="to-top">
   	 			<div class="material-icons">top</div>
  				</div>
    
                <footer style="background-color:#FFFFFF"  >
                    <div class="container-fluid px-4" >
                        <div class="d-flex align-items-center justify-content-between small" >
                            <div class="text-muted" >2023.04.19 </div>
                            
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
<script>
$(function() { // 보이기 | 숨기기
	$(window).scroll(function() {
    if ($(this).scrollTop() > 250) { //250 넘으면 버튼이 보여짐니다. 
      $('#to-top').fadeIn();
    } else {
      $('#to-top').fadeOut();
    }
  }); // 버튼 클릭시 
  $("#to-top").click(function() { 
  	$('html, body').animate({ scrollTop : 0 // 0 까지 animation 이동합니다. 
  	}, 400); // 속도 400 
  	return false; 
  }); 
});

</script>


    </body>
</html>




