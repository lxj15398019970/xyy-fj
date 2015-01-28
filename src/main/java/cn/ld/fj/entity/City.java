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
@Table(name = "ES_CITY")
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class City extends IdEntity {
    private String cityName;

    private Long provinceId;

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Long getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Long provinceId) {
        this.provinceId = provinceId;
    }
}
