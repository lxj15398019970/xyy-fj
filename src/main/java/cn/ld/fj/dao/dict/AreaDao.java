package cn.ld.fj.dao.dict;

import cn.ld.fj.entity.Area;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author fly
 */
@Component
public class AreaDao extends HibernateDao<Area, Long> {
}
