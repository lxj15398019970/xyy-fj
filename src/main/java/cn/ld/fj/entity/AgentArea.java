package cn.ld.fj.entity;

/**
 * Created by xjli on 15-2-2.
 */


import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
//表名与类名不相同时重新定义表名.
@Table(name = "ES_AGENT_AREA")
public class AgentArea extends IdEntity {

    private long agentId;


    private long areaId;

    public long getAgentId() {
        return agentId;
    }

    public void setAgentId(long agentId) {
        this.agentId = agentId;
    }

    public long getAreaId() {
        return areaId;
    }

    public void setAreaId(long areaId) {
        this.areaId = areaId;
    }
}
