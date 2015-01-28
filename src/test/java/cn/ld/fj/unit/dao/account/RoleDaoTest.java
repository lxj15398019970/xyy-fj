package cn.ld.fj.unit.dao.account;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.junit.AfterClass;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import cn.ld.fj.dao.account.RoleDao;
import cn.ld.fj.dao.account.UserDao;
import cn.ld.fj.entity.account.Role;
import cn.ld.fj.entity.account.User;
import net.esoar.modules.test.spring.SpringTxTestCase;
import net.esoar.modules.test.utils.DataUtils;
import net.esoar.modules.test.utils.DbUnitUtils;

/**
 * RoleDao的测试用例, 测试ORM映射及特殊的DAO操作.
 * 
 * @author fly
 */
@ContextConfiguration(locations = { "/applicationContext-test.xml" })
public class RoleDaoTest extends SpringTxTestCase {

	private static DataSource dataSourceHolder = null;

	@Autowired
	private RoleDao roleDao;

	@Autowired
	private UserDao userDao;

	@Before
	public void loadDefaultData() throws Exception {
		if (dataSourceHolder == null) {
			DbUnitUtils.loadData(dataSource, "/data/default-data.xml");
			dataSourceHolder = dataSource;
		}
	}

	@AfterClass
	public static void cleanDefaultData() throws Exception {
		DbUnitUtils.removeData(dataSourceHolder, "/data/default-data.xml");
	}

	/**
	 * 测试删除角色时删除用户-角色的中间表.
	 */
	@Test
	public void deleteRole() {
		//新增测试角色并与admin用户绑定.
		Role role = new Role();
		role.setName(DataUtils.randomName("Role"));
		roleDao.save(role);

		User user = userDao.get(1L);
		user.getRoleList().add(role);
		userDao.save(user);
		userDao.flush();

		int oldJoinTableCount = countRowsInTable("ES_USER_ROLE");
		int oldUserTableCount = countRowsInTable("ES_USER");

		//删除用户角色, 中间表将减少1条记录,而用户表应该不受影响.
		roleDao.delete(role.getId());
		roleDao.flush();

		int newJoinTableCount = countRowsInTable("ES_USER_ROLE");
		int newUserTableCount = countRowsInTable("ES_USER");
		assertEquals(1, oldJoinTableCount - newJoinTableCount);
		assertEquals(0, oldUserTableCount - newUserTableCount);
	}
}
