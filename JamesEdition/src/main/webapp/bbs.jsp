<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<title>JSP 게시판 웹사이트</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%
	int pageNumber = 1;
	if (request.getParameter("pageNumber") !=null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<jsp:include page="nav.jsp" />
	
	<div class="service4" style="height: 230px;">
		<div class="gif_img">
			<a><img src="images2/highest car.jpg" width="230px" height="230px"></a>
			<div id="youngjin" style="width: 200px; height: 427px"></div>
		</div>
		<div class="contents4">
			<h2>JamesEdition Board</h2>
			<p>회원간의 자유로운 소통이 가능한 공간입니다. 문의사항 또는 건의사항을 입력해주시면<br>답변해드리겠습니다.<br>회원간의 비방이나 욕설은 관리자에의해 삭제될 수 있습니다.</p>
		</div>
	</div>
	
	<div class="container" style="justify-content: center;">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:2000px;">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i< list.size(); i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td style="text-align:center;"><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<%	
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1) {	
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			<br><br>
			
		</div>
		
	</div>
	<div id="wrapper">
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	

	%>
	<a href="write.jsp" class="btn btn-primary">글쓰기</a>
	<%} %>

	</div>
	<%@ include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>