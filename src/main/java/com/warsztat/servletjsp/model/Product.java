package com.warsztat.servletjsp.model;

public class Product {

	private int product_id;
	private int category_id;
	private String name;
	private String image;
	private Double price;
	private String type;
	private String desc;

	public Product() {
	}

	public Product(int product_id, int category_id, String name, String image, Double price, String type, String desc) {
		this.product_id = product_id;
		this.category_id = category_id;
		this.name = name;
		this.image = image;
		this.price = price;
		this.type = type;
		this.desc = desc;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDesc() {
		return desc;
	}

	public void getDesc(String desc) {
		this.desc = desc;
	}


	public int getCategory_id() {
		return category_id;
	}

	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}

}
