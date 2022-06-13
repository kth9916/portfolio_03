<%-- 회원의 주문내역 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="checkorder.CheckorderDAO" %>
<%@ page import="checkorder.Checkorder" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">

<title>주문 목록</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<jsp:include page="nav.jsp" />
	<div class="service4" style="height: 230px;">
		<div class="gif_img" style="padding-top:20px;">
			<a><img src="images2/1.jpg" width="200px" height="200px"></a>
			<div id="youngjin" style="width: 200px; height: 427px"></div>
		</div>
		<div class="contents4">
			<h2><%=userID %>님의 주문목록</h2>
			<p><%=userID %>님의 주문목록 페이지입니다. JamesEdition을 이용해주셔서 감사합니다.<br>여러분의 소중한 인생의 따뜻한 쉼터가 되도록 노력하겠습니다.</p>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">배송지</th>
						<th style="background-color: #eeeeee; text-align: center;">주문시간</th>
						<th style="background-color: #eeeeee; text-align: center;">배송일</th>
						<th style="background-color: #eeeeee; text-align: center;">물품이름</th>
						<th style="background-color: #eeeeee; text-align: center;">물품가격</th>
						<th style="background-color: #eeeeee; text-align: center;">물품수량</th>
						<th style="background-color: #eeeeee; text-align: center;">합계가격</th>
					</tr>
				</thead>
				<tbody>
					<%
					CheckorderDAO checkorderDAO = new CheckorderDAO();
						ArrayList<Checkorder> list = checkorderDAO.getList(userID);
						for(int i = 0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getUserid() %></td>
						<td><%= list.get(i).getAddress() %></td>
						<td><%= list.get(i).getOrderdate() %></td>
						<td><%= list.get(i).getArrive() %></td>
						<td><%= list.get(i).getOjname() %></td>
						<td><%= list.get(i).getOjprice() %></td>
						<td><%= list.get(i).getOjqnt() %></td>
						<td><%= list.get(i).getSumprice() %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="row">
			<table style="width:100%">
				<tr>
					<td align="left"><a href="mainpage.jsp" class="btn btn-success">메인화면 가기</a></td>
					<td align="right"><a href="allproduct.jsp" class="btn btn-warning">쇼핑 계속하기</a></td>
					
				</tr>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>