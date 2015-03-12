package cn.ld.fj.service.dict;

import cn.ld.fj.dao.dict.ProvinceDao;
import cn.ld.fj.entity.Province;
import net.esoar.modules.orm.Page;
import net.esoar.modules.orm.PropertyFilter;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 *
 * @author xjli
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class ProvinceManager {
    @Autowired
    private ProvinceDao provinceDao;

    private static Logger logger = LoggerFactory.getLogger(ProvinceManager.class);

    @Transactional(readOnly = true)
    public Province getProvince(Long id) {
        return provinceDao.get(id);
    }

    @Transactional(readOnly = true)
    public Page<Province> searchProvince(Page<Province> page, List<PropertyFilter> filters) {
        return provinceDao.findPage(page, filters);
    }

    public void save(Province entity) {
        provinceDao.save(entity);
    }

    public void delete(Long id) {
        provinceDao.delete(id);
    }

    @Transactional(readOnly = true)
    public List<Province> findAll() {
        return provinceDao.getAll();
    }

    public Map<Long, String> getProvinceMap() {

        Map<Long, String> map = new HashMap<Long, String>();
        List<Province> provinces = provinceDao.getAll();
        if (CollectionUtils.isNotEmpty(provinces)) {
            for (Province province : provinces) {
                map.put(province.getId(), province.getProvinceName());
            }
        }
        return map;
    }
}
