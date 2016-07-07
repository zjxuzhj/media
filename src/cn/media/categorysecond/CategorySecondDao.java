package cn.media.categorysecond;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategorySecondDao extends HibernateDaoSupport{

	public List<CategorySecond> findAll() {
		return this.getHibernateTemplate().find("from CategorySecond");
	}
	
	// 查询某个一级分类下所有的二级分类
	public List<CategorySecond> findByCid(Integer cid) {
		return this.getHibernateTemplate().find("from CategorySecond where cid=?", cid);
	}
}
