<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductDAO" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JamesEdition | The World's Luxury Marketplace</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
</head>
<body onload="slider()">
	<jsp:include page="nav.jsp" />
    
    <%
	ProductDAO dao = ProductDAO.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProductList();
	%>
        <br><br>
	<h1 style="text-align:center;">고생한 당신에게 휴식을 선사하세요</h1><br>
	<h4 style="text-align:center;font-family : 'Hanna'">고객의 니즈를 위해 최대한 많은 상품을 준비해봤습니다.</h4>


	<!--------- featured products ------------>
	
        <h1 class="title">All Products</h1>
     	<div class="container">
			<%
					for (int i = 0; i < listOfProducts.size(); i++) {
						Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4" style="width:20%; float:left; margin-left:100px;">
				<a href="./product.jsp?id=<%=product.getProductId()%>"><img src ="./uploads/<%=product.getOfile1()%>" style ="width: 80%"> </a>
                <a href="./product.jsp?id=<%=product.getProductId()%>"><h4><%=product.getPname() %></h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star-half-stroke"></i>
                </div>
                <p><%=product.getUnitPrice() %></p>
			</div>
			<%
				}
			%>
		<hr>
	</div>

    <jsp:include page="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<!-- --------- js for toggle menu -----------  -->
    <script>
        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "300px";
                 } 
            else 
                {
                MenuItems.style.maxHeight = "0px";
                }
        }
    </script>

   
</body>
</html>