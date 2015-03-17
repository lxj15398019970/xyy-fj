package cn.ld.fj.service.order;

import cn.ld.fj.dao.mybatis.OrderMybatisDao;
import cn.ld.fj.dao.order.OrderDao;
import cn.ld.fj.entity.Order;
import cn.ld.fj.service.dict.CityManager;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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
public class OrderManager {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderMybatisDao orderMybatisDao;

    private static Logger logger = LoggerFactory.getLogger(CityManager.class);

    @Transactional(readOnly = true)
    public Order getEntity(Long id) {
        return orderDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Order> searchList(Page<Order> page, List<PropertyFilter> filters) {
        return orderDao.findPage(page, filters);

    }

    public void save(Order entity) {

        orderDao.save(entity);
    }

    public void delete(Long id) {
        orderDao.delete(id);
    }

    public List<Order> getOrders(Map<String, Object> map) {
        return orderMybatisDao.getOrders(map);
    }

    public int getTotalCount(Map<String, Object> map) {
        return orderMybatisDao.getTotalCount(map);
    }
}
