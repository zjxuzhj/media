package cn.media.adminuser;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

public class AdminUserDao extends HibernateDaoSupport{

	public AdminUser login(AdminUser adminUser) {
		List<AdminUser> list = this.getHibernateTemplate().find(
				"from AdminUser where username = ? and password = ?",
				adminUser.getUsername(), adminUser.getPassword());
		if (list != null && list.size() != 0) {
			return list.get(0);
		}
		return null;
	}

}
