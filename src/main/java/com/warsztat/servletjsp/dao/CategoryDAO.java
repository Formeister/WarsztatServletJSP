package com.warsztat.servletjsp.dao;

import java.util.List;

import com.warsztat.servletjsp.model.Category;

public interface CategoryDAO {

	// thêm danh mục mới
	public void addCategory(Category c);

	public void delCategory(int category_id);

	// danh sach
	public List<Category> getList();

	public Category getCategory(int category_id);
	
	public void updateCategory(Category c);

}
