package edu.iot.common.dao;

import edu.iot.common.model.Board;

public interface BoardDao extends CrudDao<Board, Long>{

	void increaseReadCnt(long boardId) throws Exception;

}
