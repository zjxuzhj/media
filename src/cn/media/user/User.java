package cn.media.user;

/**
 * 用户模块的实体类对象
 * @author superme
 *
 *CREATE TABLE `user` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32),
  `password` varchar(32),
   name varchar(20),
  `email` varchar(30),
  `sex` varchar(10),
  `phone` varchar(20),
  `addr` varchar(64),
  `state` int,
  `code` varchar(64),
  PRIMARY KEY (`uid`)
)
 */
public class User {
	private Integer uid;
	private String username;
	private String password;
	private String name;
	private String email;
	private String sex;
	private String phone;
	private String addr;
	private int state;
	private String code;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
