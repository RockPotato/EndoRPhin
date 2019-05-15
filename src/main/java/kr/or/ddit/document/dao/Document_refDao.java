package kr.or.ddit.document.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.document.model.DocumentVo;
import kr.or.ddit.document.model.Document_refVo;

@Repository("document_refDao")
public class Document_refDao implements IDocument_refDao{


	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertDocument_ref(Document_refVo document_refVo) {
		return sqlSessionTemplate.insert("document_ref.insertDocument_ref",document_refVo);
	}

	@Override
	public List<Document_refVo> getAllDocument_ref() {
		return sqlSessionTemplate.selectList("document_ref.getAllDocument_ref");
	}

	@Override
	public List<Document_refVo> selectDocument_ref(Document_refVo document_refVo) {
		return sqlSessionTemplate.selectList("document_ref.selectDocument_ref",document_refVo);
	}

	@Override
	public int updateDocument_ref(Document_refVo document_refVo) {
		return sqlSessionTemplate.update("document_ref.updateDocument_ref",document_refVo);
	}

	@Override
	public int deleteDocument_ref(String documentNumber) {
		return sqlSessionTemplate.delete("document_ref.deleteDocument_ref",documentNumber);
	}


	@Override
	public List<Document_refVo> selectDocument_refNumber(String documentNumber) {
		return sqlSessionTemplate.selectList("document_ref.selectDocument_refNumber",documentNumber);
	}
	
}
