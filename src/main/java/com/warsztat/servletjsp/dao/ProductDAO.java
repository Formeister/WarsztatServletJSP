package com.warsztat.servletjsp.dao;

import java.util.List;

import com.warsztat.servletjsp.model.Product;

public interface ProductDAO {

	public void addProduct(Product p);

	public List<Product> getList();

	public List<Product> getListByCategory(int category_id);
	
	public Product getProduct(int product_id);
	
	public List<Product> searchList(String nameProduct, String nameCategory);

}
