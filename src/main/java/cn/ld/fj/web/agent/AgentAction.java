package cn.ld.fj.web.agent;

import cn.ld.fj.entity.*;
import cn.ld.fj.entity.account.User;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.service.agent.AgentAreaManager;
import cn.ld.fj.service.agent.AgentManager;
import cn.ld.fj.service.dict.AreaManager;
import cn.ld.fj.service.dict.CityManager;
import cn.ld.fj.service.dict.ProvinceManager;
import cn.ld.fj.service.production.ProductionManager;
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

import java.util.List;
import java.util.Map;

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
    @Autowired
    private AccountManager accountManager;
    @Autowired
    private ProductionManager productionManager;
    @Autowired
    private ProvinceManager provinceManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private AreaManager areaManager;
    @Autowired
    private AgentAreaManager agentAreaManager;

    private List<Long> areaIds = Lists.newArrayList();

    private Agent agent;

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public List<Long> getAreaIds() {
        return areaIds;
    }

    public void setAreaIds(List<Long> areaIds) {
        this.areaIds = areaIds;
    }

    private List<User> users = Lists.newArrayList();

    private List<Production> productions = Lists.newArrayList();

    private List<Province> provinces = Lists.newArrayList();

    private List<City> cities = Lists.newArrayList();

    private List<Area> areas = Lists.newArrayList();

    public List<City> getCities() {
        return cities;
    }

    public void setCities(List<City> cities) {
        this.cities = cities;
    }

    public List<Area> getAreas() {
        return areas;
    }

    public void setAreas(List<Area> areas) {
        this.areas = areas;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Production> getProductions() {
        return productions;
    }

    public void setProductions(List<Production> productions) {
        this.productions = productions;
    }

    public List<Province> getProvinces() {
        return provinces;
    }

    public void setProvinces(List<Province> provinces) {
        this.provinces = provinces;
    }

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = agentManager.getEntity(id);
            List<AgentArea> agentAreas = agentAreaManager.findByProperty("agentId", id);
            if (CollectionUtils.isNotEmpty(agentAreas)) {
                for (AgentArea agentArea : agentAreas) {
                    Area area = areaManager.getEntity(agentArea.getAreaId());
                    if (area != null) {
                        areas.add(area);
                    }
                }
            }

        } else {
            entity = new Agent();
        }

        users = accountManager.findByProperty(2);
        productions = productionManager.findAll();
        provinces = provinceManager.findAll();
        cities = cityManager.findAll();
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        if (CollectionUtils.isNotEmpty(filters)) {
            System.out.println(filters.get(0).getPropertyName());
        }
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }
        page = agentManager.searchList(page, filters);


        Map<Long, Object> productionMap = productionManager.getProductionMap();
        Map<Long, String> provinceMap = provinceManager.getProvinceMap();
        Map<Long, String> cityMap = cityManager.getCityMap();
        Map<Long, String> areaMap = agentAreaManager.getAgentAreaMap();

        for (Agent agent : page.getResult()) {
            agent.setProvinceName(provinceMap.get(agent.getProvinceId()));
            agent.setCityName(cityMap.get(agent.getCityId()));
            agent.setAreaScope(areaMap.get(agent.getId()));
            Production production = (Production) productionMap.get(agent.getProductionId());
            if (production != null) {
                agent.setProductionName(production.getProductionName());
                agent.setProductionModel(production.getVersion());
                agent.setColor(production.getColor());
            }


        }

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {


        List<PropertyFilter> filters = Lists.newArrayList();
        filters.add(new PropertyFilter("EQL_provinceId", entity.getProvinceId() + ""));
        filters.add(new PropertyFilter("EQL_cityId", entity.getCityId() + ""));
        filters.add(new PropertyFilter("EQL_productionId", entity.getProductionId() + ""));


        List<Agent> agents = agentManager.getAgents(filters);
        if (CollectionUtils.isNotEmpty(agents)) {
            for (Agent agent1 : agents) {

                List<AgentArea> agentAreas = agentAreaManager.findByProperty("agentId", agent1.getId());
                String ids = "";
                if (CollectionUtils.isNotEmpty(agentAreas)) {
                    for (AgentArea agentArea : agentAreas) {
                        ids = ids + agentArea.getId() + ",";
                    }
                    if (ids.lastIndexOf(",") > 0) {
                        ids = ids.substring(0, ids.lastIndexOf(","));
                        if (ids.equals(areaIds) && agent1.getId() != entity.getId()) {
                            Struts2Utils.renderHtml(DwzUtil.getFailReturn("不能重复添加"));
                            return;
                        }
                    }

                }
            }

        }
        if (CollectionUtils.isEmpty(areaIds)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("请选择代理区域"));
            return;
        }

        agentManager.save(entity);

        List<AgentArea> agentAreas = agentAreaManager.findByProperty("agentId", entity.getId());
        if (CollectionUtils.isNotEmpty(agentAreas)) {
            for (AgentArea agentArea : agentAreas) {
                agentAreaManager.delete(agentArea.getId());
            }
        }

        for (Long id : areaIds) {
            AgentArea agentArea = new AgentArea();
            agentArea.setAgentId(entity.getId());
            agentArea.setAreaId(id);
            agentAreaManager.save(agentArea);
        }

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_agent",
                "操作成功"));


    }

    public String addArea() {
        agent = agentManager.getEntity(id);
        provinces = provinceManager.findAll();
        return "add-area";
    }

    public void add() {

        List<Long> exitIds = agentAreaManager.findExitIds(id);
        for (Long areaId : areaIds) {
            if (exitIds.contains(areaId)) {
                continue;
            }
            AgentArea agentArea = new AgentArea();
            agentArea.setAgentId(id);
            agentArea.setAreaId(areaId);
            agentAreaManager.save(agentArea);
        }

        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_agent",
                "操作成功"));

    }


    @Override
    public void delete() throws Exception {
        agentManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_agent",
                "操作成功"));

    }

    public Page<Agent> getPage() {
        return page;
    }

    public void setPage(Page<Agent> page) {
        this.page = page;
    }
}
