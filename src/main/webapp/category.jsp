<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	CategoryDAOImpl categoryDAO = new CategoryDAOImpl();
	List<Category> list = new ArrayList<Category>();
	list = categoryDAO.getList();
%>
	<div class="container">
		<ul class="mcd-menu">
			<%
			for (Category c : list) {	
			%>
				<li><a href="index.jsp?category_id=<%=c.getCategory_id()%>"> 
					<i class="fa fa-home"><img src="images/<%=c.getCategory_id() %>.png" alt="Category"></i>
					<strong><%=c.getName()%></strong>
				</a></li>
			<%
			}
			%>
		</ul>
	</div>
