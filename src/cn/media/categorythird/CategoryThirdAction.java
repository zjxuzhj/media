package cn.media.categorythird;

import java.util.List;

import cn.media.category.Category;
import cn.media.category.CategoryService;
import cn.media.categorysecond.CategorySecond;
import cn.media.categorysecond.CategorySecondService;
import cn.media.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryThirdAction extends ActionSupport implements
		ModelDriven<CategoryThird> {
	// 接收页数参数:
	private Integer page;
	// 模型驱动:
	private CategoryThird categoryThird = new CategoryThird();

	// 注入Service
	private CategoryThirdService categoryThirdService;
	// 注入二级分类的Service
	private CategorySecondService categorySecondService;
	private Integer csid;

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	@Override
	public CategoryThird getModel() {
		return categoryThird;
	}

	public void setCategoryThirdService(
			CategoryThirdService categoryThirdService) {
		this.categoryThirdService = categoryThirdService;
	}

	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	/**
	 * 三级分类管理:查询所有二级分类(带有分页.)
	 */
	public String adminFindAll() {
		// 调用Service完成查询:
		PageBean<CategoryThird> pageBean = categoryThirdService
				.findByPage(page);

		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "adminFindAllSuccess";
	}

	/**
	 * 三级分类管理:跳转到添加页面的方法.
	 */
	public String addPage() {
		// 查询一级分类的列表:
		List<CategorySecond> cList = categorySecondService.findAll();
		// 压栈:
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}

	/**
	 * 三级分类的保存:
	 */
	public String save() {
		CategorySecond categorySecond = new CategorySecond();
		categorySecond.setCsid(csid);
		// 二级分类对象:
		categoryThird.setCstegorySecond(categorySecond);
		// 调用Serviec保存
		categoryThirdService.save(categoryThird);
		return "saveSuccess";

	}

	/**
	 * 后台:删除二级分类：
	 */
	public String delete() {
		categoryThirdService.delete(categoryThird);
		return "deleteSuccess";
	}

}
