package kr.or.ddit.product.controller;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import kr.or.ddit.image.model.ImagesVo;
import kr.or.ddit.image.service.IImagesService;
import kr.or.ddit.product.model.ProductVo;
import kr.or.ddit.product.service.IProductService;

@RequestMapping(path="/product")
@Controller
public class ProductController {
	
	private Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Resource(name="productService")
	IProductService productService;
	
	@Resource(name="imagesService")
	IImagesService imagesService;
	
	@RequestMapping(path="/productInput")
	public String productInput(String productName,Model model){
		List<ProductVo> list=new ArrayList<>();
		if(productName!=null)
			list = productService.searchByName(productName);
		else
			list = productService.getAllProduct();
		model.addAttribute("allProductList",list);
		return "prodInput";
	}
	
	@RequestMapping(path = "/findProductCode", method = RequestMethod.POST, produces = { "application/json" })
	@ResponseBody
	public ProductVo findDeductCode_post(String productCode) {
		ProductVo selectProduct = productService.selectProduct(productCode);
		if(selectProduct.getImageCode()!=null){
			ImagesVo selectImages = imagesService.selectImages(selectProduct.getImageCode());
			selectProduct.setImageName(selectImages.getImageRealpath()+selectImages.getImageRealname());
		}
		return selectProduct;
	}
	@RequestMapping(path="/deleteProduct",method=RequestMethod.POST)
	public String deleteProduct(String[] productCode){
		for (int i = 0; i < productCode.length; i++) {
			productService.deleteProduct(productCode[i]);
		}
		return "redirect:/product/productInput";
	}
	
	@RequestMapping(path="/insOrUpdProduct",method=RequestMethod.POST)
	public String insertProduct(ProductVo productVo,MultipartRequest multparts) throws IllegalStateException, IOException{
		logger.debug("확인:{}",productVo.getProductCode());
		if(!(multparts.getFile("fileName").isEmpty())){
			String updateOrInsertImages = imagesService.updateOrInsertImages(new ImagesVo(), multparts);
			productVo.setImageCode(updateOrInsertImages);
		}
		if(productVo.getProductCode().equals(""))
			productService.insertProduct(productVo);
		else
			productService.updateProduct(productVo);
		return "redirect:/product/productInput";
	}
	
}
