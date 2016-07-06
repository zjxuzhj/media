package cn.media.categorythird;



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
//	private Cstegory cstegory;
	// 关联的商品的集合
	
//	public Integer getCsid() {
//		return csid;
//	}
//	public void setCsid(Integer csid) {
//		this.csid = csid;
//	}
//	public String getCsname() {
//		return csname;
//	}
//	public void setCsname(String csname) {
//		this.csname = csname;
//	}
//	public Category getCategory() {
//		return category;
//	}
//	public void setCategory(Category category) {
//		this.category = category;
//	}
//	public Set<Product> getProducts() {
//		return products;
//	}
//	public void setProducts(Set<Product> products) {
//		this.products = products;
//	}
	
}
