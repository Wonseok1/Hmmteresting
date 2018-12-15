package edu.iot.common.dao;

import java.util.List;

import edu.iot.common.model.Attachment;

public interface AttachmentDao {
	List<Attachment> getList(long boardId) throws Exception;

	Attachment findById(long attachmentId) throws Exception;

	void insert(Attachment attachment) throws Exception;

	void delete(long attachmentId) throws Exception;

	void deleteByBoardId(long boardId) throws Exception;

}
