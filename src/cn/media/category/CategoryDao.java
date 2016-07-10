package cn.media.category;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryDao extends HibernateDaoSupport {

	// DAO层的查询所有的一级分类的代码
	public List<Category> findAll() {
		return this.getHibernateTemplate().find("from Category");
	}

	// DAO层添加一级分类的代码
	public void save(Category category) {
		this.getHibernateTemplate().save(category);
	}

	// DAO层的删除一级分类
	public void delete(Category category) {
		category = this.getHibernateTemplate().get(Category.class,
				category.getCid());
		this.getHibernateTemplate().delete(category);
	}

	// DAO层查询一级分类
	public Category findByCid(Integer cid) {
		return this.getHibernateTemplate().get(Category.class, cid);
	}

	// DAO层的修改一级分类
	public void update(Category category) {
		this.getHibernateTemplate().update(category);
	}
}
