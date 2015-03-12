package cn.ld.fj.dao.production;

import cn.ld.fj.entity.Production;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class ProductionDao extends HibernateDao<Production, Long> {
}
