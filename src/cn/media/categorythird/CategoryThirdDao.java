package cn.media.categorythird;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class CategoryThirdDao extends HibernateDaoSupport{

	public List<CategoryThird> findAll() {
		return this.getHibernateTemplate().find("from CategoryThird");
	}


}
