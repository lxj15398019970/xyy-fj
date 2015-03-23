package cn.ld.fj.web.dict;

import cn.ld.fj.entity.Area;
import cn.ld.fj.entity.City;
import cn.ld.fj.entity.Province;
import cn.ld.fj.service.dict.AreaManager;
import cn.ld.fj.service.dict.CityManager;
import cn.ld.fj.service.dict.ProvinceManager;
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

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/area")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "area.action", type = "redirect")})
public class AreaAction extends SimpleJsonActionSupport<Area> {

    private static final long serialVersionUID = 8683878162525847072L;
    @Autowired
    private ProvinceManager provinceManager;

    private Page<Area> page = new Page<Area>(10);// 每页5条记录

    @Autowired
    private CityManager cityManager;
    @Autowired
    private AreaManager areaManager;

    private List<Province> provinces = Lists.newArrayList();

    private List<City> cities = Lists.newArrayList();

    public List<Province> getProvinces() {
        return provinces;
    }

    private long provinceId;
    private long cityId;

    public long getCityId() {
        return cityId;
    }

    public void setCityId(long cityId) {
        this.cityId = cityId;
    }

    public long getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
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

    @Override
    protected void prepareModel() throws Exception {
        provinces = provinceManager.findAll();
        if (id != null) {
            entity = areaManager.getEntity(id);
            City city = cityManager.getEntity(entity.getCityId());
            if (city != null) {
                provinceId = city.getProvinceId();

            }
        } else {
            entity = new Area();
            if (CollectionUtils.isNotEmpty(provinces)) {
                provinceId = provinces.get(0).getId();
            }
        }
        cities = cityManager.getCites(provinceId);
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {

        HttpServletRequest request = Struts2Utils.getRequest();
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }
        page = areaManager.searchList(page, filters);
        for (Area area : page.getResult()) {
            City city = cityManager.getEntity(area.getCityId());
            if (city != null) {
                area.setCityName(city.getCityName());
            }
            Province province = provinceManager.getProvince(city.getProvinceId());
            if (province != null) {
                area.setProvinceName(province.getProvinceName());
            }

        }


        if (provinceId > 0) {
            cities = cityManager.getCites(provinceId);
        }

        provinces = provinceManager.findAll();

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        areaManager.save(entity);
//        Struts2Utils.renderHtml(DwzUtil
//                .getFailReturn("操作失败，打开了异网，但是没有选择资源"));
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_area",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {
        areaManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_area",
                "操作成功"));

    }

    public void getAreas() {
        List<Area> areas = areaManager.getAreaByCityId(cityId);
        Struts2Utils.renderJson(areas);

    }


    public Page<Area> getPage() {
        return page;
    }

}
