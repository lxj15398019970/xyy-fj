package cn.ld.fj.service.agent;

import cn.ld.fj.dao.agent.AgentDao;
import cn.ld.fj.entity.Agent;
import cn.ld.fj.service.dict.CityManager;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class AgentManager {

    @Autowired
    private AgentDao agentDao;

    private static Logger logger = LoggerFactory.getLogger(CityManager.class);

    @Transactional(readOnly = true)
    public Agent getEntity(Long id) {
        return agentDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Agent> searchList(Page<Agent> page, List<PropertyFilter> filters) {
        return agentDao.findPage(page, filters);

    }

    public void save(Agent entity) {

        agentDao.save(entity);
    }

    public void delete(Long id) {
        agentDao.delete(id);
    }

    public List<Agent> getAgents(List<PropertyFilter> filters) {

        return agentDao.find(filters);
    }

    public List<Agent> findByProperty(String property, String agentName) {
        return agentDao.findBy(property, agentName);
    }
}
