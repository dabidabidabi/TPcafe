<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/include/h2.jsp"%>

<%   if(session.getAttribute("username")==null){
   response.sendRedirect("/sessionover"); 
}
%>

<% 
String username = (String)session.getAttribute("username");
Integer quantity = (Integer)session.getAttribute("quantity");
/* String id = (String)session.getAttribute("id"); */
String name = (String)session.getAttribute("name");
%>

<style>

body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
  margin-top: 10px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 15px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 16px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 15px;
  text-align: center;
}

tfoot {
	text-align: center;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

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

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: gold;
  color: black;
  border: 1px lightgray solid;
}

.selectItem {
	font-size: 14px;
	margin-left: 33px;
	display: flex;
	align-items: center;
}
.deleteItem {
	margin-left: 20px;
}

table.cart__list td {
        width: 16.6%;
        text-align: center;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

</style>

 <body>
    <section class="cart">
        
        <center><font size="7">주문내역</font></center>     
        <br><br>
		    
		<table class="cart__list">
		    <thead>
		        <tr>
		            <td>주문번호</td>
		            <td>주문일자</td>
		            <td>상품이미지</td>
		            <td>상품명</td>
		            <td>수량</td>
		            <td>주문자</td>
		        </tr>
		    </thead>
		
		    <tbody>
		        <c:set var="prevOrderNumber" value="" />
		        <c:forEach var="menuOrderList" items="${list}">
		            <c:choose>
		                <c:when test="${menuOrderList.orderNumber eq prevOrderNumber}">
		                    <%-- 같은 주문번호 --%>
		                    <tr>
		                        <td></td> <!-- 이전 주문번호와 같은 주문번호의 경우 빈 셀로 대체 -->
		                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${menuOrderList.orderDate}" /></td>
		                        <td><img style="width:auto" src="/resources/files/${menuOrderList.menuId.filename}" /></td>
		                        <td id="menuName" class="menuName">${menuOrderList.menuId.name}</td>
		                        <td id="quantity" class="quantity">${menuOrderList.quantity}</td>
		                        <td>${menuOrderList.username}</td>
		                    </tr>
		                </c:when>
		                <c:otherwise>
		                    <%-- 새로운 주문번호 --%>
		                    <tr>
		                        <td>${menuOrderList.orderNumber}</td>
		                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${menuOrderList.orderDate}" /></td>
		                        <td><img style="width:auto" src="/resources/files/${menuOrderList.menuId.filename}" /></td>
		                        <td id="menuName" class="menuName">${menuOrderList.menuId.name}</td>
		                        <td id="quantity" class="quantity">${menuOrderList.quantity}</td>
		                        <td>${menuOrderList.username}</td>
		                    </tr>
		                </c:otherwise>
		            </c:choose>
		            <%-- 이전 주문번호 갱신 --%>
		            <c:set var="prevOrderNumber" value="${menuOrderList.orderNumber}" />
		        </c:forEach>
		    </tbody>
		</table>




				
        
        <br>
		
        
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left" onclick="location.href='mypage'">마이페이지</button>
            <button class="cart__bigorderbtn right" onclick="location.href='menu'">주문하러가기</button>
        </div>
    </section>
</body>
<script>
function order() {
	const checkedItems = document.querySelectorAll('.itemCheckbox:checked');
    const uncheckedItems = document.querySelectorAll('.itemCheckbox:not(:checked)');
    const selectedIds = Array.from(checkedItems).map(function(checkbox) {
        return checkbox.dataset.itemId;
    });
    // 체크되지 않은 항목 삭제 처리
    if (checkedItems.length > 0 && uncheckedItems.length > 0) {
        const unselectedIds = Array.from(uncheckedItems).map(function(checkbox) {
            return checkbox.dataset.itemId;
        });
        deleteUncheckCartMenu(unselectedIds)
            .then(function() {
                regForm.submit();
            })
            .catch(function(error) {
                console.error(error);
            });
    } else {
        regForm.submit();
    }
    function deleteUncheckCartMenu(selectedIds) {
        return fetch('/deleteCartMenu', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(selectedIds),
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('선택한 상품을 삭제하는 데 실패했습니다.');
            }
        });
    }
}
</script>

<script>
    
    // 체크박스 전체 선택
    const selectAllCheckbox = document.querySelector('#selectAllCheckbox');
    const itemCheckboxes = document.querySelectorAll('.itemCheckbox');
    
    selectAllCheckbox.addEventListener('change', function() {
        itemCheckboxes.forEach(function(checkbox) {
            checkbox.checked = selectAllCheckbox.checked;
        });
    });
    
    // 삭제 버튼 요소 가져오기
    const deleteButton = document.querySelector('.deleteCartButton');

 	// 삭제 버튼에 클릭 이벤트 리스너 추가
    deleteButton.addEventListener('click', function() {
        const checkedItems = document.querySelectorAll('.itemCheckbox:checked');
        const selectedIds = Array.from(checkedItems).map(function(checkbox) {
            return checkbox.dataset.itemId;
        });

        if (selectedIds.length === 0) {
            alert("선택된 항목이 없습니다.");
            return;
        }

        const confirmation = confirm("선택한 항목을 삭제하시겠습니까?");
        if (confirmation) {
            deleteCartMenu(selectedIds);
        }
    });

    function deleteCartMenu(selectedIds) {
        fetch('/deleteCartMenu', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(selectedIds),
        })
        .then(function(response) {
            if (response.ok) {
                return response.text();
            } else {
                throw new Error('선택한 상품을 삭제하는 데 실패했습니다.');
            }
        })
        .then(function(data) {
            alert(data);	
            location.reload();
        })
        .catch(function(error) {
            console.error(error);
        });
    }

</script>

<script>
function totalP() {
	var totalPrice = 0;
	var totalQuantity = 0;
	var str = "";
	var checkbox = document.getElementsByClassName("itemCheckbox");
	var checkboxAll = document.getElementById("selectAllCheckbox");
	var priceElements = document.getElementsByClassName("price");
	var menuNameElements = document.getElementsByClassName("menuName");
	var quantityElements = document.getElementsByClassName("quantity");
	var allChecked = true; // 모든 체크박스가 선택되었는지 확인하는 변수
	
	for (var i = 0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			var price = parseInt(priceElements[i].innerText);
			totalPrice += price;
			var quantity = parseInt(quantityElements[i].innerText);
			totalQuantity += quantity;
			var menuName = menuNameElements[i].innerText;
			str += menuName + " ";
		} else {
			allChecked = false;
		}
	}
	
	// 선택되지 않은 체크박스가 하나라도 있다면 false
	checkboxAll.checked = allChecked;
	
	var totalPriceElement = document.getElementById("totalPrice");
	var totalQuantityElement = document.getElementById("totalQuantity");
	totalPriceElement.innerText = totalPrice;
	totalQuantityElement.innerText = totalQuantity;
	
	var totalPriceInput = document.getElementById("PriceSum");
	var totalQuantityInput = document.getElementById("QuantitySum");
	totalPriceInput.value = totalPrice;
	totalQuantityInput.value = totalQuantity;
	
	var menuOrderName = document.getElementById("menuOrderName")
	menuOrderName.value = str;
}

var checkboxes = document.getElementsByClassName("itemCheckbox");
var checkboxAll = document.getElementById("selectAllCheckbox");
checkboxAll.addEventListener("change", totalP);

for (var i = 0; i < checkboxes.length; i++) {
	checkboxes[i].addEventListener("change", totalP);
}
</script>


<%@ include file="/include/footer.jsp"%>
</html>