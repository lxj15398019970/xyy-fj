package cn.ld.fj.dao.agent;

import cn.ld.fj.entity.Agent;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class AgentDao extends HibernateDao<Agent, Long> {
}
