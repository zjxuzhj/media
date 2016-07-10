package cn.media.multmedia;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.media.utils.PageBean;
/**
 * 
 * @author superme
 *
 */
@Transactional
public class MultMediaService {

	// 注入multMediaDao
	private MultMediaDao multMediaDao;
	
	public void setMultMediaDao(MultMediaDao multMediaDao) {
		this.multMediaDao = multMediaDao;
	}
	
	//业务层查询热门商品
	public List<MultMedia> findHot(){
		  return multMediaDao.findHot();
	}

	// 分类页面的显示商品的方法
	public PageBean<MultMedia> findByPage(Integer cid, Integer page) {
		int limit = 12; // 每页显示记录数.
		int totalPage = 0; // 总页数
		PageBean<MultMedia> pageBean = new PageBean<MultMedia>();
		pageBean.setPage(page);
		pageBean.setLimit(limit);		
		// 查询总记录数:
		Integer totalCount = multMediaDao.findCountByCid(cid);
		pageBean.setTotalCount(totalCount);
		// 总页数的封装
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 商品数据集合:
		int begin = (page - 1) * limit;
		List<MultMedia> list = multMediaDao.findByPage(cid,begin ,limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	//业务层查询最新商品
	public List<MultMedia> findNew() {
		return multMediaDao.findNew();
	}

	// 业务层查询所有商品带有分页:
	public PageBean<MultMedia> findByPage(Integer page) {
		// 封装PageBean对象.
		PageBean<MultMedia> pageBean = new PageBean<MultMedia>();
		int limit = 10;//每页显示的记录数
		pageBean.setPage(page);
		pageBean.setLimit(limit);
		// 总记录数
		int totalCount = multMediaDao.findCount();
		pageBean.setTotalCount(totalCount);
		// 总页数:
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		// 每页显示数据的集合:
		int begin = (page -1 )*limit;
		List<MultMedia> list = multMediaDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
	// 业务层保存商品
	public void save(MultMedia multMedia) {
		multMediaDao.save(multMedia);
	}

	public MultMedia findByMid(Integer mid) {
		return multMediaDao.findByMid(mid);
	}

	public void delete(MultMedia multMedia) {
		multMediaDao.delete(multMedia);
	}

}
