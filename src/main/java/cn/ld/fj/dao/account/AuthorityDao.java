package cn.ld.fj.dao.account;

import org.springframework.stereotype.Component;
import cn.ld.fj.entity.account.Authority;
import net.esoar.modules.orm.hibernate.HibernateDao;

/**
 * 授权对象的泛型DAO.
 * 
 * @author fly
 */
@Component
public class AuthorityDao extends HibernateDao<Authority, Long> {
}
