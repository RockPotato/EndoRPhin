package kr.or.ddit.tax_cal.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.tax_cal.model.EstablishVo;
import kr.or.ddit.util.model.PageVo;

@Repository("establishDao")
public class EstablishDao implements IEstablishDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int insertEstablish(EstablishVo establishVo) {
		return sqlSessionTemplate.insert("establish.insertEstablish",establishVo);
	}

	@Override
	public int deleteEstablish(String establishcode) {
		return sqlSessionTemplate.delete("establish.deleteEstablish",establishcode);
	}

	@Override
	public List<EstablishVo> getAllEstablish() {
		return sqlSessionTemplate.selectList("establish.getAllEstablish");
	}

	@Override
	public EstablishVo selectEstablish(String establishcode) {
		return sqlSessionTemplate.selectOne("establish.selectEstablish",establishcode);
	}

	@Override
	public List<EstablishVo> selectEstablishByNm(String establishNameKor) {
		return sqlSessionTemplate.selectList("establish.selectEstablishByNm",establishNameKor);
	}

	/**
	* Method : selectEstablishPagingList
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param pageVo
	* @return
	* Method 설명 : Ajax를 통한 페이징 조회
	*/
	@Override
	public List<EstablishVo> selectEstablishPagingList(PageVo pageVo) {
		return sqlSessionTemplate.selectList("establish.selectEstablishPagingList", pageVo);
	}


	/**
	* Method : getEstablishCount
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 수량 확인
	*/
	@Override
	public int getEstablishCount() {
		return sqlSessionTemplate.selectOne("establish.getEstablishCnt");
	}

	
	
	/**
	* Method : updateEstblish
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 계정과목 코드를 키값으로 하는 데이터수정
	*/
	@Override
	public int updateEstblish(EstablishVo vo) {
		return sqlSessionTemplate.update("establish.updateEstablish", vo);
	}
	
	
	
	
	
	
}

