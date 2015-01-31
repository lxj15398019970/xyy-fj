package cn.ld.fj.web;

import com.google.common.collect.Lists;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import net.esoar.modules.orm.Page;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * <pre>
 * 类说明：包含id、ids、page的默认Action类
 * </pre>
 * @author <a href="mailto:jnan77@qq.com"> Ljn</a>
 */
public abstract class SimpleJsonActionSupport<T> extends ActionSupport implements ModelDriven<T>,
                                                                      Preparable {
    /**
     * 
     */
    private static final long  serialVersionUID = -2331641785250998382L;

    /** 进行增删改操作后,以redirect方式重新打开action默认页的result名.*/
    public static final String RELOAD           = "reload";

    protected Logger           logger           = LoggerFactory.getLogger(getClass());
    //-----------新增--------------//
    protected Long             id;
    protected List<Long>       ids              = Lists.newArrayList();
    protected T                entity;
    protected Page<T> page             = new Page<T>(getCurrentPageSize());

    /**
     * 每页显示行数设置，默认为15
     */
    public int getCurrentPageSize() {
        return 15;
    }

    public Page<T> getPage() {
        return page;
    }

    @Override
    public T getModel() {
        return entity;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setIds(List<Long> ids) {
        this.ids = ids;
    }

    //---------------------------//
    /**
     * Action函数, 默认的action函数, 默认调用list()函数.
     */
    @Override
    public String execute() throws Exception {
        return list();
    }

    //-- CRUD Action函数 --//
    /**
     * Action函数,显示Entity列表界面.
     * 建议return SUCCESS.
     */
    public abstract String list() throws Exception;

    /**
     * Action函数,显示新增或修改Entity界面.
     * 建议return INPUT.
     */
    @Override
    public String input() throws Exception {
        return INPUT;
    };

    /**
     * Action函数,新增或修改Entity. 
     * 建议return RELOAD.
     */
    public abstract void save() throws Exception;

    /**
     * Action函数,删除Entity.
     * 建议return RELOAD.
     */
    public abstract void delete() throws Exception;

    //-- Preparable函数 --//
    /**
     * 实现空的prepare()函数,屏蔽了所有Action函数都会执行的公共的二次绑定.
     */
    public void prepare() throws Exception {
    }

    /**
     * 定义在input()前执行二次绑定.
     */
    public void prepareInput() throws Exception {
        prepareModel();
    }

    /**
     * 定义在save()前执行二次绑定.
     */
    public void prepareSave() throws Exception {
        prepareModel();
    }

    /**
     * 等同于prepare()的内部函数,供prepardMethodName()函数调用. 
     */
    protected abstract void prepareModel() throws Exception;
}
