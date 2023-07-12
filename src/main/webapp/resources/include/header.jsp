<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>cafe</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="resources/css/styles.css" rel="stylesheet" />
        <link href="/resources/css/login.css" rel="stylesheet">
        
<style>
.myswal-class {
	width:500px;
	font-size:15px;
	}
  	</style>
  	      <style>
.video_modal_popup.reveal {
    display: flex;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    justify-content: center;
    align-items: center;
    z-index: 9999999
}

.video_modal_popup .video-wrapper {
    position: relative;
    width: 80%;
    padding-bottom: 45%;
    z-index: 10
}

.video_modal_popup .video-wrapper iframe {
    position: absolute;
    width: 100%;
    height: 100%;
}

.video_modal_popup.reveal .video_modal_popup-closer {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, .5);
    z-index: 9999999
}
</style>

<style>
	div.a{float:center; height:auto; width:auto; margin: 1px; border :1px ; text-align:center;}
</style>

<style>
.font-cafe {
	font-family: 'Roboto', sans-serif;
}
</style>
  	
</head>
    
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>   
<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="//code.jquery.com/jquery-1.12.4.min.js" crossorigin="anonymous"></script>
 
 
 <script>
$(".popupModalVideo a").click(function() {
    $(".video_modal_popup").addClass("reveal"),
    $(".video_modal_popup .video-wrapper").remove(),
    $(".video_modal_popup").append("<div class='video-wrapper'><iframe width='560' height='315' src='https://www.youtube.com/embed/" + $(this).data("video") +"?title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe></div>")
});
$(".video_modal_popup-closer").click(function() {
    $(".video_modal_popup .video-wrapper").remove(),
    $(".video_modal_popup").removeClass("reveal")
});
</script> 
 
 
  <script>
  async function alert(msg) {
       try
       {
             if(!$(Swal.getTitle()).html()) {
                   sourcePlayground_Cnt = 0;
             }

             if(typeof sourcePlayground_Cnt !== "undefined" && sourcePlayground_Cnt > 0) {  
                   if(sourcePlayground_Cnt == 1) {
                         msg = "<span style='font-weight:normal'>("+sourcePlayground_Cnt+")</span> " + $(Swal.getTitle()).html() + "<Br>" + "<span style='font-weight:normal'>("+(sourcePlayground_Cnt+1)+")</span> " + msg;
                   }
                   else {
                         msg = $(Swal.getTitle()).html() + "<Br>" + "<span style='font-weight:normal'>("+(sourcePlayground_Cnt+1)+")</span> " + msg;
                   }
                   sourcePlayground_Cnt++;
             }
             else {
                   sourcePlayground_Cnt = 1;
             }

             await Swal.fire({
                   "title": msg, 
                   "timer":3000,
                   "customClass":'myswal-class',
					"returnFocus": false,
                   didOpen: () => {
                         window.localStorage.setItem("sourceplaygroumd_myfocusobj", document.activeElement.id)
                   },
                   willClose: () => {
                         var myfocusobj = window.localStorage.getItem("sourceplaygroumd_myfocusobj");
                         if(myfocusobj && myfocusobj != null) {
                               document.getElementById(myfocusobj).focus();
                         }
                   }
            });
            sourcePlayground_Cnt--;
       }
       catch (e)
       {
             try
             {
                   Swal.isVisible(); 
             }
             catch (e_inner)
             {
                   sourcePlayground_Cnt = 0;
                   setTimeout(function(){alert(msg);}, 500);
             } 
       }
 }
</script>
<!-- 상단 네비 -->
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="margin: 15px;margin-left: 91px;margin-right: 67px;">
            <!-- Navbar Brand-->
            <b><a class="navbar-brand ps-3" href="/" style="margin: 2px 6px; font-size: 30px;">TeampCafe</a></b>
        
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="#">
                   <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                   <c:choose>
                   <c:when test="${sessionScope.username==null}">
                    <span style="color: #41464b; font-size: 18px; margin-top: 6px;" >로그인을 해주세요</span>
                   </c:when>
                   <c:when test="${sessionScope.username!=null}">
                    <span style="color: white; font-size: 18px;" >${sessionScope.username } [ ${sessionScope.name } ]</span>
                    
                    
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
 	
	  