<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

    <title>JamesEdition | The World's Luxury Marketplace</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a533d3691d.js" crossorigin="anonymous"></script>
    <script src="js/jquery-1.11.0.min.js"></script>
    
</head>
<body>
<jsp:include page="nav.jsp" />
  <section class="contact">
            <div class="content">
                <h2>상품 등록창</h2>
                <p style="margin-top: 10px; color: red; font-weight: bold;">상품을 등록할때에는 정신을 차리고 집중해서 하자! </p>
            </div>
            <div class="container">
                <div class="contactform">
                   <form action="pwrite.do" method="post" enctype="multipart/form-data" onsubmit="return validateForm(this)">
			<h3>상품등록</h3>
			<br><br>
			<input type="hidden" name="command" value="register"> 
			상품명 <input type="text" name="pname" required="required"><br>
			가격 <input type="text" name="unitPrice" required="required"><br>
			설명 <input type="text" name="description" required="required"><br>
			제조사 <input type="text" name="manufacturer" required="required"><br>
			카테고리<br> <br><SELECT name=category size=1 >
				     <OPTION value=RealEstate>Real Estate
				     <OPTION value=Car>Super Car	
				     <OPTION value=Yacht>Luxury Yachts
				     <OPTION value=Jet>Great Jets
				   </SELECT><br><br>
			이미지 파일명 <input type="file" name="ofile1""><br>
			이미지 파일명 <input type="file" name="ofile2""><br>
			이미지 파일명 <input type="file" name="ofile3""><br>
			이미지 파일명 <input type="file" name="ofile4""><br>
			이미지 파일명 <input type="file" name="ofile5""><br>
			 장바구니에 담은 개수<input type="number" name="quantity" required="required"><br>
			<input type="submit" value="등록하기"><br>
		</form>
                </div>
            </div>
        </section>

	<jsp:include page="footer.jsp" />
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>