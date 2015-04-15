package cn.ld.fj.service.agent;

import cn.ld.fj.dao.agent.AgentAreaDao;
import cn.ld.fj.dao.dict.AreaDao;
import cn.ld.fj.entity.AgentArea;
import cn.ld.fj.entity.Area;
import cn.ld.fj.service.dict.CityManager;
import net.esoar.modules.orm.PropertyFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class AgentAreaManager {

    @Autowired
    private AgentAreaDao agentAreaDao;
    @Autowired
    private AreaDao areaDao;

    private static Logger logger = LoggerFactory.getLogger(CityManager.class);

    @Transactional(readOnly = true)
    public AgentArea getEntity(Long id) {
        return agentAreaDao.get(id);
    }


    public void save(AgentArea entity) {

        agentAreaDao.save(entity);
    }

    public void delete(Long id) {
        agentAreaDao.delete(id);
    }

    public List<AgentArea> getAgents(List<PropertyFilter> filters) {

        return agentAreaDao.find(filters);
    }

    public List<AgentArea> findByProperty(String property, Long agentId) {
        return agentAreaDao.findBy(property, agentId);
    }

    public Map<Long, String> getAgentAreaMap() {
        List<AgentArea> agentAreas = agentAreaDao.getAll();
        Map<Long, String> map = new HashMap<Long, String>();
        for (AgentArea agentArea : agentAreas) {
            Area area = areaDao.get(agentArea.getAreaId());
            if (!map.containsKey(agentArea.getAgentId())) {
                map.put(agentArea.getAgentId(), area.getAreaName() + ",");
            } else {
                map.put(agentArea.getAgentId(), map.get(agentArea.getAgentId()) + area.getAreaName());
            }
        }
        return map;

    }
}
