package model;

public class User {
	String memid;
	String passwd;
	String name;
	String address;
	String phone;

	public User(String memid, String passwd, String name, String address, String phone) {
		super();
		this.memid = memid;
		this.passwd = passwd;
		this.name = name;
		this.address = address;
		this.phone = phone;
	}

	public String getMemid() {
		return memid;
	}

	public void setMemid(String memid) {
		this.memid = memid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
