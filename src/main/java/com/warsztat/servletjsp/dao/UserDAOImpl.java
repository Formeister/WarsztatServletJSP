package com.warsztat.servletjsp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.cj.jdbc.PreparedStatement;
import com.warsztat.servletjsp.model.User;

public class UserDAOImpl implements UserDAO {
	

	public UserDAOImpl(){
	}

	@Override
	public void addUser(User u) {
		Connection con = DBConnect.getConnection();
		String sql = "insert into user value(?,?,?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, u.getUser_id());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getSex());
			ps.setString(5, u.getEmail());
			ps.setString(6, u.getPhone());
			ps.setString(7, u.getAddress());
			ps.setString(8, u.getRole());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkUser(String username) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from user where username='" + username + "'";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				con.close();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	/*	public static void main(String[] args) {
		UserDAOImpl dao = new UserDAOImpl();
		// dao.addUser(new User(0, "admin", "12345", "admin", "1"));
		// System.out.println(dao.checkUser("admin"));
		System.out.println(dao.login("admin", "12345"));
	}*/

	@Override
	public boolean login(String username, String password) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from user where username='" + username
				+ "' and password='" + password + "'";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				con.close();
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public void updateUser(User u) {
		Connection con = DBConnect.getConnection();
		String sql = "update user set user_id=?, password=?, sex=?, email=?, phone=?, address=?, role=? where username=?";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.setInt(1, u.getUser_id());
			ps.setString(2, u.getPassword());
			ps.setString(3, u.getSex());
			ps.setString(4, u.getEmail());
			ps.setString(5, u.getPhone());
			ps.setString(6, u.getAddress());
			ps.setString(7, u.getRole());
			ps.setString(8, u.getUsername());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}
	
	@Override
	public void deleteUser(int user_id) {
		Connection con = DBConnect.getConnection();
		String sql = "delete from user where user_id=?";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.setInt(1, user_id);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User getUser(String name) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from user where username='" + name + "'";
		User u = new User();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int user_id= rs.getInt("user_id");
				String username = rs.getString("username");
				String password = rs.getString("password");
				String sex = rs.getString("sex");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String address = rs.getString("address");
				String role = rs.getString("role");
				u = new User(user_id, username, password, sex, email, phone, address, role);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}
	
	@Override
	public int countUsers(){
		Connection con = DBConnect.getConnection();
		String sql = "select * from user";
		int count = 0;
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count++;
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	
	}
}
