package cn.ld.fj.web.agent;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.service.AgentManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/agent")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "agent.action", type = "redirect")})
public class AgentAction extends SimpleJsonActionSupport<Agent> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Agent> page = new Page<Agent>(10);
    @Autowired
    private AgentManager agentManager;


    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = agentManager.getEntity(id);

        } else {
            entity = new Agent();

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
        page = agentManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        agentManager.save(entity);
//        Struts2Utils.renderHtml(DwzUtil
//                .getFailReturn("操作失败，打开了异网，但是没有选择资源"));
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_area",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {
        agentManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_area",
                "操作成功"));

    }

    public Page<Agent> getPage() {
        return page;
    }

    public void setPage(Page<Agent> page) {
        this.page = page;
    }
}
