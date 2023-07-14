<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/h2.jsp"%>
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

</head>

<body>
	<div class="contents">
		<center><font size="7">MENU</font></center>
		<br><br>
	        <ul class="menu">
		        <li class="menu-item">
		            <a href="menu" class="menu-link">All</a>
		        </li>
		        <li class="menu-item">
		            <a href="coffee" class="menu-link">COFFEE</a>
		        </li>
		        <li class="menu-item">
		            <a href="milktea" class="menu-link">MILK TEA & LATTE</a>
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
			<br>
			<br>
			<div style="display: flex; flex-wrap: wrap;">
				<c:forEach var="vo" items="${list}">
					<c:if test="${not empty vo.filename }">
						<div style="width: 300px; margin: 20px;">
							<a href="menuContent?id=${vo.id }">
								<img style=
								"width: 300px; height: auto;" src="/resources/files/${vo.filename }" />
							</a>
							<br>
							<b><c:out value="${vo.name }" /></b>
							<br>
							<c:out value="${vo.price }" />원
						</div>
					</c:if>
				</c:forEach>
			</div>  
		
	</div>

</body>

	
						
						

						
						
					
					
					

<script>

	/* 수량 증감, 감소 */

    let plus = document.querySelector(".plus");
	let minus = document.querySelector(".minus");
	let result = document.querySelector("#result");
	let totalcost = document.querySelector('.totalcost');
	let i = 1;
	plus.addEventListener("click", () => {
		i++
		result.textContent = i;
	})
	
	minus.addEventListener("click", () => {
		if(i>1) {
			i--
			result.textContent = i;
		}
		
	})
</script>

					

<%@ include file="/include/footer.jsp"%>