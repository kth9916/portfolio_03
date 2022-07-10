<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">

<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
		<div class="row">
		<form method="post" action="writeAction.jsp" style="width:70%;">
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="from-control" placeholder="글 제목" name="bbsTitle" maxlength="50" style="width: 100%" ></td>
					</tr>
					<tr>
						<td><textarea class="from-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px; width:100%;" rows=10 cols=60 wrap=on></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기" style="width:300px; text-align: center;">
		</form>
		</div>
	
	<jsp:include page="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>