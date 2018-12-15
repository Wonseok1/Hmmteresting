package edu.iot.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import edu.iot.common.dao.AttachmentDao;
import edu.iot.common.dao.BoardDao;
import edu.iot.common.exception.PasswordMissmatchException;
import edu.iot.common.model.Attachment;
import edu.iot.common.model.Board;
import edu.iot.common.model.Pagination;


@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao dao;
	
	@Autowired
	AttachmentDao attachmentDao;

	@Override
	public Map<String, Object> getPage(int page) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		int total = dao.count();
		Pagination pagination = new Pagination(page, total);
		map.put("pagination", pagination);
		map.put("list", dao.getPage(pagination.getPageMap())) ;
		return map;
	}


	@Override
	public Board findById(long boardId) throws Exception {
		dao.increaseReadCnt(boardId); 		// 조회수 증대 
		Board board = dao.findById(boardId);
		board.setAttachList(attachmentDao.getList(boardId));		
		return board;
	}
	

	@Override
	public List<Attachment> getAttachList(long boardId) throws Exception {
		return attachmentDao.getList(boardId);
	}

	// @Transactional
	@Override
	public void create(Board board) throws Exception {
		dao.insert(board);
		/*if(result == 1) {
			throw new Exception();
		}*/
		
		for(Attachment attachment : board.getAttachList()) {
			attachment.setBoardId(board.getBoardId());
			attachmentDao.insert(attachment);
		}
	}

	@Override
	public void update(Board board) throws Exception {
		int result = dao.update(board);
		if(result ==0) {
			throw new PasswordMissmatchException();
		}
		
		for(Attachment attachment : board.getAttachList()) {
			attachment.setBoardId(board.getBoardId());
			attachmentDao.insert(attachment);
		}	

	}
	

	
	@Override
	public Attachment getAttachment(long attachmentId) throws Exception {
		return attachmentDao.findById(attachmentId);
	}


	@Override
	public void deleteAttachment(long boardId, String password, 
								long attachmentId) throws Exception {
		// 게시판의 비밀번호 일치 여부 확인
		// 일치하지 않으면 PasswordMissmatchException 예외 발생
		Board board = dao.findById(boardId);
		if(!password.equals(board.getPassword())) {
			throw new PasswordMissmatchException();
		}	
		
		// 일치하면 첨부파일 삭제
		attachmentDao.delete(attachmentId);
	}

	@Override
	public void delete(Board board) throws Exception {
		Board b = dao.findById(board.getBoardId());
		if(!b.getPassword().equals(board.getPassword())) {
			throw new PasswordMissmatchException();
		}	

		attachmentDao.deleteByBoardId(board.getBoardId());
		dao.delete(board.getBoardId());
	}

}
