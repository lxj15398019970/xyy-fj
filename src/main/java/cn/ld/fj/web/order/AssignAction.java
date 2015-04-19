package cn.ld.fj.web.order;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.Order;
import cn.ld.fj.entity.Production;
import cn.ld.fj.entity.account.User;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.service.agent.AgentManager;
import cn.ld.fj.service.order.OrderManager;
import cn.ld.fj.service.production.ProductionManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import com.google.common.collect.Lists;
import net.esoar.modules.orm.Page;
import net.esoar.modules.security.springsecurity.SpringSecurityUtils;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
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
 * @author xjli
 *         订单配送管理
 */
@Namespace("/order")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "order.action", type = "redirect")})
public class AssignAction extends SimpleJsonActionSupport<Order> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<Order> page = new Page<Order>(10);
    @Autowired
    private OrderManager orderManager;

    @Autowired
    private AccountManager accountManager;
    @Autowired
    private AgentManager agentManager;
    @Autowired
    private ProductionManager productionManager;


    private String phone;
    private String createTime;
    private String orderNo;
    private String type;
    private int status;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

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
        map.put("phone", StringUtils.isEmpty(phone) ? null : phone);
        map.put("createTime", StringUtils.isEmpty(createTime) ? null : createTime);
        map.put("orderNo", StringUtils.isEmpty(orderNo) ? null : orderNo);


        String backJsp = null;
        if ("0".equals(type)) {
            backJsp = "no";
            status = 0;
        } else if ("1".equals(type)) {
            backJsp = "ing";
            status = 1;
        } else if ("2".equals(type)) {
            backJsp = "has";
            status = 2;
        } else {

            //退单页取的是完成配送和退单的订单
            backJsp = "tui";
            status = 3;
        }

        map.put("status", status);
        String loginName = SpringSecurityUtils.getCurrentUserName();
        User user = accountManager.findUserByLoginName(loginName);
        List<Agent> agents = agentManager.findByProperty("agentName", loginName);
        /**
         * 如果是代理商，就获取自己的订单
         */
        List<Long> agentIds = Lists.newArrayList();
        if (user.getUserType() == 2) {
            if (CollectionUtils.isNotEmpty(agents)) {
                for (Agent agent : agents) {
                    agentIds.add(agent.getId());
                }
            }
            map.put("agentIds", agentIds);
        }

        List<Order> orderList = orderManager.getOrders(map);
        for (Order order : orderList) {
            order.setTotalMoney(order.getBuyCount() * order.getProduction().getPrice());
        }
        int totalCount = orderManager.getTotalCount(map);

        page.setResult(orderList);
        page.setTotalCount(totalCount);

        return backJsp;

    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }


    /**
     * 配送
     */
    public void assign() {
        entity = orderManager.getEntity(id);
        if (entity != null) {
            entity.setStatus(1);
            entity.setAssignTime(new Date());
            orderManager.save(entity);
            Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_assign",
                    "订单配送成功"));
            return;
        }
        Struts2Utils.renderHtml(DwzUtil.getFailReturn("操作失败"));
        return;
    }


    /**
     * 完成配送
     */
    public void finish() {
        entity = orderManager.getEntity(id);
        if (entity != null) {
            entity.setStatus(2);
            entity.setDealTime(new Date());
            orderManager.save(entity);

            /**
             * 同时减少该产品的库存
             *
             */

            Production production = productionManager.getEntity(entity.getProductionId());
            production.setInventory(production.getInventory() - entity.getBuyCount());
            productionManager.save(production);
            Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_assign",
                    "订单完成配送"));
            return;
        }
        Struts2Utils.renderHtml(DwzUtil.getFailReturn("操作失败"));
        return;
    }

    public void cancel() {
        entity = orderManager.getEntity(id);
        if (entity != null) {
            if (entity.getStatus() == 3) {
                Struts2Utils.renderHtml(DwzUtil.getFailReturn("操作失败,不能重复退单"));
                return;
            }

            entity.setStatus(3);
            entity.setDealTime(new Date());
            orderManager.save(entity);
            Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_assign",
                    "退单成功"));
            return;
        }
        Struts2Utils.renderHtml(DwzUtil.getFailReturn("操作失败"));
        return;
    }


    @Override
    public void save() throws Exception {

    }

    @Override
    public void delete() throws Exception {

    }


    public Page<Order> getPage() {
        return page;
    }

    public void setPage(Page<Order> page) {
        this.page = page;
    }
}
