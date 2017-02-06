<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Strona głowna</title>
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/menu.css" />
	<link rel="stylesheet" href="css/product.css" />
</head>
<body>
	<div id="main">
		<div id="head">
			<img src="images/banner.jpg" width="1057" height="200" alt="Banner"/>
		</div>
		<jsp:useBean id="user" class="com.warsztat.servletjsp.model.User" scope="session" />
		
		<%
		String username = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
			for(Cookie cookie : cookies){
		    	if(cookie.getName().equals("username")) 
		    		username = cookie.getValue();
			}
		}
			
		//if (user != null) {
		%>
		<c:choose>
		<c:when test="${not empty username}">
			<div id="head-link">
				<div id='menungang'>
					<ul>
						<li class='last'><a href="index.jsp"><span>Strona główna</span></a></li>
						<li class='last'><a href="product.jsp"><span>Produkty</span></a></li>
						<li class='last'><a href="cart.jsp"><span>Koszyk</span></a></li>
						<li class='last'><a href="search_page.jsp"><span>Szukaj</span></a></li>
						<li class='last' style="float: right;"><a href="LogoutServlet"><span>Wyloguj</span></a></li>
						<li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username %>"><span><%= username %></span></a></li>			
					</ul>
				</div>
			</div>
		<%
		//} else {
		%>
		</c:when>
  		<c:otherwise>
			<div id="head-link">
				<div id='menungang'>
					<ul>
						<li class='last'><a href="index.jsp"><span>Strona główna</span></a></li>
						<li class='last'><a href="product.jsp"><span>Produkty</span></a></li>
						<li class='last'><a href="search_page.jsp"><span>Szukaj</span></a></li>
						<li class='last' style="float: right;"><a href="register.jsp"><span>Zarejestruj</span></a></li>
						<li class='last' style="float: right;"><a href="login.jsp"><span>Zaloguj</span></a></li>
					</ul>
				</div>
			</div>
		<%
		//}
		%>
		</c:otherwise>
		</c:choose>
		
		<div id="content">
			<div id="left"><jsp:include page="category.jsp"></jsp:include></div>
			<div id="right">
				<%
				ProductDAOImpl productDAO = new ProductDAOImpl();
				List<Product> list = new ArrayList<Product>();
				list = productDAO.getList();
				String category_id = null;
				
				if (request.getParameter("category_id") != null) {
					category_id = request.getParameter("category_id");
				}
				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumFractionDigits(0);
				%>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">
						<%
						if (category_id != null) {
							for (Product p : productDAO.getListByCategory(Integer.parseInt(category_id))) {
						%>
						<li class="preorder">
							<span class="tagimg"></span> 
							<a href="detail.jsp?product_id=<%=p.getProduct_id()%>">
								<img src="pics/<%=p.getImage()%>" width="250" height="250" alt="Product" />
								<h3><%=p.getName()%></h3>
								<h4>
									Cena:
									<%=nf.format(p.getPrice())%>
									zł
								</h4>
								<p class="info">
									<span>Typ: <%=p.getType()%></span>
									<span>Cena: <%=nf.format(p.getPrice())%> zł</span>
									<span>Opis: <%=p.getDesc()%></span>
								</p>
							</a>
						</li>

						<%
							}
						} else {			
							for (Product p : productDAO.getList()) {
						%>
						<li class="preorder">
							<span class="tagimg "></span>
							<a href="detail.jsp?product_id=<%=p.getProduct_id()%>">
								<img src="pics/<%=p.getImage()%>" width="250" height="250" alt="Product" />
								<h3><%=p.getName()%></h3>
								<h4>
									Cena:
									<%=nf.format(p.getPrice())%>
									zł
								</h4>
								<p class="info">
									<span>Typ: <%=p.getType()%></span>
									<span>Cena: <%=nf.format(p.getPrice())%> zł</span>
									<span>Opis: <%=p.getDesc()%></span>
								</p>
						</a></li>
						<%
							}
						}
						%>
					</ul>
				</div>
			</div>
		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>