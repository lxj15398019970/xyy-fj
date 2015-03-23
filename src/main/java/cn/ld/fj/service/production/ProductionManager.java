package cn.ld.fj.service.production;

import cn.ld.fj.dao.production.ProductionDao;
import cn.ld.fj.entity.Production;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.apache.commons.collections.CollectionUtils;
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
 * @author xjli
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class ProductionManager {
    @Autowired
    private ProductionDao productionDao;

    private static Logger logger = LoggerFactory.getLogger(ProductionManager.class);

    @Transactional(readOnly = true)
    public Production getEntity(Long id) {
        return productionDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Production> searchList(Page<Production> page, List<PropertyFilter> filters) {
        return productionDao.findPage(page, filters);

    }

    public void save(Production entity) {

        productionDao.save(entity);
    }

    public void delete(Long id) {
        productionDao.delete(id);
    }

    @Transactional(readOnly = true)
    public Production getEntityByProperty(String productionName) {
        return productionDao.findUniqueBy("productionName", productionName);
    }

    public List<Production> findAll() {
        return productionDao.getAll();

    }

    public Map<Long, Object> getProductionMap() {
        Map<Long, Object> map = new HashMap<Long, Object>();
        List<Production> productions = productionDao.getAll();
        if (CollectionUtils.isNotEmpty(productions)) {
            for (Production p : productions) {
                map.put(p.getId(), p);
            }
        }
        return map;
    }

    public Production getProductionByProperty(String productionName) {
        return productionDao.findUniqueBy("productionName", productionName);
    }
}
