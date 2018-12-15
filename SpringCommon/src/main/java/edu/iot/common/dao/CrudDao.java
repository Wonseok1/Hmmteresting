package edu.iot.common.dao;

import java.util.List;
import java.util.Map;

public interface CrudDao<M, K>{

	int count() throws Exception;

	M findById(K k) throws Exception;
	
	List<M> getList() throws Exception;
	
	int insert(M m) throws Exception;
	
	int update(M m) throws Exception;
	
	int delete(K k) throws Exception;
	
	List<M> getPage(Map map) throws Exception;
}
