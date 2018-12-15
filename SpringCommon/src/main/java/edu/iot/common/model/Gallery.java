package edu.iot.common.model;

import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class Gallery {
	private long galleryId;
	@NotEmpty(message="필수항목입니다.")
	private String title;
	@NotEmpty(message="필수항목입니다.")	
	private String owner;
	private String description;
	private int readCnt;	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updateDate;
	private List<GalleryImage> list;
}
