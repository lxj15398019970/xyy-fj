package cn.ld.fj.dao.sale;

import cn.ld.fj.pojo.SaleStatistic;

import java.util.List;
import java.util.Map;

/**
 * Created by xjli on 15-3-30.
 */
public interface SaleStatisticMybatisDAO {
    List<SaleStatistic> searchList(Map<String, Object> map);

    Integer getTotalCount(Map<String, Object> map);
}
