package cn.ld.fj.dao.agent;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.AgentArea;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class AgentAreaDao extends HibernateDao<AgentArea, Long> {
}
