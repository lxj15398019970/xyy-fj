package cn.ld.fj.web.statistic;

import cn.ld.fj.pojo.SaleStatistic;
import cn.ld.fj.service.sale.SaleStatisticManager;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author xjli
 */
@Namespace("/statistic")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "sale-statistic.action", type = "redirect")})
public class SaleStatisticAction extends SimpleJsonActionSupport<SaleStatistic> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<SaleStatistic> page = new Page<SaleStatistic>(10);

    @Autowired
    private SaleStatisticManager saleStatisticManager;

    private String date;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    protected void prepareModel() throws Exception {

    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();
        if (page.getPageNo() < 1) {
            page.setPageNo(1);
        }

        map.put("start", (page.getPageNo() - 1) * 10);
        map.put("end", page.getPageNo() * 10);
        map.put("date", StringUtils.isEmpty(date) ? null : date);

        List<SaleStatistic> saleStatistics = saleStatisticManager.searchList(map);
        Integer totalCount = saleStatisticManager.getTotalCount(map);
        if (totalCount == null) {
            totalCount = 0;
        }
        page.setResult(saleStatistics);
        page.setTotalCount(totalCount);

        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {


    }

    @Override
    public void delete() throws Exception {
    }

    public Page<SaleStatistic> getPage() {
        return page;
    }

    public void setPage(Page<SaleStatistic> page) {
        this.page = page;
    }
}
