package cn.ld.fj.web.order;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.Order;
import cn.ld.fj.service.agent.AgentManager;
import cn.ld.fj.service.order.OrderManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import com.google.common.collect.Lists;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
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
@Results({@Result(name = JsonActionSupport.RELOAD, location = "order.action", type = "redirect")})
public class OrderAction extends SimpleJsonActionSupport<Order> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Order> page = new Page<Order>(10);
    @Autowired
    private OrderManager orderManager;
    @Autowired
    private AgentManager agentManager;


    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = orderManager.getEntity(id);

        } else {
            entity = new Order();

        }
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

        List<Order> orderList = orderManager.getOrders(map);
        int totalCount = orderManager.getTotalCount(map);

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
        entity.setStatus(0);
        entity.setOrderTime(new Date());

        /**
         * 给该地区的代理商配送
         */

        List<PropertyFilter> filters = Lists.newArrayList();
        filters.add(new PropertyFilter("provinceId", entity.getProvinceId() + ""));
        filters.add(new PropertyFilter("cityId", entity.getProvinceId() + ""));
        filters.add(new PropertyFilter("provinceId", entity.getProvinceId() + ""));

        List<Agent> agents = agentManager.getAgents(filters);
        if (CollectionUtils.isEmpty(agents)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("还没有该地区的代理商，请先添加该地区的代理商"));
            return;
        }

        entity.setAgentId(agents.get(0).getId());
        orderManager.save(entity);

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_order",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {
//        agentManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_area",
                "操作成功"));

    }

    public Page<Order> getPage() {
        return page;
    }

    public void setPage(Page<Order> page) {
        this.page = page;
    }
}
