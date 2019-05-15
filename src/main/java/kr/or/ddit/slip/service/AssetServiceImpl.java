package kr.or.ddit.slip.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.slip.dao.IAssetDao;
import kr.or.ddit.slip.model.AssetVo;

@Service("assetService")
public class AssetServiceImpl implements IAssetService{

	@Resource(name="assetDao")
	private IAssetDao assetDao;
	
	@Override
	public List<AssetVo> getAllAsset() {
		return assetDao.getAllAsset();
	}

	@Override
	public int insertAsset(AssetVo assetVo) {
		return assetDao.insertAsset(assetVo);
	}

	@Override
	public int insertStatusAsset(AssetVo assetVo) {
		return assetDao.insertStatusAsset(assetVo);
	}
	@Override
	public int updateAsset(AssetVo assetVo) {
		return assetDao.updateAsset(assetVo);
	}

	@Override
	public AssetVo selectAsset(String assetCode) {
		return assetDao.selectAsset(assetCode);
	}

	@Override
	public int updateStatusAsset(AssetVo assetVo) {
		return assetDao.updateStatusAsset(assetVo);
	}

	@Override
	public int deleteAsset(String assetCode) {
		return assetDao.deleteAsset(assetCode);
	}

	@Override
	public List<AssetVo> searchAsset(String assetCode) {
		return assetDao.searchAsset(assetCode);
	}

	@Override
	public List<AssetVo> searchDateAsset(String accountName, String acquisitionDate) {
		return assetDao.searchDateAsset(accountName, acquisitionDate);
	}

	@Override
	public int updateSlipNumber(AssetVo assetVo) {
		return assetDao.updateSlipNumber(assetVo);
	}

	@Override
	public int updateJangbu(AssetVo assetVo) {
		return assetDao.updateJangbu(assetVo);
	}

	@Override
	public int updateDisposal(AssetVo assetVo) {
		return assetDao.updateDisposal(assetVo);
	}




}
