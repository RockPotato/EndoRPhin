package kr.or.ddit.slip.service;

import java.util.List;

import kr.or.ddit.slip.model.AssetVo;

public interface IAssetService {

	List<AssetVo> getAllAsset();
	
	int insertAsset(AssetVo assetVo);
	
	int insertStatusAsset(AssetVo assetVo);
	
	int updateAsset(AssetVo assetVo);
	
	AssetVo selectAsset(String assetCode);
	
	int updateStatusAsset(AssetVo assetVo);

	int deleteAsset(String assetCode);
	
	List<AssetVo> searchAsset (String assetCode );
	
	List<AssetVo> searchDateAsset(String accountName, String acquisitionDate);
	
	int updateSlipNumber(AssetVo assetVo);

	int updateJangbu(AssetVo assetVo);
	
	int updateDisposal(AssetVo assetVo);
}
