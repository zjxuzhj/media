package cn.media.category;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	// 模型驱动使用的类:
		private Category category = new Category();

		public Category getModel() {
			return category;
		}
		// 注入Service
		private CategoryService categoryService;
		
		public void setCategoryService(CategoryService categoryService) {
			this.categoryService = categoryService;
		}

		/**
		 * 后台:查询所有的一级分类的方法:
		 */
		public String adminFindAll(){
			List<Category> cList = categoryService.findAll();
			// 压入值栈:
			ActionContext.getContext().getValueStack().set("cList", cList);
			return "adminFindAllSuccess";
		}
		
}
