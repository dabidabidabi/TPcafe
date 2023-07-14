<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/h2.jsp"%>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script type="text/javascript">
	const route = window.location.pathname.replace('/', '');
</script>
<script type="text/javascript">
	const wrap = document.referrer;
</script>
<head>
<style>
.textareas{
    overflow:hidden;
    height:auto;
    }

.min-width {
	width: 1080px;
	margin: 0 210px;
	margin-top: 90px;
	margin-bottom: 50px;
}

.left-box {
	float: left;
}

.writer_info {
	margin-right: 6px;
	font-size: 13px;
	font-weight: 700;
}

.se-section-text.se-l-default .se-text-paragraph {
	line-height: 1.8;
	white-space: break-spaces;
}

.CommentWriter {
	margin: 12px 0 29px;
	padding: 16px 10px 10px 18px;
	border: 2px solid var(- -skinCommentWriterBorder);
	border-radius: 6px;
	box-sizing: border-box;
	background: var(- -skinCommentWriterBg);
}

.CommentWriter textarea {
	height: auto; /* 내용의 길이에 따라 자동으로 높이 조정 */
	resize: none; /* 사용자가 크기를 조정할 수 없도록 함 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤바 생성 */
}

.my-box {
	border: 1px solid;
	padding: 10px;
	width: auto;
	margin: 12px 0 29px;
	padding: 16px 10px 10px 18px;
	border-radius: 6px;
	box-sizing: border-box;
	overflow: auto
}

.right-box {
	float: right;
}

.comment_inbox_text {
	overflow-x: hidden;
	overflow-y: auto;
	display: block;
	width: 100%;
	min-height: 17px;
	padding-right: 1px;
	border: 0;
	font-size: 13px;
	-webkit-appearance: none;
	resize: none;
	box-sizing: border-box;
	background: transparent;
	color: var(- -skinTextColor);
	outline: 0;
}

.comment_info_date {
	margin-right: 8px;
}

.rounded-box {
	border-radius: 10px;
	border: 1px solid #ccc;
	padding: 10px;
	position: relative;
}

.rounded-box .comment-btn {
	margin: 10px;
	position: absolute;
	float: right;
	bottom: 7px;
}

.register_box .button {
	display: inline-block;
	min-width: 46px;
	height: 34px;
	line-height: 36px;
	font-size: 13px;
	color: #b7b7b7;
	border-radius: 6px;
	box-sizing: border-box;
	font-weight: 700;
	text-align: center;
	vertical-align: top;
}

.modify-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.comment-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.delete-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.list-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.modi-btn {
	background-color: gray;
	color: #fff;
	border: none;
	border-radius: 10px;
}

.mt-6 {
	margin-top: 0.5rem !important;
	margin-bottom: 0.8rem;
}

.scroll::-webkit-scrollbar {
	display: none;
}

.menu {
	margin-top: 110px;
}

