package cn.ld.fj.service.account;

import cn.ld.fj.entity.account.Authority;
import cn.ld.fj.entity.account.Role;
import cn.ld.fj.entity.account.User;
import com.google.common.collect.Sets;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * <pre>
 * 类说明: SpringSecurity自定义密码校验
 * </pre>
 *
 * @author LJN
 */
@Component
public class SignedUsernamePasswordAuthenticationProvider extends
        AbstractUserDetailsAuthenticationProvider {

    private AccountManager accountManager;
    private Set<String> auths = Sets.newHashSet();
    private boolean hideUserNotFoundExceptions = false;

    @Override
    protected UserDetails retrieveUser(String username,
                                       UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {


        if (username == null || username == "") {
            throw new AuthenticationServiceException("用户名不能为空");
        }

        User user = accountManager.findUserByLoginName(username);
        if (null == authentication.getCredentials() || authentication.getCredentials() == "") {
            throw new AuthenticationServiceException("用户" + username + " 登录密码不能为空");
        }
        if (user == null) {
            throw new AuthenticationServiceException("用户名或密码错误");
        }

        if (!user.getPassword().equals(authentication.getCredentials().toString())) {
            throw new AuthenticationServiceException("用户名或密码错误");
        }

        return loadUser(user);
    }

    /**
     * 获取用户Details信息的回调函数.
     */
    public UserDetails loadUser(User user) throws UsernameNotFoundException,
            DataAccessException {
        Set<GrantedAuthority> grantedAuths = obtainGrantedUserAuthorities(user);
        // -- csair_fsms示例中无以下属性, 暂时全部设为true. --//
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        UserDetails userdetails = new org.springframework.security.core.userdetails.User(
                user.getLoginName(), user.getPassword(), enabled,
                accountNonExpired, credentialsNonExpired, accountNonLocked,
                grantedAuths);

        return userdetails;
    }

    /**
     * 获得用户所有角色的权限集合.
     */
    private Set<GrantedAuthority> obtainGrantedUserAuthorities(User user) {
        Set<GrantedAuthority> authSet = Sets.newHashSet();
        for (Role role : user.getRoleList()) {
            for (Authority authority : role.getAuthorityList()) {
                authSet.add(new GrantedAuthorityImpl(authority
                        .getPrefixedName()));
                auths.add(authority.getPrefixedName());
            }
        }
        return authSet;
    }

    /**
     * 密码验证
     */
    @Override
    protected void additionalAuthenticationChecks(UserDetails userDetails,
                                                  UsernamePasswordAuthenticationToken authentication)
            throws AuthenticationException {
        // TODO Auto-generated method stub
        System.out
                .println("===========additionalAuthenticationChecks=============");

    }

    @Autowired
    public void setAccountManager(AccountManager accountManager) {
        this.accountManager = accountManager;
    }

}
