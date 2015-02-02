package cn.ld.fj.dao;

import cn.ld.fj.entity.Agent;
import cn.ld.fj.entity.Area;
import net.esoar.modules.orm.hibernate.HibernateDao;
import org.springframework.stereotype.Component;
import sun.management.resources.agent;


/**
 * 用户对象的泛型DAO类.
 *
 * @author xjli
 */
@Component
public class AgentDao extends HibernateDao<Agent, Long> {
}
