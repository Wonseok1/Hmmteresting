package edu.iot.common.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.iot.common.dao.GalleryDao;
import edu.iot.common.model.Gallery;
import edu.iot.common.model.GalleryImage;
import edu.iot.common.model.Pagination;


@Service

public class GalleryServiceImpl implements GalleryService {
	@Autowired
	GalleryDao dao;
	
	@Override
	public Map<String, Object> getPage(int page, String orderBy) throws Exception {
		Map<String, Object> map = new HashMap<>();
		
		int total = dao.count();
		Pagination pagination = new Pagination(page, total);
		map.put("pagination", pagination);
		map.put("orderBy", orderBy);
		
		Map<String, Object> pageMap = pagination.getPageMap();
		pageMap.put("orderBy", orderBy);
		map.put("list", dao.getPage(pageMap)) ;
		
		return map;
	}

	@Override
	public void create(Gallery gallery) throws Exception {
		dao.insert(gallery);
		
		
	}

	@Override
	public Gallery findById(long galleryId) throws Exception {
		dao.increaseReadCnt(galleryId);
		Gallery gallery = dao.findById(galleryId);
		
		//List<GalleryImage> list = dao.getImages(galleryId);
		//gallery.setList(list);
		return gallery;
	}

	@Override
	public void update(Gallery gallery) throws Exception {
		dao.update(gallery);
	}

	@Override
	public void addImage(GalleryImage image) throws Exception {
		dao.addImage(image);
		
	}

	@Override
	public GalleryImage getImage(long imageId) throws Exception {
		return dao.getImage(imageId);
	}
}






