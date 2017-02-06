package com.warsztat.servletjsp.dao;

import java.util.List;

import com.warsztat.servletjsp.model.History;

public interface HistoryDAO {
	
	public void addHistory(History h);
	
	public List<History> getList(int user_id);

}
