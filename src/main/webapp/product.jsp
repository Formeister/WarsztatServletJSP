<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.ProductDAOImpl"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/taglib139.tld" prefix="pg"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Produkty</title>
<link rel="stylesheet" href="css/product.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/menu.css" />
</head>
<body>
	<pg:paging pageSize="4">
		<div id="main">
			<div id="head">
				<img src="images/banner.jpg" width="1057px" height="200px" />
			</div>
		<%
			String username = null;
				Cookie[] cookies = request.getCookies();
				if(cookies !=null)
				{
				for(Cookie cookie : cookies)
				{
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
			
			<div id="content_center" >

<%
					ProductDAOImpl productDAO = new ProductDAOImpl();
	
						NumberFormat nf = NumberFormat.getInstance();
						nf.setMinimumFractionDigits(0);
				%>

				<div id="site-wrapper-p" style="float: left; margin-left: 120px">

					<%
					List<Product> list = new ArrayList<Product>();
					list = productDAO.getList(); 
					pageContext.setAttribute("products", list); 
					%>

					<ul class="products homepage">
					
						<c:forEach items="${products}" var="product">
							<li class="preorder"><span class="tagimg "></span> <a
								href="detail.jsp?product_id=${product.product_id}"> <img
									src="pics/${product.image}" width=" 250px"
									height="250px" />
									<h3>${product.name}</h3>
									<h4>
										Cena:
										${product.price}
										zł
								</span>
									<p class="info">
										<span>Typ: ${product.type}</span> <span>Cena:
											${product.price} zł</span> <span>Opis: ${product.desc} </span>
									</p>
							</a></li>

						</c:forEach>
						
					</ul>
				</div>

			<div id="footer" align= "center">
				<pg:index>
					<pg:page><%=thisPage%></pg:page>
				</pg:index>
			</div>
		</div>
	</div>
	</pg:paging>

</body>
</html>