package cn.ld.fj.web.agent;

import cn.ld.fj.entity.*;
import cn.ld.fj.entity.account.User;
import cn.ld.fj.service.AgentManager;
import cn.ld.fj.service.account.AccountManager;
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

        } else {
            entity = new Agent();
        }

        users = accountManager.findAll();
        productions = productionManager.findAll();
        provinces = provinceManager.findAll();
        cities = cityManager.findAll();
        areas = areaManager.findAll();
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


        Map<Long, Object> productionMap = productionManager.getProductionMap();
        Map<Long, String> provinceMap = provinceManager.getProvinceMap();
        Map<Long, String> cityMap = cityManager.getCityMap();
        Map<Long, String> areaMap = areaManager.getAreaMap();

        for (Agent agent : page.getResult()) {
            agent.setProvinceName(provinceMap.get(agent.getProvinceId()));
            agent.setCityName(cityMap.get(agent.getCityId()));
            agent.setAreaName(areaMap.get(agent.getAreaId()));
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
        agentManager.save(entity);
//        Struts2Utils.renderHtml(DwzUtil
//                .getFailReturn("操作失败，打开了异网，但是没有选择资源"));
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
