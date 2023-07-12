<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/resources/include/h2.jsp"%>
<head>
<style>

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.contents {
	padding: 100px;
}

.menu {
  display: flex;
}
.menu-item {
  background-color: #fde3e9;
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

.fixed-button {
    position: fixed;
    bottom: 50px; /* 버튼의 하단 여백 */
    right: 110px; /* 버튼의 우측 여백 */
    z-index: 9999; /* 다른 요소 위에 표시하기 위한 우선순위 */
    padding: 10px 25px;
    border-radius: 20px;
    background: #ffffff
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
			<br>
			<br>
			<section class="cart">
			<table class="cart__list">
				<thead>
					<tr>
						<th scope="col" class="th-num">주문번호</th>
						
						<th scope="col" class="th-num">상품명</th>
						<td>
						<td>
						<th scope="col" class="th-num">가격</th>
						<td>
						<th scope="col" class="th-num">수량</th>
						<td>
						<td>
						<td><td>
						<th scope="col" class="th-num">주문일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="menuOrder" items="${menuOrderList }">
						<tr>
							<td>${menuOrder.orderNumber }</td>
							
							<td>${menuOrder.menuId.name}</td>
							<td>
							<td>
							<td>${menuOrder.menuId.price} 원</td>
							<td>
							<td>${menuOrder.quantity}</td>
							<td><td>
							<td><td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${menuOrder.orderDate}" /></td>
							
						</tr>
					</c:forEach>
				</tbody>
	        </table>
	        </section>  
			<br>
			<div>
			    <%
			        String username = (String) session.getAttribute("username");
			        String displayStyle = (username != null && username.equals("admin")) ? "block" : "none";
			    %>
			    <button class="fixed-button" id="fixed-button" style="display: <%= displayStyle %>"
			        onclick="menuRegister('<%= username %>')">+ 메뉴 추가</button>
				</div>


		</div>

</body>	

					

<%@ include file="/resources/include/footer.jsp"%>