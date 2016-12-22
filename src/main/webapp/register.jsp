<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<!--/start-login-two-->
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>Rejestracja</h2>
				<lable></lable>
			</div>
			<form action="RegisterServlet" method="post">
				<li style="color: red"><%=err%></li>
				Nazwa użytkownika
				<li><input type="text" class="text" value=""
					name="username"><a href="#" class=" icon2 user2"></a></li>
				Hasło
				<li><input type="password" value=""
					name="password"><a href="#" class=" icon2 lock2"></a></li>
				Płeć
				<li><input type="text" value="" list="exampleList"
					name="sex"> 
					<datalist id="exampleList">
					<option value="Kobieta">
					<option value="Mężczyzna">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				Adres e-mail
				<li><input type="text" value=""
					name="email"><a href="#" class=" icon2 lock2"></a></li>
				Numer telefonu
				<li><input type="text" value=""				
					name="phone"><a href="#" class=" icon2 lock2"></a></li>
				Adres
				<li><input type="text" value=""
					name="address"><a href="#" class=" icon2 lock2"></a></li>

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