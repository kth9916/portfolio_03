<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/style.css">
<title>카드 결제</title>
<script type="text/javascript">
function cancel() {
	if (confirm("결제를 취소하시겠습니까?")) {
		document.addForm.submit();
	} else {		
		document.addForm.reset();
	}
}
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	
	<section class="contact">
            <div class="content">
                <h2>Contact Seller</h2>
                <p style="margin-top: 10px; color: red; font-weight: bold;"><h2>카드 결제</h2><br>
			카드 결제 페이지입니다. 카드 정보를 정확히 입력해주세요.<br>개인정보 보호법에 의해 카드정보를 저장하지 않으니 안심하세요.</p>
			</div>
            <div class="container">
                <div class="contactinfo">
                    <div class="box">
                        <div class="icon"><i class="fa-solid fa-location-dot"></i></div>
                        <div class="text">
                            <h3>Address</h3>
                            <p><h2>161, Sajik-ro, Jongno-gu, <br> Seoul, Republic of Korea</h2></p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon"><i class="fa-solid fa-phone"></i></div>
                        <div class="text">
                            <h3>Phone</h3>
                            <p><h2>010-1234-5678</h2></p>
                        </div>
                    </div>
                    <div class="box">
                        <div class="icon"><i class="fa-solid fa-envelope"></i></div>
                        <div class="text">
                            <h3>Email</h3>
                            <p><h2>rlaxogudsla2@gmail.com</h2></p>
                        </div>
                    </div>
                </div>
                <div class="contactform">
                    <form action="./processShippingInfo.jsp" class="form-horizontal" method="post" style="border-style: solid;padding:20px;">
						<input type="hidden" name="cartId" value="<%=request.getParameter("userID")%>" />
						<div class="form-group row">
							<label class="col-sm-2">카드사 선택</label>
							<div class="col-sm-3">
								<select name="name" class="form-control">
									<option value='' selected>-- 선택 --</option>
									<option value='BC'>BC카드</option>
									<option value='KB'>KB국민카드</option>
									<option value='삼성'>삼성카드</option>
									<option value='신한'>신한카드</option>
									<option value='우리'>우리카드</option>
									<option value='하나'>하나카드</option>
									<option value='롯데'>롯데카드</option>
									<option value='현대'>현대카드</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">카드주 이름</label>
							<div class="col-sm-3">
								<input name="cardname" type="text" class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">카드 번호</label>
							<div class="col-sm-3">
								<input name="country" type="text" class="form-control" placeholder="(XXXX-XXXX-XXXX-XXXX)" maxlength="50"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">유효기간</label>
							<div class="col-sm-3">
								<input name="zipCode" type="text" class="form-control" placeholder="(MM/YY)"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">생년월일 앞자리</label>
							<div class="col-sm-3">
								<input name="birth" type="text" class="form-control" placeholder="ex) 970124" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">수신인</label>
							<div class="col-sm-3">
								<input name="name" type="text" class="form-control"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">주소</label>
							<div class="col-sm-3">
								<input name="addressName" type="text" class="form-control" />
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2">배송일</label>
							<div class="col-sm-3">
								<input name="shippingDate" type="text" class="form-control" placeholder="ex) XXXX-XX-XX"/>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-10 " style="width:130px;" >
								<a href="./cart.jsp>" class="btn btn-secondary" role="button" style="text-align: center;">  이전으로</a> 
								<input	type="submit" class="btn btn-primary" value="등록" />
								<a href="main.jsp"  class="btn btn-info" onclick="cancel()"  style="text-align: center;">취소하기</a> 
							</div>
						</div>
					</form>
                </div>
            </div>
        </section>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>
