package cn.media.categorythird;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.media.categorysecond.CategorySecond;
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
		// DAO层查询二级分类
		public CategoryThird findByCtid(Integer ctid) {
			return this.getHibernateTemplate().get(CategoryThird.class, ctid);
		}

		// DAO层的修改二级分类
		public void update(CategoryThird categoryThird) {
			this.getHibernateTemplate().update(categoryThird);
		}


		public Integer findCid(Integer ctid) {
			//String sql = " SELECT c.cid FROM categorythird ct, categorysecond cs, category c WHERE m.ctid = ct.ctid AND ct.csid = cs.csid AND cs.cid = c.cid AND ct.ctid = 12;";
			           //"select m from MultMedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
			String hql = "select c.cid from CategoryThird ct join ct.cstegorySecond cs join cs.category c where ct.ctid = ?";
			
			List<Integer> list = this.getHibernateTemplate().find(hql,ctid);
			System.out.println("list:====某三级分类下归属的一级分类========="+ list.get(0));
			return list.get(0);
		}
}
