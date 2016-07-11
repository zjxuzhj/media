package cn.media.categorythird;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import cn.media.utils.PageHibernateCallback;

public class CategoryThirdDao extends HibernateDaoSupport{

	public List<CategoryThird> findAll() {
		return this.getHibernateTemplate().find("from CategoryThird");
	}


	// 查询某个二级分类下所有的三级分类
		public List<CategoryThird> findByCsid(Integer csid) {
			return this.getHibernateTemplate().find(
					"from CategoryThird where csid=?", csid);
		}

		// 保存二级分类
		public void save(CategoryThird categoryThird) {
			this.getHibernateTemplate().save(categoryThird);
		}

		// 查询二级分类的总记录数
		public Integer findCount() {
			List<Long> list = this.getHibernateTemplate().find(
					"select count(*) from CategoryThird");
			if (list.size() > 0) {
				return list.get(0).intValue();
			}
			return null;
		}

		// 分页查询
		public List<CategoryThird> findByPage(Integer begin, Integer limit) {
			String hql = "from CategoryThird";
			List<CategoryThird> list = this.getHibernateTemplate().executeFind(
					new PageHibernateCallback<CategoryThird>(hql, null, begin,
							limit));
			if (list.size() > 0) {
				return list;
			}
			return null;
		}

		// DAO层的删除二级分类
		public void delete(CategoryThird categoryThird) {
			categoryThird = this.getHibernateTemplate().get(CategoryThird.class,
					categoryThird.getCtid());
			this.getHibernateTemplate().delete(categoryThird);
		}
}
