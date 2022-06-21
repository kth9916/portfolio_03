<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dto.ProductDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/style.css">

<title>상품 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {		
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	
	<%
		String id = request.getParameter("id");
		ProductDAO dao = ProductDAO.getInstance();
		Product product = dao.findProductById(id);
	%>
	
	<!-- --------  single product details ----------  -->
<div class="ppage">
    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
            <img src="./uploads/<%=product.getOfile1()%>" style="width: 100%" id="ProductImg">
                <div class="small-img-row">
                    <div class="small-img-col">
                        <img src="./uploads/<%=product.getOfile2()%>"  width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="./uploads/<%=product.getOfile3()%>" width="100%" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="./uploads/<%=product.getOfile4()%>" class="small-img">
                    </div>
                    <div class="small-img-col">
                        <img src="./uploads/<%=product.getOfile5()%>" width="100%" class="small-img">
                    </div>
                </div>
            </div>
            <div class="col-2">
            <form name="addForm" action="./addCart.jsp?id=<%=product.getProductId()%>" method="post">
                <div class="p-center">
                <%=product.getProductId() %> / <p><%=product.getManufacturer() %> / <%=product.getCategory() %></p>
                <h2><%=product.getPname() %></h2>
                <h4><%=product.getUnitPrice() %></h4>
                <p><b>수량</b><input type="text" name="count" value="1" size="3" >
                <a href="#" class="btn btn-info" onclick="addToCart()" style="width:160px; text-align:center;">Add To cart</a> 
                <a href="./cart.jsp" class="btn" style="width:160px; text-align:center;">go To cart</a>
                <a href="mainpage.jsp" class="btn" style="width:160px; text-align:center;">상품 목록</a>
                </div>
                <h3>Product Details <i class="fa-solid fa-indent"></i></h3>
                <br><br>
                <%=product.getDescription() %>
                
               </form>
            </div>
        </div>
    </div>
</div>
		
<!-- ------- title -------  -->
    <div class="small-container">
        <div class="row row-2">
            <h2>Related Products</h2>
            <a href="mainpage.jsp"><p>View More</p></a>
        </div>
    </div>
<!-- ------ products ---------  -->
	
	 <%
	ArrayList<Product> listOfProducts = dao.getProductList(product.getCategory());
	%>
<!-- ------ products ---------  -->
		<div class="container">
        <div class="row" align="center">
			<%
				for (int i = 0; i < 4; i++) {
					Product product2 = listOfProducts.get(i);
					
					
					
			%>

			<div class="col-4">
				<a href="./product.jsp?id=<%=product2.getProductId()%>"><img src ="./uploads/<%=product.getOfile1()%>" style ="width: 80%"> </a>
                <a href="./product.jsp?id=<%=product2.getProductId()%>"><h4><%=product2.getPname() %></h4></a>
                <div class="rating">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star-half-stroke"></i>
                </div>
                <p><%=product2.getUnitPrice() %></p>
			</div>

			<%
				}
			%>
		</div>
    </div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<jsp:include page="footer.jsp" />
	<!-- --------- js for toggle menu -----------  -->
    <script>
        var MenuItems = document.getElementById("MenuItems");

        MenuItems.style.maxHeight = "0px";

        function menutoggle(){
            if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                 } 
            else 
                {
                MenuItems.style.maxHeight = "0px";
                }
        }
    </script>

<!-- -------- js for product gallery --------  -->

    <script>
        var ProductImg = document.getElementById("ProductImg")
        var SmallImg = document.getElementsByClassName("small-img")

        SmallImg[0].onclick = function()
        {
            ProductImg.src = SmallImg[0].src;
        }
        SmallImg[1].onclick = function()
        {
            ProductImg.src = SmallImg[1].src;
        }
        SmallImg[2].onclick = function()
        {
            ProductImg.src = SmallImg[2].src;
        }
        SmallImg[3].onclick = function()
        {
            ProductImg.src = SmallImg[3].src;
        }
    </script>
	
</body>
</html>
