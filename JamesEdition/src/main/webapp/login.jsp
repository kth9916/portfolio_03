<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<title>JSP 게시판 웹사이트</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
		<div class="container">
			 <div class="account-page">
			    <div class="container">
			        <div class="row">
			            <div class="col-2">
			                <img src="images2/loginlogo.png" width="100%">
			            </div>
			            <div class="col-2">
			                <div class="form-container">
			                <div id="status">
			                    <form id="LoginForm" method="post" action="loginAction.jsp">
			                        <input name="userID" size="20" maxlength="20" type="text" placeholder="6~16자 ID">
			                        <input name="userPassword" size="20" type="password" placeholder="6~16자 Password" maxlength="20">
									<input type="submit" class="btn btn-primary form-control" value="로그인">
									<h5 style="text-align: center;">계정이 없으신가요?</h5>
									<p style="text-align: center;"><a href="join.jsp" class="btn btn-warning form-control" role="button">회원가입</a></p>
			                    </form>
			                   </div>
			                </div>
			            </div>
			        </div>
			    </div>
		 </div>
		</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<jsp:include page="footer.jsp" />

</body>
</html>