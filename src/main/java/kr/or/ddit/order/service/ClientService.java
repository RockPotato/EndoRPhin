package kr.or.ddit.order.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.or.ddit.order.dao.IClientDao;
import kr.or.ddit.order.model.ClientVo;

@Service("clientService")
public class ClientService implements ICilentService{

	@Resource(name="clientDao")
	private IClientDao clientDao;
	
	
	/**
	* Method : getAllClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 정보를 전부 조회한다.
	*/
	@Override
	public List<ClientVo> getAllClient() {
		
		return clientDao.getAllClient();
	}

	/**
	* Method : getCodeClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientCode값을 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getCodeClient(String clientCode) {
		
		return clientDao.getCodeClient(clientCode);
	}

	/**
	* Method : getCodeClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName값을 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getNameClient(String clientName) {
		
		return clientDao.getNameClient(clientName);
	}

	/**
	* Method : getBothClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param map
	* @return
	* Method 설명 : ClientName과 ClientCode를 기준으로 거래처를 조회한다.
	*/
	@Override
	public List<ClientVo> getBothClient(String clientName, String clientCode) {
		
		return clientDao.getBothClient(clientName, clientCode);
	}

	/**
	* Method : insertClient
	* 작성자 : sanghoyun
	* 변경이력 :
	* @param clientVo
	* @return
	* Method 설명 : 거래처 데이터 추가
	*/
	@Override
	public int insertClient(ClientVo clientVo) {
		return clientDao.insertClient(clientVo);
	}

	@Override
	public int updateClient(ClientVo clientVo) {
		return clientDao.updateClient(clientVo);
	}

	@Override
	public int deleteClient(String clientCode) {
		return clientDao.deleteClient(clientCode);
	}
	
	
	

}
