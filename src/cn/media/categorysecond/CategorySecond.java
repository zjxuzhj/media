package cn.media.categorysecond;

import java.util.HashSet;
import java.util.Set;

import cn.media.category.Category;
import cn.media.categorythird.CategoryThird;

/**
 * 
 * @author superme
 *
 *CREATE TABLE `categorysecond` (
  `csid` int NOT NULL AUTO_INCREMENT, --二级分类主键
  `csname` varchar(20)  ,--二级分类名
  `cid` int  ,			--一级分类外键
  PRIMARY KEY (`csid`),
  FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) 
 */
public class CategorySecond {
	private Integer csid;
	private String csname;
	// 二级分类所属的一级分类:
	private Category category;
	//关联三级分类集合
	private Set<CategoryThird> categoryThirds = new HashSet<CategoryThird>();
	public Integer getCsid() {
		return csid;
	}
	public void setCsid(Integer csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Set<CategoryThird> getCategoryThirds() {
		return categoryThirds;
	}
	public void setCategoryThirds(Set<CategoryThird> categoryThirds) {
		this.categoryThirds = categoryThirds;
	}
	
	

}
