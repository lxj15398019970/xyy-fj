package cn.ld.fj.dao.order;

import cn.ld.fj.entity.OrderBackup;
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
