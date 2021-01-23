package com.walab.oas.DTO;


//예시: User의 정보를 담는 DTO 입니다 (모두 예시입니다!)
public class UserEx {
	
	private Integer id;

	private String name;

	private String user_id;

	private String pwd;
	
	private String email_address;

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", user_id=" + user_id + ", pwd=" + pwd + ", email_address="
				+ email_address + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail_address() {
		return email_address;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	
}