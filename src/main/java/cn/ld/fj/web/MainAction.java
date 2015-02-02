package cn.ld.fj.web;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

/**
 * 管理首页面ACTION
 * 
 * @author fly
 * 
 */
// 定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({ @Result(name = CrudActionSupport.RELOAD, location = "main.action", type = "redirect") })
public class MainAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

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
		return "dwz-menu";
	}
	
}
