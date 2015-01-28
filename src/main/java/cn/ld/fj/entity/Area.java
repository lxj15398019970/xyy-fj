package cn.ld.fj.entity;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by xjli on 15-1-28.
 */
@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_AREA")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Area extends IdEntity{
    private String areaName;

    private Long cityId;

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public Long getCityId() {
        return cityId;
    }

    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }
}
