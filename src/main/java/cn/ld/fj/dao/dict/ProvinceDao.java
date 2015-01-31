package cn.ld.fj.dao.dict;

import cn.ld.fj.entity.Province;
import cn.ld.fj.entity.account.User;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;

/**
 * 用户对象的泛型DAO类.
 * 
 * @author fly
 */
@Component
public class ProvinceDao extends HibernateDao<Province, Long> {
}
