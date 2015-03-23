package cn.ld.fj.dao.order;

import cn.ld.fj.entity.Order;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class OrderDao extends HibernateDao<Order, Long> {
}
