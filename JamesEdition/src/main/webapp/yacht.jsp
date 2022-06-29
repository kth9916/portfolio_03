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
        <div class="banner">
            <div class="slider">
                <img src="images2/highest yacht.jpg" id="slideImg">
            </div>
            <div class="overlay">
                <div class="banner-content">
                    <h1>Luxury yacht</h1>
                    <h3>바다 위에서 소중한 사람과 행복한 추억을 남기세요 </h3>
                </div>
            </div>
        </div>
	<br><br>


    
    <%
	ProductDAO dao = ProductDAO.getInstance();
	ArrayList<Product> listOfProducts = dao.getProductList("Yacht");
	%>
        <br><br>
	<h1 style="text-align:center;">바다는 모든 생명의 어머니라고 불리죠. 가끔 그곳으로 위로를 받으러 가보는건 어떨까요?</h1><br>
	<h4 style="text-align:center;font-family : 'Hanna'">바다는 광대하고 위험합니다. 안전하고 럭셔리한 보트를 추천해요!</h4>


	<!--------- featured products ------------>
	
        <h1 class="title">Popular Products</h1>
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

    <!-- -------- slide banner --------  -->
    <script>
        var slideImg = document.getElementById("slideImg");

        var images = new Array(
        		"images2/highest yacht.jpg",
                "images2/product-21.webp",
                "images2/product-27.webp",
                "images2/product-14.webp"
            );

        var len = images.length;
        var i = 0;

        function slider(){
            if(i > len-1){
                i = 0;
            }
            slideImg.src = images[i];
            i++;
            setTimeout('slider()',3000);
        }

    </script>
</body>
</html>