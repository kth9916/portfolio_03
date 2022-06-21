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
	<%@ include file="nav.jsp" %>
	 <div class="banner">
            <div class="slider">
                <img src="images2/highest home.jpg" id="slideImg">
            </div>
            <div class="overlay">
                <div class="banner-content">
                    <h1>The World's Luxury Market</h1>
                    <h3>당신이 위대함을 추구한다면, 그 원대한 목적지로 삼을 수 있는 곳을 제공합니다.</h3>
                    <div class="container-search">
                        <a href="allproduct.jsp"><button type="button">더 보기</button></a>
                    </div>
                </div>
            </div>
        </div>
	<br><br>
	<h1 style="text-align:center;">찬란한 인생을 살아가는 본인 스스로에게 선물하시는 것은 어떠십니까?</h1><br>
	<h4 style="text-align:center;font-family : 'Hanna'">당신을 위한 최고의 선물을 준비했습니다.</h4>

	<!--------- featured categories ------------>    


    <div class="categories">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <a href="real_estate.jsp"><img src="images2/category-1.jpg"></a>
                    <a href="real_estate.jsp"><h2>Real Estate</h2></a>
                </div>
                <div class="col-3">
                    <a href="car.jsp"><img src="images2/category-2.jpg"></a>
                    <a href="car.jsp"><h2>Super Cars</h2></a>
                </div>
                <div class="col-3">
                    <a href="yacht.jsp"><img src="images2/category-3.jpg"></a>
                    <a href="yacht.jsp"><h2>Yachts</h2></a>
                </div>
                <div class="col-3">
                    <a href="jet.jsp"><img src="images2/category-4.jpg"></a>
                    <a href="jet.jsp"><h2>Jets</h2></a>
                </div>
            </div>
        </div>
    </div>
    
    
    <%
	ProductDAO dao = ProductDAO.getInstance();
	ArrayList<Product> listOfProducts = dao.getAllProductList();
	%>
        <br><br>
	<h1 style="text-align:center;">성공한 사람들은 어떤 물건을 사용할까요?</h1><br>
	<h4 style="text-align:center;font-family : 'Hanna'">그들이 가장 많이 사용한 물건들을 살펴보세요</h4>


	<!--------- featured products ------------>
	
        <h1 class="title">Popular Products</h1>
     	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < 4; i++) {
					Product product = listOfProducts.get(i);
					
			%>
			<div class="col-md-4">
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
		</div>
		<hr>
	</div>
	
	   
        <br><br><br>
		<h1 style="text-align:center;">이번에 새로이 등록된 상품들입니다.</h1><br>
		<h4 style="text-align:center;font-family : 'Hanna'">남들보다 빠르게 둘러보세요!!</h4>
        <h1 class="title">New & Trending</h1>
        
	<div class="container">
		<div class="row" align="center">
			<%
				for (int i = 0; i < 8; i++) {
					Product product = listOfProducts.get(i);
					
			%>
			<div class="col-md-4">
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
		</div>
		<hr>
	</div>
        

    <!----------- offer ----------- -->
    <div class="offer">
        <div class="small-container">
            <div class="row">
                <div class="col-2">
                    <img src="images2/exculsive3.png" class="offer-img">
                </div>
                <div class="col-2">
                    <p style="font-weight: bold;font-size: large;" >세상에서 가장 가치 있는 것을 모아 놓은 곳</p>
                    <h1>JamesEdition</h1>
                    <h4>앞만 보고 몰두하며 달려 드디어 꼭대기가 보인다고 느껴졌을 때<br> 정신 없이 달려왔던 다리 <br> 무거운 짐을 지느라 축처진 어깨<br>땀에 흠뻑 젖어 있는 자신에게 트로피를 선물하세요<h4>
                    <a href="" class="btn">선물하기 &nbsp;&#8594;</a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ------ testimonial ------- -->
    <div class="testimonial">
        <div class="small-container">
            <div class="row">
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>인생에서 공짜로 얻은 건 하나도 없다. 드리블, 슈팅, 컨디션, 부상 방지 등은 전부 죽어라 노력해 얻은 결과물이라 믿는다. </p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="images2/수정됨_user-1.jpg">
                    <h3>Heung-min Son</h3>
                </div>
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>처음부터 겁먹지 말자. 막상 가보면 아무것도 아닌게 세상엔 참으로 많다.</p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="images2/수정됨_user-2.jpg">
                    <h3>Yu-na Kim</h3>
                </div>
                <div class="col-3">
                    <i class="fa-solid fa-quote-left"></i>
                    <p>남들과 똑같이 해서는 살아남을 수 없었다. 완벽주의는 내게 불가피한 선택이었다. 쓰러질지언정 무릎은 꿇지 않았다.</p>
                    <div class="rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star-half-stroke"></i>
                    </div>
                    <img src="images2/수정됨_user-3.jpg">
                    <h3>Ji-sung Park</h3>
                </div>
            </div>
        </div>
    </div>
    
    <!-- --------------- brands --------------  -->
    <div class="brands">
        <div class="small-container">
            <div class="row">
                <div class="col-5">
                    <img src="images/logo-philips.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-paypal.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-godrej.png">
                </div>
                <div class="col-5">
                    <img src="images2/수정됨_logo-cnbc.png">
                </div>
                <div class="col-5">
                    <img src="images/logo-coca-cola.png">
                </div>
            </div>
        </div>
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
                "images2/highest home.jpg",
                "images2/highest car.jpg",
                "images2/highest jet.jpg",
                "images2/highest yacht.jpg"
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