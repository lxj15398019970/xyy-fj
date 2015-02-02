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
import net.esoar.modules.utils.encode.JsonBinder;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.util.List;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/city")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "city.action", type = "redirect")})
public class CityAction extends SimpleJsonActionSupport<City> {

    private JsonBinder binder = JsonBinder.buildNormalBinder();

    private static final long serialVersionUID = 8683878162525847072L;
    @Autowired
    private ProvinceManager provinceManager;

    private Page<City> page = new Page<City>(10);// 每页5条记录

    @Autowired
    private CityManager cityManager;
    @Autowired
    private AreaManager areaManager;

    private List<Province> provinces = Lists.newArrayList();

    private long provinceId;

    public long getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
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
            entity = cityManager.getEntity(id);
        } else {
            entity = new City();
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
        page = cityManager.searchList(page, filters);

        for (City city : page.getResult()) {
            if (city.getProvinceId() != null) {
                Province province = provinceManager.getProvince(city.getProvinceId());
                if (province != null) {
                    city.setProvinceName(province.getProvinceName());
                }
            }
        }

        provinces = provinceManager.findAll();

        return SUCCESS;
    }

    public void getCities() {
        List<City> cities = cityManager.getCites(provinceId);

       Struts2Utils.renderJson(cities);

    }


    @Override
    public String input() throws Exception {
        provinces = provinceManager.findAll();
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        cityManager.save(entity);
//        Struts2Utils.renderHtml(DwzUtil
//                .getFailReturn("操作失败，打开了异网，但是没有选择资源"));
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("w_city",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {
        List<Area> areas = areaManager.getAreaByCityId(id);
        for(Area area : areas){
            areaManager.delete(area.getId());
        }
        cityManager.delete(id);
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_city",
                "操作成功"));

    }


    public Page<City> getPage() {
        return page;
    }

}
