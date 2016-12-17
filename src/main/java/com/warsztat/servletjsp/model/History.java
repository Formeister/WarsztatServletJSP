package com.warsztat.servletjsp.model;

import java.sql.Timestamp;


public class History {
	private int history_id;
	private int user_id;
	private int product_id;
	private Timestamp date;
	private int amount;
	private double cost;
	
	public History() {
	}
	
	public History(int history_id, int user_id, int product_id, Timestamp date,
			int amount, double cost) {
		
		this.history_id = history_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.date = date;
		this.amount = amount;
		this.cost = cost;
	}

	public int getHistory_id() {
		return history_id;
	}

	public void setHistory_id(int history_id) {
		this.history_id = history_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}
	

}
