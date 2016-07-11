package cn.media.multmedia;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.media.category.Category;
import cn.media.category.CategoryService;
import cn.media.categorysecond.CategorySecond;
import cn.media.categorysecond.CategorySecondService;
import cn.media.categorythird.CategoryThird;
import cn.media.categorythird.CategoryThirdService;
import cn.media.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MultMediaAction extends ActionSupport implements
		ModelDriven<MultMedia> {
	// 文件上传需要的三个属性:
	private File upload; // 上传文件
	private String uploadContentType; // 上传文件的MIME类型
	private String uploadFileName; // 上传文件名称

	// 接收cid
	private Integer cid;
	// 接收二级分类id
	private Integer csid;
	// 接收三级分类id
	private Integer ctid;
	// 接收当前页数
	private Integer page;
	// 注入一级分类的Service
	private CategoryService categoryService;
	// 注入二级分类的Service
	private CategorySecondService categorySecondService;
	// 注入三级分类的Service
	private CategoryThirdService categoryThirdService;
	// 注入媒体的Service
	private MultMediaService multMediaService;
	// 分页的媒体显示
	private PageBean<MultMedia> pageBean;
	// 模型驱动类
	private MultMedia multMedia = new MultMedia();

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setCategorySecondService(
			CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	@Override
	public MultMedia getModel() {
		return multMedia;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public Integer getCtid() {
		return ctid;
	}

	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCategoryThirdService(
			CategoryThirdService categoryThirdService) {
		this.categoryThirdService = categoryThirdService;
	}

	public void setMultMediaService(MultMediaService multMediaService) {
		this.multMediaService = multMediaService;
	}

	public PageBean<MultMedia> getPageBean() {
		return pageBean;
	}

	// 查询二级分类
	public String findByCsid() {
		// 查询所有一级分类:
		List<Category> categoryList = categoryService.findAll();
		// 获得值栈:
		ActionContext.getContext().getValueStack()
				.set("categoryList", categoryList);
		// 查询当前cid下所有二级分类:
		List<CategorySecond> categorySecondList = categorySecondService
				.findByCid(cid);

		// 数据测试
		for (CategorySecond cs : categorySecondList) {
			System.out.println("################");
			System.out.println(cs.getCsname());
			for (CategoryThird ct : cs.getCategoryThirds()) {
				System.out.println("****" + ct.getCtname());
			}
			System.out.println("################");
		}

		// 获得值栈:
		ActionContext.getContext().getValueStack()
				.set("categorySecondList", categorySecondList);

		// 查询页面媒体
		pageBean = multMediaService.findByPage(cid, page);

		if (cid == 3) {
			return "findByCsidSuccessForMusic";
		}
		return "findByCsidSuccess";
	}

	// 查询三级分类--未完成
	public String findByCtid() {
		// 查询二级分类
		List<CategorySecond> categorySecondList = categorySecondService
				.findAll();
		// 获得值栈:
		ActionContext.getContext().getValueStack()
				.set("categorySecondList", categorySecondList);
		// 查询当前csid下所有三级分类:
		List<CategoryThird> categoryThirdList = categoryThirdService
				.findByCsid(csid);

		// pageBean = multMediaService.findByPage(ctid, page);
		return "findByCtidSuccess";
	}

	// 后台:查询所有商品的方法
	public String adminFindAll() {
		pageBean = multMediaService.findByPage(page);
		return "adminFindAllSuccess";
	}

	/**
	 * 跳转到添加页面
	 */
	public String addPage() {
		// 查询所有的三级分类 :
		List<CategoryThird> ctList = categoryThirdService.findAll();
		ActionContext.getContext().getValueStack().set("ctList", ctList);
		return "addPageSuccess";
	}

	public String edit() {
		// 查询所有的三级分类 :
		List<CategoryThird> ctList = categoryThirdService.findAll();
		ActionContext.getContext().getValueStack().set("ctList", ctList);

		multMedia = multMediaService.findByMid(multMedia.getMid());
		return "editSuccess";
	}

	public String delete() {
		multMediaService.delete(multMedia);
		return "deleteSuccess";
	}

	/**
	 * 保存商品:同时上传图片
	 * 
	 * @throws IOException
	 */
	public String save() throws IOException {
		// 文件上传的操作:
		// 获得上传的路径:
		String path = ServletActionContext.getServletContext().getRealPath(
				"/multmedias");
		String realPath = path + "/" + ctid + "/" + uploadFileName;
		File diskFile = new File(realPath);
		// 文件上传:
		FileUtils.copyFile(upload, diskFile);
		// 保存到数据库:
		// 设置三级分类
		CategoryThird categoryThird = new CategoryThird();
		categoryThird.setCtid(ctid);
		multMedia.setCategoryThird(categoryThird);
		// 设置时间:
		multMedia.setMdate(new Date());
		// 设置图片上传路径:
		multMedia.setImage("multmedias/" + ctid + "/" + uploadFileName);
		// 点击
		multMedia.setPageview(0);

		// 调用Serviec保存商品:
		multMediaService.save(multMedia);
		return "saveSuccess";
	}

	// 查询媒体详情：
	public String findByMid() {
		// 查询所有一级分类:
		List<Category> categoryList = categoryService.findAll();
		// 获得值栈:
		ActionContext.getContext().getValueStack()
				.set("categoryList", categoryList);
		// 查询当前cid下所有二级分类:
		List<CategorySecond> categorySecondList = categorySecondService
				.findByCid(cid);

		// 获得值栈:
		ActionContext.getContext().getValueStack()
				.set("categorySecondList", categorySecondList);
		
		multMedia = multMediaService.findByMid(multMedia.getMid());
		return "findByMidSuccess";
	}

}
