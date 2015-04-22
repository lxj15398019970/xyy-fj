package cn.ld.fj.web;

import cn.ld.fj.entity.account.User;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.util.DwzUtil;
import com.opensymphony.xwork2.ActionSupport;
import net.esoar.modules.security.springsecurity.SpringSecurityUtils;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 管理首页面ACTION
 *
 * @author fly
 */
// 定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({@Result(name = CrudActionSupport.RELOAD, location = "main.action", type = "redirect")})
public class MainAction extends ActionSupport {

    private static final long serialVersionUID = 1L;

    private String type;

    private String oldPassword;

    private String newPassword;

    private String rnewPassword;

    @Autowired
    private AccountManager accountManager;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getRnewPassword() {
        return rnewPassword;
    }

    public void setRnewPassword(String rnewPassword) {
        this.rnewPassword = rnewPassword;
    }

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


    public String passwordInput() {


        return "password-input";
    }


    public void changePassword() {

        String loginName = SpringSecurityUtils.getCurrentUserName();
        User user = accountManager.findUserByLoginName(loginName);

        if (user == null) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("用户不存在"));
            return;
        }

        if (!user.getPassword().equals(oldPassword)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("旧密码不正确"));
            return;
        }

        if (!newPassword.equals(rnewPassword)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("两次输入的密码不相同"));
            return;
        }

        user.setPassword(newPassword);
        accountManager.saveUser(user);

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w",
                "修改密码成功"));


    }


}
