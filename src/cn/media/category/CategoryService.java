package cn.media.category;

import java.util.List;

public class CategoryService {
	// 注入Dao
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	// 业务层查询所有的一级分类的方法
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	// 业务层保存一级分类
	public void save(Category category) {
		categoryDao.save(category);
	}

	// 业务层删除一级分类
	public void delete(Category category) {
		categoryDao.delete(category);
	}

	// 业务层查询一级分类
	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
	}

	// 业务层修改一级分类
	public void update(Category category) {
		categoryDao.update(category);
	}
}
