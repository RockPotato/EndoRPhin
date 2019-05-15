package kr.or.ddit.image.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.image.model.ImagesVo;

@Repository("imagesDao")
public class ImagesDao implements IImagesDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertImages(ImagesVo imagesVo) {
		return sqlSessionTemplate.insert("images.insertImages",imagesVo);
	}

	@Override
	public List<ImagesVo> getAllImages() {
		return sqlSessionTemplate.selectList("images.getAllImages");
	}

	@Override
	public ImagesVo selectImages(String imageCode) {
		return sqlSessionTemplate.selectOne("images.selectImages",imageCode);
	}

	@Override
	public int deleteImages(String imageCode) {
		return sqlSessionTemplate.delete("images.deleteImages",imageCode);
	}

	@Override
	public int updateImages(ImagesVo imagesVo) {
		return sqlSessionTemplate.insert("images.updateImages",imagesVo);
	}

}
