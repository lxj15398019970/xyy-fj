package cn.ld.fj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.util.Date;

/**
 * Created by xjli on 15-2-3.
 */
@Entity
@Table(name = "ES_ORDER")
public class Order extends IdEntity {

    /**
     * 产品id
     */
    private long productionId;

    /**
     * 省份
     */
    private long provinceId;

    /**
     * 城市
     */
    private long cityId;


    /**
     * 区域
     */
    private long areaId;


    /**
     * 购买数量
     */
    private int buyCount;

    /**
     * 总价
     */
    private float totalMoney;

    /**
     * 下单时间
     */
    private Date orderTime;


    /**
     * 详细配送地址
     */
    private String address;


    /**
     * 下单人
     */
    private String customName;


    /**
     * 电话
     */
    private String phone;


    private Production production;


    /**
     * 省
     */
    private String provinceName;

    /**
     * 城市
     */
    private String cityName;

    /**
     * 区域
     */
    private String areaName;

    /**
     * 0 未配送
     * 1	正在配送
     * 2	已配送
     * 3	退货
     */
    private int status;

    /**
     * 代理商
     */
    private long agentId;

    /**
     * 配送时间
     */
    private Date assignTime;

    /**
     * 代理商名称
     */
    private String agentName;

    @Transient
    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public long getAgentId() {
        return agentId;
    }

    public void setAgentId(long agentId) {
        this.agentId = agentId;
    }

    public Date getAssignTime() {
        return assignTime;
    }

    public void setAssignTime(Date assignTime) {
        this.assignTime = assignTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    @Transient
    public Production getProduction() {
        return production;
    }

    public void setProduction(Production production) {
        this.production = production;
    }

    public long getProductionId() {
        return productionId;
    }

    public void setProductionId(long productionId) {
        this.productionId = productionId;
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

    public long getAreaId() {
        return areaId;
    }

    public void setAreaId(long areaId) {
        this.areaId = areaId;
    }

    public int getBuyCount() {
        return buyCount;
    }

    public void setBuyCount(int buyCount) {
        this.buyCount = buyCount;
    }

    @Transient
    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCustomName() {
        return customName;
    }

    public void setCustomName(String customName) {
        this.customName = customName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}

