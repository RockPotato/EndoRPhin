package kr.or.ddit.document.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.FilesVo;

@Repository("filesDao")
public class FilesDao implements IFilesDao{

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertFiles(FilesVo filesVo) {
		return sqlSessionTemplate.insert("files.insertFiles",filesVo);
	}

	@Override
	public FilesVo selectFiles(String filecode) {
		return sqlSessionTemplate.selectOne("files.selectFiles",filecode);
	}

	@Override
	public int updateFiles(FilesVo filesVo) {
		return sqlSessionTemplate.update("files.updateFiles",filesVo);
	}

	@Override
	public List<FilesVo> documentFileList(String documentNumber) {
		return sqlSessionTemplate.selectList("files.documentFileList",documentNumber);
	}

	@Override
	public int deleteFiles(String filecode) {
		return sqlSessionTemplate.delete("files.deleteFiles",filecode);
	}


}
