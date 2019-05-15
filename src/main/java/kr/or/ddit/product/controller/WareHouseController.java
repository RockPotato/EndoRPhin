package kr.or.ddit.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.order.model.OrdersVo;
import kr.or.ddit.order.service.ICilentService;
import kr.or.ddit.order.service.IOrdersService;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.model.ReceiveVo;
import kr.or.ddit.product.model.Receive_detailVo;
import kr.or.ddit.product.model.WareHouseVo;
import kr.or.ddit.product.service.IReceiveService;
import kr.or.ddit.product.service.IReceive_detailService;
import kr.or.ddit.product.service.IWareHouseService;

@RequestMapping("/wareHouse")
@Controller
public class WareHouseController {
	
	private Logger logger = LoggerFactory.getLogger(WareHouseController.class);
	
	@Resource(name="ordersService")
	IOrdersService ordersService;
	
	@Resource(name="wareHouseService")
	IWareHouseService wareHouseService;
	
	@Resource(name="receiveService")
	IReceiveService receiveService;
	
	@Resource(name="receive_detailService")
	IReceive_detailService receive_detailService;
	
	
	@RequestMapping(path="/getAllWareHouse")
	public String getAllWareHouse(Model model){
		model.addAttribute("allWareHouse",wareHouseService.getAllWarehouse());
		return "wareHouseTiles";
	}
	
	@RequestMapping(path = "/findWareHouseCode", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public WareHouseVo findWareHouseCode(Model model, String wareHouseCode) {
		WareHouseVo selectWarehouse = wareHouseService.selectWarehouse(wareHouseCode);
		return selectWarehouse;
	}
	
	@RequestMapping(path="/insOrUpdReceive")
	public String insOrUpdReceive(ReceiveVo receiveVo,String[] quantity,String[] productCode){
		if(receiveVo.getReceiveCode().equals("")){
			receiveService.insertReceive(receiveVo);
		}
		Map<String,Object> map = new HashMap<>();
		map.put("receiveCode",receiveVo.getReceiveCode());
		receive_detailService.deleteReceive_detail(map);
		for (int i = 0; i < quantity.length; i++) {
			receive_detailService.insertReceive_detail(new 
					Receive_detailVo(receiveVo.getReceiveCode(), productCode[i], quantity[i]));
		}
		receiveService.updateReceive(receiveVo);
		return "redirect:/wareHouse/getAllReceive";
	}
	
	@RequestMapping(path="/deleteReceive")
	public String deleteReceive(String[] receiveCode){
		for (int i = 0; i < receiveCode.length; i++) {
			receiveService.deleteReceive(receiveCode[i]);
		}
		return "redirect:/wareHouse/getAllReceive";
	}
	@RequestMapping(path="/deleteWareHouse")
	public String deleteWareHouse(String[] wareHouseCode){
		for (int i = 0; i < wareHouseCode.length; i++) {
			wareHouseService.deleteWarehouse(wareHouseCode[i]);
		}
		return "redirect:/wareHouse/getAllWareHouse";
	}
	
	@RequestMapping(path="/insOrUpdWareHouse",method=RequestMethod.POST)
	public String updateWareHouse(WareHouseVo wareHouseVo){
		if(wareHouseVo.getWareHouseCode().equals(""))
			wareHouseService.insertWarehouse(wareHouseVo);
		else
			wareHouseService.updateWarehouse(wareHouseVo);
		return "redirect:/wareHouse/getAllWareHouse";
	}
	
	@RequestMapping(path="/selectModal")
	@ResponseBody
	public Map<String, Object> selectModal(String check){
		Map<String, Object> map = new HashMap<>();
		switch (check) {
			case "0":
				map.put("orderList", ordersService.searchByName(new OrdersVo()));
				break;
			default:
				map.put("wareHouseList", wareHouseService.getAllWarehouse());
				break;
		}
		return map;
	}
	
	@RequestMapping(path="/getAllReceive")
	public String getAllReceive(Model model,String preDate,String postDate){
		Map<String, Object> map= new HashMap<>();
		if(preDate!=null){
			map.put("preDate", preDate);
			map.put("postDate", postDate);
		}
		model.addAttribute("receiveList",receiveService.getAllReceive(map));
		return "receiveInput";
	}
	
	@RequestMapping(path="/findReceive")
	@ResponseBody
	public Map<String,Object> findReceive(String receiveCode){
		Map<String,Object> map = new HashMap<>();
		map.put("receiveCode", receiveCode);
		map.put("receiveVo", receiveService.selectReceive(map).get(0));
		map.put("receiveDetailList", receive_detailService.getReceive_detail(receiveCode));
		return map;
	}
}
