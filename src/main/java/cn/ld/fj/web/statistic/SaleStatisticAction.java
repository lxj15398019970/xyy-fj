package cn.ld.fj.web.statistic;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.Production;
import cn.ld.fj.entity.account.User;
import cn.ld.fj.pojo.SaleStatistic;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.service.agent.AgentManager;
import cn.ld.fj.service.production.ProductionManager;
import cn.ld.fj.service.sale.SaleStatisticManager;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import com.google.common.collect.Lists;
import net.esoar.modules.orm.Page;
import net.esoar.modules.security.springsecurity.SpringSecurityUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
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
 * @author xjli
 */
@Namespace("/statistic")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "sale-statistic.action", type = "redirect")})
public class SaleStatisticAction extends SimpleJsonActionSupport<SaleStatistic> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<SaleStatistic> page = new Page<SaleStatistic>(10);

    @Autowired
    private SaleStatisticManager saleStatisticManager;
    @Autowired
    private AgentManager agentManager;
    @Autowired
    private ProductionManager productionManager;
    @Autowired
    private AccountManager accountManager;

    private List<String> agents = Lists.newArrayList();

    private List<Production> productions = Lists.newArrayList();

    private String agentName;

    private long productionId;

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public long getProductionId() {
        return productionId;
    }

    public void setProductionId(long productionId) {
        this.productionId = productionId;
    }

    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public List<String> getAgents() {
        return agents;
    }

    public void setAgents(List<String> agents) {
        this.agents = agents;
    }

    public List<Production> getProductions() {
        return productions;
    }

    public void setProductions(List<Production> productions) {
        this.productions = productions;
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


        String userName = SpringSecurityUtils.getCurrentUserName();
        User user = accountManager.findUserByLoginName(userName);

        //如果是代理商自己
        if (user != null && user.getUserType() == 2) {
            agentName = user.getLoginName();
        }

        map.put("start", (page.getPageNo() - 1) * 10);
        map.put("end", page.getPageNo() * 10);
        map.put("date", StringUtils.isEmpty(date) ? null : date);
        map.put("agentName", StringUtils.isEmpty(agentName) ? null : agentName);
        map.put("productionId", productionId);

        List<SaleStatistic> saleStatistics = saleStatisticManager.searchList(map);
        Integer totalCount = saleStatisticManager.getTotalCount(map);
        if (totalCount == null) {
            totalCount = 0;
        }
        page.setResult(saleStatistics);
        page.setTotalCount(totalCount);

      //如果是代理商
        if (user != null && user.getUserType() == 2) {
            agents.add(agentName);
        } else {
            List<Agent> agentList = agentManager.getAllAgents();
            if (CollectionUtils.isNotEmpty(agentList)) {
                Map<String, Object> map1 = new HashMap<String, Object>();
                for (Agent agent : agentList) {
                    if (!map1.containsKey(agent.getAgentName())) {
                        map1.put(agent.getAgentName(), agent);
                        agents.add(agent.getAgentName());

                    }

                }
            }
        }

        productions = productionManager.findAll();


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

    public Page<SaleStatistic> getPage() {
        return page;
    }

    public void setPage(Page<SaleStatistic> page) {
        this.page = page;
    }
}
