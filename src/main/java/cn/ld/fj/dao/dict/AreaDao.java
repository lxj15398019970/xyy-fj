package cn.ld.fj.dao.dict;

import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

import java.awt.geom.Area;

/**
 * 用户对象的泛型DAO类.
 *
 * @author fly
 */
@Component
public class AreaDao extends HibernateDao<Area, Long> {
}
