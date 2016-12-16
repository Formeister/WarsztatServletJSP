package com.warsztat.servletjsp.model;

public class Category {

	private int category_id;
	private String name;
	private String desc;

	public Category() {
	}

	public Category(int category_id, String name, String desc) {
		this.category_id = category_id;
		this.name = name;
		this.desc = desc;
	}

	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

}
