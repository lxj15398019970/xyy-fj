package cn.ld.fj.web.order;

import cn.ld.fj.entity.Order;
import cn.ld.fj.entity.OrderBackup;
import cn.ld.fj.service.order.OrderBackupManager;
import cn.ld.fj.service.order.OrderManager;
import cn.ld.fj.util.Config;
import cn.ld.fj.util.DateUtil;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.util.ExcelUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import com.google.common.collect.Lists;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.security.springsecurity.SpringSecurityUtils;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/order")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "order-backup.action", type = "redirect")})
public class OrderBackupAction extends SimpleJsonActionSupport<OrderBackup> {

    private static final long serialVersionUID = 8683878162525847072L;


    private Page<OrderBackup> page = new Page<OrderBackup>(10);

    @Autowired
    private OrderBackupManager orderBackupManager;
    @Autowired
    private OrderManager orderManager;

    private String phone;
    private String createTime;
    private String orderNo;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    @Override
    protected void prepareModel() throws Exception {
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {

        List<PropertyFilter> filters = Lists.newArrayList();
        filters.add(new PropertyFilter("EQS_createUser", SpringSecurityUtils.getCurrentUserName()));

        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }

        page = orderBackupManager.search(page, filters);
        for (OrderBackup orderBackup : page.getResult()) {
            orderBackup.setSaveUrl(Config.access_url + orderBackup.getFileName());
        }
        return SUCCESS;
    }

    /**
     * 备份订单
     *
     * @throws Exception
     */
    public void backup() throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("start", 0);
        map.put("status", -1);
        int totalCount = orderManager.getTotalCount(map);
        map.put("end", totalCount);


        List<Order> orderList = orderManager.getOrders(map);
        for (Order order : orderList) {
            order.setTotalMoney(order.getBuyCount() * order.getProduction().getPrice());
        }

        // 查询数据库中的数据
        String backDate = DateUtil.getTimeStamp();


        String fileName = backDate + "订单备份.xls";
        ExcelUtil excel = new ExcelUtil();
        excel.createBookAndSheet(true, fileName);
        // 写入表头
        excel.writeRow(0, "订单号", "总价", "代理商", "订单创建时间", "订单状态", "地址", "订单配送时间", "购买数量", "省份", "城市", "区域", "产品", "手机", "客户姓名", "成交时间");

        int rowNum = 0;

        for (Order item : orderList) {
            rowNum++;
            String orderStatus = "未配送";
            if (1 == item.getStatus()) {
                orderStatus = "正在配送";
            } else if (2 == item.getStatus()) {
                orderStatus = "已配送";
            } else if (3 == item.getStatus()) {
                orderStatus = "退单";
            } else if (4 == item.getStatus()) {
                orderStatus = "退货申请";
            } else if (5 == item.getStatus()) {
                orderStatus = "校准完成";
            } else if (6 == item.getStatus()) {
                orderStatus = "完成退货";
            }


            String orderTime = null;
            String assignTime = null;
            String dealTime = null;
            if (item.getOrderTime() != null) {
                orderTime = DateUtil.date2str(item.getOrderTime(), "yyyy-MM-dd HH:mm:ss");
            }
            if (item.getAssignTime() != null) {
                assignTime = DateUtil.date2str(item.getAssignTime(), "yyyy-MM-dd HH:mm:ss");
            }
            if (item.getDealTime() != null) {
                dealTime = DateUtil.date2str(item.getDealTime(), "yyyy-MM-dd HH:mm:ss");
            }


            String productionName = null;
            if (item.getProduction() != null) {
                productionName = item.getProduction().getProductionName();
            }
            excel.writeRow(rowNum, item.getOrderNo(), item.getTotalMoney(), item.getAgentName(), orderTime, orderStatus, item.getAddress(), assignTime, item.getBuyCount(), item.getProvinceName(), item.getCityName(), item.getAreaName(), productionName, item.getPhone(), item.getCustomName(), dealTime);
        }

        OrderBackup orderBackup = new OrderBackup();
        orderBackup.setBackTime(new Date());
        orderBackup.setSaveUrl(fileName);
        orderBackup.setCreateUser(SpringSecurityUtils.getCurrentUserName());
        orderBackup.setFileName(fileName);
        orderBackupManager.save(orderBackup);

        // 导出
        //保存到服务器
        File file = new File(Config.back_url + fileName);
        if (!file.exists()) {
            file.createNewFile();
        }

        InputStream ins = excel.getInputStream();
        try {
            OutputStream os = new FileOutputStream(file);
            int bytesRead = 0;
            byte[] buffer = new byte[1024];
            while ((bytesRead = ins.read(buffer, 0, 1024)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            os.close();
            ins.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Struts2Utils.renderHtml(DwzUtil.getNavtabReturn("w_order",
                "备份成功"));

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


    public Page<OrderBackup> getPage() {
        return page;
    }

    public void setPage(Page<OrderBackup> page) {
        this.page = page;
    }
}
