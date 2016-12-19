<%@page import="java.util.ArrayList"%>
<%@page import="com.warsztat.servletjsp.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.warsztat.servletjsp.dao.CategoryDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
</head>
<body>
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
			<li><a href="index.jsp?category_id=<%=c.getCategory_id()%>"> <i class="fa fa-home"><img
						src="images/<%=c.getCategory_id() %>.png"></i>
					<strong><%=c.getName()%></strong>
			</a></li>
			<%
				}
			%>
		</ul>
	</div>
</body>
</html>