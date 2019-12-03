<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="db_connection.jsp" %>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminPage</title>
<link
      href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700"
      rel="stylesheet"
    />

    <!-- Animate.css -->
    <link rel="stylesheet" href="css/animate.css" />
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="css/icomoon.css" />
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="css/bootstrap.css" />

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="css/magnific-popup.css" />

    <!-- Flexslider  -->
    <link rel="stylesheet" href="css/flexslider.css" />

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="css/owl.carousel.min.css" />
    <link rel="stylesheet" href="css/owl.theme.default.min.css" />

    <!-- Date Picker -->
    <link rel="stylesheet" href="css/bootstrap-datepicker.css" />
    <!-- Flaticons  -->
    <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css" />

    <!-- Theme style  -->
    <link rel="stylesheet" href="css/style.css" />

    <!-- Modernizr JS -->
    <script src="js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<jsp:useBean  id = "login_user" class = "beans.Account" scope="session"/>
	<jsp:useBean  id = "customer" class = "beans.Customer" scope = "session"/>

	<%! 
	    static final String selectReservationQuery = "select * from `hoteldb`.`reservation`";
	    static final String selectRegisterAllQuery = "select * from `hoteldb`.`account`";
        static final String selectContactAllQuery = "select * from `hoteldb`.`question`";
        static final String selectReviewAllQuery = "select * from `hoteldb`.`review`";
	%>
		
	<div id="tab"class="container">
		<div>
	        <h2><a href="adPage.jsp" style="color: black;">AdminPage</a></h2>
	    </div>
    	<ul class="nav nav-tabs">
    		<li class="active">
    			<a href="#1a" data-toggle="tab">회원정보 조회</a>
    		</li>
    		<li>
    			<a href="#2a" data-toggle="tab">전체 예약 확인</a>
    		</li>
    		<li>
    			<a href="#3a" data-toggle="tab">후기 게시판 관리</a>
    		</li>
    		<li>
    			<a href="#4a" data-toggle="tab">문의 관리</a>
    		</li>
    	</ul>
    	<div class="tab-content clearfix">
			<div class="tab-pane active animate-box"" id="1a">
				<h2>회원정보 조회</h2>
				<div class="pull-right" style="width:auto">
					<form action="#">
						<input type="text" name="user_search" placeholder="회원 검색" style="width:150px;height:30px">
						<input type="submit" name="search" class=" btn-success" value="검색" style="width:80px height:auto;">
					</form>
				</div>	
				<div>				
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">회원이름</th>
								<th scope="col">계정명</th>
								<th scope="col">이메일</th>
								<th scope="col">연락처</th>
								<th scope="col">가입일자</th>
								<th scope="col">예약여부</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>

							<%
							{

								conn = DriverManager.getConnection(url, user, password);

								
								ResultSet rs = null;			
								PreparedStatement pstmt = null;

								try 
								{				
									pstmt = conn.prepareStatement(selectRegisterAllQuery);
									
									rs = pstmt.executeQuery();
	
									while (rs.next()) 
									{
							%>
							<tr>
									<td><%= rs.getString("name")%></td>
									<td><%=rs.getString("id") %></td>
									<td><%=rs.getString("email") %></td>
									<td><%=rs.getString("phone") %></td>
									<td><%=rs.getString("generated_date") %></td>
									<td>True or False</td>
									<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="">삭제</a></td>
							</tr>
							<% 
									}
								} 
								catch (SQLException ex) 
								{
									out.println("Account 테이블 호출이 실패했습니다.<br>");
									out.println("SQLException: " + ex.getMessage());
								} 
								finally 
								{
									if (rs != null)
										rs.close();
									if (pstmt != null)
										pstmt.close();
									if (conn != null)
										conn.close();
								}
							}
							%>	

						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane animate-box"" id="2a">
				<h2>전체 예약 확인</h2>
				<div class="pull-right" style="width:auto">
					<form action="#">
						<input type="text" name="reservation_search" placeholder="예약 검색" style="width:150px;height:30px">
						<input type="submit" name="search" class=" btn-success" value="검색" style="width:80px height:auto;">
					</form>
				</div>
				<div>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">예약날짜</th>
								<th scope="col">객실종류</th>
								<th scope="col">예약자</th>
								<th scope="col">숙박인원</th>
								<th scope="col">연락처</th>
								<th scope="col">이메일</th>
								<th scope="col">체크인날짜</th>
								<th scope="col">체크아웃날짜</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
							<%
							{
                            conn = DriverManager.getConnection(url, user, password);

							ResultSet rs = null;			
							PreparedStatement ppstmt = null;

							try 
							{				
								ppstmt = conn.prepareStatement(selectReservationQuery);
								
								rs = ppstmt.executeQuery();

								while (rs.next()) 
								{
							%>
							
							<tr>
								<td><%=rs.getString("generated_date") %></td>
								<td><%=rs.getString("roomtype") %></td>
								<td><%=rs.getString("name") %></td>
								<td><%=rs.getString("guests") %></td>
								<td><%=rs.getString("phone") %></td>
								<td><%=rs.getString("email") %></td>
								<td><%=rs.getString("checkindate")%></td>
								<td><%=rs.getString("checkoutdate") %></td>
								<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="">삭제</a></td>
							</tr>
							<% 
							}
							} 
							catch (SQLException ex) 
							{
								out.println("Member 테이블 호출이 실패했습니다.<br>");
								out.println("SQLException: " + ex.getMessage());
							} 
							finally 
							{
								if (rs != null)
									rs.close();
								if (ppstmt != null)
									ppstmt.close();
								if (conn != null)
									conn.close();
							}
							}
							%>						
							<tr>
								<td>2019-11-06</td>
								<td>Suite</td>
								<td>홍길동</td>
								<td>2</td>
								<td>010-1234-1234</td>
								<td>asdsa@naver.com</td>
								<td>2019-11-28</td>
								<td>2019-12-01</td>
								<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="">삭제</a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane animate-box"" id="3a">
				<h2>후기 게시판 관리</h2>
				<div class="pull-right" style="width:auto">
					<form action="#">
						<input type="text" name="review_search" placeholder="후기 검색" style="width:150px;height:30px">
						<input type="submit" name="search" class=" btn-success" value="검색" style="width:80px height:auto;">
					</form>
				</div>
				<div>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">후기번호</th>
								<th scope="col">제목</th>
								<th scope="col">객실 종류</th>
								<th scope="col">내용</th>
								<th scope="col">점수</th>
								<th scope="col">작성자</th>
								<th scope="col">작성날짜</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
                        <%
							{
                            conn = DriverManager.getConnection(url, user, password);

							ResultSet rs = null;			
							PreparedStatement ppstmt = null;

							try 
							{				
								ppstmt = conn.prepareStatement(selectReviewAllQuery);
								
								rs = ppstmt.executeQuery();

								while (rs.next()) 
								{
							%>
							<tr>
								<td><%=rs.getString("title") %></td>
								<td><%=rs.getString("id") %></td>
                                <td><%=rs.getString("message") %></td>
                                <td><%=rs.getString("score") %></td>
                                <td><%=rs.getString("score") %></td>// 다른걸로 채워야함.
                                <td><%=rs.getString("score") %></td>// 다른걸로 채워야함.
								<td><%=rs.getString("generated_date") %></td>
								<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="">삭제</a></td>
							</tr>
							<% 
							}
							} 
							catch (SQLException ex) 
							{
								out.println("Member 테이블 호출이 실패했습니다.<br>");
								out.println("SQLException: " + ex.getMessage());
							} 
							finally 
							{
								if (rs != null)
									rs.close();
								if (ppstmt != null)
									ppstmt.close();
								if (conn != null)
									conn.close();
							}
							}
						%>	
						</tbody>
					</table>
				</div>
			</div>
			<div class="tab-pane animate-box" id="4a">
				<h2>문의 관리</h2>
				<div class="pull-right" style="width:auto">
					<form action="#">
						<input type="text" name="question_search" placeholder="문의 검색" style="width:150px;height:30px">
						<input type="submit" name="search" class=" btn-success" value="검색" style="width:80px height:auto;">
					</form>
				</div>
				<div>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">작성자</th>
								<th scope="col">문의 주제</th>
								<th scope="col">이메일</th>
								<th scope="col">문의내용</th>
								<th scope="col">작성날짜</th>
								<th scope="col">비고</th>
							</tr>
						</thead>
						<tbody>
                        <%
							{
                            conn = DriverManager.getConnection(url, user, password);

							ResultSet rs = null;			
							PreparedStatement ppstmt = null;

							try 
							{				
								ppstmt = conn.prepareStatement(selectContactAllQuery);
								
								rs = ppstmt.executeQuery();

								while (rs.next()) 
								{
							%>
							
							<tr>
								<td><%=rs.getString("name") %></td>
								<td><%=rs.getString("email") %></td>
								<td><%=rs.getString("subject")%></td>
                                <td><%=rs.getString("message")%></td>
								<td><%=rs.getString("generated_date") %></td>
								<td><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="">삭제</a></td>
							</tr>
							<% 
							}
							} 
							catch (SQLException ex) 
							{
								out.println("Member 테이블 호출이 실패했습니다.<br>");
								out.println("SQLException: " + ex.getMessage());
							} 
							finally 
							{
								if (rs != null)
									rs.close();
								if (ppstmt != null)
									ppstmt.close();
								if (conn != null)
									conn.close();
							}
							}
						%>	
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    <!-- jQuery Easing -->
    <script src="js/jquery.easing.1.3.js"></script>
    <!-- Bootstrap -->
    <script src="js/bootstrap.min.js"></script>
    <!-- Waypoints -->
    <script src="js/jquery.waypoints.min.js"></script>
    <!-- Flexslider -->
    <script src="js/jquery.flexslider-min.js"></script>
    <!-- Owl carousel -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- Magnific Popup -->
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/magnific-popup-options.js"></script>
    <!-- Date Picker -->
    <script src="js/bootstrap-datepicker.js"></script>
    <!-- Main -->
    <script src="js/main.js"></script>
</body>
</html>