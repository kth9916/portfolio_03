<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JamesEdition | The World's Luxury Marketplace</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
</head>
<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
<nav class="navbar navbar-default">

        <div class="container-logo" id="bs-example-navbar-collapse-1">
            <div class="navbar">
                <div class="logo">
                    <a href="mainpage.jsp"><img src="images2/logo3.png" width="180px" height="50px" alt="로고"></a>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="allproduct.jsp">All products</a></li>
                        <li><a href="real_estate.jsp">Real Estate</a></li>
                        <li><a href="car.jsp">Cars</a></li>
                        <li><a href="yacht.jsp">Yachts</a></li>
                        <li><a href="jet.jsp">Jets</a></li>
                        <li><a href="bbs.jsp" class="menu-r">Board</a>   </li>
                    </ul>
                </nav>
     
            </div>   
        </div>
		<%
				if(userID == null) {	
			%>
			<nav class="right-box">
			<ul>
			<li><a href="login.jsp" class="menu-r">로그인</a></li>
			<li><a href="join.jsp" class="menu-r">회원가입</a></li>
			</ul>
			</nav>
			
		<%
				} else {

				if(userID.equals("admin")) {	
			%>
			
			<nav class="right-box">
			<ul>
			<li><a href="admin_order.jsp" style="color:red;">전체회원 주문내역</a></li>
			<li><a href="admin_user.jsp" style="color:red;">전체회원 정보내역</a></li>
			<li><a href="register-form.jsp" style="color:red;">상품 등록</a></li>
			</ul>
			</nav>
			

			<%
				}
			%>
			<nav style="margin-top:-20px;">
			<%= userID %>님
			<a href="logoutAction.jsp" class="menu-r" style="text-align:right;"><h2>Logout</h2></a>
			<a href="checkorder.jsp" class="menu-r" style="margin-left:20px;text-align:right;">Order</a>
			</nav>
			
		<%
				}
			%>
			<a href="cart.jsp"><img src="images2/bookmark-regular.svg" width="40px" height="30px"></a>
                <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
	
</nav>