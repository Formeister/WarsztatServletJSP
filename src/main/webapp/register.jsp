<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/login.css" rel='stylesheet' type='text/css' />
	<title>Rejestracja</title>
</head>
<body>
	<%
	String err = "";
	if (request.getAttribute("err") != null) {
		err = (String) request.getAttribute("err");
	}
	%>
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>Rejestracja</h2>
				<label></label>
			</div>
			<form action="RegisterServlet" method="post">
				<ul>
				<li style="color: red"><%=err%></li>
				<li>Nazwa użytkownika</li>
				<li><input type="text" class="text" value="" name="username"><a href="#" class=" icon2 user2"></a></li>
				<li>Hasło</li>
				<li><input type="password" value="" name="password"><a href="#" class=" icon2 lock2"></a></li>
				<li>Płeć</li>
				<li><input type="text" value="" list="exampleList" name="sex"> 
					<datalist id="exampleList">
					<option value="Kobieta">
					<option value="Mężczyzna">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				<li>Adres e-mail</li>
				<li><input type="text" value=""
					name="email"><a href="#" class=" icon2 lock2"></a></li>
				<li>Numer telefonu</li>
				<li><input type="text" value=""				
					name="phone"><a href="#" class=" icon2 lock2"></a></li>
				<li>Adres</li>
				<li><input type="text" value=""
					name="address"><a href="#" class=" icon2 lock2"></a></li>
				</ul>
				<div class="submit two">
					<input type="submit" value="ZAREJESTRUJ">
				</div>
				<h5>
					<a href="login.jsp">Zaloguj</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>