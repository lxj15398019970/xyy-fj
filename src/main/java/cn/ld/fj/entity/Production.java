package cn.ld.fj.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by xjli on 15-3-12.
 */

@Entity
@Table(name = "ES_PRODUCTION")
public class Production extends IdEntity {
    /**
     * 产品名称
     */
    private String productionName;
    /**
     * 条形码
     */
    private String code;

    /**
     * 规格型号
     */
    private String version;

    /**
     * 颜色
     */
    private String color;


    /**
     * 价格
     */
    private float price;

    /**
     * 库存
     */
    private int inventory;

    /**
     * 描述
     */
    private String description;

    /**
     * 参数参数
     */
    private String para;

    /**
     * 剩余数量
     */
    private int remain;

    public String getPara() {
        return para;
    }

    public void setPara(String para) {
        this.para = para;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getProductionName() {
        return productionName;
    }

    public void setProductionName(String productionName) {
        this.productionName = productionName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }
}
