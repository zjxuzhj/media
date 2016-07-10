package cn.media.categorythird;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
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

	
	

}
