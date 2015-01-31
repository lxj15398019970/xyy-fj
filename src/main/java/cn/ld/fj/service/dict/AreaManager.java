package cn.ld.fj.service.dict;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 安全相关实体的管理类, 包括用户,角色,资源与授权类.
 * 
 * @author fly
 */
//Spring Bean的标识.
@Component
//默认将类中的所有函数纳入事务管理.
@Transactional
public class AreaManager {

	private static Logger logger = LoggerFactory.getLogger(AreaManager.class);

}
