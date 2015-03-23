package cn.ld.fj.web.order;

import cn.ld.fj.entity.*;
import cn.ld.fj.service.agent.AgentManager;
import cn.ld.fj.service.dict.AreaManager;
import cn.ld.fj.service.dict.CityManager;
import cn.ld.fj.service.dict.ProvinceManager;
import cn.ld.fj.service.order.OrderBackupManager;
import cn.ld.fj.service.order.OrderManager;
import cn.ld.fj.service.production.ProductionManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.util.ExcelUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import com.google.common.collect.Lists;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
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


    @Autowired
    private ProductionManager productionManager;
    @Autowired
    private ProvinceManager provinceManager;
    @Autowired
    private CityManager cityManager;
    @Autowired
    private AreaManager areaManager;
    @Autowired
    private OrderBackupManager orderBackupManager;

    private File excel;
    private String excelFileName;

    private String phone;
    private String createTime;

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

    public File getExcel() {
        return excel;
    }

    public void setExcel(File excel) {
        this.excel = excel;
    }

    public String getExcelFileName() {
        return excelFileName;
    }

    public void setExcelFileName(String excelFileName) {
        this.excelFileName = excelFileName;
    }

    private List<Production> productions = Lists.newArrayList();

    private List<Province> provinces = Lists.newArrayList();

    private List<City> cities = Lists.newArrayList();

    private List<Area> areas = Lists.newArrayList();

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

    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
            entity = orderManager.getEntity(id);

        } else {
            entity = new Order();

        }

        productions = productionManager.findAll();
        provinces = provinceManager.findAll();
        cities = cityManager.findAll();
        areas = areaManager.findAll();
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

        List<Order> orderList = orderManager.getOrders(map);
        for (Order order : orderList) {
            order.setTotalMoney(order.getBuyCount() * order.getProduction().getPrice());
        }
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
        filters.add(new PropertyFilter("EQL_provinceId", entity.getProvinceId() + ""));
        filters.add(new PropertyFilter("EQL_cityId", entity.getCityId() + ""));
        filters.add(new PropertyFilter("EQL_areaId", entity.getAreaId() + ""));
        filters.add(new PropertyFilter("EQL_productionId", entity.getProductionId() + ""));


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
        orderManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_order",
                "操作成功"));
    }


    /**
     * 备份订单
     *
     * @throws Exception
     */
    public void backup() throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("start", 0);
        int totalCount = orderManager.getTotalCount(map);
        map.put("end", totalCount);

        List<Order> orderList = orderManager.getOrders(map);
        for (Order order : orderList) {
            order.setTotalMoney(order.getBuyCount() * order.getProduction().getPrice());
        }


        Date date = new Date();
        for (Order order : orderList) {
            OrderBackup backup = new OrderBackup();
            backup.setTotalMoney(order.getBuyCount() * order.getProduction().getPrice());
            backup.setAgentId(order.getAgentId());
            backup.setOrderTime(order.getOrderTime());
            backup.setStatus(order.getStatus());
            backup.setAddress(order.getAddress());
            backup.setAssignTime(order.getAssignTime());
            backup.setBuyCount(order.getBuyCount());
            backup.setProvinceId(order.getProvinceId());
            backup.setCityId(order.getCityId());
            backup.setAreaId(order.getAreaId());
            backup.setProductionId(order.getProductionId());
            backup.setPhone(order.getPhone());
            backup.setAddress(order.getAddress());
            backup.setCustomName(order.getCustomName());
            backup.setBackupTime(date);
            backup.setDealTime(order.getDealTime());
            orderBackupManager.save(backup);

        }
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_order",
                "备份成功"));

    }


    /**
     * 导入订单
     *
     * @throws Exception
     */
    public String importOrderInput() throws Exception {
        return "import";
    }

    public void importOrder() throws Exception {

        List<Map<Integer, String>> uploadDatas = ExcelUtil.poiRead(excel, 8, excelFileName);
        if (CollectionUtils.isEmpty(uploadDatas)) {
            Struts2Utils.renderHtml(DwzUtil.getFailReturn("导入的数据为空"));
            return;
        }


        int totalCount = uploadDatas.size();
        int success = 0;
        for (Map<Integer, String> map : uploadDatas) {
            String productionName = map.get(0);
            String provinceName = map.get(1);
            String cityName = map.get(2);
            String areaName = map.get(3);
            String buyCount = map.get(4);
            String customName = map.get(5);
            String phone = map.get(6);
            String address = map.get(7);

            Province province = provinceManager.getProvinceByProperty(provinceName);
            City city = cityManager.getCityByProperty(cityName);
            Area area = areaManager.getAreaByProperty(areaName);
            Production production = productionManager.getProductionByProperty(productionName);
            if (province == null || city == null || area == null || production == null) {
                continue;
            }

            List<PropertyFilter> filters = Lists.newArrayList();
            filters.add(new PropertyFilter("EQL_provinceId", province.getId() + ""));
            filters.add(new PropertyFilter("EQL_cityId", city.getId() + ""));
            filters.add(new PropertyFilter("EQL_areaId", area.getId() + ""));
            filters.add(new PropertyFilter("EQL_productionId", production.getId() + ""));


            List<Agent> agents = agentManager.getAgents(filters);
            if (CollectionUtils.isEmpty(agents)) {
                continue;
            }


            Order order = new Order();
            order.setTotalMoney(Integer.parseInt(buyCount) * production.getPrice());
            order.setAgentId(agents.get(0).getId());
            order.setOrderTime(new Date());
            order.setStatus(0);
            order.setAddress(address);
            order.setBuyCount(Integer.parseInt(buyCount));
            order.setProvinceId(province.getId());
            order.setCityId(city.getId());
            order.setAreaId(area.getId());
            order.setProductionId(production.getId());
            order.setPhone(phone);
            order.setAddress(address);
            order.setCustomName(customName);
            success++;
            orderManager.save(order);


        }


        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_order",
                "本机总共导入" + totalCount + "条订单,成功导入" + success + "条订单"));
    }


    public Page<Order> getPage() {
        return page;
    }

    public void setPage(Page<Order> page) {
        this.page = page;
    }
}
