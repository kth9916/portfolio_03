<%-- 결제내역이 데이터베이스로 이동하는 부분 --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductDAO"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.*"%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<%
	request.setCharacterEncoding("UTF-8");
	
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
	
	String today = sf.format(nowTime);
	
	


	String userID = null;
	if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}

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
		for (int i = 0; i < cookies.length; i++) {
			Cookie thisCookie = cookies[i];
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
	String address = shipping_addressName;
	String shippingDate = shipping_shippingDate;
%>
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<title>결제완료</title>
</head>
<body>
<jsp:include page="nav.jsp" />
<div class="col-4" align="left">
				<strong style="font-size:20px">결제 정보</strong> <br>
				성명 : <% out.println(shipping_cardname);%><br>
				카드사 : <% out.println(shipping_name); %>	<br> 
				카드 번호 : <%out.println(shipping_country);%> <br>
				카드 유효기간 : (<% 	out.println(shipping_zipCode);%>)<br>
				생년월일 : <%	out.println(shipping_birth);%><br>
				수신인 : <% out.println(shipping_name);%><br>
				배송지 : <%	out.println(shipping_addressName);%><br>
				배송일 : <%	out.println(shipping_shippingDate);%><br>
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
			
				물품 이름 : <%=product.getPname()%><br>
				물품 수량 : <%=product.getQuantity()%><br>
				물품 가격 : <%=product.getUnitPrice()%>원<br>
				합계가격 : <%=total%>원<br>
				총가격 : <%=sum %><br>
				배송지 : <%=address %><br>
				배송일 : <%=shippingDate %>
				현재시간 : <%= sf.format(nowTime) %>
			<%
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "hr2";
			String dbPassword = "1234";

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			// 1) JDBC 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			// 2) DB연결(DB url, DB id, DB pw)
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
			/* DB 
			TABLE order1(
			userid varchar(20),
			address varchar(50),
			arrive varchar(20),
			ojname varchar(20),
			ojprice int,
			ojqnt int,
			sumprice int,
			totalprice int);*/
		 // JDBC 참조 변수 준비
				String SQL_in = "INSERT INTO order1 VALUES (?, ?, default, ?, ?, ?, ?, ?, ?)";
					pstmt = conn.prepareStatement(SQL_in);
					pstmt.setString(1,userID);		//이게 문제임 이거 안댐
					pstmt.setString(2,address);
					pstmt.setString(3,shippingDate);
					pstmt.setString(4,product.getPname());
					pstmt.setInt(5,product.getUnitPrice());
					pstmt.setInt(6,product.getQuantity());
					pstmt.setInt(7,total);
					pstmt.setInt(8,sum);
					pstmt.executeUpdate();
			
				}
				response.sendRedirect("checkorder.jsp");
			%>
			</div>