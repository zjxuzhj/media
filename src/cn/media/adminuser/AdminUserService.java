package cn.media.adminuser;

public class AdminUserService {

	private AdminUserDao adminUserDao;
	
	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}
	
	public AdminUser login(AdminUser adminUser) {

		return adminUserDao.login(adminUser);
	}

}
