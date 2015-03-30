package cn.ld.fj.service.sale;

import cn.ld.fj.dao.sale.SaleStatisticMybatisDAO;
import cn.ld.fj.pojo.SaleStatistic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by xjli on 15-3-30.
 */
@Component
public class SaleStatisticManager {
    @Autowired
    private SaleStatisticMybatisDAO saleStatisticMybatisDAO;

    public List<SaleStatistic> searchList(Map<String, Object> map) {
        return saleStatisticMybatisDAO.searchList(map);
    }

    public Integer getTotalCount(Map<String, Object> map) {
        return saleStatisticMybatisDAO.getTotalCount(map);
    }
}
