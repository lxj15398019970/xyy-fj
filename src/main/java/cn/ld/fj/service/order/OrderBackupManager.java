package cn.ld.fj.service.order;

import cn.ld.fj.dao.mybatis.OrderMybatisDao;
import cn.ld.fj.dao.order.OrderBackupDao;
import cn.ld.fj.entity.account.OrderBackup;
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
public class OrderBackupManager {
    @Autowired
    private OrderBackupDao orderBackupDao;
    @Autowired
    private OrderMybatisDao orderMybatisDao;

    public void save(OrderBackup backup) {
        orderBackupDao.save(backup);
    }


    public List<OrderBackup> getBackupOrders(Map<String,Object> map) {
        return  orderMybatisDao.getBackupOrders(map);
    }

    public int getBackupTotalCount(Map<String,Object> map) {
        return  orderMybatisDao.getBackupTotalCount(map);
    }
}
