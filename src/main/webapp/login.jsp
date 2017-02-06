<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/login.css" rel='stylesheet' type='text/css' />
	<title>Strona logowania</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	%>
	<div class="login-01">
		<div class="one-login  hvr-float-shadow">
			<div class="one-login-head">
				<img src="images/top-lock.png" alt="" />
				<h1>LOGIN</h1>
				<span></span>
			</div>
			<form action="LoginServlet" method="post">
				<ul>
					<% String mess="";
					if (request.getAttribute("mess") != null){
						mess= (String) request.getAttribute("mess");%>
					<li style="color: red"><%=mess%></li>	
					<% }%>
					<li style="color: red"><%=err%></li>
					<li>Nazwa użytkownika</li>
					<li><input type="text" class="text" value="" name="username"><a href="#" class=" icon user"></a></li>
					<li>Hasło</li>
					<li><input type="password" value="" name="password"><a href="#" class=" icon lock"></a></li>
				</ul>
				<div class="submit">
					<input type="submit" value="ZALOGUJ">
				</div>
				<h5>
					Nie masz jeszcze konta?<a href="register.jsp">Zarejestruj się</a>
				</h5>
				<h5>
					<a href="index.jsp">Powrót</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>