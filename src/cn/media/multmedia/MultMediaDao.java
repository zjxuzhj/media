package cn.media.multmedia;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.media.utils.PageHibernateCallback;

public class MultMediaDao extends HibernateDaoSupport{

	
	// 统计某个一级分类下的媒体的总数:
	public Integer findCountByCid(Integer cid) {
		//String sql = "SELECT COUNT(*) FROM multmedia m ,categorythird ct,categorysecond cs,category c WHERE m.ctid = ct.ctid AND ct.csid = cs.csid AND cs.cid = c.cid AND c.cid=?;";
		String hql = "select count(*) from MultMedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		//String hql = "select count(*) from Product p join p.categorySecond cs join cs.category c where c.cid = ?";
		
		List<Long> list = this.getHibernateTemplate().find(hql,cid);
		System.out.println("list:====某一级分类下所有的媒体========="+list.get(0).intValue());
		return list.get(0).intValue();
	}

	public List<MultMedia> findByPage(Integer cid, int begin, int limit) {
		// String sql = "select m.* from multmedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		String hql = "select m from MultMedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>(hql, new Object[]{cid}, begin, limit));
		return list;
	}

}
