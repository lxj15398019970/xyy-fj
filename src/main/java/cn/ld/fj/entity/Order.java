package cn.ld.fj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by xjli on 15-2-3.
 */
@Entity
@Table(name = "ES_ORDER")
public class Order extends  IdEntity {

    private String orderName;

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }
}

