package cn.ld.fj.dao.mybatis;

import cn.ld.fj.entity.Order;

import java.util.List;
import java.util.Map;

/**
 * Created by xjli on 15-3-17.
 */
public interface OrderMybatisDao {
    List<Order> getOrders(Map<String,Object> map);

    int getTotalCount(Map<String,Object> map);
}
