package com.warsztat.servletjsp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.PreparedStatement;
import com.warsztat.servletjsp.model.Product;

public class ProductDAOImpl implements ProductDAO {

	@Override
	public void addProduct(Product p) {
		Connection con = DBConnect.getConnection();
		String sql = "insert into product value(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, p.getCategory_id());
			ps.setString(2, p.getName());
			ps.setString(3, p.getImage());
			ps.setDouble(4, p.getPrice());
			ps.setString(5, p.getType());
			ps.setString(6, p.getDesc());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Product> getList() {
		Connection con = DBConnect.getConnection();
		String sql = "select * from product";
		List<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				Double price = rs.getDouble("price");
				String type = rs.getString("type");
				String desc = rs.getString("desc");
				list.add(new Product(product_id, category_id, name,
						image, price, type, desc));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getListByCategory(int id) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from product where category_id='" + id + "'";
		List<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				Double price = rs.getDouble("price");
				String type = rs.getString("type");
				String desc = rs.getString("desc");
				list.add(new Product(product_id, category_id, name,
						image, price, type, desc));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Product getProduct(int id) {
		Connection con = DBConnect.getConnection();
		String sql = "select * from product where product_id='" + id + "'";
		Product p = new Product();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				int category_id = rs.getInt("category_id");
				String name = rs.getString("name");
				String image = rs.getString("image");
				Double price = rs.getDouble("price");
				String type = rs.getString("type");
				String desc = rs.getString("desc");
				p = new Product(product_id, category_id, name,
						image, price, type, desc);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return p;
	}

/*	public static void main(String[] args) {
		//Product p = new Product(0, 1, "S6", "da", 500000.0 ,"","");
		ProductDAOImpl productDAO = new ProductDAOImpl();
		// productDAO.addProduct(p);
		// System.out.println(productDAO.getList());
		System.out.println(productDAO.getListByCategory(1));
	}*/

	@Override
	public List<Product> searchList(String nameProduct, String nameCategory) {
		Connection con = DBConnect.getConnection();
		String sql=null;
		if(!nameProduct.equals("") && !nameCategory.equals("")){
			sql = "SELECT * FROM product, category WHERE product.name LIKE N'%"+ nameProduct +"%' AND product.category_id = category.category_id AND category.name=N'"+nameCategory+"'";
		}else{
			if(nameProduct.equals("")){
				sql="SELECT * FROM product, category WHERE product.category_id = category.category_id AND category.name = N'"+nameCategory+"'";
			}else{
				if(nameCategory.equals("")){
					sql="SELECT * FROM product, category WHERE product.name LIKE N'%"+nameProduct+"%' AND product.category_id = category.category_id";
				}
			}
		}
		List<Product> list = new ArrayList<Product>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				int category_id = rs.getInt("category_id");
				nameProduct = rs.getString("name");
				String image = rs.getString("image");
				Double price = rs.getDouble("price");
				String type = rs.getString("type");
				String desc = rs.getString("desc");
				list.add(new Product(product_id, category_id, nameProduct,
						image, price, type, desc));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	
	}
}
