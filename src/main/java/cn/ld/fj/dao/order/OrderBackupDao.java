package cn.ld.fj.dao.order;

import cn.ld.fj.entity.Order;
import cn.ld.fj.entity.account.OrderBackup;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class OrderBackupDao extends HibernateDao<OrderBackup, Long> {
}
