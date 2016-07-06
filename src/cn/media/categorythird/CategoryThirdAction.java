package cn.media.categorythird;

import java.util.List;

import cn.media.category.Category;
import cn.media.category.CategoryService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryThirdAction extends ActionSupport implements ModelDriven<CategoryThird>{
	// 接收页数参数:
	private Integer page;
	// 模型驱动:
	private CategoryThird categoryThird = new CategoryThird();
//	public CategoryThird getModel() {
//		return categorySecond;
//	}
	// 注入Service
	private CategoryThirdService categoryThirdService;
//	// 注入二级分类的Service
//	private CategorySeService categoryService;
	// 接收cid
	private Integer ctid;
	@Override
	public CategoryThird getModel() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
