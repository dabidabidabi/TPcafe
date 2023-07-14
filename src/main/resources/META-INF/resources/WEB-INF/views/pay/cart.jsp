<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   if(session.getAttribute("username")==null){
   response.sendRedirect("/sessionover"); 
}
%>
<% 
String uuid = (String)session.getAttribute("uuid");
String orderNumber = (String)session.getAttribute("orderNumber");
String name =(String)session.getAttribute("name");
String email =(String)session.getAttribute("email");
%>
<!DOCTYPE html>
<html style="margin: 100px 250px;">
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  <style>
    #payment-button{ width:100%; padding:15px; background-color:#3065AC; color:white; border-radius:3px; font-size:16px; border:none; margin-top:10px}
	.title {margin: 0 0 4px; font-size: 24px; font-weight: 600;color: #4e5968;}
  </style>
</head>
<body>
  <!-- 상품 정보 영역-->
  <div class="title">상품 정보</div>
  <%-- <p>${param.menuOrderName}</p> --%>
  <p>${list2.id }</p>
  <p><%=name%>님의 주문</p>
  <p>결제 금액: ${param.PriceSum }${param.priceAll }</p>
 	

  <!-- 결제 방법 영역-->
  <div class="title">결제 방법</div>
  <div id="payment-method"></div>
  <div id="agreement"></div> 
  <button id="payment-button">결제하기</button>
</body>
<script>
  const clientKey = 'test_ck_oeqRGgYO1r555edOqKprQnN2Eyaz' // 상점을 특정하는 키
  const customerKey ='<%=uuid%>' // 결제 고객을 특정하는 키
  const amount = ${param.PriceSum }${param.priceAll } // 결제 금액
  
 
  /*결제위젯 영역 렌더링*/
  const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
  // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제
  paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount)
  
  /*약관 영역 렌더링*/
  const paymentAgreement = paymentWidget.renderAgreement('#agreement')
  
  /*결제창 열기*/
  document.querySelector("#payment-button").addEventListener("click",()=>{
    paymentWidget.requestPayment({
      orderId: '<%=orderNumber%>',
      orderName: '<%=name%>님의 주문',
      successUrl: 'http://localhost:5000/success',
      failUrl: 'http://localhost:5000/fail',
      customerEmail: '<%=email%>', 
      customerName: '<%=name%>'
      }).catch(function (error) {
          if (error.code === 'USER_CANCEL') {
          // 결제 고객이 결제창을 닫았을 때 에러 처리
          } if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
          }
      })  
  })


</script>

</html>