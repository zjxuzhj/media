package cn.media.user;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

/**
 * 用户模块Dao层代码
 * @author superme
 *
 */
public class UserDao extends HibernateDaoSupport{
	/**
	 * DAO层保存用户的代码
	 * @param user
	 */
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}
	
	/**
	 * DAO层根据激活码查询用户
	 * @param code
	 * @return
	 */
	public User findByCode(String code) {
		List<User> list = this.getHibernateTemplate().find("from User where code = ?",code);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}

	/**
	 * DAO层修改用户的方法
	 * @param existUser
	 */
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	/**
	 * DAO层的登录方法
	 * @param user
	 * @return
	 */
	public User login(User user) {
		List<User> list = this.getHibernateTemplate().find("from User where username = ? and password = ? and state = ?",user.getUsername(),user.getPassword(),1);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}

	public User findByUserName(String username) {
		List<User> list = this.getHibernateTemplate().find("from User where username = ?",username);
		if(list.size()!=0){
			return list.get(0);
		}
		return null;
	}
}
