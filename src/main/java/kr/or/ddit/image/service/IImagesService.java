package kr.or.ddit.image.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.image.model.ImagesVo;

public interface IImagesService {
	List<ImagesVo> getAllImages();
	ImagesVo selectImages(String imageCode);
	int deleteImages(String imageCode);
	String updateOrInsertImages(ImagesVo imagesVo,MultipartRequest multparts) throws IllegalStateException, IOException;
}
