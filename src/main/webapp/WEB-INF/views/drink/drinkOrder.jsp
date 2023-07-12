<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

</head>
<body>
	<div class="container-fluid px-4">
				<h2 class="mt-4">장바구니</h2>
				
				<div>
					<div id="board-list">
						<div class="container">
							<br> 
							<br>
							<br>
							<table>
							    <tr>
							        <th>주문 번호</th>
							        <th>아이디</th>
							        <th>수량</th>
							        <th>이름</th>
							        <th>금액</th>
							    </tr>
							    <tr>
							        <td>${cart.id}</td>
							        <%-- <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${cart.orderDate}" /></td> --%>
							        <td>${cart.user.username}</td>
							        <td>${cart.quantity}</td>
							        <td>${cart.menu.name }</td>
							        <td>${cart.menu.price*cart.quantity }</td>
							    </tr>
							</table>
							<br>

								<form action="MyCart" method="Get">
									<button>
										장바구니가기
									</button>
								</form>
							<br>
						</div>
					</div>
				</div>
			</div>
</body>
</html>