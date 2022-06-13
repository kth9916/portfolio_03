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
			                <img src="images2/image1.png" width="100%">
			            </div>
			            <div class="col-2">
			                <div class="form-container">
			                <div id="status">
			                    <form id="JoinForm" method="post" action="joinAction.jsp">
			                        <input name="userID" size="20" maxlength="20" type="text" placeholder="6~16자 ID">
			                        <input name="userPassword" size="20" type="password" placeholder="6~16자 Password" maxlength="20">
			                        <input name="userName" size="20" type="text" placeholder="Name" maxlength="20">
			                        <input name="userEmail" size="20" type="email" placeholder="E-mail" maxlength="50">
			                        <div class="form-group" style="text-align: center;">
				                        <div class="btn-group" data-toggle="buttons">
											<label class="btn btn-primary active" style="width:114px">
												<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
											</label>
											<label class="btn btn-primary" style="width:114px">
												<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
											</label>
										</div>
										
			                      	
									</div>
									<input type="submit" class="btn btn-primary form-control" value="회원가입">
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