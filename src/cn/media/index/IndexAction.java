package cn.media.index;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 首页访问的Action
 * @author superme
 *
 */
public class IndexAction extends ActionSupport{

	/**
	 * 执行首页访问的方法
	 */
	@Override
	public String execute() throws Exception {
		System.out.println("indexAction++++++");
		return "indexSuccess";
	}
}
