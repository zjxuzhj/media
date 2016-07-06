package cn.media.category;

public class CategoryService {
	//注入Dao
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}
}
