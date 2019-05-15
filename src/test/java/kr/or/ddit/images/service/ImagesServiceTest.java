package kr.or.ddit.images.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.or.ddit.image.dao.IImagesDao;
import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.set.LogicConfig;

public class ImagesServiceTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(ImagesServiceTest.class);
	
	@Resource(name="imagesService")
	IImagesService imagesService;
	
	@Test
	public void getAllImagesTest(){
		List<ImagesVo> allImages = imagesService.getAllImages();
		logger.debug("asdfljnsadf:{}",allImages.size());
	}
	
	@Test
	public void selectImagesTest() {
		ImagesVo selectImages = imagesService.selectImages("1");
		assertTrue(selectImages.getImageName().equals("자"));
	}
	@Test
	public void deleteImagesTest() {
		int deleteProduct = imagesService.deleteImages("2");
		assertEquals(1, deleteProduct);
	}
}


