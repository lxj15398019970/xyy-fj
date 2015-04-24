package cn.ld.fj.web.account;

import cn.ld.fj.dao.HibernateUtils;
import cn.ld.fj.entity.account.Role;
import cn.ld.fj.entity.account.User;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.web.JsonActionSupport;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 用户管理Action.
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
// 定义URL映射对应/account/user.action
@Namespace("/account")
// 定义名为reload的result重定向到user.action, 其他result则按照convention默认.
@Results({@Result(name = JsonActionSupport.RELOAD, location = "user.action", type = "redirect")})
public class UserAction extends JsonActionSupport<User> {

    private static final long serialVersionUID = 8683878162525847072L;

    private AccountManager accountManager;

    // -- 页面属性 --//
    private Long id;
    private User entity;
    private Page<User> page = new Page<User>(5);// 每页5条记录
    private List<Long> checkedRoleIds; // 页面中钩选的角色id列表

    // -- ModelDriven 与 Preparable函数 --//
    public void setId(Long id) {
        this.id = id;
    }

    public User getModel() {
        return entity;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = accountManager.getUser(id);
        } else {
            entity = new User();
        }
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }

        page = accountManager.searchUser(page, filters);
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        checkedRoleIds = entity.getRoleIds();
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        // 根据页面上的checkbox选择 整合User的Roles Set


        User user = accountManager.findUserByLoginName(entity.getLoginName());
        if (user != null && user.getId() != entity.getId()) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("该用户已经存在"));
            return;
        }


        List<Long> ids = checkedRoleIds;
        if (CollectionUtils.isEmpty(ids)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("请选择角色"));
            return;
        }

        HibernateUtils.mergeByCheckedIds(entity.getRoleList(), checkedRoleIds,
                Role.class);
        accountManager.saveUser(entity);
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_user",
                "操作成功"));
    }

    @Override
    public void delete() throws Exception {

        try {
            accountManager.deleteUser(id);
        } catch (Exception e) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("超级管理员不能删除"));
            return;
        }

        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_user",
                "操作成功"));
    }

    // -- 其他Action函数 --//

    /**
     * 支持使用Jquery.validate Ajax检验用户名是否重复.
     */
    public String checkLoginName() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String newLoginName = request.getParameter("loginName");
        String oldLoginName = request.getParameter("oldLoginName");

        if (accountManager.isLoginNameUnique(newLoginName, oldLoginName)) {
            Struts2Utils.renderText("true");
        } else {
            Struts2Utils.renderText("false");
        }
        // 因为直接输出内容而不经过jsp,因此返回null.
        return null;
    }

    // -- 页面属性访问函数 --//

    /**
     * list页面显示用户分页列表.
     */
    public Page<User> getPage() {
        return page;
    }

    /**
     * input页面显示所有角色列表.
     */
    public List<Role> getAllRoleList() {
        return accountManager.getAllRole();
    }

    /**
     * input页面显示用户拥有的角色.
     */
    public List<Long> getCheckedRoleIds() {
        return checkedRoleIds;
    }

    /**
     * input页面提交用户拥有的角色.
     */
    public void setCheckedRoleIds(List<Long> checkedRoleIds) {
        this.checkedRoleIds = checkedRoleIds;
    }

    @Autowired
    public void setAccountManager(AccountManager accountManager) {
        this.accountManager = accountManager;
    }
}
