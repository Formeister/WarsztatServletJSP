<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Szukanie</title>
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/menu.css" />
	<link rel="stylesheet" href="css/product.css" />
</head>
<body>
	<div id="main">
		<div id="head">
			<img src="images/banner.jpg" width="1057" height="200" alt="Banner"/>
		</div>
		<%
		String username = null;
		Cookie[] cookies = request.getCookies();
		if(cookies !=null){
			for(Cookie cookie : cookies){
		    	if(cookie.getName().equals("username")) 
		    		username = cookie.getValue();
			}
		}
	
		if (username != null) {
		%>
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
		} else {
		%>
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
		}
		%>
		<div id="content">
			<div id="left"><jsp:include page="search_menu.jsp"></jsp:include></div>
			<div id="right">
				<%			
				ProductDAOImpl productDAO = new ProductDAOImpl();
				List<Product> list = new ArrayList<Product>();
				list = productDAO.getList();
				String nameProduct = "";
				String nameCategory = "";
				if (request.getParameter("nameCategory") != null && request.getParameter("nameProduct")!= null) {
					nameCategory = request.getParameter("nameCategory");
					nameProduct = request.getParameter("nameProduct");
				}
				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumFractionDigits(0);
				String err = "";
				if (request.getAttribute("err") != null) {
					err = (String) request.getAttribute("err");%>
					<h3><%=err %></h3>
				<% 
				}
				if(productDAO.searchList(nameProduct, nameCategory).size()==0 && err=="") {%>
					<h3>Nie znaleziono produktów.</h3>
				<%} %>
				<div id="site-wrapper" style="float: left">
					<ul class="products homepage">			
						<%
						if (nameCategory != null || nameProduct != null) {
							for (Product p : productDAO.searchList(nameProduct, nameCategory)) {
						%>
								<li class="preorder"><span class="tagimg "> </span> <a
									href="detail.jsp?product_id=<%=p.getProduct_id()%>"> <img
										src="pics/<%=p.getImage()%>" width=" 250px" height="250px" />
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
						} else {%>
							<h3>Pole wyszukiwania nie może być puste. </h3>
						<%
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