package com.warsztat.servletjsp.controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warsztat.servletjsp.dao.UserDAOImpl;
import com.warsztat.servletjsp.model.User;


public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();   

	
    public UpdateUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String user_id = request.getParameter("id");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");


		String err = "";
		String url = "/update_user.jsp";

		if (password.equals("") || email.equals("") || phone.equals("") || address.equals("")) {
			err += "Musisz wypełnić wszystkie pola!";
		} else {
			 
				Pattern pattenObj = Pattern
						.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
								+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
				Matcher matcherObj = pattenObj.matcher(email);
				if (!matcherObj.matches()) {
					err += "Email niepoprawny!";
				}else{
					Pattern pattenObj2 = Pattern
							.compile("^(?:[0-9] ?){6,14}[0-9]$");
					Matcher matcherObj2 = pattenObj2.matcher(phone);
					if (!matcherObj2.matches()) {
						err += "Błędny numer telefonu!";}
				}
		}

		if (err.length() > 0) {
			request.setAttribute("err", err);
		}

		try {
			if (err.length() == 0) {
				User u= new User(Integer.parseInt(user_id), username, password, sex, email, phone, address, "2");
				userDAO.updateUser(u);
				url = "/index.jsp";
			} else {
				url = "/update_user.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/register.jsp");
		}
	}

}
