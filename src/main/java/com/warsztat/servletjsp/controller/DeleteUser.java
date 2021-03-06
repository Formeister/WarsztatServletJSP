package com.warsztat.servletjsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warsztat.servletjsp.dao.UserDAOImpl;


public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();   

    public DeleteUser() {
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

		try {
			userDAO.deleteUser(Integer.parseInt(user_id));
			
			RequestDispatcher rd = request.getRequestDispatcher("LogoutServlet");
			rd.forward(request,response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/update_user.jsp");
		}
	}

}
