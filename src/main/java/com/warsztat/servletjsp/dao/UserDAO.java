package com.warsztat.servletjsp.dao;

import com.warsztat.servletjsp.model.User;

public interface UserDAO {
	
	public void addUser(User u);
	
	public boolean checkUser(String username);
	
	public boolean login(String username, String password);
	
	public void updateUser(User u);
	
	public void deleteUser(int user_id);
	
	public User getUser(String username);

}
