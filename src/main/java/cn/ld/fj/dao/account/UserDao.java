package cn.ld.fj.dao.account;

import org.springframework.stereotype.Component;
import cn.ld.fj.entity.account.User;
import net.esoar.modules.orm.hibernate.HibernateDao;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author fly
 */
@Component
public class UserDao extends HibernateDao<User, Long> {
}
