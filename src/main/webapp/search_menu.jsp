<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%
	CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	List<Category> list = new ArrayList<Category>();
	list = categoryDAO.getList();
	String err="";
	%>
	<div class="container">
		<nav>
			<ul class="mcd-menu">
				<li>
					<form accept-charset="utf-8" method="post" action="SearchServlet" name="SearchServlet">
	                	<p>
	                	<label>Nazwa produktu</label>
	                	<br>
	                	<input type="text"  name="nameProduct" style="width:97%">
	                	</p>
	                	<p>
	                	<label>Typ</label>
	                	<br>
	                	<select name="nameCategory" style="width:100%">
		                	<option value="" selected="selected">--Wybierz kategorię--</option>
		                	<%
							for (Category c : list) {
							%>
		                		<option  value="<%=c.getName() %>"><%=c.getName() %></option>
		                    <%} %>
	                    </select>
	                    </p>
	                    <input type="submit" value="Szukaj" name="search">
	                </form>
	          	</li>
	            <li style="color: red"><%=err%></li>
            </ul>
		</nav>
	</div>