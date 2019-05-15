package kr.or.ddit.image.model;
/**
 * 
 * @author sanghoyun
 *
 */
public class ImagesVo {
	
	String imageCode;
	String imageName;
	String imageRealpath;
	String imageRealname;
	String userName;
	String userId;
	
	public String getImageCode() {
		return imageCode;
	}
	public void setImageCode(String imageCode) {
		this.imageCode = imageCode;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getImageRealpath() {
		return imageRealpath;
	}
	public void setImageRealpath(String imageRealpath) {
		this.imageRealpath = imageRealpath;
	}
	public String getImageRealname() {
		return imageRealname;
	}
	public void setImageRealname(String imageRealname) {
		this.imageRealname = imageRealname;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public ImagesVo() {
	}
	public ImagesVo(String imageName, String imageRealpath, String imageRealname) {
		this.imageName = imageName;
		this.imageRealpath = imageRealpath;
		this.imageRealname = imageRealname;
	}
	
	
 
}
