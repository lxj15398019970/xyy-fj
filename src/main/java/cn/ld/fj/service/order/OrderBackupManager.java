package cn.ld.fj.service.order;

import cn.ld.fj.dao.order.OrderBackupDao;
import cn.ld.fj.entity.OrderBackup;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
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
public class OrderBackupManager {
    @Autowired
    private OrderBackupDao orderBackupDao;

    @Transactional(readOnly = true)
    public Page<OrderBackup> search(Page<OrderBackup> page, List<PropertyFilter> filters) {
        return orderBackupDao.findPage(page, filters);

    }

    public void save(OrderBackup orderBackup) {
        orderBackupDao.save(orderBackup);
    }

    public List<OrderBackup> getOrderback(List<PropertyFilter> filters) {
        return orderBackupDao.find(filters);
    }
}
