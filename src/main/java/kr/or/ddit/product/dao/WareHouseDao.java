package kr.or.ddit.product.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.product.model.WareHouseVo;

@Repository("wareHouseDao")
public class WareHouseDao implements IWareHouseDao{

	@Resource(name="sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<WareHouseVo> getAllWarehouse() {
		return sqlSessionTemplate.selectList("warehouse.getAllWarehouse");
	}

	@Override
	public WareHouseVo selectWarehouse(String wareHouseCode) {
		return sqlSessionTemplate.selectOne("warehouse.selectWarehouse",wareHouseCode);
	}

	@Override
	public int deleteWarehouse(String wareHouseCode) {
		return sqlSessionTemplate.delete("warehouse.deleteWarehouse",wareHouseCode);
	}

	@Override
	public int insertWarehouse(WareHouseVo wareHouseVo) {
		return sqlSessionTemplate.insert("warehouse.insertWarehouse",wareHouseVo);
	}

	@Override
	public int updateWarehouse(WareHouseVo wareHouseVo) {
		return sqlSessionTemplate.update("warehouse.updateWareHouse",wareHouseVo);
	}

}
