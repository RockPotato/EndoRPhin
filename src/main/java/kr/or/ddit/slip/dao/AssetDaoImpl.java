package kr.or.ddit.slip.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.slip.model.AssetVo;

@Repository("assetDao")
public class AssetDaoImpl implements IAssetDao{

	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<AssetVo> getAllAsset() {
		return sqlSessionTemplate.selectList("asset.getAllAsset");
	}

	
	@Override
	public int insertAsset(AssetVo assetVo) {
		return sqlSessionTemplate.insert("asset.insertAsset", assetVo);
	}


	@Override
	public int updateAsset(AssetVo assetVo) {
		return sqlSessionTemplate.update("asset.updateAsset",assetVo);
	}

	@Override
	public int insertStatusAsset(AssetVo assetVo) {
		return sqlSessionTemplate.insert("asset.insertStatusAsset",assetVo);
	}


	@Override
	public AssetVo selectAsset(String assetCode) {
		return sqlSessionTemplate.selectOne("asset.selectAsset",assetCode);
	}


	@Override
	public int updateStatusAsset(AssetVo assetVo) {
		return sqlSessionTemplate.update("asset.updateStatusAsset",assetVo);
	}


	@Override
	public int deleteAsset(String assetCode) {
		return sqlSessionTemplate.delete("asset.deleteAsset",assetCode);
	}


	@Override
	public List<AssetVo> searchAsset(String assetCode) {
		HashMap<String, String> map = new HashMap<>();
		map.put("assetCode", assetCode);
		 
		return sqlSessionTemplate.selectList("asset.searchAsset", map);
	}


	@Override
	public List<AssetVo> searchDateAsset(String accountName, String acquisitionDate) {
		HashMap<String, String> map = new HashMap<>();
		map.put("accountName", accountName);
		map.put("acquisitionDate", acquisitionDate);
		
		return sqlSessionTemplate.selectList("asset.searchDateAsset", map);
	}


	@Override
	public int updateSlipNumber(AssetVo assetVo) {
		return sqlSessionTemplate.update("updateSlipNumber",assetVo);
	}

	@Override
	public int updateJangbu(AssetVo assetVo) {
		return sqlSessionTemplate.update("updateJangbu",assetVo);
	}


	@Override
	public int updateDisposal(AssetVo assetVo) {
		return sqlSessionTemplate.insert("updateDisposal",assetVo);
	}
}
