<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductDAO"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userID = session.getId();

	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	String shipping_birth = "";
	String shipping_cardname = "";
	
	Cookie[] cookies = request.getCookies();

	if (cookies != null) {
		for (int k = 0; k < cookies.length; k++) {
			Cookie thisCookie = cookies[k];
			String n = thisCookie.getName();
			if (n.equals("Shipping_cartId"))
				shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_birth"))
				shipping_birth = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_cardname"))
				shipping_cardname = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<title>결제 확인</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="service4" style="height: 80px;">
		<div class="contents4" style="text-align:center">
			<h2>결제 확인</h2>
			<p>결제 확인 페이지입니다. 영수증을 꼼꼼히 확인해주세요.<br>'주문' 버튼을 누르시면 결제가 완료됩니다.</p>
		</div>
	</div>

	<div class="container col-8 alert alert-info" style="border-width:20px;">
	<form action="./ordercomplete.jsp" method="post">
		<div class="text-center ">
			<h1>영수증</h1>
		</div>
		<div>
		<table class="table table-hover"><tr><td>
			<div class="col-4" align="left">
				<strong style="font-size:20px">결제 정보</strong> <br>
				성명 : <% out.println(shipping_cardname);%><br>
				카드사 : <% out.println(shipping_name); %>	<br> 
				카드 번호 : <%out.println(shipping_country);%> <br>
				카드 유효기간 : (<% 	out.println(shipping_zipCode);%>)<br>
				생년월일 : <%	out.println(shipping_birth);%><br>
			</div>
			</td><td><p>　　　　　　　　　　</td><td><p>　　　　　　　　　　</td><td style="float:left;">
			<div class="col-4" align="left">
				<strong style="font-size:20px">배송 정보</strong> <br>
				수신인 : <% out.println(shipping_name);%><br>
				배송지 : <%	out.println(shipping_addressName);%><br>
				배송일 : <%	out.println(shipping_shippingDate);%>
			</div>
			</td>
		</tr>
		
		
						
			<tr>
				<th class="text-center">물품 이름</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">총 가격</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total = product.getUnitPrice() * product.getQuantity();
					sum = sum + total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=product.getUnitPrice()%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>
			
				<a href="./shippingInfo.jsp?userID=<%=shipping_cartId%>"class="btn btn-warning" role="button" style="width:30%; text-align:center;"> 이전 </a>
				<input	type="submit"  class="btn btn-success" value="주문" style="width:30%; text-align:center;"/>
				<a href="./main.jsp" class="btn btn-danger"	role="button" style="width:30%; text-align:center;"> 취소 </a>			
		</div>
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>
