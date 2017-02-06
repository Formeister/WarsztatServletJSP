package com.warsztat.servletjsp.dao;

import static org.junit.Assert.*;

import org.junit.Test;

public class UserDAOImplTest {
	
	UserDAOImpl userDao = new UserDAOImpl();
	
	// TEST COUNT
	@Test
	public void checkCountUsers(){
		assertEquals(userDao.countUsers(), 2);
	}
	
}
