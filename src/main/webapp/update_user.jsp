<%@page import="com.warsztat.servletjsp.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.warsztat.servletjsp.dao.UserDAOImpl"%>
<%@page import="com.warsztat.servletjsp.model.User"%>
<%@page import="com.warsztat.servletjsp.dao.UserDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/login.css" rel='stylesheet' type='text/css' />
	<title>Stwórz konto</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	String username= request.getParameter("username");
	UserDAOImpl userDAO = new UserDAOImpl();
	User u= userDAO.getUser(username);
	%>
	
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>Wprowadź informacje</h2>
			</div>
			<form action="UpdateUser" method="post">
				<ul>
					<li style="color: red"><%=err%></li>
					<li>Nazwa użytkownika</li>
					<li><input type="text" class="text" value="<%=u.getUsername()%>" readonly name="username"><a href="#" class=" icon2 user2"></a></li>
					<li>Hasło</li>
					<li><input type="password" value="" name="password"><a href="#" class=" icon2 lock2"></a></li>
					<li>Płeć</li>
					<li><input type="text" value="<%=u.getSex() %>" list="exampleList" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '<%=u.getSex() %>';}" name="sex"> <datalist id="exampleList">
						<option value="Kobieta">
						<option value="Mężczyzna">
						</datalist><a href="#" class=" icon2 lock2"></a></li>
					<li>Adres e-mail</li>
					<li><input type="text" value="<%= u.getEmail() %>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '<%=u.getEmail() %>';}" name="email"><a href="#" class=" icon2 lock2"></a></li>
					<li>Numer telefonu</li>
					<li><input type="text" value="<%=u.getPhone() %>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '<%=u.getPhone() %>';}" name="phone"><a href="#" class=" icon2 lock2"></a></li>
					<li>Adres</li>
					<li><input type="text" value="<%=u.getAddress() %>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '<%=u.getAddress() %>';}" name="address"><a href="#" class=" icon2 lock2"></a></li>
				</ul>
				<div class="submit two">
					<input type="submit" value="Dodaj">
					<input type="hidden" value="<%=u.getUser_id()%>" name="id">
				</div>
				<h5>
					<a href="index.jsp">Powrót</a>
				</h5>
			</form>
			<form name="submitForm" method="POST" action="DeleteUser">
  					<input type="hidden" name="id" value="<%=u.getUser_id()%>">
  					<input type="submit" value="Usuń">
			</form>
		</div>
	</div>
</body>
</html>