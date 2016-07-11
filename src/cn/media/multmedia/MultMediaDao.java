package cn.media.multmedia;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.media.utils.PageHibernateCallback;

public class MultMediaDao extends HibernateDaoSupport{

	
	// 统计某个一级分类下的媒体的总数:
	public Integer findCountByCid(Integer cid) {
		//String sql = "SELECT COUNT(*) FROM multmedia m ,categorythird ct,categorysecond cs,category c WHERE m.ctid = ct.ctid AND ct.csid = cs.csid AND cs.cid = c.cid AND c.cid=?;";
		String hql = "select count(*) from MultMedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		
		List<Long> list = this.getHibernateTemplate().find(hql,cid);
		System.out.println("list:====某一级分类下所有的媒体========="+list.get(0).intValue());
		return list.get(0).intValue();
	}

	public List<MultMedia> findByPage(Integer cid, int begin, int limit) {
		// String sql = "select m.* from multmedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		String hql = "select m from MultMedia m join m.categoryThird ct join ct.cstegorySecond cs join cs.category c where c.cid = ?";
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>(hql, new Object[]{cid}, begin, limit));
		List<MultMedia> newList=new ArrayList<MultMedia>();
		Iterator<MultMedia>it =list.listIterator();
		while (it.hasNext()){
			MultMedia media=it.next();
			if(!newList.contains(media)){
			newList.add(media);
			}
		}
		return newList;
	}

	//Dao层查询热门媒体只显示10个
	public List<MultMedia> findHot() {
		// DetachedCriteria criteria =
		// DetachedCriteria.forClass(MultMedia.class);
		// criteria.add(Restrictions.eq("is_hot", 1));
		// List<MultMedia> list =
		// this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>("from MultMedia where is_hot=?", new Object[]{1}, 0, 10));
		return list;
	}

	//Dao层的查询最新媒体
	public List<MultMedia> findNew() {
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>("from MultMedia order by mdate desc", null , 0, 10));
		return list;
	}

	public Integer findCount() {
		String hql = "select count(*) from MultMedia";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list.size() > 0){
			return list.get(0).intValue();
		}
		return null;
	}

	public List<MultMedia> findByPage(int begin, int limit) {
		String hql = "from MultMedia";
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>(hql, null, begin, limit));
		if(list.size() > 0){
			return list;
		}
		return null;
	}

	public void save(MultMedia multMedia) {
		this.getHibernateTemplate().save(multMedia);
	}

	public MultMedia findByMid(Integer mid) {
		return this.getHibernateTemplate().get(MultMedia.class, mid);
	}

	public void delete(MultMedia multMedia) {
		this.getHibernateTemplate().delete(multMedia);
	}

	// 统计某三级分类下所有媒体
	public Integer findCountByCtid(Integer ctid) {
		//String sql = "SELECT COUNT(*) FROM MultMedia m , categorythird ct WHERE m.ctid = ct.ctid AND ct.ctid = 2;";
		String hql = "select count(*) from MultMedia m join m.categoryThird ct where ct.ctid = ?";
		
		List<Long> list = this.getHibernateTemplate().find(hql,ctid);
		System.out.println("list:====某一级分类下所有的媒体========="+list.get(0).intValue());
		return list.get(0).intValue();
	}

	public List<MultMedia> findByPage(Integer ctid, int begin, int limit,
			String string) {
		// String sql = "select m.* from multmedia m  where m.ctid = ?";
		String hql = "select m from MultMedia m join m.categoryThird ct where ct.ctid = ?";
		List<MultMedia> list = this.getHibernateTemplate().executeFind(new PageHibernateCallback<MultMedia>(hql, new Object[]{ctid}, begin, limit));
		List<MultMedia> newList=new ArrayList<MultMedia>();
		Iterator<MultMedia>it =list.listIterator();
		while (it.hasNext()){
			MultMedia media=it.next();
			if(!newList.contains(media)){
			newList.add(media);
			}
		}
		return newList;
	}

	public Integer findCtid(Integer mid) {
		String hql = "select ct.ctid from MultMedia m join m.categoryThird ct where m.mid = ?";
		
		List<Integer> list = this.getHibernateTemplate().find(hql,mid);
		return list.get(0);
	}

}
