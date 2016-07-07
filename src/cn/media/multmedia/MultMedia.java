package cn.media.multmedia;

import java.util.Date;

import cn.media.categorythird.CategoryThird;

/**
 * 服 多媒体 multimedia
 * @author superme
 *CREATE TABLE `multmedia` (
  `mid` int NOT NULL AUTO_INCREMENT, --主键
  `mname` varchar(32)  ,--媒体标题
  `image` varchar(64)  ,--图片
  `mdesc` varchar(255)  , --描述
  `is_hot` int , --热门
  `pageview` int ,--点击浏览量
  `mdate` datetime  ,--发布日期
  `ctid` int ,--分类号
  PRIMARY KEY (`mid`),
  FOREIGN KEY (`ctid`) REFERENCES `categorythird` (`ctid`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
 */
public class MultMedia {

	private Integer mid;
	private String mname;
	private String image;
	private String mdesc;
	private Integer is_hot;
	private Integer pageview;
	private Date mdate;
	private CategoryThird categoryThird;
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getMdesc() {
		return mdesc;
	}
	public void setMdesc(String mdesc) {
		this.mdesc = mdesc;
	}
	public Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}
	public Integer getPageview() {
		return pageview;
	}
	public void setPageview(Integer pageview) {
		this.pageview = pageview;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public CategoryThird getCategoryThird() {
		return categoryThird;
	}
	public void setCategoryThird(CategoryThird categoryThird) {
		this.categoryThird = categoryThird;
	}
	
	
	
	
}
