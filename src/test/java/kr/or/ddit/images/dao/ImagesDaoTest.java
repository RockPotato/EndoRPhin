package kr.or.ddit.images.dao;

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

public class ImagesDaoTest extends LogicConfig{

	private Logger logger = LoggerFactory.getLogger(ImagesDaoTest.class);
	

	@Resource(name="imagesDao")
	IImagesDao imagesDao;
	
	@Test
	public void getAllImagesTest(){
		List<ImagesVo> allImages = imagesDao.getAllImages();
		logger.debug("asdfljnsadf:{}",allImages.size());
	}
	
	@Test
	public void insertImagesTest() {
		ImagesVo imagesVo= new ImagesVo("1","c:/","haha.png");
		int insertPayment = imagesDao.insertImages(imagesVo);
		logger.debug("확인 : {}",imagesVo.getImageCode());
		assertEquals(1, insertPayment);
	}
	@Test
	public void selectImagesTest() {
		ImagesVo selectImages = imagesDao.selectImages("1");
		assertTrue(selectImages.getImageName().equals("자"));
	}
	@Test
	public void deleteImagesTest() {
		int deleteProduct = imagesDao.deleteImages("2");
		assertEquals(1, deleteProduct);
	}

}
