package cn.media.categorysecond;

import java.util.List;

import cn.media.category.Category;
import cn.media.category.CategoryService;
import cn.media.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategorySecondAction extends ActionSupport implements
		ModelDriven<CategorySecond> {
	// 接收页数参数:
	private Integer page;
	// 模型驱动:
	private CategorySecond categorySecond = new CategorySecond();

	public CategorySecond getModel() {
		return categorySecond;
	}

	// 注入Service
	private CategorySecondService categorySecondService;
	// 注入一级分类的Service
	private CategoryService categoryService;
	// 接收cid
	private Integer cid;

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	/**
	 * 二级分类管理:查询所有二级分类(带有分页.)
	 */
	public String adminFindAll() {
		// 调用Service完成查询:
		PageBean<CategorySecond> pageBean = categorySecondService
				.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "adminFindAllSuccess";
	}

	/**
	 * 二级分类管理:跳转到添加页面的方法.
	 */
	public String addPage() {
		// 查询一级分类的列表:
		List<Category> cList = categoryService.findAll();
		// 压栈:
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}

	/**
	 * 二级分类的保存:
	 */
	public String save() {
		Category category = new Category();
		category.setCid(cid);
		// 二级分类对象:
		categorySecond.setCategory(category);
		// 调用Serviec保存
		categorySecondService.save(categorySecond);
		return "saveSuccess";

	}
	
	/**
	 * 后台:删除二级分类：
	 */
	public String delete() {
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	
	/**
	 * 后台:编辑二级分类:(查询二级分类)
	 */
	public String edit() {
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		return "editSuccess";
	}
	
	/**
	 * 后台:修改二级分类:
	 */
	public String update() {
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
}
