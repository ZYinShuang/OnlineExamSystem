package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

/**
 * 鐢ㄦ埛绫�
 * @author Administrator
 *
 */
@Component
@Named("User")
public class User {
	
	private int id;
	private String username;
	private String password;
	private int type;
	private String name;
	private boolean is_show;
	private String isShow_show;
	private String istype;
	private String isclass;
	
	

	public String getIsclass() {
		return isclass;
	}
	public void setIsclass(String isclass) {
		this.isclass = isclass;
	}
	public String getIstype() {
		return istype;
	}
	public void setIstype(String istype) {
		this.istype = istype;
	}
	public User() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isIs_show() {
		return is_show;
	}
	public void setIs_show(boolean is_show) {
		this.is_show = is_show;
	}
	
	
	
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", type=" + type + ", name=" + name + ", is_show="
				+ is_show + ", isShow_show=" + isShow_show + ", istype="
				+ istype + ", isclass=" + isclass + "]";
	}
	public String getIsShow_show() {
		return isShow_show;
	}
	public void setIsShow_show(String isShow_show) {
		this.isShow_show = isShow_show;
	}
	public User(int id, String username, String password, int type,
			String name, boolean is_show,String isclass) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.type = type;
		this.name = name;
		this.is_show = is_show;
		this.isclass=isclass;
	}
	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	
	
	
	
	
	
	
	
	
}
