<%@page import="com.warsztat.servletjsp.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.ProductDAOImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Koszyk</title>
	<link rel="stylesheet" href="css/cart.css" />
	<link rel="stylesheet" href="css/menu.css" />
	<link rel="stylesheet" href="css/main.css" />
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<style type="text/css">

	#main {
		width: 1060px;
		padding: 0;
		margin-left: auto;
		margin-right: auto;
	}
	
	#head {
		height: 200px;
		background-color: #F5F5F5;
		border: 1px solid #CDCDCD;
		margin-bottom: 5px;
		margin-top: 5px;
	}
	
	#head-link {
		height: 50px;
		line-height: 30px;
		border: 1px solid #CDCDCD;
		background-color: #F5F5F5;
		margin-bottom: 5px;
		clear: both;
	}
	
	#content {
		width: 1060px;
		min-height: 430px;
		border: 1px solid #CDCDCD;
		float: left;
		margin-bottom: 5px;
		clear: both;
	}
	
	#footer {
		height: 50px;
		clear: both;
		border: 1px solid #CDCDCD;
		background-color: #F8F8FF;
		margin-bottom: 5px;
	}
	</style>
</head>
<body>
	<%
	String username = null;
	Cookie[] cookies = request.getCookies();
	if(cookies !=null){
		for(Cookie cookie : cookies){
		    if(cookie.getName().equals("username")) 
		    	username = cookie.getValue();
		}
	}
	%>
	<div id="main">
		<div id="head">
			<img src="images/banner.jpg" width="1057" height="200" alt="Banner"/>
		</div>
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
		<div id="content">
			<div class="shopping-cart">
				<div class="column-labels">
					<label class="product-image">Zdjęcie</label> 
					<label class="product-details">Produkt</label> 
					<label class="product-price">Cena</label> 
					<label class="product-quantity">Ilość</label>
					<label class="product-line-price">Suma</label>
				</div>
				<%
				ProductDAOImpl productDAO = new ProductDAOImpl();

				NumberFormat nf = NumberFormat.getInstance();
				nf.setMinimumIntegerDigits(0);
				double total = 0;
				ArrayList<Cart> cart=null;
				if(session.getAttribute("cart")!=null){
					cart = (ArrayList<Cart>) session.getAttribute("cart");
				}
				if (cart != null) {
					for (Cart c : cart) {
						total = total
								+ (c.getQuantity() * productDAO.getProduct(
										c.getP().getProduct_id()).getPrice());
				%>
				<div class="product">
					<div class="product-image">
						<img src="pics/<%=productDAO.getProduct(c.getP().getProduct_id()).getImage()%>">
					</div>
					<div class="product-details">
						<div class="product-title">
							<%=productDAO.getProduct(c.getP().getProduct_id()).getName()%>
						</div>
						<p class="product-description"></p>
					</div>
					<div class="product-price">
						<%=nf.format(productDAO.getProduct(c.getP().getProduct_id()).getPrice())%>
						zł
					</div>
					<div class="product-quantity cart_quantity_button">
						<a class="cart_quantity_up" href="CartServlet?command=deleteCart&product_id=<%=c.getP().getProduct_id()%>"> - </a>
						<input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled">
						<a class="cart_quantity_up" href="CartServlet?command=addCart&product_id=<%=c.getP().getProduct_id()%>"> + </a>
					</div>
					<div class="product-line-price" style="text-align: right">
						<%=nf.format(productDAO.getProduct(
									c.getP().getProduct_id()).getPrice()
										* c.getQuantity())%>
						zł
						<a href="CartServlet?command=removeCart&product_id=<%=c.getP().getProduct_id()%>">
							<img style="margin-left: 10px"src="images/delete.png">
						</a>
					</div>
				</div>
				<%
					}
				}
				%>
				<div class="totals">
					<div class="totals-item">
						<label>Razem</label>
						<div class="totals-value" id="cart-subtotal"><%=nf.format(total)%>
							zł
						</div>
					</div>
				</div>
				<%if(cart.size()>0){ %>
					<a class="checkout" href="history.jsp" style="text-decoration: none;">Historia zamówień</a>
					<a class="checkout" href="ConfirmServlet?username=<%=username %>" style="text-decoration: none;">Zrealizuj zamówienie</a>
				<%}else{ %>
					<a class="checkout" href="history.jsp" style="text-decoration: none;">Historia zamówień</a>
					<a class="checkout" href="product.jsp" style="text-decoration: none;">Cofnij</a>
				<%} %>
			</div>
		</div>
		<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
	</div>
</body>
</html>