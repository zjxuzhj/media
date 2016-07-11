package cn.media.categorysecond;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.media.utils.PageHibernateCallback;

public class CategorySecondDao extends HibernateDaoSupport {

	public List<CategorySecond> findAll() {
		return this.getHibernateTemplate().find("from CategorySecond");
	}

	// 查询某个一级分类下所有的二级分类
	public List<CategorySecond> findByCid(Integer cid) {
		return this.getHibernateTemplate().find(
				"from CategorySecond where cid=?", cid);
	}

	// 保存二级分类
	public void save(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);
	}

	// 查询二级分类的总记录数
	public Integer findCount() {
		List<Long> list = this.getHibernateTemplate().find(
				"select count(*) from CategorySecond");
		if (list.size() > 0) {
			return list.get(0).intValue();
		}
		return null;
	}

	// 分页查询
	public List<CategorySecond> findByPage(Integer begin, Integer limit) {
		String hql = "from CategorySecond";
		List<CategorySecond> list = this.getHibernateTemplate().executeFind(
				new PageHibernateCallback<CategorySecond>(hql, null, begin,
						limit));
		if (list.size() > 0) {
			return list;
		}
		return null;
	}

	// DAO层的删除二级分类
	public void delete(CategorySecond categorySecond) {
		categorySecond = this.getHibernateTemplate().get(CategorySecond.class,
				categorySecond.getCsid());
		this.getHibernateTemplate().delete(categorySecond);
	}

	// DAO层查询二级分类
	public CategorySecond findByCsid(Integer csid) {
		return this.getHibernateTemplate().get(CategorySecond.class, csid);
	}

	// DAO层的修改二级分类
	public void update(CategorySecond categorySecond) {
		this.getHibernateTemplate().update(categorySecond);
	}
}
