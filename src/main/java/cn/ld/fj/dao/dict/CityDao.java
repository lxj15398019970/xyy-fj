package cn.ld.fj.dao.dict;

import cn.ld.fj.entity.City;
import cn.ld.fj.entity.Province;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author fly
 */
@Component
public class CityDao extends HibernateDao<City, Long> {
}
