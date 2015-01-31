package cn.ld.fj.web.dict;

import cn.ld.fj.entity.Province;
import cn.ld.fj.service.account.AccountManager;
import cn.ld.fj.service.dict.ProvinceManager;
import cn.ld.fj.util.DwzUtil;
import cn.ld.fj.web.JsonActionSupport;
import cn.ld.fj.web.SimpleJsonActionSupport;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import net.esoar.modules.utils.web.struts2.Struts2Utils;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import java.util.List;

/**
 * 用户管理Action.
 * <p/>
 * 使用Struts2 convention-plugin annotation定义Action参数. 演示带分页的管理界面.
 *
 * @author fly
 */
@Namespace("/province")
@Results({@Result(name = JsonActionSupport.RELOAD, location = "province.action", type = "redirect")})
public class ProvinceAction extends SimpleJsonActionSupport<Province> {

    private static final long serialVersionUID = 8683878162525847072L;

    private ProvinceManager provinceManager;

    private Page<Province> page = new Page<Province>(10);// 每页5条记录


    @Override
    protected void prepareModel() throws Exception {
        if (id != null) {
              entity = provinceManager.getProvince(id);
        } else {
            entity = new Province();
        }
    }

    // -- CRUD Action 函数 --//
    @Override
    public String list() throws Exception {
        List<PropertyFilter> filters = PropertyFilter
                .buildFromHttpRequest(Struts2Utils.getRequest());
        // 设置默认排序方式
        if (!page.isOrderBySetted()) {
            page.setOrderBy("id");
            page.setOrder(Page.ASC);
        }
         page = provinceManager.searchUser(page, filters);
        return SUCCESS;
    }

    @Override
    public String input() throws Exception {
        return INPUT;
    }

    @Override
    public void save() throws Exception {
        provinceManager.save(entity);
//        Struts2Utils.renderHtml(DwzUtil
//                .getFailReturn("操作失败，打开了异网，但是没有选择资源"));
        Struts2Utils.renderHtml(DwzUtil.getCloseCurrentReturn("",
                "操作成功"));

    }

    @Override
    public void delete() throws Exception {

    }


    /**
     * list页面显示用户分页列表.
     */
    public Page<Province> getPage() {
        return page;
    }

}
