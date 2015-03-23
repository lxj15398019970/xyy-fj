package cn.ld.fj.web.order;

import cn.ld.fj.entity.OrderBackup;
import cn.ld.fj.service.order.OrderBackupManager;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/order")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "order-backup.action", type = "redirect")})
public class OrderBackupAction extends SimpleJsonActionSupport<OrderBackup> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<OrderBackup> page = new Page<OrderBackup>(10);

    @Autowired
    private OrderBackupManager orderBackupManager;


    @Override
    protected void prepareModel() throws Exception {
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        if (page.getPageNo() < 1) {
            page.setPageNo(1);
        }
        map.put("start", (page.getPageNo() - 1) * 10);
        map.put("end", page.getPageNo() * 10);

        List<OrderBackup> orderList = orderBackupManager.getBackupOrders(map);
        int totalCount = orderBackupManager.getBackupTotalCount(map);

        page.setResult(orderList);
        page.setTotalCount(totalCount);
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {


    }

    @Override
    public void delete() throws Exception {
    }


    public Page<OrderBackup> getPage() {
        return page;
    }

    public void setPage(Page<OrderBackup> page) {
        this.page = page;
    }
}
