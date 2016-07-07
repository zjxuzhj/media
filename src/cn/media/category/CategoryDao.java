package cn.media.category;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryDao extends HibernateDaoSupport{

	// DAO层的查询所有的一级分类的代码
	public List<Category> findAll() {
		return this.getHibernateTemplate().find("from Category");
	}

}
