package cn.media.categorythird;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.media.utils.PageBean;
@Transactional
public class CategoryThirdService {
	// 注入DAO
	private CategoryThirdDao categoryThirdDao;
	// 业务层带有分页查询三级分类
	public void setCategoryThirdDao(CategoryThirdDao categoryThirdDao) {
		this.categoryThirdDao = categoryThirdDao;
	}

	public List<CategoryThird> findAll() {
		return categoryThirdDao.findAll();
	}
	// 查询某个二级分类下所有的三级分类
		public List<CategoryThird> findByCsid(Integer csid) {
			return categoryThirdDao.findByCsid(csid);
		}

		// 业务层保存三级分类
		public void save(CategoryThird categoryThird) {
			categoryThirdDao.save(categoryThird);
		}
		
		public PageBean<CategoryThird> findByPage(Integer page) {
			// 封装PageBean
			PageBean<CategoryThird> pageBean = new PageBean<CategoryThird>();
			// 封装页数
			pageBean.setPage(page);
			// 每页显示的记录数
			Integer limit = 10;
			pageBean.setLimit(limit);
			// 总记录数
			Integer totalCount = categoryThirdDao.findCount();
			pageBean.setTotalCount(totalCount);
			// 总页数
			Integer totalPage = 0;
			if (totalCount % limit == 0) {
				totalPage = totalCount / limit;
			} else {
				totalPage = totalCount / limit + 1;
			}
			pageBean.setTotalPage(totalPage);
			// 每页显示的数据
			Integer begin = (page - 1) * limit;
			List<CategoryThird> list = categoryThirdDao.findByPage(begin, limit);
			pageBean.setList(list);
			return pageBean;
		}

		// 业务层删除二级分类
		public void delete(CategoryThird categoryThird) {
			categoryThirdDao.delete(categoryThird);
		}

	
	

}
