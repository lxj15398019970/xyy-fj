package cn.ld.fj.web;

import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 管理首页面ACTION
 * 
 * @author fly
 * 
 */
// 定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({ @Result(name = CrudActionSupport.RELOAD, location = "index.action", type = "redirect") })
public class IndexAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	@Override
	public String execute() throws Exception {
		return this.index();
	}

	/**
	 * 跳转页面ACTION
	 * 
	 * @return
	 * @throws Exception
	 */
	public String index() throws Exception {
		return SUCCESS;
	}
	
}
