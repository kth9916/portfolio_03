<%-- 회원의 주문내역 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
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
<title>회원 관리</title>
<style type="text/css">
	a, a:hover{
		color: #000000;
		text-decoration: none;
	}
</style>
<script>
        setInterval(function(){
             
            var timer = new Date();
            var h = timer.getHours();
            var m = timer.getMinutes();
            var s = timer.getSeconds();
            if(s < 10){
				s = '0'+s;
			}
            document.getElementById('clock').innerHTML = h + "시" + m + "분" + s+ "초";
        },1000);
</script>
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
		<div class="gif_img">
			<a><img src="images2/highest yacht.jpg" width="230px" height="230px"></a>
			<div id="youngjin" style="width: 200px; height: 427px"></div>
		</div>
		<div class="contents4">
			<h2>전체 회원관리 페이지</h2>
			<p>관리자만 접근할 수 있는 전체 회원관리 페이지입니다.<br>가입된 회원들의 모든 정보가 표시되며 강제 회원탈퇴가 가능합니다.</p>
			<div style="display:flex;margin-top:-30px"><h2>현재시간을 표시합니다. </h2><h2 style="margin-left:30px;" id="clock"></h2></div>
		</div>
	</div>
	<div class="container" style="justify-content: center;">
		<div class="row" style="width:80%;">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
						<th style="background-color: #eeeeee; text-align: center;">이 름</th>
						<th style="background-color: #eeeeee; text-align: center;">성 별</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
						<th style="background-color: #eeeeee; text-align: center;">관리</th>
					</tr>
				</thead>
				<tbody>
					<%
					Class.forName("oracle.jdbc.OracleDriver");
					  
					Connection conn = null;
					PreparedStatement pstmt = null;
					Statement stmt = null; // SQL구문을 실행
					ResultSet rs = null;
			  
			      try
			      {
			    	  String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
						String dbID = "hr2";
						String dbPassword = "1234";
			   
			            String query = "select * from user1";
			   
			            // 2. 데이터베이스 커넥션 생성
			            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			   
			            // 3. Statement 생성
			            stmt = conn.createStatement();
			   
			            // 4. 쿼리 실행
			            rs = stmt.executeQuery(query);
			   
			            // 5. 쿼리 실행 결과 출력
			            while(rs.next())
			            {
					%>
					<tr>
						<td><%= rs.getString("userID") %></td>
						<td><%= rs.getString("userPassword") %></td>
						<td><%= rs.getString("userName") %></td>
						<td><%= rs.getString("userGender") %></td>
						<td><%= rs.getString("userEmail") %></td>
						<td style="text-align:center;"><a href="./process_admin_user.jsp?userid=<%= rs.getString("userID") %>" class="badge badge-danger">추방</a></td>
					</tr>
					<%
			            }
			      }catch(SQLException ex){
			            out.println(ex.getMessage());
			            ex.printStackTrace();
			      }finally{
			            // 6. 사용한 Statement 종료
			            if(rs != null) try { rs.close(); } catch(SQLException ex) {}
			            if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
			   
			            // 7. 커넥션 종료
			            if(conn != null) try { conn.close(); } catch(SQLException ex) {}
			      }
					%>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<jsp:include page="footer.jsp" />
</body>
</html>