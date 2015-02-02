package cn.ld.fj.entity;

/**
 * Created by xjli on 15-2-2.
 */


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_AGENT")
public class Agent extends IdEntity {
    private String agentName;

    private String productionName;

    private String productionModel;

    private long provinceId;

    private long cityId;

    private long areaId;


    private String areaScope;


    private String provinceName;


    private String cityName;


    private String areaName;


    public long getAreaId() {
        return areaId;
    }

    public void setAreaId(long areaId) {
        this.areaId = areaId;
    }

    @Transient
    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    @Transient
    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    @Transient
    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getProductionName() {
        return productionName;
    }

    public void setProductionName(String productionName) {
        this.productionName = productionName;
    }

    public String getProductionModel() {
        return productionModel;
    }

    public void setProductionModel(String productionModel) {
        this.productionModel = productionModel;
    }

    public long getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(long provinceId) {
        this.provinceId = provinceId;
    }

    public long getCityId() {
        return cityId;
    }

    public void setCityId(long cityId) {
        this.cityId = cityId;
    }

    public String getAreaScope() {
        return areaScope;
    }

    public void setAreaScope(String areaScope) {
        this.areaScope = areaScope;
    }
}
