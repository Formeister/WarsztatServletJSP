package com.warsztat.servletjsp.model;


public class User {

	private int user_id;
	private String username;
	private String password;
	private String sex;
	private String email;
	private String phone;
	private String address;
	private String role;

	public User() {
	}

	public User(int user_id, String username, String password, String sex, String email, String phone, String address, String role) {
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.role = role;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
