package com.warsztat.servletjsp.controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.warsztat.servletjsp.model.Cart;
import com.warsztat.servletjsp.model.History;
import com.warsztat.servletjsp.model.User;
import com.warsztat.servletjsp.dao.HistoryDAOImpl;
import com.warsztat.servletjsp.dao.ProductDAOImpl;
import com.warsztat.servletjsp.dao.UserDAOImpl;


public class ConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAOImpl userDAO = new UserDAOImpl();
    private ProductDAOImpl productDAO = new ProductDAOImpl();  
    private HistoryDAOImpl historyDAO = new HistoryDAOImpl();

    public ConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		User u = userDAO.getUser(username);

		Calendar calendar = Calendar.getInstance();
	    java.sql.Timestamp tdate = new java.sql.Timestamp(calendar.getTime().getTime());
		
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart = (ArrayList<Cart>) request.getSession().getAttribute("cart");
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumFractionDigits(0); 

		   if(cart!=null){
			   for(Cart c : cart){
				   History h = new History(0, u.getUser_id(), c.getP().getProduct_id(), tdate, c.getQuantity(), (c.getQuantity() * productDAO.getProduct(c.getP().getProduct_id()).getPrice()));
				   historyDAO.addHistory(h);
			   }
		   }

		   cart.clear();
		   request.getSession().setAttribute("cart", cart);
		   response.sendRedirect("index.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
}
