package cn.media.categorysecond;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public class CategorySecondService {

	// 注入DAO
	private CategorySecondDao categorySecondDao;
	
	// 业务层带有分页查询二级分类
	public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
		this.categorySecondDao = categorySecondDao;
	}
	
	public List<CategorySecond> findAll() {
		return categorySecondDao.findAll();
	}

}