.menu-item {
  background-color: #ffffff;
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

ul, li {
  list-style:none;
} 



</style>


</head>

<body class="">
	<div id="layoutSidenav">

		<div id="layoutSidenav_nav" style="margin-left: 70px">
			<ul class="menu">
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
				
		

		<div id="layoutSidenav_content" style="bottom: 56px;">

			<main class="min-width">
				
				
				<a style="font-size: 20px">${menu.type}</a>
				<br><br>		
				<h1>${menu.name }</h1>
				<br><br>
					<c:if test="${not empty menu.filename }">
						<div style="display: flex;"><img style="width: 300px; height: auto;" src="/resources/files/${menu.filename }">
							<p style="margin-left: 70px; margin-top: 60px; margin-right: 285px;">${menu.content }</p>
						</div>
						
					</c:if>
					<br><br>
					
					<br>
					
					<c:choose>
						<c:when test="${sessionScope.username == 'admin'}">
						</c:when>
						<c:otherwise>
							<hr>
							<br>
							<div class="num">
							    <b><span style="font-size: 18px;">주문하기</span></b>
							    <form name="regForm" id="regForm" action="drinkOrder" method="post">
								    <div style="margin-left: 4px;" class="quantity" id="quantity"><br>
								        <button style="border: none; border-radius: 10px;" class="minus" type="button">-</button>
								        <span id="result">1</span>
								        <button style="border: none; border-radius: 10px;" style="all: unset" class="plus" type="button">+</button>
								        <br><br>
								        <a style="font-size: 17px;">금액 : </a><span id ="price" style="font-size: 17px;">${menu.price }</span>원
								    </div>
		
								    <input type="hidden" id="menuId" name="id" value="${menu.id}">
								    <input type="hidden" id="menuQuantity" name="quantity" value="1">
								    <input type="hidden" id="menuName" name ="menuName" value=${menu.name }><br>						    
								</form>
								
								<div style="display: flex;">
								    <input type="button" style="background: #ffffff;" id="confirm" onclick="go()" value = "장바구니 담기">  
								
									<form name="regForm2" id="regForm2" action="cart2" method="post">
										<input type="hidden" name="menuPrice" id="menuPrice" value="${menu.price}">
										<input type="hidden" name="menuName" id="menuName" value="${menu.name}">
										<input type="button" style="background: #ffffff; margin-left: 10px;" id="confirm" onclick="go2()" value = "바로 주문하기">
									</form>
								</div>
					       	</div>
						</c:otherwise>
					</c:choose>
					
				<br><br>
				<div><input style="float:right; padding:6px 8px" type="button" class="list-btn" value="목록" onclick="listnum();"></div>
				<div>
  					 <%
					    String username = (String) session.getAttribute("username");
					    String displayStyle = (username != null && username.equals("admin")) ? "block" : "none";
					  %>
  					 <button style="float: right; margin-right: 7px; padding: 6px 8px; display: <%= displayStyle %>" class="modi-btn" id="modibtn" onclick="modi()">수정</button>
				</div>
				
			</main>
	
				
<script>
function go() {
	regForm.submit();
}

function go2() {
	regForm2.submit();
}
</script>




<script>
    const plusBtn = document.querySelector('.plus');
    const minusBtn = document.querySelector('.minus');
    const resultSpan = document.querySelector('#result');
    const priceSpan = document.querySelector('#price');
    
    const resultValue = parseInt(resultSpan.textContent);
    const priceValue = parseInt(priceSpan.textContent);
    
    const menuQuantityInput = document.querySelector('#menuQuantity');
    
    const totalPrice = document.getElementById("priceAll");
    
    plusBtn.addEventListener('click', () => {
        let quantity = parseInt(resultSpan.textContent);
        quantity++;
        resultSpan.textContent = quantity;
        menuQuantityInput.value = quantity;
        priceSpan.textContent = quantity*priceValue;
        totalPrice.value=quantity*priceValue;
    });
    
    minusBtn.addEventListener('click', () => {
        let quantity = parseInt(resultSpan.textContent);
        if (quantity > 1) {
            quantity--;
            resultSpan.textContent = quantity;
            menuQuantityInput.value = quantity;
            priceSpan.textContent = quantity*priceValue;
            totalPrice.value=quantity*priceValue;
        }
    }); 
</script>

<script>
	function modi() {
	    document.addEventListener('DOMContentLoaded', function() {
	        const modibtn = document.getElementById('modi-btn');
	        const username = ${sessionScope.username};
	        if (username != 'admin') {
	            modibtn.style.display = 'none';
	        } else {
	            modibtn.style.display = 'block';
	        }
	    });
	    // 버튼 클릭 시 실행할 동작 추가
	    location.href='modifyMenu?id=${menu.id}';}
</script>

<script>
   function listnum(){
      if(${sessionScope.listnum} == '1'){
         history.go(-1);
         return;
      }else if(${sessionScope.listnum} == '2'){
         history.go(-2);
      }else if(${sessionScope.listnum} == '3'){   
         history.go(-3);
      }
   }
</script>

<%@ include file="/include/footer.jsp"%>