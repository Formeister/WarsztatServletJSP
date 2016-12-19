package com.warsztat.servletjsp.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.PreparedStatement;
import com.warsztat.servletjsp.model.History;

public class HistoryDAOImpl implements HistoryDAO {

	@Override
	public void addHistory(History h) {
		Connection con = DBConnect.getConnecttion();
		String sql = "insert into history value(?,?,?,?,?,?)";
		PreparedStatement ps;

		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setInt(1, h.getHistory_id());
			ps.setInt(2, h.getUser_id());
			ps.setInt(3, h.getProduct_id());
			ps.setTimestamp(4, h.getDate());
			ps.setInt(5, h.getAmount());
			ps.setDouble(6, h.getCost());
			ps.executeUpdate();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<History> getList(int id) {
		Connection con = DBConnect.getConnecttion();
		String sql = "select * from history where user_id='"+ id +"'";
		List<History> list = new ArrayList<History>();
		try {
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int history_id = rs.getInt("history_id");
				int user_id = rs.getInt("user_id");
				int product_id = rs.getInt("product_id");
				Timestamp date = rs.getTimestamp("date");
				int amount = rs.getInt("amount");
				double cost = rs.getDouble("cost");
				list.add(new History(history_id, user_id, product_id, date, amount, cost));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	

}
