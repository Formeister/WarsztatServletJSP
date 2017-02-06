package com.warsztat.servletjsp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.warsztat.servletjsp.model.Cart;
import com.warsztat.servletjsp.dao.UserDAOImpl;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
	private List<Cart> cart = new ArrayList<Cart>();

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		String err = "";
		if (username.equals("") || password.equals("")) {
			err += "Wypełnij wszystkie pola!";
		} else {
			if (userDAO.login(username, password) == false) {
				err += "Nazwa użytkownika lub hasło są nieprawidłowe.";
			}
		}

		if (err.length() > 0) {
			request.setAttribute("err", err);
		}

		String url = "/login.jsp";
		try {
			if (err.length() == 0) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("cart", cart);
				session.setAttribute("user", userDAO.getUser(username));
				
				userDAO.login(username, password);
				Cookie loginCookie = new Cookie("username", username);
	            //setting cookie to expiry in 30 mins
	            loginCookie.setMaxAge(30*60);
	            response.addCookie(loginCookie);
	            response.sendRedirect("index.jsp");
				url = "/index.jsp";
			} else {
				url = "/login.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/login.jsp");
		}
	}

}
