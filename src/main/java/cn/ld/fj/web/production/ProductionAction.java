package cn.ld.fj.web.production;

import cn.ld.fj.entity.Production;
import cn.ld.fj.service.production.ProductionManager;
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
@Namespace("/production")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "production.action", type = "redirect")})
public class ProductionAction extends SimpleJsonActionSupport<Production> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Production> page = new Page<Production>(10);
    @Autowired
    private ProductionManager productionManager;


    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = productionManager.getEntity(id);

        } else {
            entity = new Production();

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
        page = productionManager.searchList(page, filters);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {


        Production production = productionManager.getEntityByProperty(entity.getProductionName());
        if (production != null && production.getId() != entity.getId()) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("该产品名称已经添加"));
            return;
        }

        productionManager.save(entity);

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_production",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {
        productionManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_production",
                "操作成功"));

    }

    public Page<Production> getPage() {
        return page;
    }

    public void setPage(Page<Production> page) {
        this.page = page;
    }
}
