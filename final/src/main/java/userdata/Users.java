package userdata;

public class Users {
	String username,password,phonenumber,sex,email;
	int tag = 1,caozuo=0,mid=1;
	
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPassword() {
		return password;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSex() {
		return sex;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail() {
		return email;
	}
	public void setTag(int x) {
		tag = x;
	}
	public int getTag() {
		return tag;
	}
	public int getCaozuo() {
		return caozuo;
	}
	public void setCaozuo(int caozuo) {
		this.caozuo = caozuo;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	
}
