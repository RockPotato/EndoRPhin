package kr.or.ddit.product.dao;

import java.util.List;

import kr.or.ddit.product.model.WareHouseVo;

public interface IWareHouseDao {
	List<WareHouseVo> getAllWarehouse();
	WareHouseVo selectWarehouse(String wareHouseCode);
	int deleteWarehouse(String wareHouseCode);
	int insertWarehouse(WareHouseVo wareHouseVo);
	int updateWarehouse(WareHouseVo wareHouseVo);
}
