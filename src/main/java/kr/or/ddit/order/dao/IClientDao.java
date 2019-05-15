package kr.or.ddit.order.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.order.model.ClientVo;

public interface IClientDao {
	
	/**
	* Method : getAllClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 정보를 전부 조회한다.
	*/
	List<ClientVo> getAllClient();
	
	
	
	/**
	* Method : getCodeClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientCode값을 기준으로 거래처를 조회한다.
	*/
	List<ClientVo> getCodeClient(String clientCode);
	
	
	/**
	* Method : getNameClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName값을 기준으로 거래처를 조회한다.
	*/
	List<ClientVo> getNameClient(String clientName);
	
	
	/**
	* Method : getBothClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName과 ClientCode를 기준으로 거래처를 조회한다.
	*/
	List<ClientVo> getBothClient(String clientName, String clientCode);
	
	
	/**
	* Method : insertClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param clientVo
	* @return
	* Method 설명 : 거래처 데이터 추가
	*/
	int insertClient(ClientVo clientVo);
	
	
	/**
	* Method : updateClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param clientVo
	* @return
	* Method 설명 : 거래처 코드를 기준으로 거래처 수정하기
	*/
	int updateClient(ClientVo clientVo);
	
	
	/**
	* Method : deleteClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param clientCode
	* @return
	* Method 설명 : 거래처 코드를 기준으로 거래처 삭제하기
	*/
	int deleteClient(String clientCode);
	
	
}
