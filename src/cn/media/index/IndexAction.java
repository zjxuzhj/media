package cn.media.index;

import java.util.List;

import cn.media.category.Category;
import cn.media.category.CategoryService;
import cn.media.multmedia.MultMedia;
import cn.media.multmedia.MultMediaService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 首页访问的Action
 * @author superme
 *
 */
public class IndexAction extends ActionSupport{

	// 注入一级分类的Service
	private CategoryService categoryService;
	// 注入Media的Service
	private MultMediaService multMediaService;
	//热门
	private List<MultMedia> hotList;
	//最新
	private List<MultMedia> newList;
	
	public List<MultMedia> getHotList() {
		return hotList;
	}

	public List<MultMedia> getNewList() {
		return newList;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setMultMediaService(MultMediaService multMediaService) {
		this.multMediaService = multMediaService;
	}



	/**
	 * 执行首页访问的方法
	 */
	@Override
	public String execute() throws Exception {
		//查询所有一级分类
		List<Category> categoryList = categoryService.findAll();
		//存入Session
		ActionContext.getContext().getSession().put("categoryList", categoryList);
		//查询最热
		
		//查询最新
		
		return "indexSuccess";
	}
}
