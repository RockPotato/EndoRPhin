package kr.or.ddit.client;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.order.model.ClientVo;
import kr.or.ddit.order.service.ClientService;
import kr.or.ddit.order.service.ICilentService;

@Controller()
public class ClientController {
	
	private Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Resource(name="clientService")
	private ICilentService clientService;
	
	
	/**
	* Method : clientView
	* 작성자 : sanghoyun
	* 변경이력 :
	* @return
	* Method 설명 : 거래처 데이터를 전부 불러온다.
	*/
	@RequestMapping(path="/clientview", method=RequestMethod.GET)
	public String clientView(Model model) {
		
		List<ClientVo> clientList = clientService.getAllClient();
		model.addAttribute("clientList", clientList);
			
		return "clientview";
	}
	
	
	@RequestMapping(path="/seachCodeClient", method=RequestMethod.GET)
	public String seachCodeClient(@RequestParam("cCode")String cCode, Model model) {
		
		List<ClientVo> clientList = clientService.getCodeClient(cCode);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	
	@RequestMapping(path="/seachNameClient", method=RequestMethod.GET)
	public String seachNameClient(@RequestParam("cName")String cName, Model model) {
		
		List<ClientVo> clientList = clientService.getNameClient(cName);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	@RequestMapping(path="/seachBothClient", method=RequestMethod.GET)
	public String seachBothClient(@RequestParam("BothName")String BothName
								, @RequestParam("BothCode")String BothCode
								, Model model) {
		
		List<ClientVo> clientList = clientService.getBothClient(BothName, BothCode);
		model.addAttribute("clientList", clientList);
		
		return "clientview";
	}
	
	
    
    
	@RequestMapping(path="/insertClient", method=RequestMethod.GET)
	public String insertClient(	@RequestParam(name="frmClCode", defaultValue="9999")String clientCode
							, 	@RequestParam(name="frmClName", defaultValue="미등록")String clientName
							, 	@RequestParam(name="frmClSalesNumber", defaultValue="9999")String salesNumber
							, 	@RequestParam(name="frmClManager", defaultValue="미등록")String manager
							, 	@RequestParam(name="frmClTelephone", defaultValue="미등록")String telephone
							, 	@RequestParam(name="frmClFaxNumber", defaultValue="9999")String faxNumber
							, 	@RequestParam(name="frmClManagerEmail", defaultValue="미등록")String managerEmail
							, 	@RequestParam(name="frmClBusinessType", defaultValue="미등록")String businessType
							, 	@RequestParam(name="frmClPlace", defaultValue="미등록")String place
							, 	@RequestParam(name="frmClBusiness", defaultValue="미등록")String business
							, 	@RequestParam(name="frmClBankname", defaultValue="미등록")String bankName
							, 	@RequestParam(name="frmClAccountNumber", defaultValue="9999")String accountNumber
							, 	@RequestParam(name="frmClRelate", defaultValue="미등록")String relate
							,	Model model) { 
		
		
		logger.debug("businessType : {}" , businessType);
		
		ClientVo clientVo = new ClientVo();
		
		clientVo.setClientCode(clientCode);
		clientVo.setClientName(clientName);
		clientVo.setSalesNumber(salesNumber);
		clientVo.setManager(manager);
		clientVo.setTelephone(telephone);
		clientVo.setFaxNumber(faxNumber);
		clientVo.setManagerEmail(managerEmail);
		clientVo.setBusinessType(businessType);
		clientVo.setPlace(place);
		clientVo.setBusiness(business);
		clientVo.setBankName(bankName);
		clientVo.setAccountNumber(accountNumber);
		clientVo.setRelate(relate);
		
		int cnt = clientService.insertClient(clientVo);
		
			
		return "redirect:/clientview";
	}
	
	
	@RequestMapping(path="/clientDupl", method=RequestMethod.POST)
	@ResponseBody
	public String clientDupl(@RequestParam(name="clientCode", defaultValue="WS")String clientCode) {
		
		List<ClientVo> clientList = clientService.getAllClient();
		//Not Duplicate Code = 0
		String duplicateCode = "1";
		
		for(int i = 0; i < clientList.size(); i++) {
			// Duplicate Code = 0
			if(clientCode.equals(clientList.get(i).getClientCode())){
				duplicateCode = "0";
				return duplicateCode;
				
			// WhiteSpace Code = WS
			} else if(clientCode.equals("WS")) {
				duplicateCode = "WS";
				return duplicateCode;
			}
		}
		
		return duplicateCode;
		
		
	}
	
	@RequestMapping(path="/viewDetailClient", method=RequestMethod.GET)
	public String viewDetailClient(@RequestParam("clientCode")String clientCode
								,Model model) {
		
		List<ClientVo> vo = clientService.getCodeClient(clientCode);
		logger.debug("vo : {}", vo.size());
		
		model.addAttribute("vo", vo);
		
		return "viewDetailClient";
	}
	
	
	@RequestMapping(path="/clientUpdate", method=RequestMethod.POST)
	public String clientUpdate(	 @RequestParam(name="frmclientCode", defaultValue="미등록")String clientCode
								,@RequestParam(name="frmclientName", defaultValue="미등록")String clientName
								,@RequestParam(name="frmsalesNumber", defaultValue="미등록")String salesNumber
								,@RequestParam(name="frmmanager", defaultValue="미등록")String manager
								,@RequestParam(name="frmtelephone", defaultValue="미등록")String telephone
								,@RequestParam(name="frmfaxNumber", defaultValue="미등록")String faxNumber
								,@RequestParam(name="frmmanagerEmail", defaultValue="미등록")String managerEmail
								,@RequestParam(name="frmbusiness", defaultValue="미등록")String business
								,@RequestParam(name="frmplace", defaultValue="미등록")String place
								,@RequestParam(name="frmrelate", defaultValue="미등록")String relate
								,@RequestParam(name="frmbusinessType", defaultValue="미등록")String businessType
								,@RequestParam(name="frmbankName", defaultValue="미등록")String bankName
								,@RequestParam(name="frmaccountNumber", defaultValue="미등록")String accountNumber
								,@RequestParam(name="frmuseStatus", defaultValue="미등록")String useStatus
								) {
		
		ClientVo vo = new ClientVo();
		vo.setClientCode(clientCode);
		vo.setClientName(clientName);
		vo.setSalesNumber(salesNumber);
		vo.setManager(manager);
		vo.setTelephone(telephone);
		vo.setFaxNumber(faxNumber);
		vo.setManagerEmail(managerEmail);
		vo.setBusiness(businessType);
		vo.setPlace(place);
		vo.setRelate(relate);
		vo.setBusinessType(businessType);
		vo.setBankName(bankName);
		vo.setAccountNumber(accountNumber);
		vo.setUseStatus(useStatus);
		
		int cnt = clientService.updateClient(vo);
		
		
			
		return "redirect:/viewDetailClient?clientCode="+clientCode;
	}
	
	
	@RequestMapping(path="deleteClient", method=RequestMethod.GET)
	public String deleteClient(@RequestParam(name="deleteCode")String clientCode) {
		
		int cnt = clientService.deleteClient(clientCode);
		
		return "redirect:/clientview";
	}
	
	@RequestMapping("/ClientSearchUseSlip")
	public String ClientSearchUseSlip(@RequestParam("searchClientValue2")String searchClientValue2, Model model) {
			
			List<ClientVo> searchResultClient = clientService.getNameClient(searchClientValue2);
			
			model.addAttribute("searchResultClient", searchResultClient);
		
		return "slip/clientSearchAjaxHtml";
	}
	

}














