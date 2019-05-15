package kr.or.ddit.slip.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.or.ddit.slip.model.AssetVo;

@Repository("assetDao")
public interface IAssetDao {

	/**
	* Method : getAllAsset
	* 작성자 : PC05
	* 변경이력 :
	* @return
	* Method 설명 : 전체 출력
	*/
	List<AssetVo> getAllAsset();
	
	
	/**
	* Method : insertAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetVo
	* @return
	* Method 설명 : 모두 등록
	*/
	
	int insertAsset(AssetVo assetVo);
	
	/**
	* Method : insertStatusAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetVo
	* @return
	* Method 설명 : 부분등록
	*/
	int insertStatusAsset(AssetVo assetVo);
	
	/**
	* Method : updateAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetVo
	* @return
	* Method 설명 : 수정
	*/
	int updateAsset(AssetVo assetVo);
	
	/**
	* Method : selectAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetCode
	* @return
	* Method 설명 : 상세보기 
	*/
	AssetVo selectAsset(String assetCode);
	
	/**
	* Method : updateStatusAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetVo
	* @return
	* Method 설명 : 부분 수정
	*/
	int updateStatusAsset(AssetVo assetVo);
	
	/**
	* Method : deleteAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetCode
	* @return
	* Method 설명 : 취소시 삭제 
	*/
	int deleteAsset(String assetCode);
	
	
	/**
	* Method : searchAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param assetCode
	* @return
	* Method 설명 : 코드로 검색
	*/
	List<AssetVo> searchAsset(String assetCode);
	
	/**
	* Method : searchDateAsset
	* 작성자 : PC05
	* 변경이력 :
	* @param accountName
	* @param acquisitionDate
	* @return
	* Method 설명 : 날짜와 계정검색 
	*/
	List<AssetVo> searchDateAsset(String accountName, String acquisitionDate);
	
	
	int updateSlipNumber(AssetVo assetVo);
	
	
	int updateJangbu(AssetVo assetVo);
	
	
	/**
	* Method : insertDisposal
	* 작성자 : PC05
	* 변경이력 :
	* @param assetVo
	* @return
	* Method 설명 :매각 수정 
	*/
	int updateDisposal(AssetVo assetVo);
}
