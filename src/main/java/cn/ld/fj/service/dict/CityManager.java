package cn.ld.fj.service.dict;

import cn.ld.fj.dao.dict.CityDao;
import cn.ld.fj.entity.City;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class CityManager {
    @Autowired
    private CityDao cityDao;

    private static Logger logger = LoggerFactory.getLogger(CityManager.class);

    @Transactional(readOnly = true)
    public City getEntity(Long id) {
        return cityDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<City> searchList(Page<City> page, List<PropertyFilter> filters) {
        return cityDao.findPage(page, filters);

    }

    public void save(City entity) {

        cityDao.save(entity);
    }

    public void delete(Long id) {
        cityDao.delete(id);
    }

    public List<City> getCites(long provinceId) {
        return cityDao.findBy("provinceId", provinceId);
    }

}
