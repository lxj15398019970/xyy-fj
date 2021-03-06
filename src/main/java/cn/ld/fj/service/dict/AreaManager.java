package cn.ld.fj.service.dict;

import cn.ld.fj.dao.dict.AreaDao;
import cn.ld.fj.entity.Area;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class AreaManager {

    @Autowired
    private AreaDao areaDao;

    private static Logger logger = LoggerFactory.getLogger(CityManager.class);

    @Transactional(readOnly = true)
    public Area getEntity(Long id) {
        return areaDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Area> searchList(Page<Area> page, List<PropertyFilter> filters) {
        return areaDao.findPage(page, filters);

    }

    public void save(Area entity) {

        areaDao.save(entity);
    }

    public void delete(Long id) {
        areaDao.delete(id);
    }

    public List<Area> getAreaByCityId(Long cityId) {
        return areaDao.findBy("cityId", cityId);
    }

    public Map<Long, String> getAreaMap() {
        Map<Long, String> map = new HashMap<Long, String>();
        List<Area> areas = areaDao.getAll();
        if (CollectionUtils.isNotEmpty(areas)) {
            for (Area area : areas) {
                map.put(area.getId(), area.getAreaName());
            }
        }
        return map;
    }

    public List<Area> findAll() {
        return areaDao.getAll();
    }

    public Area getAreaByProperty(String areaName) {
        return areaDao.findUniqueBy("areaName",areaName);
    }
}
