package cn.media.categorythird;

import java.util.HashSet;
import java.util.Set;

import cn.media.categorysecond.CategorySecond;
import cn.media.multmedia.MultMedia;



/**
 * 三级分类的实体类对象
 *CREATE TABLE `categorysecond` (
  `ctid` int(11) NOT NULL AUTO_INCREMENT,
  `ctname` varchar(255) DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;



 */
public class CategoryThird {
	private Integer ctid;
	private String ctname;
	// 三级分类所属的二级分类:
	private CategorySecond cstegorySecond;
	// 关联的媒体的集合
	private Set<MultMedia> multMedias = new HashSet<MultMedia>();
	public Integer getCtid() {
		return ctid;
	}
	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}
	public String getCtname() {
		return ctname;
	}
	public void setCtname(String ctname) {
		this.ctname = ctname;
	}
	public CategorySecond getCstegorySecond() {
		return cstegorySecond;
	}
	public void setCstegorySecond(CategorySecond cstegorySecond) {
		this.cstegorySecond = cstegorySecond;
	}
	public Set<MultMedia> getMultMedias() {
		return multMedias;
	}
	public void setMultMedias(Set<MultMedia> multMedias) {
		this.multMedias = multMedias;
	}	
}
