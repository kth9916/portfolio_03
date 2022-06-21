<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductDAO"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JamesEdition | The World's Luxury Marketplace</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
    <script src="js/jquery-1.11.0.min.js"></script>

<%@page import="java.sql.*"%>

<title>장바구니</title>
<%
String userID = null;
if (session.getAttribute("userID") != null) {
	userID = (String) session.getAttribute("userID");
}
%>
</head>
<%
String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
String dbID = "hr2";
String dbPassword = "1234";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
// 1) JDBC 드라이버 로딩
Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

String SQL = "delete from cart where user = ?";
pstmt = conn.prepareStatement(SQL);
pstmt.setString(1,userID);
pstmt.executeUpdate();

%>
<body>
	<jsp:include page="nav.jsp" />

	<div class="small-container cart-page">

	<div>
			<h2><%=userID %>님의 장바구니</h2>
			<p>주문이 완료되면 여러분이 등록하신 번호로 상담 예약이 잡힙니다. 그 점 참고해서 주문해주세요.</p>
	</div>
	
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
    <table>
        <tr>
            <th>Product</th>
            <th>Quantitiy</th>
            <th>Subtotal</th>
        </tr>

        <tr>
            <td><a href="./product.jsp?id=<%=product.getProductId()%>">
                    <div class="cart-info">
                        <img src ="./uploads/<%=product.getOfile1()%>" style="width: 80px; height:80px;">
                        <div>
                            <p><%=product.getPname()%></p>
                            <small><%=product.getUnitPrice() %></small>
                            <br>
                            <a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a>
                            <a href="./product.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">상품 다시보기</a>
                            
                        </div>
                    </div>
                </a>
            </td>
            <td><%=product.getQuantity()%></td>
            <td><%=total%></td>
        </tr>
    </table>

<%
				
					    
		
					    // 1) JDBC 드라이버 로딩
					    Class.forName("oracle.jdbc.OracleDriver");
						String SQL_in = "INSERT INTO cart VALUES (?, ?, ?, ?,?)";
							pstmt = conn.prepareStatement(SQL_in);
							pstmt.setString(1,product.getPname());
							pstmt.setInt(2,product.getUnitPrice());
							pstmt.setInt(3,product.getQuantity());
							pstmt.setInt(4,total);
							pstmt.setString(5,userID);
							pstmt.executeUpdate();
					}
				%>

    <div class="total-price">
        <table>
            <tr>
                <td>Total</td>
                <td><h2><%=sum%></h2></td>
                <td><a href="./shippingInfo.jsp?userID=<%= userID %>" class="btn2" style="height:90px;">주문하기</a></td>
                <td><a href="./deleteCart.jsp?cartId=<%=userID%>" class="btn2" style="height:90px;">전체삭제</a></td>
				<td><a href="./mainpage.jsp" class="btn2" style="height:90px;">계속쇼핑</a></td>
            </tr>
        </table>

    </div>

</div>
	



	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
