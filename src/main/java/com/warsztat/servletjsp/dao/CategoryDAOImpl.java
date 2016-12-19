package com.warsztat.servletjsp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.PreparedStatement;
import com.warsztat.servletjsp.model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public void addCategory(Category c) {
		Connection con = DBConnect.getConnecttion();
		String sql = "insert into category value(?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, c.getCategory_id());
			ps.setString(2, c.getName());
			ps.setString(3, c.getDesc());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Category> getList() {
		Connection con = DBConnect.getConnecttion();
		String sql = "select * from category";
		List<Category> list = new ArrayList<Category>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				String desc = rs.getString("desc");
				list.add(new Category(category_id, name, desc));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

/*	public static void main(String[] args) {
		CategoryDAOImpl dao = new CategoryDAOImpl();
		Category c = new Category(8, "Samsung", "DT");
		// dao.addCategory(c);
		// System.out.println(dao.getList());
		// dao.delCategory(10);
		dao.updateCategory(c);
	}*/

	@Override
	public void delCategory(int category_id) {
		Connection con = DBConnect.getConnecttion();
		String sql = "delete from category where category_id='" + category_id
				+ "'";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Category getCategory(int id) {
		Connection con = DBConnect.getConnecttion();
		String sql = "select * from category where category_id='" + id + "'";
		Category c = new Category();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				String desc = rs.getString("desc");
				c = new Category(category_id, name, desc);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	@Override
	public void updateCategory(Category c) {
		Connection con = DBConnect.getConnecttion();
		String sql = "update category set name=?, desc=? where category_id=?";
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getDesc());
			ps.setInt(3, c.getCategory_id());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
