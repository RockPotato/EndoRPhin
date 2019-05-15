package kr.or.ddit.product.model;

import java.io.File;

/**
 * 
 * @author sanghoyun
 *
 */
public class ProductVo {
	
	String productCode;
	String productName;
	String standard;
	String outLine;
	String usestatus;
	String basePrice;
	String imageCode;
	
	String imageName; // 이미지를 불러오기 위한 변수
	
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getOutLine() {
		return outLine;
	}
	public void setOutLine(String outLine) {
		this.outLine = outLine;
	}
	public String getUsestatus() {
		return usestatus;
	}
	public void setUsestatus(String usestatus) {
		this.usestatus = usestatus;
	}
	public String getBasePrice() {
		return basePrice;
	}
	public void setBasePrice(String basePrice) {
		this.basePrice = basePrice;
	}
	@Override
	public String toString() {
		return "ProductVo [productCode=" + productCode + ", productName=" + productName + ", standard=" + standard
				+ ", outLine=" + outLine + ", usestatus=" + usestatus + ", basePrice=" + basePrice + ", imageCode="
				+ imageCode + ", imageName=" + imageName + "]";
	}
	
	

}
