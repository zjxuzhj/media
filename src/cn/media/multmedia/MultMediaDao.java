package cn.media.multmedia;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class MultMediaDao extends HibernateDaoSupport{

	
	// 统计某个分类下的商品的总数:
	public Integer findCountByCid(Integer cid) {
		return null;
	}

}
